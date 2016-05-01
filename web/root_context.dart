
import 'package:angular/angular.dart';

@Injectable()
class RootContext {

  Map<int, String> breakpoints = {0:'small', 300:'medium', 450:'large', 600:'xlarge'};

  List<String> activeBreakpoints = [];
}