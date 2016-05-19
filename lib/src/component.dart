library jb_responsive_breakpoints.component;

import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular2/angular2.dart';

@Component(
    selector: "jb-responsive-breakpoints",
    template: ""
)
class JbResponsiveBreakpoints implements AfterViewInit {
  final Logger _logger = new Logger("JbResponsiveBreakpoints.Component");

//  @ViewChild('debug')
//  DivElement debugDiv;

  ///matches Media Query Strings with their labels
  Map<String, String> mediaQueries = {};

  ///maps min-width values in px to Names for this breakpoint
  @Input()
  Map<int, String> breakpoints;

  @Input()
  List<String> activeBreakpoints = new List<String>();

  @Output()
  EventEmitter activeBreakpointsChange = new EventEmitter();

  ApplicationRef application;

//  Element node;

  JbResponsiveBreakpoints(this.application /*, this.node*/) {
//    node.style.display = "hidden";
  }

  void onMediaQueryChange(MediaQueryListEvent event) {
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

    activeBreakpointsChange.emit(activeBreakpoints);
  }

  ngAfterViewInit() {
    //create media query watchers
    breakpoints.forEach((value, label) {
      MediaQueryList mq = window.matchMedia("(min-width: ${value}px)");
      mediaQueries[mq.media] = label;
      mq.addListener(onMediaQueryChange);

      if (mq.matches) {
        //add label for current breakpoint to activeBreakpoints list, if breakpoint matches currently
        activeBreakpoints.add(label);
        activeBreakpointsChange.emit(activeBreakpoints);
      }
    });
  }
}
