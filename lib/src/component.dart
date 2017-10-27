library jb_responsive_breakpoints.component;

import 'dart:async';
import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular/angular.dart';

@Component(selector: "jb-responsive-breakpoints", template: "")
class JbResponsiveBreakpoints implements AfterViewInit {
  final Logger _logger = new Logger("jb_responsive_breakpoints.component");

//  @ViewChild('debug')
//  DivElement debugDiv;

  ///matches Media Query Strings with their labels
  Map<String, String> mediaQueries = {};

  ///maps min-width values in px to Names for this breakpoint
  @Input()
  Map<int, String> breakpoints;

  @Input()
  List<String> activeBreakpoints = new List<String>();

  final StreamController _activeBreakpointsEmitter = new StreamController<List<String>>.broadcast();

  @Output()
  Stream get activeBreakpointsChange => _activeBreakpointsEmitter.stream;

  ApplicationRef application;

//  Element node;

  JbResponsiveBreakpoints(this.application /*, this.node*/) {
//    node.style.display = "hidden";
  }

  void onMediaQueryChange(Event event) {

    if (event is MediaQueryListEvent) {
    if (event.matches) {
      activeBreakpoints.add(mediaQueries[event.media]);
      _logger.info("${mediaQueries[event.media]} - Label added to active breakpoints");
//      _logger.info(activeBreakpoints.toString());
    } else {
      activeBreakpoints.remove(mediaQueries[event.media]);
      _logger.info("${mediaQueries[event.media]} - Label removed from active breakpoints");
//      _logger.info(activeBreakpoints.toString());
    }
    //manual change detection for whole application
//    application.tick();

      _activeBreakpointsEmitter.add(activeBreakpoints.toList());

    } else {
      _logger.severe('onMediaQueryChange was called with an event of different type than MediaQueryListEvent');
    }


  }

  void ngAfterViewInit() {
    //create media query watchers
    breakpoints.forEach((value, label) {
      MediaQueryList mq = window.matchMedia("(min-width: ${value}px)");
      mediaQueries[mq.media] = label;
      mq.addListener(onMediaQueryChange);

      if (mq.matches) {
        //add label for current breakpoint to activeBreakpoints list, if breakpoint matches currently
        activeBreakpoints.add(label);
        _activeBreakpointsEmitter.add(activeBreakpoints.toList());
      }
    });
  }
}
