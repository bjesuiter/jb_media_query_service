# jb_responsive_breakpoints

An Angular Dart Service to register a listener function 
to media query updates without dealing with matchMedia.

## How to use 

Declare `JbMediaQueryService` as provider, inject it into your component 
(called `mqService in example`) and call  
`mqService.register(callbackFunction, minWidth: 300)`  
 or   
 `mqService.registerStringQuery(callbackFunction, '(minWidth:600px)'`.
 
 The `register` method provides a shortcut for the most used media queries, 
 currently min-width and min-height media queries. 
 If both are given, they will be connected by ` and `. 
 The `registerStringQuery` method allows you to register an arbitrary mediaQuery 
 which is accepted by window.matchMedia. 
 
## Example 
Please look at the `example` folder in the Github Repository. 

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

