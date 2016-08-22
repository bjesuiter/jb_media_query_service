import 'package:angular2/angular2.dart';
import 'package:jb_responsive_breakpoints/jb_responsive_breakpoints.dart';
import 'consumer_component/consumer_component.dart';


@Component(
    selector: 'app-root',
    templateUrl: 'app_component.html',
    directives: const [JbResponsiveBreakpoints, ConsumerComponent])
class AppComponent {
  Map<int, String> breakpoints = {0:'small', 300:'medium', 450:'large', 600:'xlarge'};

  List<String> activeBreakpoints = new List<String>();
}