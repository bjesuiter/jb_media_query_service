library jb_responsive_breakpoints.app_init;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';
import 'app_component.dart';

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
