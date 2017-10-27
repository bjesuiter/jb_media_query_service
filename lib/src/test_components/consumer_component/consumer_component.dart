import 'package:angular/angular.dart';
import 'package:logging/logging.dart';

@Component(selector: 'breakpoint-consumer', templateUrl: 'consumer_component.html', directives: const [CORE_DIRECTIVES])
class ConsumerComponent implements AfterViewInit {
  Logger _log = new Logger("jb_responsive_breakpoints.consumer_component");

  @Input()
  List<String> activeBreakpoints;

  List<String> _activeBreakpointsSetter;

  @Input()
  set activeBreakpointsSetter(List<String> activeBreakpoints) {
    _log.info("activeBreakpointsSetter called with ${activeBreakpoints.fold(
            "", (String prevVal, newVal) => "$prevVal, $newVal")}");
    _activeBreakpointsSetter = activeBreakpoints;
  }

  List<String> get activeBreakpointsSetter => _activeBreakpointsSetter;

  @override
  void ngAfterViewInit() {
    _log.info(''' AfterViewInit:
        ActiveBreakpoints normal: $activeBreakpoints,
        ActiveBreakpoints setter: $_activeBreakpointsSetter;
    ''');
  }
}
