library jb_responsive_breakpoints.app_init;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
import 'package:logging_handlers/logging_handlers_shared.dart';
import 'package:jb_responsive_breakpoints/jb_responsive_breakpoints.dart';

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
    directives: const [CORE_DIRECTIVES],
    providers: const [JbMediaQueryService])
class AppComponent implements OnInit {
  JbMediaQueryService mqService;

  Map<String, String> colors = {
    'default': '#aaaaaa',
    'min300': '#aaaa00',
    'min600': '#00aaaa',
  };

  String color = "#aaaaaa";

  List<String> activeBreakpoints = [];

  AppComponent(this.mqService) {}

  @override
  ngOnInit() {
    mqService.register(min300, minWidth: 300);
    mqService.register(min600, minWidth: 600);
  }

  min300(bool matches) {
    if (matches) {
      activeBreakpoints.add('min300');
      color = colors['min300'];
    } else {
      activeBreakpoints.remove('min300');
      color = colors['default'];
    }

    _libLogger.fine(activeBreakpoints);
  }

  min600(bool matches) {
    if (matches) {
      color = colors['min600'];
      activeBreakpoints.add('min600');
    } else {
      activeBreakpoints.remove('min600');
      color = colors['min300'];
    }

    _libLogger.fine(activeBreakpoints);
  }
}
