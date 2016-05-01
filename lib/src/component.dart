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
  @NgTwoWay("breakpoints")
  Map<int, String> breakpoints;

  @NgTwoWay("active-breakpoints")
  List<String> activeBreakpoints;

  void onMediaQueryChange(MediaQueryListEvent event) {
    if (event.matches) {
      activeBreakpoints.add(mediaQueries[event.media]);
      _logger.info("${mediaQueries[event.media]} - Label added to active breakpoints");
      _logger.info(activeBreakpoints.toString());
    } else {
      activeBreakpoints.remove(mediaQueries[event.media]);
      _logger.info("${mediaQueries[event.media]} - Label removed from active breakpoints");
      _logger.info(activeBreakpoints.toString());
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
