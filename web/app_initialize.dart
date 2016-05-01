library jb_responsive_breakpoints.app_init;

import 'package:angular/application_factory.dart';
import 'package:angular/angular.dart' as Angular;
import 'package:logging/logging.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';

//import own component
import 'package:jb_responsive_breakpoints/jb_responsive_breakpoints.dart';
import 'root_context.dart';

final Logger _libLogger = new Logger("JbResponsiveBreakpoints");

void main() {
  //init logging
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(new LogPrintHandler());

  Logger.root.level = Level.OFF;
  _libLogger.level = Level.ALL;
  //could be customized with _libLogger.level =  Level.INFO or Level.OFF and
  // then add specific logger
  //_logger.level = Level.All

// Hint for using injector:
// final injector = applicationFactory().addModule(new SpeedpadApp()).run();
  final injector = applicationFactory().addModule(new App()).rootContextType(RootContext).run();
}

class App extends Angular.Module {

  App() {
    bind(JbResponsiveBreakpoints);
    // EXAMPLE: bind(StorageService);
    // EXAMPLE: bind(StorageService, toValue: new StorageService());
    // EXAMPLE: bind(StorageService, toFactory: (Angular.Injector inj) => new StorageService(inj.get(EventBus)));

  }

}