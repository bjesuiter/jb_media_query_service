import 'package:angular/angular.dart';
import 'package:logging/logging.dart';


@Component(
    selector: 'breakpoint-consumer',
    templateUrl: 'consumer_component.html',
    directives: const [CORE_DIRECTIVES])
class ConsumerComponent AfterViewInit{

  Logger _log = new Logger("jb_responsive_breakpoints.consumer_component");

  @Input()
  List<String> activeBreakpoints;

  List<String> _activeBreakpointsSetter;

  @Input()
  set activeBreakpointsSetter(activeBreakpoints) {
    _log.info(
        "activeBreakpointsSetter called with ${activeBreakpoints.fold("", (prevVal, newVal) => "$prevVal, $newVal")}");
    _activeBreakpointsSetter = activeBreakpoints;
  }

  List<String> get activeBreakpointsSetter => _activeBreakpointsSetter;

  @override
  ngAfterViewInit() {
    _log.info(''' AfterViewInit:
        ActiveBreakpoints normal: $activeBreakpoints,
        ActiveBreakpoints setter: $_activeBreakpointsSetter;
    ''');

  }
}