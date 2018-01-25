# Changelog

## 5.0.1 +1,+2,+3
- changes some meta files, like README
- adds Github contribution templates

## 5.0.1
- changes package name from jb_responsive_breakpoints to jb_media_query_service

## 5.0.0
- moved content from./web to ./example
- changed architecture to be a more simple media query service instead of a big component 
  with unnecessary complicated bindings
- adjusted example to fit new JbMediaQueryService

## 4.0.2 
- added two dev dependencies back to normal dependencies because of transformer
## 4.0.1
- moves some dependencies to dev_dependencies

## 4.0.0 
- updates to angular 4.0.0
- introduces strong mode & checked dart2js 
(dartdevc not compatible with angular currently)

## 2.0.5 
- updated dependencies, mainly angular2 to 2.2.0
- removed test folder and entry_point from test folder in angular transformer in pubspec.yaml

## 2.0.4 
- upgraded dependencies again - angular2 Beta 20
- added consumer component example to test injecting 
  activeBreakpoints inside components 
- changed onBreakpointChange EventEmitter to emit new list references 
  on every breakpoint change


## 2.0.3 
-downgraded dependencies - angular2 Beta 17

## 2.0.2
- updated dependencies - angular2 Beta 19

## 2.0.1
- emits now change events instead of refreshing the whole component tree on media queries

## 2.0.0
- updated syntax to Angular 2

## 1.0.1
- changed internals to use window.matchMedia
- problem with TwoWayBinding in AngularDart likely broken in version 1.16 of the dart sdk, maybe caused by some code generation issues

## 0.0.1

- Initial version
