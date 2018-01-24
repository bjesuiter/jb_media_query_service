library jb_responsive_breakpoints.app_init;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';
import 'package:jb_responsive_breakpoints/jb_responsive_breakpoints.dart';
import 'package:jb_responsive_breakpoints/src/test_components/consumer_component/consumer_component.dart';

final Logger _libLogger = new Logger("jb_responsive_breakpoints");

void main() {
  //init logging
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(new LogPrintHandler());

  Logger.root.level = Level.OFF;
  _libLogger.level = Level.ALL;
  //could be customized with _libLogger.level =  Level.INFO or Level.OFF and
  // then add specific logger
  //_logger.level = Level.All

  bootstrap(AppComponent);
}


@Component(
    selector: 'app-root',
    templateUrl: 'app_component.html',
    directives: const [
      CORE_DIRECTIVES,
      JbResponsiveBreakpoints,
      ConsumerComponent
    ])
class AppComponent {
  Map<int, String> breakpoints = {
    0: 'small',
    300: 'medium',
    450: 'large',
    600: 'xlarge'
  };

  List<String> activeBreakpoints = new List<String>();
}
