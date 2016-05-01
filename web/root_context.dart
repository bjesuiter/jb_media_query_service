
import 'package:angular/angular.dart';

@Injectable()
class RootContext {

  Map<int, String> breakpoints = {0:'small', 300:'medium', 600:'large', 900:'xlarge'};

  List<String> activeBreakpoints = [];
}