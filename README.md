# jb_responsive_breakpoints

An AngularDart 1 Component for being re-used in other AngularDart projects

## Usage
1. Add the component to your pubspec.yaml
    - Use hosted Version

            dependencies:
              transmogrify:
                hosted:
                  name: transmogrify
                  url: http://some-package-server.com
                version: ^=1.0.0

    - Use git version

            dependencies:
              kittens:
                git: git://github.com/munificent/kittens.git

    - Git with specific branch

            dependencies:
              kittens:
                git:
                  url: git://github.com/munificent/kittens.git
                  ref: some-branch

2. Show your component to angular dependency injection -> see App Class in app_initialize.dart

        import 'package:jb_responsive_breakpoints/jb_responsive_breakpoints.dart';

        class App extends Angular.Module {

          App() {
            bind(JbResponsiveBreakpoints);
          }
        }


## Additional Links

- <https://www.dartlang.org/tools/pub/dependencies.html>
- <http://simiansblog.com/2015/05/06/Using-Inquirer-js/>
- <https://github.com/SBoudrias/Inquirer.js/>
- <https://www.npmjs.com/package/change-case>
- <http://ejs.co/>
- <http://yeoman.io/authoring/user-interactions.html>
- <http://yeoman.io/authoring/>
- <https://github.com/yeoman/generator-generator>
