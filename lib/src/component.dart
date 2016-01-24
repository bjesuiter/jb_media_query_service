library jb_responsive_breakpoints.component;

import 'dart:async';
import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular/angular.dart';

@Component(selector: "jb-responsive-breakpoints", useShadowDom: true)
class JbResponsiveBreakpoints implements ShadowRootAware {
  String _currentBreakpoint;
  
  final Logger _logger = new Logger("JbResponsiveBreakpoints.Component");

  Element node;

  CssStyleDeclaration _pseudoAfterElement;
  int lastInnerWidth;
  int currentInnerWidth;

  JbResponsiveBreakpoints(this.node) {
    _pseudoAfterElement = node.getComputedStyle("after");
    node.style.display = "none";
  }

  get currentBreakpoint {
    return _currentBreakpoint;
  }

  @NgTwoWay("current-breakpoint")
  set currentBreakpoint(String value) {
    _currentBreakpoint = (value != null) ? value.trim() : value;
  }
  
  void onResize() {
    var newBreakpoint = _pseudoAfterElement.content;

    //if breakpoint has changed
    if (newBreakpoint != currentBreakpoint) {
      //copy current breakpoint to last breakpoint
      var lastBreakpoint = currentBreakpoint;

      _logger.finest("old Breakpoint: $lastBreakpoint");
      _logger.finest("new breakpoint: $newBreakpoint");
      currentBreakpoint = newBreakpoint;
    }
  }

  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    window.onResize.listen((_) => onResize());
    new Future(onResize);
  }
}
