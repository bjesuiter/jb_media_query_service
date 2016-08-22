import 'package:angular2/angular2.dart';
import 'package:logging/logging.dart';


@Component(
    selector: 'breakpoint-consumer',
    templateUrl: 'consumer_component.html',
    directives: const [])
class AppComponent {

  Logger _log = new Logger("consumer_component");

  @Input()
  List<String> activeBreakpoints;

  List<String> _activeBreakpointsSetter;

  @Input()
  set activeBreakpointsSetter(List<String> activeBreakpoints) {
    _log.info(
        "activeBreakpointsSetter called with ${activeBreakpoints.fold("", (prevVal, newVal) => "$prevVal, $newVal")}");
  }

  List<String> get activeBreakpointsSetter => _activeBreakpointsSetter;


}