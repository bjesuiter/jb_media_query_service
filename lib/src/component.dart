library jb_responsive_breakpoints.component;

import 'dart:async';
import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular/angular.dart';

@Component(
    selector: "jb-responsive-breakpoints[active-breakpoints][breakpoints]",
    useShadowDom: true)
class JbResponsiveBreakpoints implements AttachAware {
  final Logger _logger = new Logger("JbResponsiveBreakpoints.Component");

  Element node;

  JbResponsiveBreakpoints(this.node) {
  }

  ///matches Media Query Strings with their labels
  Map<String, String> mediaQueries = {};

  ///maps min-width values in px to Names for this breakpoint
  @NgOneWay("breakpoints")
  Map<int, String> breakpoints = {};

  @NgTwoWay("active-breakpoints")
  List<String> activeBreakpoints = [];

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
