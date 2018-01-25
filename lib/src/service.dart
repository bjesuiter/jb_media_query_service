library jb_responsive_breakpoints.component;

import 'dart:html';
import 'package:logging/logging.dart';

import 'package:angular/angular.dart';

/// mqMatch - a boolean whether the media query matches or not.
/// This is like 'activation' and 'deactivation' of states
typedef MediaQueryListener(bool mqMatch);

@Injectable()
class JbMediaQueryService {
  final Logger _logger = new Logger("jb_responsive_breakpoints.component");
  final NgZone _ngZone;

  /// Matches Media Query Objects with their registered listeners
  Map<String, List<MediaQueryListener>> mediaQueries = {};

  JbMediaQueryService(this._ngZone) {}

  /// Registers a listener for a media query breakpoint
  registerStringQuery(MediaQueryListener listener, String mediaQuery) {
    MediaQueryList mq = window.matchMedia(mediaQuery);

    _logger.fine('Original MediaQuery: ${mediaQuery}');
    _logger.fine('Window.MatchMedia MediaQuery: ${mediaQuery}');

    if (mediaQueries[mq.media] == null) {
      mediaQueries[mq.media] = [];
    }
    mediaQueries[mq.media].add(listener);

    mq.addListener(onMediaQueryChange);

    if (mq.matches) {
      //add label for current breakpoint to activeBreakpoints list, if breakpoint matches currently
      listener(mq.matches);
    }
  }

  ///support some media-query features directly simplify media query string creation
  register(Function listener, {int minWidth, int minHeight}) {
    List<String> mediaProperties = new List<String>();
    if (minWidth != null) {
      mediaProperties.add('(min-width: ${minWidth}px)');
    }
    if (minHeight != null) {
      mediaProperties.add('min-height: ${minHeight}px');
    }
    registerStringQuery(listener, mediaProperties.join(' and '));
  }

  /// removes a listener for a specific media query
  unregister(String mediaQuery, Function listener) {
    mediaQueries[mediaQuery]?.remove(listener);

    if (mediaQueries[mediaQuery]?.length == 0) {
      mediaQueries.remove(mediaQuery);
    }
  }

  void onMediaQueryChange(Event event) {
    if (event is MediaQueryListEvent) {
      List<MediaQueryListener> listeners = mediaQueries[event.media];

      if (listeners == null) {
        _logger.severe(
            'Media Query Change was detected for query "${event.media}", '
            'but no event listener could be found!');
      }

      //wrap listener call in ngZone call to execute the listeners in angular zone to fix issues with property binding
      _ngZone
          .run(() => listeners?.forEach((listener) => listener(event.matches)));
    } else {
      _logger.severe(
          'onMediaQueryChange was called with an event of different type than MediaQueryListEvent');
    }
  }
}
