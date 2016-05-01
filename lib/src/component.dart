library jb_responsive_breakpoints.component;

import 'dart:async';
import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular/angular.dart';

@Component(
    selector: "jb-responsive-breakpoints[active-breakpoints][breakpoints]",
    useShadowDom: true)
class JbResponsiveBreakpoints implements ShadowRootAware, AttachAware {
  String _currentBreakpoint;

  final Logger _logger = new Logger("JbResponsiveBreakpoints.Component");

  Element node;

  int lastInnerWidth;
  int currentInnerWidth;

  JbResponsiveBreakpoints(this.node) {
  }

  ///matches Media Query Strings with their labels
  Map<String, String> mediaQueries = {};

  get currentBreakpoint {
    return _currentBreakpoint;
  }

  @NgTwoWay("current-breakpoint")
  set currentBreakpoint(String value) {
    _currentBreakpoint = (value != null) ? value.trim() : value;
  }

  ///maps min-width values in px to Names for this breakpoint
  @NgOneWay("breakpoints")
  Map<int, String> breakpoints = {};

  @NgTwoWay("active-breakpoints")
  List<String> activeBreakpoints = [];

//  void onResize() {
//    var newBreakpoint = _pseudoAfterElement.content;
//
//    //if breakpoint has changed
//    if (newBreakpoint != currentBreakpoint) {
//      //copy current breakpoint to last breakpoint
//      var lastBreakpoint = currentBreakpoint;
//
//      _logger.finest("old Breakpoint: $lastBreakpoint");
//      _logger.finest("new breakpoint: $newBreakpoint");
//      currentBreakpoint = newBreakpoint;
//    }
//  }

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
//    window.onResize.listen((_) => onResize());
//    new Future(onResize);
  }

  void onMediaQueryChange(MediaQueryListEvent event) {
    _logger.info("MediaQueryChange event: " + event.media);
    _logger.info("Event.matches: ${event.matches}");

    if (event.matches) {
      activeBreakpoints.add(mediaQueries[event.media]);
    } else {
      activeBreakpoints.remove(mediaQueries[event.media]);
    }
  }

  @override
  void attach() {
    //create media query watchers
    breakpoints.forEach((value, label) {
      MediaQueryList mq = window.matchMedia("(min-width: ${value}px)");
      mediaQueries[mq.media] = label;
      mq.addListener(onMediaQueryChange);

      if (mq.matches) {
        //add label for current breakpoint to activeBreakpoints list, if breakpoint matches currently
        activeBreakpoints.add(label);
      }
    });
  }
}
