# jb_responsive_breakpoints

An Angular Component to provide media-query events in javascript to other Angular Components

#!IMPORTANT! Debug Note

Test functionality of this component without Chrome device emulation resize. 
JavaScript matchMedia seems not to fire events in Chrome device emulation mode.

## Build 'System'
The build system consists of a script system with the 'scripts' package for dart. 
This works analoguous to the npm scripts feature.  
https://pub.dartlang.org/packages/scripts#-readme-tab-

### Activate Scripts
`pub global activate scripts`

### Basic Scripts Commands
- scripts get 
- scripts install <package>
- scripts clean
- scripts <customScriptName> (see pubspec.yaml)

### Custom Scripts Commands
- **check-pkg** - checks package health for pub.dartlang.org with the pana package
- **format-src** - format sources with dartfmt
