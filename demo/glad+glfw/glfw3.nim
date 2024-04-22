
from macros import hint

when not declared(structglfwcursor):
  type
    structglfwcursor* {.incompleteStruct.} = object
else:
  static :
    hint("Declaration of " & "structglfwcursor" &
        " already exists, not redeclaring")
when not declared(structglfwwindow):
  type
    structglfwwindow* {.incompleteStruct.} = object
else:
  static :
    hint("Declaration of " & "structglfwwindow" &
        " already exists, not redeclaring")
when not declared(structglfwmonitor):
  type
    structglfwmonitor* {.incompleteStruct.} = object
else:
  static :
    hint("Declaration of " & "structglfwmonitor" &
        " already exists, not redeclaring")
type
  Glfwglproc_1207969024 = proc (): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1365:16
  Glfwvkproc_1207969026 = proc (): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1379:16
  Glfwmonitor_1207969028 = structglfwmonitor ## Generated based on /usr/local/include/GLFW/glfw3.h:1391:28
  Glfwwindow_1207969030 = structglfwwindow ## Generated based on /usr/local/include/GLFW/glfw3.h:1403:27
  Glfwcursortypedef_1207969032 = structglfwcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1415:27
  Glfwallocatefun_1207969034 = proc (a0: csize_t; a1: pointer): pointer {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1468:18
  Glfwreallocatefun_1207969036 = proc (a0: pointer; a1: csize_t; a2: pointer): pointer {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1524:18
  Glfwdeallocatefun_1207969038 = proc (a0: pointer; a1: pointer): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1566:17
  Glfwerrorfun_1207969040 = proc (a0: cint; a1: cstring): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1590:17
  Glfwwindowposfun_1207969042 = proc (a0: ptr Glfwwindow_1207969031; a1: cint;
                                      a2: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1613:17
  Glfwwindowsizefun_1207969044 = proc (a0: ptr Glfwwindow_1207969031; a1: cint;
                                       a2: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1635:17
  Glfwwindowclosefun_1207969046 = proc (a0: ptr Glfwwindow_1207969031): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1655:17
  Glfwwindowrefreshfun_1207969048 = proc (a0: ptr Glfwwindow_1207969031): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1675:17
  Glfwwindowfocusfun_1207969050 = proc (a0: ptr Glfwwindow_1207969031; a1: cint): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1696:17
  Glfwwindowiconifyfun_1207969052 = proc (a0: ptr Glfwwindow_1207969031;
      a1: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1717:17
  Glfwwindowmaximizefun_1207969054 = proc (a0: ptr Glfwwindow_1207969031;
      a1: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1738:17
  Glfwframebuffersizefun_1207969056 = proc (a0: ptr Glfwwindow_1207969031;
      a1: cint; a2: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1759:17
  Glfwwindowcontentscalefun_1207969058 = proc (a0: ptr Glfwwindow_1207969031;
      a1: cfloat; a2: cfloat): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1780:17
  Glfwmousebuttonfun_1207969060 = proc (a0: ptr Glfwwindow_1207969031; a1: cint;
                                        a2: cint; a3: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1806:17
  Glfwcursorposfun_1207969062 = proc (a0: ptr Glfwwindow_1207969031;
                                      a1: cdouble; a2: cdouble): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1829:17
  Glfwcursorenterfun_1207969064 = proc (a0: ptr Glfwwindow_1207969031; a1: cint): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1850:17
  Glfwscrollfun_1207969066 = proc (a0: ptr Glfwwindow_1207969031; a1: cdouble;
                                   a2: cdouble): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1871:17
  Glfwkeyfun_1207969068 = proc (a0: ptr Glfwwindow_1207969031; a1: cint;
                                a2: cint; a3: cint; a4: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1897:17
  Glfwcharfun_1207969070 = proc (a0: ptr Glfwwindow_1207969031; a1: cuint): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1918:17
  Glfwcharmodsfun_1207969072 = proc (a0: ptr Glfwwindow_1207969031; a1: cuint;
                                     a2: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1945:17
  Glfwdropfun_1207969074 = proc (a0: ptr Glfwwindow_1207969031; a1: cint;
                                 a2: ptr UncheckedArray[cstring]): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:1969:17
  Glfwmonitorfun_1207969076 = proc (a0: ptr Glfwmonitor_1207969029; a1: cint): void {.
      cdecl.}                ## Generated based on /usr/local/include/GLFW/glfw3.h:1990:17
  Glfwjoystickfun_1207969078 = proc (a0: cint; a1: cint): void {.cdecl.} ## Generated based on /usr/local/include/GLFW/glfw3.h:2011:17
  structglfwvidmode_1207969080 {.pure, inheritable, bycopy.} = object
    width*: cint             ## Generated based on /usr/local/include/GLFW/glfw3.h:2026:16
    height*: cint
    redbits*: cint
    greenbits*: cint
    bluebits*: cint
    refreshrate*: cint

  Glfwvidmode_1207969082 = structglfwvidmode_1207969081 ## Generated based on /usr/local/include/GLFW/glfw3.h:2046:3
  structglfwgammaramp_1207969084 {.pure, inheritable, bycopy.} = object
    red*: ptr cushort        ## Generated based on /usr/local/include/GLFW/glfw3.h:2060:16
    green*: ptr cushort
    blue*: ptr cushort
    size*: cuint

  Glfwgammaramp_1207969086 = structglfwgammaramp_1207969085 ## Generated based on /usr/local/include/GLFW/glfw3.h:2074:3
  structglfwimage_1207969088 {.pure, inheritable, bycopy.} = object
    width*: cint             ## Generated based on /usr/local/include/GLFW/glfw3.h:2089:16
    height*: cint
    pixels*: ptr uint8

  Glfwimage_1207969090 = structglfwimage_1207969089 ## Generated based on /usr/local/include/GLFW/glfw3.h:2100:3
  structglfwgamepadstate_1207969092 {.pure, inheritable, bycopy.} = object
    buttons*: array[15'i64, uint8] ## Generated based on /usr/local/include/GLFW/glfw3.h:2113:16
    axes*: array[6'i64, cfloat]

  Glfwgamepadstate_1207969094 = structglfwgamepadstate_1207969093 ## Generated based on /usr/local/include/GLFW/glfw3.h:2123:3
  structglfwallocator_1207969096 {.pure, inheritable, bycopy.} = object
    allocate*: Glfwallocatefun_1207969035 ## Generated based on /usr/local/include/GLFW/glfw3.h:2137:16
    reallocate*: Glfwreallocatefun_1207969037
    deallocate*: Glfwdeallocatefun_1207969039
    user*: pointer

  Glfwallocator_1207969098 = structglfwallocator_1207969097 ## Generated based on /usr/local/include/GLFW/glfw3.h:2155:3
  Glfwmonitor_1207969029 = (when declared(Glfwmonitor):
    Glfwmonitor
   else:
    Glfwmonitor_1207969028)
  Glfwcursorposfun_1207969063 = (when declared(Glfwcursorposfun):
    Glfwcursorposfun
   else:
    Glfwcursorposfun_1207969062)
  Glfwscrollfun_1207969067 = (when declared(Glfwscrollfun):
    Glfwscrollfun
   else:
    Glfwscrollfun_1207969066)
  Glfwwindowsizefun_1207969045 = (when declared(Glfwwindowsizefun):
    Glfwwindowsizefun
   else:
    Glfwwindowsizefun_1207969044)
  Glfwcharmodsfun_1207969073 = (when declared(Glfwcharmodsfun):
    Glfwcharmodsfun
   else:
    Glfwcharmodsfun_1207969072)
  structglfwvidmode_1207969081 = (when declared(structglfwvidmode):
    structglfwvidmode
   else:
    structglfwvidmode_1207969080)
  structglfwgammaramp_1207969085 = (when declared(structglfwgammaramp):
    structglfwgammaramp
   else:
    structglfwgammaramp_1207969084)
  Glfwwindowfocusfun_1207969051 = (when declared(Glfwwindowfocusfun):
    Glfwwindowfocusfun
   else:
    Glfwwindowfocusfun_1207969050)
  Glfwgammaramp_1207969087 = (when declared(Glfwgammaramp):
    Glfwgammaramp
   else:
    Glfwgammaramp_1207969086)
  Glfwwindowclosefun_1207969047 = (when declared(Glfwwindowclosefun):
    Glfwwindowclosefun
   else:
    Glfwwindowclosefun_1207969046)
  structglfwgamepadstate_1207969093 = (when declared(structglfwgamepadstate):
    structglfwgamepadstate
   else:
    structglfwgamepadstate_1207969092)
  structglfwallocator_1207969097 = (when declared(structglfwallocator):
    structglfwallocator
   else:
    structglfwallocator_1207969096)
  Glfwvidmode_1207969083 = (when declared(Glfwvidmode):
    Glfwvidmode
   else:
    Glfwvidmode_1207969082)
  Glfwwindowrefreshfun_1207969049 = (when declared(Glfwwindowrefreshfun):
    Glfwwindowrefreshfun
   else:
    Glfwwindowrefreshfun_1207969048)
  Glfwjoystickfun_1207969079 = (when declared(Glfwjoystickfun):
    Glfwjoystickfun
   else:
    Glfwjoystickfun_1207969078)
  Glfwimage_1207969091 = (when declared(Glfwimage):
    Glfwimage
   else:
    Glfwimage_1207969090)
  Glfwdeallocatefun_1207969039 = (when declared(Glfwdeallocatefun):
    Glfwdeallocatefun
   else:
    Glfwdeallocatefun_1207969038)
  Glfwmonitorfun_1207969077 = (when declared(Glfwmonitorfun):
    Glfwmonitorfun
   else:
    Glfwmonitorfun_1207969076)
  Glfwcursorenterfun_1207969065 = (when declared(Glfwcursorenterfun):
    Glfwcursorenterfun
   else:
    Glfwcursorenterfun_1207969064)
  Glfwdropfun_1207969075 = (when declared(Glfwdropfun):
    Glfwdropfun
   else:
    Glfwdropfun_1207969074)
  Glfwallocatefun_1207969035 = (when declared(Glfwallocatefun):
    Glfwallocatefun
   else:
    Glfwallocatefun_1207969034)
  Glfwgamepadstate_1207969095 = (when declared(Glfwgamepadstate):
    Glfwgamepadstate
   else:
    Glfwgamepadstate_1207969094)
  Glfwwindow_1207969031 = (when declared(Glfwwindow):
    Glfwwindow
   else:
    Glfwwindow_1207969030)
  Glfwallocator_1207969099 = (when declared(Glfwallocator):
    Glfwallocator
   else:
    Glfwallocator_1207969098)
  Glfwglproc_1207969025 = (when declared(Glfwglproc):
    Glfwglproc
   else:
    Glfwglproc_1207969024)
  Glfwwindowmaximizefun_1207969055 = (when declared(Glfwwindowmaximizefun):
    Glfwwindowmaximizefun
   else:
    Glfwwindowmaximizefun_1207969054)
  Glfwerrorfun_1207969041 = (when declared(Glfwerrorfun):
    Glfwerrorfun
   else:
    Glfwerrorfun_1207969040)
  Glfwreallocatefun_1207969037 = (when declared(Glfwreallocatefun):
    Glfwreallocatefun
   else:
    Glfwreallocatefun_1207969036)
  Glfwwindowiconifyfun_1207969053 = (when declared(Glfwwindowiconifyfun):
    Glfwwindowiconifyfun
   else:
    Glfwwindowiconifyfun_1207969052)
  Glfwwindowcontentscalefun_1207969059 = (when declared(
      Glfwwindowcontentscalefun):
    Glfwwindowcontentscalefun
   else:
    Glfwwindowcontentscalefun_1207969058)
  Glfwcursortypedef_1207969033 = (when declared(Glfwcursortypedef):
    Glfwcursortypedef
   else:
    Glfwcursortypedef_1207969032)
  Glfwvkproc_1207969027 = (when declared(Glfwvkproc):
    Glfwvkproc
   else:
    Glfwvkproc_1207969026)
  Glfwkeyfun_1207969069 = (when declared(Glfwkeyfun):
    Glfwkeyfun
   else:
    Glfwkeyfun_1207969068)
  Glfwcharfun_1207969071 = (when declared(Glfwcharfun):
    Glfwcharfun
   else:
    Glfwcharfun_1207969070)
  Glfwwindowposfun_1207969043 = (when declared(Glfwwindowposfun):
    Glfwwindowposfun
   else:
    Glfwwindowposfun_1207969042)
  structglfwimage_1207969089 = (when declared(structglfwimage):
    structglfwimage
   else:
    structglfwimage_1207969088)
  Glfwmousebuttonfun_1207969061 = (when declared(Glfwmousebuttonfun):
    Glfwmousebuttonfun
   else:
    Glfwmousebuttonfun_1207969060)
  Glfwframebuffersizefun_1207969057 = (when declared(Glfwframebuffersizefun):
    Glfwframebuffersizefun
   else:
    Glfwframebuffersizefun_1207969056)
when not declared(Glfwmonitor):
  type
    Glfwmonitor* = Glfwmonitor_1207969028
else:
  static :
    hint("Declaration of " & "Glfwmonitor" & " already exists, not redeclaring")
when not declared(Glfwcursorposfun):
  type
    Glfwcursorposfun* = Glfwcursorposfun_1207969062
else:
  static :
    hint("Declaration of " & "Glfwcursorposfun" &
        " already exists, not redeclaring")
when not declared(Glfwscrollfun):
  type
    Glfwscrollfun* = Glfwscrollfun_1207969066
else:
  static :
    hint("Declaration of " & "Glfwscrollfun" &
        " already exists, not redeclaring")
when not declared(Glfwwindowsizefun):
  type
    Glfwwindowsizefun* = Glfwwindowsizefun_1207969044
else:
  static :
    hint("Declaration of " & "Glfwwindowsizefun" &
        " already exists, not redeclaring")
when not declared(Glfwcharmodsfun):
  type
    Glfwcharmodsfun* = Glfwcharmodsfun_1207969072
else:
  static :
    hint("Declaration of " & "Glfwcharmodsfun" &
        " already exists, not redeclaring")
when not declared(structglfwvidmode):
  type
    structglfwvidmode* = structglfwvidmode_1207969080
else:
  static :
    hint("Declaration of " & "structglfwvidmode" &
        " already exists, not redeclaring")
when not declared(structglfwgammaramp):
  type
    structglfwgammaramp* = structglfwgammaramp_1207969084
else:
  static :
    hint("Declaration of " & "structglfwgammaramp" &
        " already exists, not redeclaring")
when not declared(Glfwwindowfocusfun):
  type
    Glfwwindowfocusfun* = Glfwwindowfocusfun_1207969050
else:
  static :
    hint("Declaration of " & "Glfwwindowfocusfun" &
        " already exists, not redeclaring")
when not declared(Glfwgammaramp):
  type
    Glfwgammaramp* = Glfwgammaramp_1207969086
else:
  static :
    hint("Declaration of " & "Glfwgammaramp" &
        " already exists, not redeclaring")
when not declared(Glfwwindowclosefun):
  type
    Glfwwindowclosefun* = Glfwwindowclosefun_1207969046
else:
  static :
    hint("Declaration of " & "Glfwwindowclosefun" &
        " already exists, not redeclaring")
when not declared(structglfwgamepadstate):
  type
    structglfwgamepadstate* = structglfwgamepadstate_1207969092
else:
  static :
    hint("Declaration of " & "structglfwgamepadstate" &
        " already exists, not redeclaring")
when not declared(structglfwallocator):
  type
    structglfwallocator* = structglfwallocator_1207969096
else:
  static :
    hint("Declaration of " & "structglfwallocator" &
        " already exists, not redeclaring")
when not declared(Glfwvidmode):
  type
    Glfwvidmode* = Glfwvidmode_1207969082
else:
  static :
    hint("Declaration of " & "Glfwvidmode" & " already exists, not redeclaring")
when not declared(Glfwwindowrefreshfun):
  type
    Glfwwindowrefreshfun* = Glfwwindowrefreshfun_1207969048
else:
  static :
    hint("Declaration of " & "Glfwwindowrefreshfun" &
        " already exists, not redeclaring")
when not declared(Glfwjoystickfun):
  type
    Glfwjoystickfun* = Glfwjoystickfun_1207969078
else:
  static :
    hint("Declaration of " & "Glfwjoystickfun" &
        " already exists, not redeclaring")
when not declared(Glfwimage):
  type
    Glfwimage* = Glfwimage_1207969090
else:
  static :
    hint("Declaration of " & "Glfwimage" & " already exists, not redeclaring")
when not declared(Glfwdeallocatefun):
  type
    Glfwdeallocatefun* = Glfwdeallocatefun_1207969038
else:
  static :
    hint("Declaration of " & "Glfwdeallocatefun" &
        " already exists, not redeclaring")
when not declared(Glfwmonitorfun):
  type
    Glfwmonitorfun* = Glfwmonitorfun_1207969076
else:
  static :
    hint("Declaration of " & "Glfwmonitorfun" &
        " already exists, not redeclaring")
when not declared(Glfwcursorenterfun):
  type
    Glfwcursorenterfun* = Glfwcursorenterfun_1207969064
else:
  static :
    hint("Declaration of " & "Glfwcursorenterfun" &
        " already exists, not redeclaring")
when not declared(Glfwdropfun):
  type
    Glfwdropfun* = Glfwdropfun_1207969074
else:
  static :
    hint("Declaration of " & "Glfwdropfun" & " already exists, not redeclaring")
when not declared(Glfwallocatefun):
  type
    Glfwallocatefun* = Glfwallocatefun_1207969034
else:
  static :
    hint("Declaration of " & "Glfwallocatefun" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadstate):
  type
    Glfwgamepadstate* = Glfwgamepadstate_1207969094
else:
  static :
    hint("Declaration of " & "Glfwgamepadstate" &
        " already exists, not redeclaring")
when not declared(Glfwwindow):
  type
    Glfwwindow* = Glfwwindow_1207969030
else:
  static :
    hint("Declaration of " & "Glfwwindow" & " already exists, not redeclaring")
when not declared(Glfwallocator):
  type
    Glfwallocator* = Glfwallocator_1207969098
else:
  static :
    hint("Declaration of " & "Glfwallocator" &
        " already exists, not redeclaring")
when not declared(Glfwglproc):
  type
    Glfwglproc* = Glfwglproc_1207969024
else:
  static :
    hint("Declaration of " & "Glfwglproc" & " already exists, not redeclaring")
when not declared(Glfwwindowmaximizefun):
  type
    Glfwwindowmaximizefun* = Glfwwindowmaximizefun_1207969054
else:
  static :
    hint("Declaration of " & "Glfwwindowmaximizefun" &
        " already exists, not redeclaring")
when not declared(Glfwerrorfun):
  type
    Glfwerrorfun* = Glfwerrorfun_1207969040
else:
  static :
    hint("Declaration of " & "Glfwerrorfun" & " already exists, not redeclaring")
when not declared(Glfwreallocatefun):
  type
    Glfwreallocatefun* = Glfwreallocatefun_1207969036
else:
  static :
    hint("Declaration of " & "Glfwreallocatefun" &
        " already exists, not redeclaring")
when not declared(Glfwwindowiconifyfun):
  type
    Glfwwindowiconifyfun* = Glfwwindowiconifyfun_1207969052
else:
  static :
    hint("Declaration of " & "Glfwwindowiconifyfun" &
        " already exists, not redeclaring")
when not declared(Glfwwindowcontentscalefun):
  type
    Glfwwindowcontentscalefun* = Glfwwindowcontentscalefun_1207969058
else:
  static :
    hint("Declaration of " & "Glfwwindowcontentscalefun" &
        " already exists, not redeclaring")
when not declared(Glfwcursortypedef):
  type
    Glfwcursortypedef* = Glfwcursortypedef_1207969032
else:
  static :
    hint("Declaration of " & "Glfwcursortypedef" &
        " already exists, not redeclaring")
when not declared(Glfwvkproc):
  type
    Glfwvkproc* = Glfwvkproc_1207969026
else:
  static :
    hint("Declaration of " & "Glfwvkproc" & " already exists, not redeclaring")
when not declared(Glfwkeyfun):
  type
    Glfwkeyfun* = Glfwkeyfun_1207969068
else:
  static :
    hint("Declaration of " & "Glfwkeyfun" & " already exists, not redeclaring")
when not declared(Glfwcharfun):
  type
    Glfwcharfun* = Glfwcharfun_1207969070
else:
  static :
    hint("Declaration of " & "Glfwcharfun" & " already exists, not redeclaring")
when not declared(Glfwwindowposfun):
  type
    Glfwwindowposfun* = Glfwwindowposfun_1207969042
else:
  static :
    hint("Declaration of " & "Glfwwindowposfun" &
        " already exists, not redeclaring")
when not declared(structglfwimage):
  type
    structglfwimage* = structglfwimage_1207969088
else:
  static :
    hint("Declaration of " & "structglfwimage" &
        " already exists, not redeclaring")
when not declared(Glfwmousebuttonfun):
  type
    Glfwmousebuttonfun* = Glfwmousebuttonfun_1207969060
else:
  static :
    hint("Declaration of " & "Glfwmousebuttonfun" &
        " already exists, not redeclaring")
when not declared(Glfwframebuffersizefun):
  type
    Glfwframebuffersizefun* = Glfwframebuffersizefun_1207969056
else:
  static :
    hint("Declaration of " & "Glfwframebuffersizefun" &
        " already exists, not redeclaring")
when not declared(Glfwversionmajor):
  when 3 is static:
    const
      Glfwversionmajor* = 3  ## Generated based on /usr/local/include/GLFW/glfw3.h:287:9
  else:
    let Glfwversionmajor* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:287:9
else:
  static :
    hint("Declaration of " & "Glfwversionmajor" &
        " already exists, not redeclaring")
when not declared(Glfwversionminor):
  when 5 is static:
    const
      Glfwversionminor* = 5  ## Generated based on /usr/local/include/GLFW/glfw3.h:294:9
  else:
    let Glfwversionminor* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:294:9
else:
  static :
    hint("Declaration of " & "Glfwversionminor" &
        " already exists, not redeclaring")
when not declared(Glfwversionrevision):
  when 0 is static:
    const
      Glfwversionrevision* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:301:9
  else:
    let Glfwversionrevision* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:301:9
else:
  static :
    hint("Declaration of " & "Glfwversionrevision" &
        " already exists, not redeclaring")
when not declared(Glfwtrue):
  when 1 is static:
    const
      Glfwtrue* = 1          ## Generated based on /usr/local/include/GLFW/glfw3.h:312:9
  else:
    let Glfwtrue* = 1        ## Generated based on /usr/local/include/GLFW/glfw3.h:312:9
else:
  static :
    hint("Declaration of " & "Glfwtrue" & " already exists, not redeclaring")
when not declared(Glfwfalse):
  when 0 is static:
    const
      Glfwfalse* = 0         ## Generated based on /usr/local/include/GLFW/glfw3.h:321:9
  else:
    let Glfwfalse* = 0       ## Generated based on /usr/local/include/GLFW/glfw3.h:321:9
else:
  static :
    hint("Declaration of " & "Glfwfalse" & " already exists, not redeclaring")
when not declared(Glfwrelease):
  when 0 is static:
    const
      Glfwrelease* = 0       ## Generated based on /usr/local/include/GLFW/glfw3.h:331:9
  else:
    let Glfwrelease* = 0     ## Generated based on /usr/local/include/GLFW/glfw3.h:331:9
else:
  static :
    hint("Declaration of " & "Glfwrelease" & " already exists, not redeclaring")
when not declared(Glfwpress):
  when 1 is static:
    const
      Glfwpress* = 1         ## Generated based on /usr/local/include/GLFW/glfw3.h:338:9
  else:
    let Glfwpress* = 1       ## Generated based on /usr/local/include/GLFW/glfw3.h:338:9
else:
  static :
    hint("Declaration of " & "Glfwpress" & " already exists, not redeclaring")
when not declared(Glfwrepeat):
  when 2 is static:
    const
      Glfwrepeat* = 2        ## Generated based on /usr/local/include/GLFW/glfw3.h:345:9
  else:
    let Glfwrepeat* = 2      ## Generated based on /usr/local/include/GLFW/glfw3.h:345:9
else:
  static :
    hint("Declaration of " & "Glfwrepeat" & " already exists, not redeclaring")
when not declared(Glfwhatcentered):
  when 0 is static:
    const
      Glfwhatcentered* = 0   ## Generated based on /usr/local/include/GLFW/glfw3.h:355:9
  else:
    let Glfwhatcentered* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:355:9
else:
  static :
    hint("Declaration of " & "Glfwhatcentered" &
        " already exists, not redeclaring")
when not declared(Glfwhatup):
  when 1 is static:
    const
      Glfwhatup* = 1         ## Generated based on /usr/local/include/GLFW/glfw3.h:356:9
  else:
    let Glfwhatup* = 1       ## Generated based on /usr/local/include/GLFW/glfw3.h:356:9
else:
  static :
    hint("Declaration of " & "Glfwhatup" & " already exists, not redeclaring")
when not declared(Glfwhatright):
  when 2 is static:
    const
      Glfwhatright* = 2      ## Generated based on /usr/local/include/GLFW/glfw3.h:357:9
  else:
    let Glfwhatright* = 2    ## Generated based on /usr/local/include/GLFW/glfw3.h:357:9
else:
  static :
    hint("Declaration of " & "Glfwhatright" & " already exists, not redeclaring")
when not declared(Glfwhatdown):
  when 4 is static:
    const
      Glfwhatdown* = 4       ## Generated based on /usr/local/include/GLFW/glfw3.h:358:9
  else:
    let Glfwhatdown* = 4     ## Generated based on /usr/local/include/GLFW/glfw3.h:358:9
else:
  static :
    hint("Declaration of " & "Glfwhatdown" & " already exists, not redeclaring")
when not declared(Glfwhatleft):
  when 8 is static:
    const
      Glfwhatleft* = 8       ## Generated based on /usr/local/include/GLFW/glfw3.h:359:9
  else:
    let Glfwhatleft* = 8     ## Generated based on /usr/local/include/GLFW/glfw3.h:359:9
else:
  static :
    hint("Declaration of " & "Glfwhatleft" & " already exists, not redeclaring")
when not declared(Glfwkeyunknown):
  when -1 is static:
    const
      Glfwkeyunknown* = -1   ## Generated based on /usr/local/include/GLFW/glfw3.h:367:9
  else:
    let Glfwkeyunknown* = -1 ## Generated based on /usr/local/include/GLFW/glfw3.h:367:9
else:
  static :
    hint("Declaration of " & "Glfwkeyunknown" &
        " already exists, not redeclaring")
when not declared(Glfwkeyspace):
  when 32 is static:
    const
      Glfwkeyspace* = 32     ## Generated based on /usr/local/include/GLFW/glfw3.h:396:9
  else:
    let Glfwkeyspace* = 32   ## Generated based on /usr/local/include/GLFW/glfw3.h:396:9
else:
  static :
    hint("Declaration of " & "Glfwkeyspace" & " already exists, not redeclaring")
when not declared(Glfwkeyapostrophe):
  when 39 is static:
    const
      Glfwkeyapostrophe* = 39 ## Generated based on /usr/local/include/GLFW/glfw3.h:397:9
  else:
    let Glfwkeyapostrophe* = 39 ## Generated based on /usr/local/include/GLFW/glfw3.h:397:9
else:
  static :
    hint("Declaration of " & "Glfwkeyapostrophe" &
        " already exists, not redeclaring")
when not declared(Glfwkeycomma):
  when 44 is static:
    const
      Glfwkeycomma* = 44     ## Generated based on /usr/local/include/GLFW/glfw3.h:398:9
  else:
    let Glfwkeycomma* = 44   ## Generated based on /usr/local/include/GLFW/glfw3.h:398:9
else:
  static :
    hint("Declaration of " & "Glfwkeycomma" & " already exists, not redeclaring")
when not declared(Glfwkeyminus):
  when 45 is static:
    const
      Glfwkeyminus* = 45     ## Generated based on /usr/local/include/GLFW/glfw3.h:399:9
  else:
    let Glfwkeyminus* = 45   ## Generated based on /usr/local/include/GLFW/glfw3.h:399:9
else:
  static :
    hint("Declaration of " & "Glfwkeyminus" & " already exists, not redeclaring")
when not declared(Glfwkeyperiod):
  when 46 is static:
    const
      Glfwkeyperiod* = 46    ## Generated based on /usr/local/include/GLFW/glfw3.h:400:9
  else:
    let Glfwkeyperiod* = 46  ## Generated based on /usr/local/include/GLFW/glfw3.h:400:9
else:
  static :
    hint("Declaration of " & "Glfwkeyperiod" &
        " already exists, not redeclaring")
when not declared(Glfwkeyslash):
  when 47 is static:
    const
      Glfwkeyslash* = 47     ## Generated based on /usr/local/include/GLFW/glfw3.h:401:9
  else:
    let Glfwkeyslash* = 47   ## Generated based on /usr/local/include/GLFW/glfw3.h:401:9
else:
  static :
    hint("Declaration of " & "Glfwkeyslash" & " already exists, not redeclaring")
when not declared(Glfwkey0):
  when 48 is static:
    const
      Glfwkey0* = 48         ## Generated based on /usr/local/include/GLFW/glfw3.h:402:9
  else:
    let Glfwkey0* = 48       ## Generated based on /usr/local/include/GLFW/glfw3.h:402:9
else:
  static :
    hint("Declaration of " & "Glfwkey0" & " already exists, not redeclaring")
when not declared(Glfwkey1):
  when 49 is static:
    const
      Glfwkey1* = 49         ## Generated based on /usr/local/include/GLFW/glfw3.h:403:9
  else:
    let Glfwkey1* = 49       ## Generated based on /usr/local/include/GLFW/glfw3.h:403:9
else:
  static :
    hint("Declaration of " & "Glfwkey1" & " already exists, not redeclaring")
when not declared(Glfwkey2):
  when 50 is static:
    const
      Glfwkey2* = 50         ## Generated based on /usr/local/include/GLFW/glfw3.h:404:9
  else:
    let Glfwkey2* = 50       ## Generated based on /usr/local/include/GLFW/glfw3.h:404:9
else:
  static :
    hint("Declaration of " & "Glfwkey2" & " already exists, not redeclaring")
when not declared(Glfwkey3):
  when 51 is static:
    const
      Glfwkey3* = 51         ## Generated based on /usr/local/include/GLFW/glfw3.h:405:9
  else:
    let Glfwkey3* = 51       ## Generated based on /usr/local/include/GLFW/glfw3.h:405:9
else:
  static :
    hint("Declaration of " & "Glfwkey3" & " already exists, not redeclaring")
when not declared(Glfwkey4):
  when 52 is static:
    const
      Glfwkey4* = 52         ## Generated based on /usr/local/include/GLFW/glfw3.h:406:9
  else:
    let Glfwkey4* = 52       ## Generated based on /usr/local/include/GLFW/glfw3.h:406:9
else:
  static :
    hint("Declaration of " & "Glfwkey4" & " already exists, not redeclaring")
when not declared(Glfwkey5):
  when 53 is static:
    const
      Glfwkey5* = 53         ## Generated based on /usr/local/include/GLFW/glfw3.h:407:9
  else:
    let Glfwkey5* = 53       ## Generated based on /usr/local/include/GLFW/glfw3.h:407:9
else:
  static :
    hint("Declaration of " & "Glfwkey5" & " already exists, not redeclaring")
when not declared(Glfwkey6):
  when 54 is static:
    const
      Glfwkey6* = 54         ## Generated based on /usr/local/include/GLFW/glfw3.h:408:9
  else:
    let Glfwkey6* = 54       ## Generated based on /usr/local/include/GLFW/glfw3.h:408:9
else:
  static :
    hint("Declaration of " & "Glfwkey6" & " already exists, not redeclaring")
when not declared(Glfwkey7):
  when 55 is static:
    const
      Glfwkey7* = 55         ## Generated based on /usr/local/include/GLFW/glfw3.h:409:9
  else:
    let Glfwkey7* = 55       ## Generated based on /usr/local/include/GLFW/glfw3.h:409:9
else:
  static :
    hint("Declaration of " & "Glfwkey7" & " already exists, not redeclaring")
when not declared(Glfwkey8):
  when 56 is static:
    const
      Glfwkey8* = 56         ## Generated based on /usr/local/include/GLFW/glfw3.h:410:9
  else:
    let Glfwkey8* = 56       ## Generated based on /usr/local/include/GLFW/glfw3.h:410:9
else:
  static :
    hint("Declaration of " & "Glfwkey8" & " already exists, not redeclaring")
when not declared(Glfwkey9):
  when 57 is static:
    const
      Glfwkey9* = 57         ## Generated based on /usr/local/include/GLFW/glfw3.h:411:9
  else:
    let Glfwkey9* = 57       ## Generated based on /usr/local/include/GLFW/glfw3.h:411:9
else:
  static :
    hint("Declaration of " & "Glfwkey9" & " already exists, not redeclaring")
when not declared(Glfwkeysemicolon):
  when 59 is static:
    const
      Glfwkeysemicolon* = 59 ## Generated based on /usr/local/include/GLFW/glfw3.h:412:9
  else:
    let Glfwkeysemicolon* = 59 ## Generated based on /usr/local/include/GLFW/glfw3.h:412:9
else:
  static :
    hint("Declaration of " & "Glfwkeysemicolon" &
        " already exists, not redeclaring")
when not declared(Glfwkeyequal):
  when 61 is static:
    const
      Glfwkeyequal* = 61     ## Generated based on /usr/local/include/GLFW/glfw3.h:413:9
  else:
    let Glfwkeyequal* = 61   ## Generated based on /usr/local/include/GLFW/glfw3.h:413:9
else:
  static :
    hint("Declaration of " & "Glfwkeyequal" & " already exists, not redeclaring")
when not declared(Glfwkeya):
  when 65 is static:
    const
      Glfwkeya* = 65         ## Generated based on /usr/local/include/GLFW/glfw3.h:414:9
  else:
    let Glfwkeya* = 65       ## Generated based on /usr/local/include/GLFW/glfw3.h:414:9
else:
  static :
    hint("Declaration of " & "Glfwkeya" & " already exists, not redeclaring")
when not declared(Glfwkeyb):
  when 66 is static:
    const
      Glfwkeyb* = 66         ## Generated based on /usr/local/include/GLFW/glfw3.h:415:9
  else:
    let Glfwkeyb* = 66       ## Generated based on /usr/local/include/GLFW/glfw3.h:415:9
else:
  static :
    hint("Declaration of " & "Glfwkeyb" & " already exists, not redeclaring")
when not declared(Glfwkeyc):
  when 67 is static:
    const
      Glfwkeyc* = 67         ## Generated based on /usr/local/include/GLFW/glfw3.h:416:9
  else:
    let Glfwkeyc* = 67       ## Generated based on /usr/local/include/GLFW/glfw3.h:416:9
else:
  static :
    hint("Declaration of " & "Glfwkeyc" & " already exists, not redeclaring")
when not declared(Glfwkeyd):
  when 68 is static:
    const
      Glfwkeyd* = 68         ## Generated based on /usr/local/include/GLFW/glfw3.h:417:9
  else:
    let Glfwkeyd* = 68       ## Generated based on /usr/local/include/GLFW/glfw3.h:417:9
else:
  static :
    hint("Declaration of " & "Glfwkeyd" & " already exists, not redeclaring")
when not declared(Glfwkeye):
  when 69 is static:
    const
      Glfwkeye* = 69         ## Generated based on /usr/local/include/GLFW/glfw3.h:418:9
  else:
    let Glfwkeye* = 69       ## Generated based on /usr/local/include/GLFW/glfw3.h:418:9
else:
  static :
    hint("Declaration of " & "Glfwkeye" & " already exists, not redeclaring")
when not declared(Glfwkeyf):
  when 70 is static:
    const
      Glfwkeyf* = 70         ## Generated based on /usr/local/include/GLFW/glfw3.h:419:9
  else:
    let Glfwkeyf* = 70       ## Generated based on /usr/local/include/GLFW/glfw3.h:419:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf" & " already exists, not redeclaring")
when not declared(Glfwkeyg):
  when 71 is static:
    const
      Glfwkeyg* = 71         ## Generated based on /usr/local/include/GLFW/glfw3.h:420:9
  else:
    let Glfwkeyg* = 71       ## Generated based on /usr/local/include/GLFW/glfw3.h:420:9
else:
  static :
    hint("Declaration of " & "Glfwkeyg" & " already exists, not redeclaring")
when not declared(Glfwkeyh):
  when 72 is static:
    const
      Glfwkeyh* = 72         ## Generated based on /usr/local/include/GLFW/glfw3.h:421:9
  else:
    let Glfwkeyh* = 72       ## Generated based on /usr/local/include/GLFW/glfw3.h:421:9
else:
  static :
    hint("Declaration of " & "Glfwkeyh" & " already exists, not redeclaring")
when not declared(Glfwkeyi):
  when 73 is static:
    const
      Glfwkeyi* = 73         ## Generated based on /usr/local/include/GLFW/glfw3.h:422:9
  else:
    let Glfwkeyi* = 73       ## Generated based on /usr/local/include/GLFW/glfw3.h:422:9
else:
  static :
    hint("Declaration of " & "Glfwkeyi" & " already exists, not redeclaring")
when not declared(Glfwkeyj):
  when 74 is static:
    const
      Glfwkeyj* = 74         ## Generated based on /usr/local/include/GLFW/glfw3.h:423:9
  else:
    let Glfwkeyj* = 74       ## Generated based on /usr/local/include/GLFW/glfw3.h:423:9
else:
  static :
    hint("Declaration of " & "Glfwkeyj" & " already exists, not redeclaring")
when not declared(Glfwkeyk):
  when 75 is static:
    const
      Glfwkeyk* = 75         ## Generated based on /usr/local/include/GLFW/glfw3.h:424:9
  else:
    let Glfwkeyk* = 75       ## Generated based on /usr/local/include/GLFW/glfw3.h:424:9
else:
  static :
    hint("Declaration of " & "Glfwkeyk" & " already exists, not redeclaring")
when not declared(Glfwkeyl):
  when 76 is static:
    const
      Glfwkeyl* = 76         ## Generated based on /usr/local/include/GLFW/glfw3.h:425:9
  else:
    let Glfwkeyl* = 76       ## Generated based on /usr/local/include/GLFW/glfw3.h:425:9
else:
  static :
    hint("Declaration of " & "Glfwkeyl" & " already exists, not redeclaring")
when not declared(Glfwkeym):
  when 77 is static:
    const
      Glfwkeym* = 77         ## Generated based on /usr/local/include/GLFW/glfw3.h:426:9
  else:
    let Glfwkeym* = 77       ## Generated based on /usr/local/include/GLFW/glfw3.h:426:9
else:
  static :
    hint("Declaration of " & "Glfwkeym" & " already exists, not redeclaring")
when not declared(Glfwkeyn):
  when 78 is static:
    const
      Glfwkeyn* = 78         ## Generated based on /usr/local/include/GLFW/glfw3.h:427:9
  else:
    let Glfwkeyn* = 78       ## Generated based on /usr/local/include/GLFW/glfw3.h:427:9
else:
  static :
    hint("Declaration of " & "Glfwkeyn" & " already exists, not redeclaring")
when not declared(Glfwkeyo):
  when 79 is static:
    const
      Glfwkeyo* = 79         ## Generated based on /usr/local/include/GLFW/glfw3.h:428:9
  else:
    let Glfwkeyo* = 79       ## Generated based on /usr/local/include/GLFW/glfw3.h:428:9
else:
  static :
    hint("Declaration of " & "Glfwkeyo" & " already exists, not redeclaring")
when not declared(Glfwkeyp):
  when 80 is static:
    const
      Glfwkeyp* = 80         ## Generated based on /usr/local/include/GLFW/glfw3.h:429:9
  else:
    let Glfwkeyp* = 80       ## Generated based on /usr/local/include/GLFW/glfw3.h:429:9
else:
  static :
    hint("Declaration of " & "Glfwkeyp" & " already exists, not redeclaring")
when not declared(Glfwkeyq):
  when 81 is static:
    const
      Glfwkeyq* = 81         ## Generated based on /usr/local/include/GLFW/glfw3.h:430:9
  else:
    let Glfwkeyq* = 81       ## Generated based on /usr/local/include/GLFW/glfw3.h:430:9
else:
  static :
    hint("Declaration of " & "Glfwkeyq" & " already exists, not redeclaring")
when not declared(Glfwkeyr):
  when 82 is static:
    const
      Glfwkeyr* = 82         ## Generated based on /usr/local/include/GLFW/glfw3.h:431:9
  else:
    let Glfwkeyr* = 82       ## Generated based on /usr/local/include/GLFW/glfw3.h:431:9
else:
  static :
    hint("Declaration of " & "Glfwkeyr" & " already exists, not redeclaring")
when not declared(Glfwkeys):
  when 83 is static:
    const
      Glfwkeys* = 83         ## Generated based on /usr/local/include/GLFW/glfw3.h:432:9
  else:
    let Glfwkeys* = 83       ## Generated based on /usr/local/include/GLFW/glfw3.h:432:9
else:
  static :
    hint("Declaration of " & "Glfwkeys" & " already exists, not redeclaring")
when not declared(Glfwkeyt):
  when 84 is static:
    const
      Glfwkeyt* = 84         ## Generated based on /usr/local/include/GLFW/glfw3.h:433:9
  else:
    let Glfwkeyt* = 84       ## Generated based on /usr/local/include/GLFW/glfw3.h:433:9
else:
  static :
    hint("Declaration of " & "Glfwkeyt" & " already exists, not redeclaring")
when not declared(Glfwkeyu):
  when 85 is static:
    const
      Glfwkeyu* = 85         ## Generated based on /usr/local/include/GLFW/glfw3.h:434:9
  else:
    let Glfwkeyu* = 85       ## Generated based on /usr/local/include/GLFW/glfw3.h:434:9
else:
  static :
    hint("Declaration of " & "Glfwkeyu" & " already exists, not redeclaring")
when not declared(Glfwkeyv):
  when 86 is static:
    const
      Glfwkeyv* = 86         ## Generated based on /usr/local/include/GLFW/glfw3.h:435:9
  else:
    let Glfwkeyv* = 86       ## Generated based on /usr/local/include/GLFW/glfw3.h:435:9
else:
  static :
    hint("Declaration of " & "Glfwkeyv" & " already exists, not redeclaring")
when not declared(Glfwkeyw):
  when 87 is static:
    const
      Glfwkeyw* = 87         ## Generated based on /usr/local/include/GLFW/glfw3.h:436:9
  else:
    let Glfwkeyw* = 87       ## Generated based on /usr/local/include/GLFW/glfw3.h:436:9
else:
  static :
    hint("Declaration of " & "Glfwkeyw" & " already exists, not redeclaring")
when not declared(Glfwkeyx):
  when 88 is static:
    const
      Glfwkeyx* = 88         ## Generated based on /usr/local/include/GLFW/glfw3.h:437:9
  else:
    let Glfwkeyx* = 88       ## Generated based on /usr/local/include/GLFW/glfw3.h:437:9
else:
  static :
    hint("Declaration of " & "Glfwkeyx" & " already exists, not redeclaring")
when not declared(Glfwkeyy):
  when 89 is static:
    const
      Glfwkeyy* = 89         ## Generated based on /usr/local/include/GLFW/glfw3.h:438:9
  else:
    let Glfwkeyy* = 89       ## Generated based on /usr/local/include/GLFW/glfw3.h:438:9
else:
  static :
    hint("Declaration of " & "Glfwkeyy" & " already exists, not redeclaring")
when not declared(Glfwkeyz):
  when 90 is static:
    const
      Glfwkeyz* = 90         ## Generated based on /usr/local/include/GLFW/glfw3.h:439:9
  else:
    let Glfwkeyz* = 90       ## Generated based on /usr/local/include/GLFW/glfw3.h:439:9
else:
  static :
    hint("Declaration of " & "Glfwkeyz" & " already exists, not redeclaring")
when not declared(Glfwkeyleftbracket):
  when 91 is static:
    const
      Glfwkeyleftbracket* = 91 ## Generated based on /usr/local/include/GLFW/glfw3.h:440:9
  else:
    let Glfwkeyleftbracket* = 91 ## Generated based on /usr/local/include/GLFW/glfw3.h:440:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleftbracket" &
        " already exists, not redeclaring")
when not declared(Glfwkeybackslash):
  when 92 is static:
    const
      Glfwkeybackslash* = 92 ## Generated based on /usr/local/include/GLFW/glfw3.h:441:9
  else:
    let Glfwkeybackslash* = 92 ## Generated based on /usr/local/include/GLFW/glfw3.h:441:9
else:
  static :
    hint("Declaration of " & "Glfwkeybackslash" &
        " already exists, not redeclaring")
when not declared(Glfwkeyrightbracket):
  when 93 is static:
    const
      Glfwkeyrightbracket* = 93 ## Generated based on /usr/local/include/GLFW/glfw3.h:442:9
  else:
    let Glfwkeyrightbracket* = 93 ## Generated based on /usr/local/include/GLFW/glfw3.h:442:9
else:
  static :
    hint("Declaration of " & "Glfwkeyrightbracket" &
        " already exists, not redeclaring")
when not declared(Glfwkeygraveaccent):
  when 96 is static:
    const
      Glfwkeygraveaccent* = 96 ## Generated based on /usr/local/include/GLFW/glfw3.h:443:9
  else:
    let Glfwkeygraveaccent* = 96 ## Generated based on /usr/local/include/GLFW/glfw3.h:443:9
else:
  static :
    hint("Declaration of " & "Glfwkeygraveaccent" &
        " already exists, not redeclaring")
when not declared(Glfwkeyworld1):
  when 161 is static:
    const
      Glfwkeyworld1* = 161   ## Generated based on /usr/local/include/GLFW/glfw3.h:444:9
  else:
    let Glfwkeyworld1* = 161 ## Generated based on /usr/local/include/GLFW/glfw3.h:444:9
else:
  static :
    hint("Declaration of " & "Glfwkeyworld1" &
        " already exists, not redeclaring")
when not declared(Glfwkeyworld2):
  when 162 is static:
    const
      Glfwkeyworld2* = 162   ## Generated based on /usr/local/include/GLFW/glfw3.h:445:9
  else:
    let Glfwkeyworld2* = 162 ## Generated based on /usr/local/include/GLFW/glfw3.h:445:9
else:
  static :
    hint("Declaration of " & "Glfwkeyworld2" &
        " already exists, not redeclaring")
when not declared(Glfwkeyescape):
  when 256 is static:
    const
      Glfwkeyescape* = 256   ## Generated based on /usr/local/include/GLFW/glfw3.h:448:9
  else:
    let Glfwkeyescape* = 256 ## Generated based on /usr/local/include/GLFW/glfw3.h:448:9
else:
  static :
    hint("Declaration of " & "Glfwkeyescape" &
        " already exists, not redeclaring")
when not declared(Glfwkeyenter):
  when 257 is static:
    const
      Glfwkeyenter* = 257    ## Generated based on /usr/local/include/GLFW/glfw3.h:449:9
  else:
    let Glfwkeyenter* = 257  ## Generated based on /usr/local/include/GLFW/glfw3.h:449:9
else:
  static :
    hint("Declaration of " & "Glfwkeyenter" & " already exists, not redeclaring")
when not declared(Glfwkeytab):
  when 258 is static:
    const
      Glfwkeytab* = 258      ## Generated based on /usr/local/include/GLFW/glfw3.h:450:9
  else:
    let Glfwkeytab* = 258    ## Generated based on /usr/local/include/GLFW/glfw3.h:450:9
else:
  static :
    hint("Declaration of " & "Glfwkeytab" & " already exists, not redeclaring")
when not declared(Glfwkeybackspace):
  when 259 is static:
    const
      Glfwkeybackspace* = 259 ## Generated based on /usr/local/include/GLFW/glfw3.h:451:9
  else:
    let Glfwkeybackspace* = 259 ## Generated based on /usr/local/include/GLFW/glfw3.h:451:9
else:
  static :
    hint("Declaration of " & "Glfwkeybackspace" &
        " already exists, not redeclaring")
when not declared(Glfwkeyinsert):
  when 260 is static:
    const
      Glfwkeyinsert* = 260   ## Generated based on /usr/local/include/GLFW/glfw3.h:452:9
  else:
    let Glfwkeyinsert* = 260 ## Generated based on /usr/local/include/GLFW/glfw3.h:452:9
else:
  static :
    hint("Declaration of " & "Glfwkeyinsert" &
        " already exists, not redeclaring")
when not declared(Glfwkeydelete):
  when 261 is static:
    const
      Glfwkeydelete* = 261   ## Generated based on /usr/local/include/GLFW/glfw3.h:453:9
  else:
    let Glfwkeydelete* = 261 ## Generated based on /usr/local/include/GLFW/glfw3.h:453:9
else:
  static :
    hint("Declaration of " & "Glfwkeydelete" &
        " already exists, not redeclaring")
when not declared(Glfwkeyright):
  when 262 is static:
    const
      Glfwkeyright* = 262    ## Generated based on /usr/local/include/GLFW/glfw3.h:454:9
  else:
    let Glfwkeyright* = 262  ## Generated based on /usr/local/include/GLFW/glfw3.h:454:9
else:
  static :
    hint("Declaration of " & "Glfwkeyright" & " already exists, not redeclaring")
when not declared(Glfwkeyleft):
  when 263 is static:
    const
      Glfwkeyleft* = 263     ## Generated based on /usr/local/include/GLFW/glfw3.h:455:9
  else:
    let Glfwkeyleft* = 263   ## Generated based on /usr/local/include/GLFW/glfw3.h:455:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleft" & " already exists, not redeclaring")
when not declared(Glfwkeydown):
  when 264 is static:
    const
      Glfwkeydown* = 264     ## Generated based on /usr/local/include/GLFW/glfw3.h:456:9
  else:
    let Glfwkeydown* = 264   ## Generated based on /usr/local/include/GLFW/glfw3.h:456:9
else:
  static :
    hint("Declaration of " & "Glfwkeydown" & " already exists, not redeclaring")
when not declared(Glfwkeyup):
  when 265 is static:
    const
      Glfwkeyup* = 265       ## Generated based on /usr/local/include/GLFW/glfw3.h:457:9
  else:
    let Glfwkeyup* = 265     ## Generated based on /usr/local/include/GLFW/glfw3.h:457:9
else:
  static :
    hint("Declaration of " & "Glfwkeyup" & " already exists, not redeclaring")
when not declared(Glfwkeypageup):
  when 266 is static:
    const
      Glfwkeypageup* = 266   ## Generated based on /usr/local/include/GLFW/glfw3.h:458:9
  else:
    let Glfwkeypageup* = 266 ## Generated based on /usr/local/include/GLFW/glfw3.h:458:9
else:
  static :
    hint("Declaration of " & "Glfwkeypageup" &
        " already exists, not redeclaring")
when not declared(Glfwkeypagedown):
  when 267 is static:
    const
      Glfwkeypagedown* = 267 ## Generated based on /usr/local/include/GLFW/glfw3.h:459:9
  else:
    let Glfwkeypagedown* = 267 ## Generated based on /usr/local/include/GLFW/glfw3.h:459:9
else:
  static :
    hint("Declaration of " & "Glfwkeypagedown" &
        " already exists, not redeclaring")
when not declared(Glfwkeyhome):
  when 268 is static:
    const
      Glfwkeyhome* = 268     ## Generated based on /usr/local/include/GLFW/glfw3.h:460:9
  else:
    let Glfwkeyhome* = 268   ## Generated based on /usr/local/include/GLFW/glfw3.h:460:9
else:
  static :
    hint("Declaration of " & "Glfwkeyhome" & " already exists, not redeclaring")
when not declared(Glfwkeyend):
  when 269 is static:
    const
      Glfwkeyend* = 269      ## Generated based on /usr/local/include/GLFW/glfw3.h:461:9
  else:
    let Glfwkeyend* = 269    ## Generated based on /usr/local/include/GLFW/glfw3.h:461:9
else:
  static :
    hint("Declaration of " & "Glfwkeyend" & " already exists, not redeclaring")
when not declared(Glfwkeycapslock):
  when 280 is static:
    const
      Glfwkeycapslock* = 280 ## Generated based on /usr/local/include/GLFW/glfw3.h:462:9
  else:
    let Glfwkeycapslock* = 280 ## Generated based on /usr/local/include/GLFW/glfw3.h:462:9
else:
  static :
    hint("Declaration of " & "Glfwkeycapslock" &
        " already exists, not redeclaring")
when not declared(Glfwkeyscrolllock):
  when 281 is static:
    const
      Glfwkeyscrolllock* = 281 ## Generated based on /usr/local/include/GLFW/glfw3.h:463:9
  else:
    let Glfwkeyscrolllock* = 281 ## Generated based on /usr/local/include/GLFW/glfw3.h:463:9
else:
  static :
    hint("Declaration of " & "Glfwkeyscrolllock" &
        " already exists, not redeclaring")
when not declared(Glfwkeynumlock):
  when 282 is static:
    const
      Glfwkeynumlock* = 282  ## Generated based on /usr/local/include/GLFW/glfw3.h:464:9
  else:
    let Glfwkeynumlock* = 282 ## Generated based on /usr/local/include/GLFW/glfw3.h:464:9
else:
  static :
    hint("Declaration of " & "Glfwkeynumlock" &
        " already exists, not redeclaring")
when not declared(Glfwkeyprintscreen):
  when 283 is static:
    const
      Glfwkeyprintscreen* = 283 ## Generated based on /usr/local/include/GLFW/glfw3.h:465:9
  else:
    let Glfwkeyprintscreen* = 283 ## Generated based on /usr/local/include/GLFW/glfw3.h:465:9
else:
  static :
    hint("Declaration of " & "Glfwkeyprintscreen" &
        " already exists, not redeclaring")
when not declared(Glfwkeypause):
  when 284 is static:
    const
      Glfwkeypause* = 284    ## Generated based on /usr/local/include/GLFW/glfw3.h:466:9
  else:
    let Glfwkeypause* = 284  ## Generated based on /usr/local/include/GLFW/glfw3.h:466:9
else:
  static :
    hint("Declaration of " & "Glfwkeypause" & " already exists, not redeclaring")
when not declared(Glfwkeyf1):
  when 290 is static:
    const
      Glfwkeyf1* = 290       ## Generated based on /usr/local/include/GLFW/glfw3.h:467:9
  else:
    let Glfwkeyf1* = 290     ## Generated based on /usr/local/include/GLFW/glfw3.h:467:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf1" & " already exists, not redeclaring")
when not declared(Glfwkeyf2):
  when 291 is static:
    const
      Glfwkeyf2* = 291       ## Generated based on /usr/local/include/GLFW/glfw3.h:468:9
  else:
    let Glfwkeyf2* = 291     ## Generated based on /usr/local/include/GLFW/glfw3.h:468:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf2" & " already exists, not redeclaring")
when not declared(Glfwkeyf3):
  when 292 is static:
    const
      Glfwkeyf3* = 292       ## Generated based on /usr/local/include/GLFW/glfw3.h:469:9
  else:
    let Glfwkeyf3* = 292     ## Generated based on /usr/local/include/GLFW/glfw3.h:469:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf3" & " already exists, not redeclaring")
when not declared(Glfwkeyf4):
  when 293 is static:
    const
      Glfwkeyf4* = 293       ## Generated based on /usr/local/include/GLFW/glfw3.h:470:9
  else:
    let Glfwkeyf4* = 293     ## Generated based on /usr/local/include/GLFW/glfw3.h:470:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf4" & " already exists, not redeclaring")
when not declared(Glfwkeyf5):
  when 294 is static:
    const
      Glfwkeyf5* = 294       ## Generated based on /usr/local/include/GLFW/glfw3.h:471:9
  else:
    let Glfwkeyf5* = 294     ## Generated based on /usr/local/include/GLFW/glfw3.h:471:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf5" & " already exists, not redeclaring")
when not declared(Glfwkeyf6):
  when 295 is static:
    const
      Glfwkeyf6* = 295       ## Generated based on /usr/local/include/GLFW/glfw3.h:472:9
  else:
    let Glfwkeyf6* = 295     ## Generated based on /usr/local/include/GLFW/glfw3.h:472:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf6" & " already exists, not redeclaring")
when not declared(Glfwkeyf7):
  when 296 is static:
    const
      Glfwkeyf7* = 296       ## Generated based on /usr/local/include/GLFW/glfw3.h:473:9
  else:
    let Glfwkeyf7* = 296     ## Generated based on /usr/local/include/GLFW/glfw3.h:473:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf7" & " already exists, not redeclaring")
when not declared(Glfwkeyf8):
  when 297 is static:
    const
      Glfwkeyf8* = 297       ## Generated based on /usr/local/include/GLFW/glfw3.h:474:9
  else:
    let Glfwkeyf8* = 297     ## Generated based on /usr/local/include/GLFW/glfw3.h:474:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf8" & " already exists, not redeclaring")
when not declared(Glfwkeyf9):
  when 298 is static:
    const
      Glfwkeyf9* = 298       ## Generated based on /usr/local/include/GLFW/glfw3.h:475:9
  else:
    let Glfwkeyf9* = 298     ## Generated based on /usr/local/include/GLFW/glfw3.h:475:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf9" & " already exists, not redeclaring")
when not declared(Glfwkeyf10):
  when 299 is static:
    const
      Glfwkeyf10* = 299      ## Generated based on /usr/local/include/GLFW/glfw3.h:476:9
  else:
    let Glfwkeyf10* = 299    ## Generated based on /usr/local/include/GLFW/glfw3.h:476:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf10" & " already exists, not redeclaring")
when not declared(Glfwkeyf11):
  when 300 is static:
    const
      Glfwkeyf11* = 300      ## Generated based on /usr/local/include/GLFW/glfw3.h:477:9
  else:
    let Glfwkeyf11* = 300    ## Generated based on /usr/local/include/GLFW/glfw3.h:477:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf11" & " already exists, not redeclaring")
when not declared(Glfwkeyf12):
  when 301 is static:
    const
      Glfwkeyf12* = 301      ## Generated based on /usr/local/include/GLFW/glfw3.h:478:9
  else:
    let Glfwkeyf12* = 301    ## Generated based on /usr/local/include/GLFW/glfw3.h:478:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf12" & " already exists, not redeclaring")
when not declared(Glfwkeyf13):
  when 302 is static:
    const
      Glfwkeyf13* = 302      ## Generated based on /usr/local/include/GLFW/glfw3.h:479:9
  else:
    let Glfwkeyf13* = 302    ## Generated based on /usr/local/include/GLFW/glfw3.h:479:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf13" & " already exists, not redeclaring")
when not declared(Glfwkeyf14):
  when 303 is static:
    const
      Glfwkeyf14* = 303      ## Generated based on /usr/local/include/GLFW/glfw3.h:480:9
  else:
    let Glfwkeyf14* = 303    ## Generated based on /usr/local/include/GLFW/glfw3.h:480:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf14" & " already exists, not redeclaring")
when not declared(Glfwkeyf15):
  when 304 is static:
    const
      Glfwkeyf15* = 304      ## Generated based on /usr/local/include/GLFW/glfw3.h:481:9
  else:
    let Glfwkeyf15* = 304    ## Generated based on /usr/local/include/GLFW/glfw3.h:481:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf15" & " already exists, not redeclaring")
when not declared(Glfwkeyf16):
  when 305 is static:
    const
      Glfwkeyf16* = 305      ## Generated based on /usr/local/include/GLFW/glfw3.h:482:9
  else:
    let Glfwkeyf16* = 305    ## Generated based on /usr/local/include/GLFW/glfw3.h:482:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf16" & " already exists, not redeclaring")
when not declared(Glfwkeyf17):
  when 306 is static:
    const
      Glfwkeyf17* = 306      ## Generated based on /usr/local/include/GLFW/glfw3.h:483:9
  else:
    let Glfwkeyf17* = 306    ## Generated based on /usr/local/include/GLFW/glfw3.h:483:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf17" & " already exists, not redeclaring")
when not declared(Glfwkeyf18):
  when 307 is static:
    const
      Glfwkeyf18* = 307      ## Generated based on /usr/local/include/GLFW/glfw3.h:484:9
  else:
    let Glfwkeyf18* = 307    ## Generated based on /usr/local/include/GLFW/glfw3.h:484:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf18" & " already exists, not redeclaring")
when not declared(Glfwkeyf19):
  when 308 is static:
    const
      Glfwkeyf19* = 308      ## Generated based on /usr/local/include/GLFW/glfw3.h:485:9
  else:
    let Glfwkeyf19* = 308    ## Generated based on /usr/local/include/GLFW/glfw3.h:485:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf19" & " already exists, not redeclaring")
when not declared(Glfwkeyf20):
  when 309 is static:
    const
      Glfwkeyf20* = 309      ## Generated based on /usr/local/include/GLFW/glfw3.h:486:9
  else:
    let Glfwkeyf20* = 309    ## Generated based on /usr/local/include/GLFW/glfw3.h:486:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf20" & " already exists, not redeclaring")
when not declared(Glfwkeyf21):
  when 310 is static:
    const
      Glfwkeyf21* = 310      ## Generated based on /usr/local/include/GLFW/glfw3.h:487:9
  else:
    let Glfwkeyf21* = 310    ## Generated based on /usr/local/include/GLFW/glfw3.h:487:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf21" & " already exists, not redeclaring")
when not declared(Glfwkeyf22):
  when 311 is static:
    const
      Glfwkeyf22* = 311      ## Generated based on /usr/local/include/GLFW/glfw3.h:488:9
  else:
    let Glfwkeyf22* = 311    ## Generated based on /usr/local/include/GLFW/glfw3.h:488:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf22" & " already exists, not redeclaring")
when not declared(Glfwkeyf23):
  when 312 is static:
    const
      Glfwkeyf23* = 312      ## Generated based on /usr/local/include/GLFW/glfw3.h:489:9
  else:
    let Glfwkeyf23* = 312    ## Generated based on /usr/local/include/GLFW/glfw3.h:489:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf23" & " already exists, not redeclaring")
when not declared(Glfwkeyf24):
  when 313 is static:
    const
      Glfwkeyf24* = 313      ## Generated based on /usr/local/include/GLFW/glfw3.h:490:9
  else:
    let Glfwkeyf24* = 313    ## Generated based on /usr/local/include/GLFW/glfw3.h:490:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf24" & " already exists, not redeclaring")
when not declared(Glfwkeyf25):
  when 314 is static:
    const
      Glfwkeyf25* = 314      ## Generated based on /usr/local/include/GLFW/glfw3.h:491:9
  else:
    let Glfwkeyf25* = 314    ## Generated based on /usr/local/include/GLFW/glfw3.h:491:9
else:
  static :
    hint("Declaration of " & "Glfwkeyf25" & " already exists, not redeclaring")
when not declared(Glfwkeykp0):
  when 320 is static:
    const
      Glfwkeykp0* = 320      ## Generated based on /usr/local/include/GLFW/glfw3.h:492:9
  else:
    let Glfwkeykp0* = 320    ## Generated based on /usr/local/include/GLFW/glfw3.h:492:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp0" & " already exists, not redeclaring")
when not declared(Glfwkeykp1):
  when 321 is static:
    const
      Glfwkeykp1* = 321      ## Generated based on /usr/local/include/GLFW/glfw3.h:493:9
  else:
    let Glfwkeykp1* = 321    ## Generated based on /usr/local/include/GLFW/glfw3.h:493:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp1" & " already exists, not redeclaring")
when not declared(Glfwkeykp2):
  when 322 is static:
    const
      Glfwkeykp2* = 322      ## Generated based on /usr/local/include/GLFW/glfw3.h:494:9
  else:
    let Glfwkeykp2* = 322    ## Generated based on /usr/local/include/GLFW/glfw3.h:494:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp2" & " already exists, not redeclaring")
when not declared(Glfwkeykp3):
  when 323 is static:
    const
      Glfwkeykp3* = 323      ## Generated based on /usr/local/include/GLFW/glfw3.h:495:9
  else:
    let Glfwkeykp3* = 323    ## Generated based on /usr/local/include/GLFW/glfw3.h:495:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp3" & " already exists, not redeclaring")
when not declared(Glfwkeykp4):
  when 324 is static:
    const
      Glfwkeykp4* = 324      ## Generated based on /usr/local/include/GLFW/glfw3.h:496:9
  else:
    let Glfwkeykp4* = 324    ## Generated based on /usr/local/include/GLFW/glfw3.h:496:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp4" & " already exists, not redeclaring")
when not declared(Glfwkeykp5):
  when 325 is static:
    const
      Glfwkeykp5* = 325      ## Generated based on /usr/local/include/GLFW/glfw3.h:497:9
  else:
    let Glfwkeykp5* = 325    ## Generated based on /usr/local/include/GLFW/glfw3.h:497:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp5" & " already exists, not redeclaring")
when not declared(Glfwkeykp6):
  when 326 is static:
    const
      Glfwkeykp6* = 326      ## Generated based on /usr/local/include/GLFW/glfw3.h:498:9
  else:
    let Glfwkeykp6* = 326    ## Generated based on /usr/local/include/GLFW/glfw3.h:498:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp6" & " already exists, not redeclaring")
when not declared(Glfwkeykp7):
  when 327 is static:
    const
      Glfwkeykp7* = 327      ## Generated based on /usr/local/include/GLFW/glfw3.h:499:9
  else:
    let Glfwkeykp7* = 327    ## Generated based on /usr/local/include/GLFW/glfw3.h:499:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp7" & " already exists, not redeclaring")
when not declared(Glfwkeykp8):
  when 328 is static:
    const
      Glfwkeykp8* = 328      ## Generated based on /usr/local/include/GLFW/glfw3.h:500:9
  else:
    let Glfwkeykp8* = 328    ## Generated based on /usr/local/include/GLFW/glfw3.h:500:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp8" & " already exists, not redeclaring")
when not declared(Glfwkeykp9):
  when 329 is static:
    const
      Glfwkeykp9* = 329      ## Generated based on /usr/local/include/GLFW/glfw3.h:501:9
  else:
    let Glfwkeykp9* = 329    ## Generated based on /usr/local/include/GLFW/glfw3.h:501:9
else:
  static :
    hint("Declaration of " & "Glfwkeykp9" & " already exists, not redeclaring")
when not declared(Glfwkeykpdecimal):
  when 330 is static:
    const
      Glfwkeykpdecimal* = 330 ## Generated based on /usr/local/include/GLFW/glfw3.h:502:9
  else:
    let Glfwkeykpdecimal* = 330 ## Generated based on /usr/local/include/GLFW/glfw3.h:502:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpdecimal" &
        " already exists, not redeclaring")
when not declared(Glfwkeykpdivide):
  when 331 is static:
    const
      Glfwkeykpdivide* = 331 ## Generated based on /usr/local/include/GLFW/glfw3.h:503:9
  else:
    let Glfwkeykpdivide* = 331 ## Generated based on /usr/local/include/GLFW/glfw3.h:503:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpdivide" &
        " already exists, not redeclaring")
when not declared(Glfwkeykpmultiply):
  when 332 is static:
    const
      Glfwkeykpmultiply* = 332 ## Generated based on /usr/local/include/GLFW/glfw3.h:504:9
  else:
    let Glfwkeykpmultiply* = 332 ## Generated based on /usr/local/include/GLFW/glfw3.h:504:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpmultiply" &
        " already exists, not redeclaring")
when not declared(Glfwkeykpsubtract):
  when 333 is static:
    const
      Glfwkeykpsubtract* = 333 ## Generated based on /usr/local/include/GLFW/glfw3.h:505:9
  else:
    let Glfwkeykpsubtract* = 333 ## Generated based on /usr/local/include/GLFW/glfw3.h:505:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpsubtract" &
        " already exists, not redeclaring")
when not declared(Glfwkeykpadd):
  when 334 is static:
    const
      Glfwkeykpadd* = 334    ## Generated based on /usr/local/include/GLFW/glfw3.h:506:9
  else:
    let Glfwkeykpadd* = 334  ## Generated based on /usr/local/include/GLFW/glfw3.h:506:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpadd" & " already exists, not redeclaring")
when not declared(Glfwkeykpenter):
  when 335 is static:
    const
      Glfwkeykpenter* = 335  ## Generated based on /usr/local/include/GLFW/glfw3.h:507:9
  else:
    let Glfwkeykpenter* = 335 ## Generated based on /usr/local/include/GLFW/glfw3.h:507:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpenter" &
        " already exists, not redeclaring")
when not declared(Glfwkeykpequal):
  when 336 is static:
    const
      Glfwkeykpequal* = 336  ## Generated based on /usr/local/include/GLFW/glfw3.h:508:9
  else:
    let Glfwkeykpequal* = 336 ## Generated based on /usr/local/include/GLFW/glfw3.h:508:9
else:
  static :
    hint("Declaration of " & "Glfwkeykpequal" &
        " already exists, not redeclaring")
when not declared(Glfwkeyleftshift):
  when 340 is static:
    const
      Glfwkeyleftshift* = 340 ## Generated based on /usr/local/include/GLFW/glfw3.h:509:9
  else:
    let Glfwkeyleftshift* = 340 ## Generated based on /usr/local/include/GLFW/glfw3.h:509:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleftshift" &
        " already exists, not redeclaring")
when not declared(Glfwkeyleftcontrol):
  when 341 is static:
    const
      Glfwkeyleftcontrol* = 341 ## Generated based on /usr/local/include/GLFW/glfw3.h:510:9
  else:
    let Glfwkeyleftcontrol* = 341 ## Generated based on /usr/local/include/GLFW/glfw3.h:510:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleftcontrol" &
        " already exists, not redeclaring")
when not declared(Glfwkeyleftalt):
  when 342 is static:
    const
      Glfwkeyleftalt* = 342  ## Generated based on /usr/local/include/GLFW/glfw3.h:511:9
  else:
    let Glfwkeyleftalt* = 342 ## Generated based on /usr/local/include/GLFW/glfw3.h:511:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleftalt" &
        " already exists, not redeclaring")
when not declared(Glfwkeyleftsuper):
  when 343 is static:
    const
      Glfwkeyleftsuper* = 343 ## Generated based on /usr/local/include/GLFW/glfw3.h:512:9
  else:
    let Glfwkeyleftsuper* = 343 ## Generated based on /usr/local/include/GLFW/glfw3.h:512:9
else:
  static :
    hint("Declaration of " & "Glfwkeyleftsuper" &
        " already exists, not redeclaring")
when not declared(Glfwkeyrightshift):
  when 344 is static:
    const
      Glfwkeyrightshift* = 344 ## Generated based on /usr/local/include/GLFW/glfw3.h:513:9
  else:
    let Glfwkeyrightshift* = 344 ## Generated based on /usr/local/include/GLFW/glfw3.h:513:9
else:
  static :
    hint("Declaration of " & "Glfwkeyrightshift" &
        " already exists, not redeclaring")
when not declared(Glfwkeyrightcontrol):
  when 345 is static:
    const
      Glfwkeyrightcontrol* = 345 ## Generated based on /usr/local/include/GLFW/glfw3.h:514:9
  else:
    let Glfwkeyrightcontrol* = 345 ## Generated based on /usr/local/include/GLFW/glfw3.h:514:9
else:
  static :
    hint("Declaration of " & "Glfwkeyrightcontrol" &
        " already exists, not redeclaring")
when not declared(Glfwkeyrightalt):
  when 346 is static:
    const
      Glfwkeyrightalt* = 346 ## Generated based on /usr/local/include/GLFW/glfw3.h:515:9
  else:
    let Glfwkeyrightalt* = 346 ## Generated based on /usr/local/include/GLFW/glfw3.h:515:9
else:
  static :
    hint("Declaration of " & "Glfwkeyrightalt" &
        " already exists, not redeclaring")
when not declared(Glfwkeyrightsuper):
  when 347 is static:
    const
      Glfwkeyrightsuper* = 347 ## Generated based on /usr/local/include/GLFW/glfw3.h:516:9
  else:
    let Glfwkeyrightsuper* = 347 ## Generated based on /usr/local/include/GLFW/glfw3.h:516:9
else:
  static :
    hint("Declaration of " & "Glfwkeyrightsuper" &
        " already exists, not redeclaring")
when not declared(Glfwkeymenu):
  when 348 is static:
    const
      Glfwkeymenu* = 348     ## Generated based on /usr/local/include/GLFW/glfw3.h:517:9
  else:
    let Glfwkeymenu* = 348   ## Generated based on /usr/local/include/GLFW/glfw3.h:517:9
else:
  static :
    hint("Declaration of " & "Glfwkeymenu" & " already exists, not redeclaring")
when not declared(Glfwkeylast):
  when Glfwkeymenu is typedesc:
    type
      Glfwkeylast* = Glfwkeymenu ## Generated based on /usr/local/include/GLFW/glfw3.h:519:9
  else:
    when Glfwkeymenu is static:
      const
        Glfwkeylast* = Glfwkeymenu ## Generated based on /usr/local/include/GLFW/glfw3.h:519:9
    else:
      let Glfwkeylast* = Glfwkeymenu ## Generated based on /usr/local/include/GLFW/glfw3.h:519:9
else:
  static :
    hint("Declaration of " & "Glfwkeylast" & " already exists, not redeclaring")
when not declared(Glfwmodshift):
  when 1 is static:
    const
      Glfwmodshift* = 1      ## Generated based on /usr/local/include/GLFW/glfw3.h:535:9
  else:
    let Glfwmodshift* = 1    ## Generated based on /usr/local/include/GLFW/glfw3.h:535:9
else:
  static :
    hint("Declaration of " & "Glfwmodshift" & " already exists, not redeclaring")
when not declared(Glfwmodcontrol):
  when 2 is static:
    const
      Glfwmodcontrol* = 2    ## Generated based on /usr/local/include/GLFW/glfw3.h:540:9
  else:
    let Glfwmodcontrol* = 2  ## Generated based on /usr/local/include/GLFW/glfw3.h:540:9
else:
  static :
    hint("Declaration of " & "Glfwmodcontrol" &
        " already exists, not redeclaring")
when not declared(Glfwmodalt):
  when 4 is static:
    const
      Glfwmodalt* = 4        ## Generated based on /usr/local/include/GLFW/glfw3.h:545:9
  else:
    let Glfwmodalt* = 4      ## Generated based on /usr/local/include/GLFW/glfw3.h:545:9
else:
  static :
    hint("Declaration of " & "Glfwmodalt" & " already exists, not redeclaring")
when not declared(Glfwmodsuper):
  when 8 is static:
    const
      Glfwmodsuper* = 8      ## Generated based on /usr/local/include/GLFW/glfw3.h:550:9
  else:
    let Glfwmodsuper* = 8    ## Generated based on /usr/local/include/GLFW/glfw3.h:550:9
else:
  static :
    hint("Declaration of " & "Glfwmodsuper" & " already exists, not redeclaring")
when not declared(Glfwmodcapslock):
  when 16 is static:
    const
      Glfwmodcapslock* = 16  ## Generated based on /usr/local/include/GLFW/glfw3.h:556:9
  else:
    let Glfwmodcapslock* = 16 ## Generated based on /usr/local/include/GLFW/glfw3.h:556:9
else:
  static :
    hint("Declaration of " & "Glfwmodcapslock" &
        " already exists, not redeclaring")
when not declared(Glfwmodnumlock):
  when 32 is static:
    const
      Glfwmodnumlock* = 32   ## Generated based on /usr/local/include/GLFW/glfw3.h:562:9
  else:
    let Glfwmodnumlock* = 32 ## Generated based on /usr/local/include/GLFW/glfw3.h:562:9
else:
  static :
    hint("Declaration of " & "Glfwmodnumlock" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton1):
  when 0 is static:
    const
      Glfwmousebutton1* = 0  ## Generated based on /usr/local/include/GLFW/glfw3.h:573:9
  else:
    let Glfwmousebutton1* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:573:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton1" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton2):
  when 1 is static:
    const
      Glfwmousebutton2* = 1  ## Generated based on /usr/local/include/GLFW/glfw3.h:574:9
  else:
    let Glfwmousebutton2* = 1 ## Generated based on /usr/local/include/GLFW/glfw3.h:574:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton2" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton3):
  when 2 is static:
    const
      Glfwmousebutton3* = 2  ## Generated based on /usr/local/include/GLFW/glfw3.h:575:9
  else:
    let Glfwmousebutton3* = 2 ## Generated based on /usr/local/include/GLFW/glfw3.h:575:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton3" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton4):
  when 3 is static:
    const
      Glfwmousebutton4* = 3  ## Generated based on /usr/local/include/GLFW/glfw3.h:576:9
  else:
    let Glfwmousebutton4* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:576:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton4" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton5):
  when 4 is static:
    const
      Glfwmousebutton5* = 4  ## Generated based on /usr/local/include/GLFW/glfw3.h:577:9
  else:
    let Glfwmousebutton5* = 4 ## Generated based on /usr/local/include/GLFW/glfw3.h:577:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton5" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton6):
  when 5 is static:
    const
      Glfwmousebutton6* = 5  ## Generated based on /usr/local/include/GLFW/glfw3.h:578:9
  else:
    let Glfwmousebutton6* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:578:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton6" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton7):
  when 6 is static:
    const
      Glfwmousebutton7* = 6  ## Generated based on /usr/local/include/GLFW/glfw3.h:579:9
  else:
    let Glfwmousebutton7* = 6 ## Generated based on /usr/local/include/GLFW/glfw3.h:579:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton7" &
        " already exists, not redeclaring")
when not declared(Glfwmousebutton8):
  when 7 is static:
    const
      Glfwmousebutton8* = 7  ## Generated based on /usr/local/include/GLFW/glfw3.h:580:9
  else:
    let Glfwmousebutton8* = 7 ## Generated based on /usr/local/include/GLFW/glfw3.h:580:9
else:
  static :
    hint("Declaration of " & "Glfwmousebutton8" &
        " already exists, not redeclaring")
when not declared(Glfwmousebuttonlast):
  when Glfwmousebutton8 is typedesc:
    type
      Glfwmousebuttonlast* = Glfwmousebutton8 ## Generated based on /usr/local/include/GLFW/glfw3.h:581:9
  else:
    when Glfwmousebutton8 is static:
      const
        Glfwmousebuttonlast* = Glfwmousebutton8 ## Generated based on /usr/local/include/GLFW/glfw3.h:581:9
    else:
      let Glfwmousebuttonlast* = Glfwmousebutton8 ## Generated based on /usr/local/include/GLFW/glfw3.h:581:9
else:
  static :
    hint("Declaration of " & "Glfwmousebuttonlast" &
        " already exists, not redeclaring")
when not declared(Glfwmousebuttonleft):
  when Glfwmousebutton1 is typedesc:
    type
      Glfwmousebuttonleft* = Glfwmousebutton1 ## Generated based on /usr/local/include/GLFW/glfw3.h:582:9
  else:
    when Glfwmousebutton1 is static:
      const
        Glfwmousebuttonleft* = Glfwmousebutton1 ## Generated based on /usr/local/include/GLFW/glfw3.h:582:9
    else:
      let Glfwmousebuttonleft* = Glfwmousebutton1 ## Generated based on /usr/local/include/GLFW/glfw3.h:582:9
else:
  static :
    hint("Declaration of " & "Glfwmousebuttonleft" &
        " already exists, not redeclaring")
when not declared(Glfwmousebuttonright):
  when Glfwmousebutton2 is typedesc:
    type
      Glfwmousebuttonright* = Glfwmousebutton2 ## Generated based on /usr/local/include/GLFW/glfw3.h:583:9
  else:
    when Glfwmousebutton2 is static:
      const
        Glfwmousebuttonright* = Glfwmousebutton2 ## Generated based on /usr/local/include/GLFW/glfw3.h:583:9
    else:
      let Glfwmousebuttonright* = Glfwmousebutton2 ## Generated based on /usr/local/include/GLFW/glfw3.h:583:9
else:
  static :
    hint("Declaration of " & "Glfwmousebuttonright" &
        " already exists, not redeclaring")
when not declared(Glfwmousebuttonmiddle):
  when Glfwmousebutton3 is typedesc:
    type
      Glfwmousebuttonmiddle* = Glfwmousebutton3 ## Generated based on /usr/local/include/GLFW/glfw3.h:584:9
  else:
    when Glfwmousebutton3 is static:
      const
        Glfwmousebuttonmiddle* = Glfwmousebutton3 ## Generated based on /usr/local/include/GLFW/glfw3.h:584:9
    else:
      let Glfwmousebuttonmiddle* = Glfwmousebutton3 ## Generated based on /usr/local/include/GLFW/glfw3.h:584:9
else:
  static :
    hint("Declaration of " & "Glfwmousebuttonmiddle" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick1):
  when 0 is static:
    const
      Glfwjoystick1* = 0     ## Generated based on /usr/local/include/GLFW/glfw3.h:594:9
  else:
    let Glfwjoystick1* = 0   ## Generated based on /usr/local/include/GLFW/glfw3.h:594:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick1" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick2):
  when 1 is static:
    const
      Glfwjoystick2* = 1     ## Generated based on /usr/local/include/GLFW/glfw3.h:595:9
  else:
    let Glfwjoystick2* = 1   ## Generated based on /usr/local/include/GLFW/glfw3.h:595:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick2" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick3):
  when 2 is static:
    const
      Glfwjoystick3* = 2     ## Generated based on /usr/local/include/GLFW/glfw3.h:596:9
  else:
    let Glfwjoystick3* = 2   ## Generated based on /usr/local/include/GLFW/glfw3.h:596:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick3" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick4):
  when 3 is static:
    const
      Glfwjoystick4* = 3     ## Generated based on /usr/local/include/GLFW/glfw3.h:597:9
  else:
    let Glfwjoystick4* = 3   ## Generated based on /usr/local/include/GLFW/glfw3.h:597:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick4" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick5):
  when 4 is static:
    const
      Glfwjoystick5* = 4     ## Generated based on /usr/local/include/GLFW/glfw3.h:598:9
  else:
    let Glfwjoystick5* = 4   ## Generated based on /usr/local/include/GLFW/glfw3.h:598:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick5" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick6):
  when 5 is static:
    const
      Glfwjoystick6* = 5     ## Generated based on /usr/local/include/GLFW/glfw3.h:599:9
  else:
    let Glfwjoystick6* = 5   ## Generated based on /usr/local/include/GLFW/glfw3.h:599:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick6" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick7):
  when 6 is static:
    const
      Glfwjoystick7* = 6     ## Generated based on /usr/local/include/GLFW/glfw3.h:600:9
  else:
    let Glfwjoystick7* = 6   ## Generated based on /usr/local/include/GLFW/glfw3.h:600:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick7" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick8):
  when 7 is static:
    const
      Glfwjoystick8* = 7     ## Generated based on /usr/local/include/GLFW/glfw3.h:601:9
  else:
    let Glfwjoystick8* = 7   ## Generated based on /usr/local/include/GLFW/glfw3.h:601:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick8" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick9):
  when 8 is static:
    const
      Glfwjoystick9* = 8     ## Generated based on /usr/local/include/GLFW/glfw3.h:602:9
  else:
    let Glfwjoystick9* = 8   ## Generated based on /usr/local/include/GLFW/glfw3.h:602:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick9" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick10):
  when 9 is static:
    const
      Glfwjoystick10* = 9    ## Generated based on /usr/local/include/GLFW/glfw3.h:603:9
  else:
    let Glfwjoystick10* = 9  ## Generated based on /usr/local/include/GLFW/glfw3.h:603:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick10" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick11):
  when 10 is static:
    const
      Glfwjoystick11* = 10   ## Generated based on /usr/local/include/GLFW/glfw3.h:604:9
  else:
    let Glfwjoystick11* = 10 ## Generated based on /usr/local/include/GLFW/glfw3.h:604:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick11" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick12):
  when 11 is static:
    const
      Glfwjoystick12* = 11   ## Generated based on /usr/local/include/GLFW/glfw3.h:605:9
  else:
    let Glfwjoystick12* = 11 ## Generated based on /usr/local/include/GLFW/glfw3.h:605:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick12" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick13):
  when 12 is static:
    const
      Glfwjoystick13* = 12   ## Generated based on /usr/local/include/GLFW/glfw3.h:606:9
  else:
    let Glfwjoystick13* = 12 ## Generated based on /usr/local/include/GLFW/glfw3.h:606:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick13" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick14):
  when 13 is static:
    const
      Glfwjoystick14* = 13   ## Generated based on /usr/local/include/GLFW/glfw3.h:607:9
  else:
    let Glfwjoystick14* = 13 ## Generated based on /usr/local/include/GLFW/glfw3.h:607:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick14" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick15):
  when 14 is static:
    const
      Glfwjoystick15* = 14   ## Generated based on /usr/local/include/GLFW/glfw3.h:608:9
  else:
    let Glfwjoystick15* = 14 ## Generated based on /usr/local/include/GLFW/glfw3.h:608:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick15" &
        " already exists, not redeclaring")
when not declared(Glfwjoystick16):
  when 15 is static:
    const
      Glfwjoystick16* = 15   ## Generated based on /usr/local/include/GLFW/glfw3.h:609:9
  else:
    let Glfwjoystick16* = 15 ## Generated based on /usr/local/include/GLFW/glfw3.h:609:9
else:
  static :
    hint("Declaration of " & "Glfwjoystick16" &
        " already exists, not redeclaring")
when not declared(Glfwjoysticklast):
  when Glfwjoystick16 is typedesc:
    type
      Glfwjoysticklast* = Glfwjoystick16 ## Generated based on /usr/local/include/GLFW/glfw3.h:610:9
  else:
    when Glfwjoystick16 is static:
      const
        Glfwjoysticklast* = Glfwjoystick16 ## Generated based on /usr/local/include/GLFW/glfw3.h:610:9
    else:
      let Glfwjoysticklast* = Glfwjoystick16 ## Generated based on /usr/local/include/GLFW/glfw3.h:610:9
else:
  static :
    hint("Declaration of " & "Glfwjoysticklast" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttona):
  when 0 is static:
    const
      Glfwgamepadbuttona* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:620:9
  else:
    let Glfwgamepadbuttona* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:620:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttona" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonb):
  when 1 is static:
    const
      Glfwgamepadbuttonb* = 1 ## Generated based on /usr/local/include/GLFW/glfw3.h:621:9
  else:
    let Glfwgamepadbuttonb* = 1 ## Generated based on /usr/local/include/GLFW/glfw3.h:621:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonb" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonx):
  when 2 is static:
    const
      Glfwgamepadbuttonx* = 2 ## Generated based on /usr/local/include/GLFW/glfw3.h:622:9
  else:
    let Glfwgamepadbuttonx* = 2 ## Generated based on /usr/local/include/GLFW/glfw3.h:622:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonx" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttony):
  when 3 is static:
    const
      Glfwgamepadbuttony* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:623:9
  else:
    let Glfwgamepadbuttony* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:623:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttony" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonleftbumper):
  when 4 is static:
    const
      Glfwgamepadbuttonleftbumper* = 4 ## Generated based on /usr/local/include/GLFW/glfw3.h:624:9
  else:
    let Glfwgamepadbuttonleftbumper* = 4 ## Generated based on /usr/local/include/GLFW/glfw3.h:624:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonleftbumper" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonrightbumper):
  when 5 is static:
    const
      Glfwgamepadbuttonrightbumper* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:625:9
  else:
    let Glfwgamepadbuttonrightbumper* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:625:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonrightbumper" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonback):
  when 6 is static:
    const
      Glfwgamepadbuttonback* = 6 ## Generated based on /usr/local/include/GLFW/glfw3.h:626:9
  else:
    let Glfwgamepadbuttonback* = 6 ## Generated based on /usr/local/include/GLFW/glfw3.h:626:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonback" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonstart):
  when 7 is static:
    const
      Glfwgamepadbuttonstart* = 7 ## Generated based on /usr/local/include/GLFW/glfw3.h:627:9
  else:
    let Glfwgamepadbuttonstart* = 7 ## Generated based on /usr/local/include/GLFW/glfw3.h:627:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonstart" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonguide):
  when 8 is static:
    const
      Glfwgamepadbuttonguide* = 8 ## Generated based on /usr/local/include/GLFW/glfw3.h:628:9
  else:
    let Glfwgamepadbuttonguide* = 8 ## Generated based on /usr/local/include/GLFW/glfw3.h:628:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonguide" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonleftthumb):
  when 9 is static:
    const
      Glfwgamepadbuttonleftthumb* = 9 ## Generated based on /usr/local/include/GLFW/glfw3.h:629:9
  else:
    let Glfwgamepadbuttonleftthumb* = 9 ## Generated based on /usr/local/include/GLFW/glfw3.h:629:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonleftthumb" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonrightthumb):
  when 10 is static:
    const
      Glfwgamepadbuttonrightthumb* = 10 ## Generated based on /usr/local/include/GLFW/glfw3.h:630:9
  else:
    let Glfwgamepadbuttonrightthumb* = 10 ## Generated based on /usr/local/include/GLFW/glfw3.h:630:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonrightthumb" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttondpadup):
  when 11 is static:
    const
      Glfwgamepadbuttondpadup* = 11 ## Generated based on /usr/local/include/GLFW/glfw3.h:631:9
  else:
    let Glfwgamepadbuttondpadup* = 11 ## Generated based on /usr/local/include/GLFW/glfw3.h:631:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttondpadup" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttondpadright):
  when 12 is static:
    const
      Glfwgamepadbuttondpadright* = 12 ## Generated based on /usr/local/include/GLFW/glfw3.h:632:9
  else:
    let Glfwgamepadbuttondpadright* = 12 ## Generated based on /usr/local/include/GLFW/glfw3.h:632:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttondpadright" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttondpaddown):
  when 13 is static:
    const
      Glfwgamepadbuttondpaddown* = 13 ## Generated based on /usr/local/include/GLFW/glfw3.h:633:9
  else:
    let Glfwgamepadbuttondpaddown* = 13 ## Generated based on /usr/local/include/GLFW/glfw3.h:633:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttondpaddown" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttondpadleft):
  when 14 is static:
    const
      Glfwgamepadbuttondpadleft* = 14 ## Generated based on /usr/local/include/GLFW/glfw3.h:634:9
  else:
    let Glfwgamepadbuttondpadleft* = 14 ## Generated based on /usr/local/include/GLFW/glfw3.h:634:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttondpadleft" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonlast):
  when Glfwgamepadbuttondpadleft is typedesc:
    type
      Glfwgamepadbuttonlast* = Glfwgamepadbuttondpadleft ## Generated based on /usr/local/include/GLFW/glfw3.h:635:9
  else:
    when Glfwgamepadbuttondpadleft is static:
      const
        Glfwgamepadbuttonlast* = Glfwgamepadbuttondpadleft ## Generated based on /usr/local/include/GLFW/glfw3.h:635:9
    else:
      let Glfwgamepadbuttonlast* = Glfwgamepadbuttondpadleft ## Generated based on /usr/local/include/GLFW/glfw3.h:635:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonlast" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttoncross):
  when Glfwgamepadbuttona is typedesc:
    type
      Glfwgamepadbuttoncross* = Glfwgamepadbuttona ## Generated based on /usr/local/include/GLFW/glfw3.h:637:9
  else:
    when Glfwgamepadbuttona is static:
      const
        Glfwgamepadbuttoncross* = Glfwgamepadbuttona ## Generated based on /usr/local/include/GLFW/glfw3.h:637:9
    else:
      let Glfwgamepadbuttoncross* = Glfwgamepadbuttona ## Generated based on /usr/local/include/GLFW/glfw3.h:637:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttoncross" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttoncircle):
  when Glfwgamepadbuttonb is typedesc:
    type
      Glfwgamepadbuttoncircle* = Glfwgamepadbuttonb ## Generated based on /usr/local/include/GLFW/glfw3.h:638:9
  else:
    when Glfwgamepadbuttonb is static:
      const
        Glfwgamepadbuttoncircle* = Glfwgamepadbuttonb ## Generated based on /usr/local/include/GLFW/glfw3.h:638:9
    else:
      let Glfwgamepadbuttoncircle* = Glfwgamepadbuttonb ## Generated based on /usr/local/include/GLFW/glfw3.h:638:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttoncircle" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttonsquare):
  when Glfwgamepadbuttonx is typedesc:
    type
      Glfwgamepadbuttonsquare* = Glfwgamepadbuttonx ## Generated based on /usr/local/include/GLFW/glfw3.h:639:9
  else:
    when Glfwgamepadbuttonx is static:
      const
        Glfwgamepadbuttonsquare* = Glfwgamepadbuttonx ## Generated based on /usr/local/include/GLFW/glfw3.h:639:9
    else:
      let Glfwgamepadbuttonsquare* = Glfwgamepadbuttonx ## Generated based on /usr/local/include/GLFW/glfw3.h:639:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttonsquare" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadbuttontriangle):
  when Glfwgamepadbuttony is typedesc:
    type
      Glfwgamepadbuttontriangle* = Glfwgamepadbuttony ## Generated based on /usr/local/include/GLFW/glfw3.h:640:9
  else:
    when Glfwgamepadbuttony is static:
      const
        Glfwgamepadbuttontriangle* = Glfwgamepadbuttony ## Generated based on /usr/local/include/GLFW/glfw3.h:640:9
    else:
      let Glfwgamepadbuttontriangle* = Glfwgamepadbuttony ## Generated based on /usr/local/include/GLFW/glfw3.h:640:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadbuttontriangle" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxisleftx):
  when 0 is static:
    const
      Glfwgamepadaxisleftx* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:650:9
  else:
    let Glfwgamepadaxisleftx* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:650:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxisleftx" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxislefty):
  when 1 is static:
    const
      Glfwgamepadaxislefty* = 1 ## Generated based on /usr/local/include/GLFW/glfw3.h:651:9
  else:
    let Glfwgamepadaxislefty* = 1 ## Generated based on /usr/local/include/GLFW/glfw3.h:651:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxislefty" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxisrightx):
  when 2 is static:
    const
      Glfwgamepadaxisrightx* = 2 ## Generated based on /usr/local/include/GLFW/glfw3.h:652:9
  else:
    let Glfwgamepadaxisrightx* = 2 ## Generated based on /usr/local/include/GLFW/glfw3.h:652:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxisrightx" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxisrighty):
  when 3 is static:
    const
      Glfwgamepadaxisrighty* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:653:9
  else:
    let Glfwgamepadaxisrighty* = 3 ## Generated based on /usr/local/include/GLFW/glfw3.h:653:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxisrighty" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxislefttrigger):
  when 4 is static:
    const
      Glfwgamepadaxislefttrigger* = 4 ## Generated based on /usr/local/include/GLFW/glfw3.h:654:9
  else:
    let Glfwgamepadaxislefttrigger* = 4 ## Generated based on /usr/local/include/GLFW/glfw3.h:654:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxislefttrigger" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxisrighttrigger):
  when 5 is static:
    const
      Glfwgamepadaxisrighttrigger* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:655:9
  else:
    let Glfwgamepadaxisrighttrigger* = 5 ## Generated based on /usr/local/include/GLFW/glfw3.h:655:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxisrighttrigger" &
        " already exists, not redeclaring")
when not declared(Glfwgamepadaxislast):
  when Glfwgamepadaxisrighttrigger is typedesc:
    type
      Glfwgamepadaxislast* = Glfwgamepadaxisrighttrigger ## Generated based on /usr/local/include/GLFW/glfw3.h:656:9
  else:
    when Glfwgamepadaxisrighttrigger is static:
      const
        Glfwgamepadaxislast* = Glfwgamepadaxisrighttrigger ## Generated based on /usr/local/include/GLFW/glfw3.h:656:9
    else:
      let Glfwgamepadaxislast* = Glfwgamepadaxisrighttrigger ## Generated based on /usr/local/include/GLFW/glfw3.h:656:9
else:
  static :
    hint("Declaration of " & "Glfwgamepadaxislast" &
        " already exists, not redeclaring")
when not declared(Glfwnoerror):
  when 0 is static:
    const
      Glfwnoerror* = 0       ## Generated based on /usr/local/include/GLFW/glfw3.h:672:9
  else:
    let Glfwnoerror* = 0     ## Generated based on /usr/local/include/GLFW/glfw3.h:672:9
else:
  static :
    hint("Declaration of " & "Glfwnoerror" & " already exists, not redeclaring")
when not declared(Glfwnotinitialized):
  when 65537 is static:
    const
      Glfwnotinitialized* = 65537 ## Generated based on /usr/local/include/GLFW/glfw3.h:681:9
  else:
    let Glfwnotinitialized* = 65537 ## Generated based on /usr/local/include/GLFW/glfw3.h:681:9
else:
  static :
    hint("Declaration of " & "Glfwnotinitialized" &
        " already exists, not redeclaring")
when not declared(Glfwnocurrentcontext):
  when 65538 is static:
    const
      Glfwnocurrentcontext* = 65538 ## Generated based on /usr/local/include/GLFW/glfw3.h:691:9
  else:
    let Glfwnocurrentcontext* = 65538 ## Generated based on /usr/local/include/GLFW/glfw3.h:691:9
else:
  static :
    hint("Declaration of " & "Glfwnocurrentcontext" &
        " already exists, not redeclaring")
when not declared(Glfwinvalidenum):
  when 65539 is static:
    const
      Glfwinvalidenum* = 65539 ## Generated based on /usr/local/include/GLFW/glfw3.h:699:9
  else:
    let Glfwinvalidenum* = 65539 ## Generated based on /usr/local/include/GLFW/glfw3.h:699:9
else:
  static :
    hint("Declaration of " & "Glfwinvalidenum" &
        " already exists, not redeclaring")
when not declared(Glfwinvalidvalue):
  when 65540 is static:
    const
      Glfwinvalidvalue* = 65540 ## Generated based on /usr/local/include/GLFW/glfw3.h:710:9
  else:
    let Glfwinvalidvalue* = 65540 ## Generated based on /usr/local/include/GLFW/glfw3.h:710:9
else:
  static :
    hint("Declaration of " & "Glfwinvalidvalue" &
        " already exists, not redeclaring")
when not declared(Glfwoutofmemory):
  when 65541 is static:
    const
      Glfwoutofmemory* = 65541 ## Generated based on /usr/local/include/GLFW/glfw3.h:718:9
  else:
    let Glfwoutofmemory* = 65541 ## Generated based on /usr/local/include/GLFW/glfw3.h:718:9
else:
  static :
    hint("Declaration of " & "Glfwoutofmemory" &
        " already exists, not redeclaring")
when not declared(Glfwapiunavailable):
  when 65542 is static:
    const
      Glfwapiunavailable* = 65542 ## Generated based on /usr/local/include/GLFW/glfw3.h:734:9
  else:
    let Glfwapiunavailable* = 65542 ## Generated based on /usr/local/include/GLFW/glfw3.h:734:9
else:
  static :
    hint("Declaration of " & "Glfwapiunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwversionunavailable):
  when 65543 is static:
    const
      Glfwversionunavailable* = 65543 ## Generated based on /usr/local/include/GLFW/glfw3.h:751:9
  else:
    let Glfwversionunavailable* = 65543 ## Generated based on /usr/local/include/GLFW/glfw3.h:751:9
else:
  static :
    hint("Declaration of " & "Glfwversionunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwplatformerror):
  when 65544 is static:
    const
      Glfwplatformerror* = 65544 ## Generated based on /usr/local/include/GLFW/glfw3.h:762:9
  else:
    let Glfwplatformerror* = 65544 ## Generated based on /usr/local/include/GLFW/glfw3.h:762:9
else:
  static :
    hint("Declaration of " & "Glfwplatformerror" &
        " already exists, not redeclaring")
when not declared(Glfwformatunavailable):
  when 65545 is static:
    const
      Glfwformatunavailable* = 65545 ## Generated based on /usr/local/include/GLFW/glfw3.h:781:9
  else:
    let Glfwformatunavailable* = 65545 ## Generated based on /usr/local/include/GLFW/glfw3.h:781:9
else:
  static :
    hint("Declaration of " & "Glfwformatunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwnowindowcontext):
  when 65546 is static:
    const
      Glfwnowindowcontext* = 65546 ## Generated based on /usr/local/include/GLFW/glfw3.h:789:9
  else:
    let Glfwnowindowcontext* = 65546 ## Generated based on /usr/local/include/GLFW/glfw3.h:789:9
else:
  static :
    hint("Declaration of " & "Glfwnowindowcontext" &
        " already exists, not redeclaring")
when not declared(Glfwcursorunavailable):
  when 65547 is static:
    const
      Glfwcursorunavailable* = 65547 ## Generated based on /usr/local/include/GLFW/glfw3.h:800:9
  else:
    let Glfwcursorunavailable* = 65547 ## Generated based on /usr/local/include/GLFW/glfw3.h:800:9
else:
  static :
    hint("Declaration of " & "Glfwcursorunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwfeatureunavailable):
  when 65548 is static:
    const
      Glfwfeatureunavailable* = 65548 ## Generated based on /usr/local/include/GLFW/glfw3.h:814:9
  else:
    let Glfwfeatureunavailable* = 65548 ## Generated based on /usr/local/include/GLFW/glfw3.h:814:9
else:
  static :
    hint("Declaration of " & "Glfwfeatureunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwfeatureunimplemented):
  when 65549 is static:
    const
      Glfwfeatureunimplemented* = 65549 ## Generated based on /usr/local/include/GLFW/glfw3.h:827:9
  else:
    let Glfwfeatureunimplemented* = 65549 ## Generated based on /usr/local/include/GLFW/glfw3.h:827:9
else:
  static :
    hint("Declaration of " & "Glfwfeatureunimplemented" &
        " already exists, not redeclaring")
when not declared(Glfwplatformunavailable):
  when 65550 is static:
    const
      Glfwplatformunavailable* = 65550 ## Generated based on /usr/local/include/GLFW/glfw3.h:849:9
  else:
    let Glfwplatformunavailable* = 65550 ## Generated based on /usr/local/include/GLFW/glfw3.h:849:9
else:
  static :
    hint("Declaration of " & "Glfwplatformunavailable" &
        " already exists, not redeclaring")
when not declared(Glfwfocused):
  when 131073 is static:
    const
      Glfwfocused* = 131073  ## Generated based on /usr/local/include/GLFW/glfw3.h:859:9
  else:
    let Glfwfocused* = 131073 ## Generated based on /usr/local/include/GLFW/glfw3.h:859:9
else:
  static :
    hint("Declaration of " & "Glfwfocused" & " already exists, not redeclaring")
when not declared(Glfwiconified):
  when 131074 is static:
    const
      Glfwiconified* = 131074 ## Generated based on /usr/local/include/GLFW/glfw3.h:864:9
  else:
    let Glfwiconified* = 131074 ## Generated based on /usr/local/include/GLFW/glfw3.h:864:9
else:
  static :
    hint("Declaration of " & "Glfwiconified" &
        " already exists, not redeclaring")
when not declared(Glfwresizable):
  when 131075 is static:
    const
      Glfwresizable* = 131075 ## Generated based on /usr/local/include/GLFW/glfw3.h:870:9
  else:
    let Glfwresizable* = 131075 ## Generated based on /usr/local/include/GLFW/glfw3.h:870:9
else:
  static :
    hint("Declaration of " & "Glfwresizable" &
        " already exists, not redeclaring")
when not declared(Glfwvisible):
  when 131076 is static:
    const
      Glfwvisible* = 131076  ## Generated based on /usr/local/include/GLFW/glfw3.h:876:9
  else:
    let Glfwvisible* = 131076 ## Generated based on /usr/local/include/GLFW/glfw3.h:876:9
else:
  static :
    hint("Declaration of " & "Glfwvisible" & " already exists, not redeclaring")
when not declared(Glfwdecorated):
  when 131077 is static:
    const
      Glfwdecorated* = 131077 ## Generated based on /usr/local/include/GLFW/glfw3.h:882:9
  else:
    let Glfwdecorated* = 131077 ## Generated based on /usr/local/include/GLFW/glfw3.h:882:9
else:
  static :
    hint("Declaration of " & "Glfwdecorated" &
        " already exists, not redeclaring")
when not declared(Glfwautoiconify):
  when 131078 is static:
    const
      Glfwautoiconify* = 131078 ## Generated based on /usr/local/include/GLFW/glfw3.h:888:9
  else:
    let Glfwautoiconify* = 131078 ## Generated based on /usr/local/include/GLFW/glfw3.h:888:9
else:
  static :
    hint("Declaration of " & "Glfwautoiconify" &
        " already exists, not redeclaring")
when not declared(Glfwfloating):
  when 131079 is static:
    const
      Glfwfloating* = 131079 ## Generated based on /usr/local/include/GLFW/glfw3.h:894:9
  else:
    let Glfwfloating* = 131079 ## Generated based on /usr/local/include/GLFW/glfw3.h:894:9
else:
  static :
    hint("Declaration of " & "Glfwfloating" & " already exists, not redeclaring")
when not declared(Glfwmaximized):
  when 131080 is static:
    const
      Glfwmaximized* = 131080 ## Generated based on /usr/local/include/GLFW/glfw3.h:900:9
  else:
    let Glfwmaximized* = 131080 ## Generated based on /usr/local/include/GLFW/glfw3.h:900:9
else:
  static :
    hint("Declaration of " & "Glfwmaximized" &
        " already exists, not redeclaring")
when not declared(Glfwcentercursor):
  when 131081 is static:
    const
      Glfwcentercursor* = 131081 ## Generated based on /usr/local/include/GLFW/glfw3.h:905:9
  else:
    let Glfwcentercursor* = 131081 ## Generated based on /usr/local/include/GLFW/glfw3.h:905:9
else:
  static :
    hint("Declaration of " & "Glfwcentercursor" &
        " already exists, not redeclaring")
when not declared(Glfwtransparentframebuffer):
  when 131082 is static:
    const
      Glfwtransparentframebuffer* = 131082 ## Generated based on /usr/local/include/GLFW/glfw3.h:912:9
  else:
    let Glfwtransparentframebuffer* = 131082 ## Generated based on /usr/local/include/GLFW/glfw3.h:912:9
else:
  static :
    hint("Declaration of " & "Glfwtransparentframebuffer" &
        " already exists, not redeclaring")
when not declared(Glfwhovered):
  when 131083 is static:
    const
      Glfwhovered* = 131083  ## Generated based on /usr/local/include/GLFW/glfw3.h:917:9
  else:
    let Glfwhovered* = 131083 ## Generated based on /usr/local/include/GLFW/glfw3.h:917:9
else:
  static :
    hint("Declaration of " & "Glfwhovered" & " already exists, not redeclaring")
when not declared(Glfwfocusonshow):
  when 131084 is static:
    const
      Glfwfocusonshow* = 131084 ## Generated based on /usr/local/include/GLFW/glfw3.h:923:9
  else:
    let Glfwfocusonshow* = 131084 ## Generated based on /usr/local/include/GLFW/glfw3.h:923:9
else:
  static :
    hint("Declaration of " & "Glfwfocusonshow" &
        " already exists, not redeclaring")
when not declared(Glfwmousepassthrough):
  when 131085 is static:
    const
      Glfwmousepassthrough* = 131085 ## Generated based on /usr/local/include/GLFW/glfw3.h:930:9
  else:
    let Glfwmousepassthrough* = 131085 ## Generated based on /usr/local/include/GLFW/glfw3.h:930:9
else:
  static :
    hint("Declaration of " & "Glfwmousepassthrough" &
        " already exists, not redeclaring")
when not declared(Glfwpositionx):
  when 131086 is static:
    const
      Glfwpositionx* = 131086 ## Generated based on /usr/local/include/GLFW/glfw3.h:936:9
  else:
    let Glfwpositionx* = 131086 ## Generated based on /usr/local/include/GLFW/glfw3.h:936:9
else:
  static :
    hint("Declaration of " & "Glfwpositionx" &
        " already exists, not redeclaring")
when not declared(Glfwpositiony):
  when 131087 is static:
    const
      Glfwpositiony* = 131087 ## Generated based on /usr/local/include/GLFW/glfw3.h:942:9
  else:
    let Glfwpositiony* = 131087 ## Generated based on /usr/local/include/GLFW/glfw3.h:942:9
else:
  static :
    hint("Declaration of " & "Glfwpositiony" &
        " already exists, not redeclaring")
when not declared(Glfwredbits):
  when 135169 is static:
    const
      Glfwredbits* = 135169  ## Generated based on /usr/local/include/GLFW/glfw3.h:948:9
  else:
    let Glfwredbits* = 135169 ## Generated based on /usr/local/include/GLFW/glfw3.h:948:9
else:
  static :
    hint("Declaration of " & "Glfwredbits" & " already exists, not redeclaring")
when not declared(Glfwgreenbits):
  when 135170 is static:
    const
      Glfwgreenbits* = 135170 ## Generated based on /usr/local/include/GLFW/glfw3.h:953:9
  else:
    let Glfwgreenbits* = 135170 ## Generated based on /usr/local/include/GLFW/glfw3.h:953:9
else:
  static :
    hint("Declaration of " & "Glfwgreenbits" &
        " already exists, not redeclaring")
when not declared(Glfwbluebits):
  when 135171 is static:
    const
      Glfwbluebits* = 135171 ## Generated based on /usr/local/include/GLFW/glfw3.h:958:9
  else:
    let Glfwbluebits* = 135171 ## Generated based on /usr/local/include/GLFW/glfw3.h:958:9
else:
  static :
    hint("Declaration of " & "Glfwbluebits" & " already exists, not redeclaring")
when not declared(Glfwalphabits):
  when 135172 is static:
    const
      Glfwalphabits* = 135172 ## Generated based on /usr/local/include/GLFW/glfw3.h:963:9
  else:
    let Glfwalphabits* = 135172 ## Generated based on /usr/local/include/GLFW/glfw3.h:963:9
else:
  static :
    hint("Declaration of " & "Glfwalphabits" &
        " already exists, not redeclaring")
when not declared(Glfwdepthbits):
  when 135173 is static:
    const
      Glfwdepthbits* = 135173 ## Generated based on /usr/local/include/GLFW/glfw3.h:968:9
  else:
    let Glfwdepthbits* = 135173 ## Generated based on /usr/local/include/GLFW/glfw3.h:968:9
else:
  static :
    hint("Declaration of " & "Glfwdepthbits" &
        " already exists, not redeclaring")
when not declared(Glfwstencilbits):
  when 135174 is static:
    const
      Glfwstencilbits* = 135174 ## Generated based on /usr/local/include/GLFW/glfw3.h:973:9
  else:
    let Glfwstencilbits* = 135174 ## Generated based on /usr/local/include/GLFW/glfw3.h:973:9
else:
  static :
    hint("Declaration of " & "Glfwstencilbits" &
        " already exists, not redeclaring")
when not declared(Glfwaccumredbits):
  when 135175 is static:
    const
      Glfwaccumredbits* = 135175 ## Generated based on /usr/local/include/GLFW/glfw3.h:978:9
  else:
    let Glfwaccumredbits* = 135175 ## Generated based on /usr/local/include/GLFW/glfw3.h:978:9
else:
  static :
    hint("Declaration of " & "Glfwaccumredbits" &
        " already exists, not redeclaring")
when not declared(Glfwaccumgreenbits):
  when 135176 is static:
    const
      Glfwaccumgreenbits* = 135176 ## Generated based on /usr/local/include/GLFW/glfw3.h:983:9
  else:
    let Glfwaccumgreenbits* = 135176 ## Generated based on /usr/local/include/GLFW/glfw3.h:983:9
else:
  static :
    hint("Declaration of " & "Glfwaccumgreenbits" &
        " already exists, not redeclaring")
when not declared(Glfwaccumbluebits):
  when 135177 is static:
    const
      Glfwaccumbluebits* = 135177 ## Generated based on /usr/local/include/GLFW/glfw3.h:988:9
  else:
    let Glfwaccumbluebits* = 135177 ## Generated based on /usr/local/include/GLFW/glfw3.h:988:9
else:
  static :
    hint("Declaration of " & "Glfwaccumbluebits" &
        " already exists, not redeclaring")
when not declared(Glfwaccumalphabits):
  when 135178 is static:
    const
      Glfwaccumalphabits* = 135178 ## Generated based on /usr/local/include/GLFW/glfw3.h:993:9
  else:
    let Glfwaccumalphabits* = 135178 ## Generated based on /usr/local/include/GLFW/glfw3.h:993:9
else:
  static :
    hint("Declaration of " & "Glfwaccumalphabits" &
        " already exists, not redeclaring")
when not declared(Glfwauxbuffers):
  when 135179 is static:
    const
      Glfwauxbuffers* = 135179 ## Generated based on /usr/local/include/GLFW/glfw3.h:998:9
  else:
    let Glfwauxbuffers* = 135179 ## Generated based on /usr/local/include/GLFW/glfw3.h:998:9
else:
  static :
    hint("Declaration of " & "Glfwauxbuffers" &
        " already exists, not redeclaring")
when not declared(Glfwstereo):
  when 135180 is static:
    const
      Glfwstereo* = 135180   ## Generated based on /usr/local/include/GLFW/glfw3.h:1003:9
  else:
    let Glfwstereo* = 135180 ## Generated based on /usr/local/include/GLFW/glfw3.h:1003:9
else:
  static :
    hint("Declaration of " & "Glfwstereo" & " already exists, not redeclaring")
when not declared(Glfwsamples):
  when 135181 is static:
    const
      Glfwsamples* = 135181  ## Generated based on /usr/local/include/GLFW/glfw3.h:1008:9
  else:
    let Glfwsamples* = 135181 ## Generated based on /usr/local/include/GLFW/glfw3.h:1008:9
else:
  static :
    hint("Declaration of " & "Glfwsamples" & " already exists, not redeclaring")
when not declared(Glfwsrgbcapable):
  when 135182 is static:
    const
      Glfwsrgbcapable* = 135182 ## Generated based on /usr/local/include/GLFW/glfw3.h:1013:9
  else:
    let Glfwsrgbcapable* = 135182 ## Generated based on /usr/local/include/GLFW/glfw3.h:1013:9
else:
  static :
    hint("Declaration of " & "Glfwsrgbcapable" &
        " already exists, not redeclaring")
when not declared(Glfwrefreshrate):
  when 135183 is static:
    const
      Glfwrefreshrate* = 135183 ## Generated based on /usr/local/include/GLFW/glfw3.h:1018:9
  else:
    let Glfwrefreshrate* = 135183 ## Generated based on /usr/local/include/GLFW/glfw3.h:1018:9
else:
  static :
    hint("Declaration of " & "Glfwrefreshrate" &
        " already exists, not redeclaring")
when not declared(Glfwdoublebuffer):
  when 135184 is static:
    const
      Glfwdoublebuffer* = 135184 ## Generated based on /usr/local/include/GLFW/glfw3.h:1024:9
  else:
    let Glfwdoublebuffer* = 135184 ## Generated based on /usr/local/include/GLFW/glfw3.h:1024:9
else:
  static :
    hint("Declaration of " & "Glfwdoublebuffer" &
        " already exists, not redeclaring")
when not declared(Glfwclientapi):
  when 139265 is static:
    const
      Glfwclientapi* = 139265 ## Generated based on /usr/local/include/GLFW/glfw3.h:1031:9
  else:
    let Glfwclientapi* = 139265 ## Generated based on /usr/local/include/GLFW/glfw3.h:1031:9
else:
  static :
    hint("Declaration of " & "Glfwclientapi" &
        " already exists, not redeclaring")
when not declared(Glfwcontextversionmajor):
  when 139266 is static:
    const
      Glfwcontextversionmajor* = 139266 ## Generated based on /usr/local/include/GLFW/glfw3.h:1037:9
  else:
    let Glfwcontextversionmajor* = 139266 ## Generated based on /usr/local/include/GLFW/glfw3.h:1037:9
else:
  static :
    hint("Declaration of " & "Glfwcontextversionmajor" &
        " already exists, not redeclaring")
when not declared(Glfwcontextversionminor):
  when 139267 is static:
    const
      Glfwcontextversionminor* = 139267 ## Generated based on /usr/local/include/GLFW/glfw3.h:1043:9
  else:
    let Glfwcontextversionminor* = 139267 ## Generated based on /usr/local/include/GLFW/glfw3.h:1043:9
else:
  static :
    hint("Declaration of " & "Glfwcontextversionminor" &
        " already exists, not redeclaring")
when not declared(Glfwcontextrevision):
  when 139268 is static:
    const
      Glfwcontextrevision* = 139268 ## Generated based on /usr/local/include/GLFW/glfw3.h:1049:9
  else:
    let Glfwcontextrevision* = 139268 ## Generated based on /usr/local/include/GLFW/glfw3.h:1049:9
else:
  static :
    hint("Declaration of " & "Glfwcontextrevision" &
        " already exists, not redeclaring")
when not declared(Glfwcontextrobustness):
  when 139269 is static:
    const
      Glfwcontextrobustness* = 139269 ## Generated based on /usr/local/include/GLFW/glfw3.h:1055:9
  else:
    let Glfwcontextrobustness* = 139269 ## Generated based on /usr/local/include/GLFW/glfw3.h:1055:9
else:
  static :
    hint("Declaration of " & "Glfwcontextrobustness" &
        " already exists, not redeclaring")
when not declared(Glfwopenglforwardcompat):
  when 139270 is static:
    const
      Glfwopenglforwardcompat* = 139270 ## Generated based on /usr/local/include/GLFW/glfw3.h:1061:9
  else:
    let Glfwopenglforwardcompat* = 139270 ## Generated based on /usr/local/include/GLFW/glfw3.h:1061:9
else:
  static :
    hint("Declaration of " & "Glfwopenglforwardcompat" &
        " already exists, not redeclaring")
when not declared(Glfwcontextdebug):
  when 139271 is static:
    const
      Glfwcontextdebug* = 139271 ## Generated based on /usr/local/include/GLFW/glfw3.h:1067:9
  else:
    let Glfwcontextdebug* = 139271 ## Generated based on /usr/local/include/GLFW/glfw3.h:1067:9
else:
  static :
    hint("Declaration of " & "Glfwcontextdebug" &
        " already exists, not redeclaring")
when not declared(Glfwopengldebugcontext):
  when Glfwcontextdebug is typedesc:
    type
      Glfwopengldebugcontext* = Glfwcontextdebug ## Generated based on /usr/local/include/GLFW/glfw3.h:1072:9
  else:
    when Glfwcontextdebug is static:
      const
        Glfwopengldebugcontext* = Glfwcontextdebug ## Generated based on /usr/local/include/GLFW/glfw3.h:1072:9
    else:
      let Glfwopengldebugcontext* = Glfwcontextdebug ## Generated based on /usr/local/include/GLFW/glfw3.h:1072:9
else:
  static :
    hint("Declaration of " & "Glfwopengldebugcontext" &
        " already exists, not redeclaring")
when not declared(Glfwopenglprofile):
  when 139272 is static:
    const
      Glfwopenglprofile* = 139272 ## Generated based on /usr/local/include/GLFW/glfw3.h:1078:9
  else:
    let Glfwopenglprofile* = 139272 ## Generated based on /usr/local/include/GLFW/glfw3.h:1078:9
else:
  static :
    hint("Declaration of " & "Glfwopenglprofile" &
        " already exists, not redeclaring")
when not declared(Glfwcontextreleasebehavior):
  when 139273 is static:
    const
      Glfwcontextreleasebehavior* = 139273 ## Generated based on /usr/local/include/GLFW/glfw3.h:1084:9
  else:
    let Glfwcontextreleasebehavior* = 139273 ## Generated based on /usr/local/include/GLFW/glfw3.h:1084:9
else:
  static :
    hint("Declaration of " & "Glfwcontextreleasebehavior" &
        " already exists, not redeclaring")
when not declared(Glfwcontextnoerror):
  when 139274 is static:
    const
      Glfwcontextnoerror* = 139274 ## Generated based on /usr/local/include/GLFW/glfw3.h:1090:9
  else:
    let Glfwcontextnoerror* = 139274 ## Generated based on /usr/local/include/GLFW/glfw3.h:1090:9
else:
  static :
    hint("Declaration of " & "Glfwcontextnoerror" &
        " already exists, not redeclaring")
when not declared(Glfwcontextcreationapi):
  when 139275 is static:
    const
      Glfwcontextcreationapi* = 139275 ## Generated based on /usr/local/include/GLFW/glfw3.h:1096:9
  else:
    let Glfwcontextcreationapi* = 139275 ## Generated based on /usr/local/include/GLFW/glfw3.h:1096:9
else:
  static :
    hint("Declaration of " & "Glfwcontextcreationapi" &
        " already exists, not redeclaring")
when not declared(Glfwscaletomonitor):
  when 139276 is static:
    const
      Glfwscaletomonitor* = 139276 ## Generated based on /usr/local/include/GLFW/glfw3.h:1100:9
  else:
    let Glfwscaletomonitor* = 139276 ## Generated based on /usr/local/include/GLFW/glfw3.h:1100:9
else:
  static :
    hint("Declaration of " & "Glfwscaletomonitor" &
        " already exists, not redeclaring")
when not declared(Glfwscaleframebuffer):
  when 139277 is static:
    const
      Glfwscaleframebuffer* = 139277 ## Generated based on /usr/local/include/GLFW/glfw3.h:1104:9
  else:
    let Glfwscaleframebuffer* = 139277 ## Generated based on /usr/local/include/GLFW/glfw3.h:1104:9
else:
  static :
    hint("Declaration of " & "Glfwscaleframebuffer" &
        " already exists, not redeclaring")
when not declared(Glfwcocoaretinaframebuffer):
  when 143361 is static:
    const
      Glfwcocoaretinaframebuffer* = 143361 ## Generated based on /usr/local/include/GLFW/glfw3.h:1111:9
  else:
    let Glfwcocoaretinaframebuffer* = 143361 ## Generated based on /usr/local/include/GLFW/glfw3.h:1111:9
else:
  static :
    hint("Declaration of " & "Glfwcocoaretinaframebuffer" &
        " already exists, not redeclaring")
when not declared(Glfwcocoaframename):
  when 143362 is static:
    const
      Glfwcocoaframename* = 143362 ## Generated based on /usr/local/include/GLFW/glfw3.h:1115:9
  else:
    let Glfwcocoaframename* = 143362 ## Generated based on /usr/local/include/GLFW/glfw3.h:1115:9
else:
  static :
    hint("Declaration of " & "Glfwcocoaframename" &
        " already exists, not redeclaring")
when not declared(Glfwcocoagraphicsswitching):
  when 143363 is static:
    const
      Glfwcocoagraphicsswitching* = 143363 ## Generated based on /usr/local/include/GLFW/glfw3.h:1119:9
  else:
    let Glfwcocoagraphicsswitching* = 143363 ## Generated based on /usr/local/include/GLFW/glfw3.h:1119:9
else:
  static :
    hint("Declaration of " & "Glfwcocoagraphicsswitching" &
        " already exists, not redeclaring")
when not declared(Glfwx11classname):
  when 147457 is static:
    const
      Glfwx11classname* = 147457 ## Generated based on /usr/local/include/GLFW/glfw3.h:1123:9
  else:
    let Glfwx11classname* = 147457 ## Generated based on /usr/local/include/GLFW/glfw3.h:1123:9
else:
  static :
    hint("Declaration of " & "Glfwx11classname" &
        " already exists, not redeclaring")
when not declared(Glfwx11instancename):
  when 147458 is static:
    const
      Glfwx11instancename* = 147458 ## Generated based on /usr/local/include/GLFW/glfw3.h:1127:9
  else:
    let Glfwx11instancename* = 147458 ## Generated based on /usr/local/include/GLFW/glfw3.h:1127:9
else:
  static :
    hint("Declaration of " & "Glfwx11instancename" &
        " already exists, not redeclaring")
when not declared(Glfwwin32keyboardmenu):
  when 151553 is static:
    const
      Glfwwin32keyboardmenu* = 151553 ## Generated based on /usr/local/include/GLFW/glfw3.h:1128:9
  else:
    let Glfwwin32keyboardmenu* = 151553 ## Generated based on /usr/local/include/GLFW/glfw3.h:1128:9
else:
  static :
    hint("Declaration of " & "Glfwwin32keyboardmenu" &
        " already exists, not redeclaring")
when not declared(Glfwwin32showdefault):
  when 151554 is static:
    const
      Glfwwin32showdefault* = 151554 ## Generated based on /usr/local/include/GLFW/glfw3.h:1131:9
  else:
    let Glfwwin32showdefault* = 151554 ## Generated based on /usr/local/include/GLFW/glfw3.h:1131:9
else:
  static :
    hint("Declaration of " & "Glfwwin32showdefault" &
        " already exists, not redeclaring")
when not declared(Glfwwaylandappid):
  when 155649 is static:
    const
      Glfwwaylandappid* = 155649 ## Generated based on /usr/local/include/GLFW/glfw3.h:1137:9
  else:
    let Glfwwaylandappid* = 155649 ## Generated based on /usr/local/include/GLFW/glfw3.h:1137:9
else:
  static :
    hint("Declaration of " & "Glfwwaylandappid" &
        " already exists, not redeclaring")
when not declared(Glfwnoapi):
  when 0 is static:
    const
      Glfwnoapi* = 0         ## Generated based on /usr/local/include/GLFW/glfw3.h:1140:9
  else:
    let Glfwnoapi* = 0       ## Generated based on /usr/local/include/GLFW/glfw3.h:1140:9
else:
  static :
    hint("Declaration of " & "Glfwnoapi" & " already exists, not redeclaring")
when not declared(Glfwopenglapi):
  when 196609 is static:
    const
      Glfwopenglapi* = 196609 ## Generated based on /usr/local/include/GLFW/glfw3.h:1141:9
  else:
    let Glfwopenglapi* = 196609 ## Generated based on /usr/local/include/GLFW/glfw3.h:1141:9
else:
  static :
    hint("Declaration of " & "Glfwopenglapi" &
        " already exists, not redeclaring")
when not declared(Glfwopenglesapi):
  when 196610 is static:
    const
      Glfwopenglesapi* = 196610 ## Generated based on /usr/local/include/GLFW/glfw3.h:1142:9
  else:
    let Glfwopenglesapi* = 196610 ## Generated based on /usr/local/include/GLFW/glfw3.h:1142:9
else:
  static :
    hint("Declaration of " & "Glfwopenglesapi" &
        " already exists, not redeclaring")
when not declared(Glfwnorobustness):
  when 0 is static:
    const
      Glfwnorobustness* = 0  ## Generated based on /usr/local/include/GLFW/glfw3.h:1144:9
  else:
    let Glfwnorobustness* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:1144:9
else:
  static :
    hint("Declaration of " & "Glfwnorobustness" &
        " already exists, not redeclaring")
when not declared(Glfwnoresetnotification):
  when 200705 is static:
    const
      Glfwnoresetnotification* = 200705 ## Generated based on /usr/local/include/GLFW/glfw3.h:1145:9
  else:
    let Glfwnoresetnotification* = 200705 ## Generated based on /usr/local/include/GLFW/glfw3.h:1145:9
else:
  static :
    hint("Declaration of " & "Glfwnoresetnotification" &
        " already exists, not redeclaring")
when not declared(Glfwlosecontextonreset):
  when 200706 is static:
    const
      Glfwlosecontextonreset* = 200706 ## Generated based on /usr/local/include/GLFW/glfw3.h:1146:9
  else:
    let Glfwlosecontextonreset* = 200706 ## Generated based on /usr/local/include/GLFW/glfw3.h:1146:9
else:
  static :
    hint("Declaration of " & "Glfwlosecontextonreset" &
        " already exists, not redeclaring")
when not declared(Glfwopenglanyprofile):
  when 0 is static:
    const
      Glfwopenglanyprofile* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:1148:9
  else:
    let Glfwopenglanyprofile* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:1148:9
else:
  static :
    hint("Declaration of " & "Glfwopenglanyprofile" &
        " already exists, not redeclaring")
when not declared(Glfwopenglcoreprofile):
  when 204801 is static:
    const
      Glfwopenglcoreprofile* = 204801 ## Generated based on /usr/local/include/GLFW/glfw3.h:1149:9
  else:
    let Glfwopenglcoreprofile* = 204801 ## Generated based on /usr/local/include/GLFW/glfw3.h:1149:9
else:
  static :
    hint("Declaration of " & "Glfwopenglcoreprofile" &
        " already exists, not redeclaring")
when not declared(Glfwopenglcompatprofile):
  when 204802 is static:
    const
      Glfwopenglcompatprofile* = 204802 ## Generated based on /usr/local/include/GLFW/glfw3.h:1150:9
  else:
    let Glfwopenglcompatprofile* = 204802 ## Generated based on /usr/local/include/GLFW/glfw3.h:1150:9
else:
  static :
    hint("Declaration of " & "Glfwopenglcompatprofile" &
        " already exists, not redeclaring")
when not declared(Glfwcursor):
  when 208897 is static:
    const
      Glfwcursor* = 208897   ## Generated based on /usr/local/include/GLFW/glfw3.h:1152:9
  else:
    let Glfwcursor* = 208897 ## Generated based on /usr/local/include/GLFW/glfw3.h:1152:9
else:
  static :
    hint("Declaration of " & "Glfwcursor" & " already exists, not redeclaring")
when not declared(Glfwstickykeys):
  when 208898 is static:
    const
      Glfwstickykeys* = 208898 ## Generated based on /usr/local/include/GLFW/glfw3.h:1153:9
  else:
    let Glfwstickykeys* = 208898 ## Generated based on /usr/local/include/GLFW/glfw3.h:1153:9
else:
  static :
    hint("Declaration of " & "Glfwstickykeys" &
        " already exists, not redeclaring")
when not declared(Glfwstickymousebuttons):
  when 208899 is static:
    const
      Glfwstickymousebuttons* = 208899 ## Generated based on /usr/local/include/GLFW/glfw3.h:1154:9
  else:
    let Glfwstickymousebuttons* = 208899 ## Generated based on /usr/local/include/GLFW/glfw3.h:1154:9
else:
  static :
    hint("Declaration of " & "Glfwstickymousebuttons" &
        " already exists, not redeclaring")
when not declared(Glfwlockkeymods):
  when 208900 is static:
    const
      Glfwlockkeymods* = 208900 ## Generated based on /usr/local/include/GLFW/glfw3.h:1155:9
  else:
    let Glfwlockkeymods* = 208900 ## Generated based on /usr/local/include/GLFW/glfw3.h:1155:9
else:
  static :
    hint("Declaration of " & "Glfwlockkeymods" &
        " already exists, not redeclaring")
when not declared(Glfwrawmousemotion):
  when 208901 is static:
    const
      Glfwrawmousemotion* = 208901 ## Generated based on /usr/local/include/GLFW/glfw3.h:1156:9
  else:
    let Glfwrawmousemotion* = 208901 ## Generated based on /usr/local/include/GLFW/glfw3.h:1156:9
else:
  static :
    hint("Declaration of " & "Glfwrawmousemotion" &
        " already exists, not redeclaring")
when not declared(Glfwcursornormal):
  when 212993 is static:
    const
      Glfwcursornormal* = 212993 ## Generated based on /usr/local/include/GLFW/glfw3.h:1158:9
  else:
    let Glfwcursornormal* = 212993 ## Generated based on /usr/local/include/GLFW/glfw3.h:1158:9
else:
  static :
    hint("Declaration of " & "Glfwcursornormal" &
        " already exists, not redeclaring")
when not declared(Glfwcursorhidden):
  when 212994 is static:
    const
      Glfwcursorhidden* = 212994 ## Generated based on /usr/local/include/GLFW/glfw3.h:1159:9
  else:
    let Glfwcursorhidden* = 212994 ## Generated based on /usr/local/include/GLFW/glfw3.h:1159:9
else:
  static :
    hint("Declaration of " & "Glfwcursorhidden" &
        " already exists, not redeclaring")
when not declared(Glfwcursordisabled):
  when 212995 is static:
    const
      Glfwcursordisabled* = 212995 ## Generated based on /usr/local/include/GLFW/glfw3.h:1160:9
  else:
    let Glfwcursordisabled* = 212995 ## Generated based on /usr/local/include/GLFW/glfw3.h:1160:9
else:
  static :
    hint("Declaration of " & "Glfwcursordisabled" &
        " already exists, not redeclaring")
when not declared(Glfwcursorcaptured):
  when 212996 is static:
    const
      Glfwcursorcaptured* = 212996 ## Generated based on /usr/local/include/GLFW/glfw3.h:1161:9
  else:
    let Glfwcursorcaptured* = 212996 ## Generated based on /usr/local/include/GLFW/glfw3.h:1161:9
else:
  static :
    hint("Declaration of " & "Glfwcursorcaptured" &
        " already exists, not redeclaring")
when not declared(Glfwanyreleasebehavior):
  when 0 is static:
    const
      Glfwanyreleasebehavior* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:1163:9
  else:
    let Glfwanyreleasebehavior* = 0 ## Generated based on /usr/local/include/GLFW/glfw3.h:1163:9
else:
  static :
    hint("Declaration of " & "Glfwanyreleasebehavior" &
        " already exists, not redeclaring")
when not declared(Glfwreleasebehaviorflush):
  when 217089 is static:
    const
      Glfwreleasebehaviorflush* = 217089 ## Generated based on /usr/local/include/GLFW/glfw3.h:1164:9
  else:
    let Glfwreleasebehaviorflush* = 217089 ## Generated based on /usr/local/include/GLFW/glfw3.h:1164:9
else:
  static :
    hint("Declaration of " & "Glfwreleasebehaviorflush" &
        " already exists, not redeclaring")
when not declared(Glfwreleasebehaviornone):
  when 217090 is static:
    const
      Glfwreleasebehaviornone* = 217090 ## Generated based on /usr/local/include/GLFW/glfw3.h:1165:9
  else:
    let Glfwreleasebehaviornone* = 217090 ## Generated based on /usr/local/include/GLFW/glfw3.h:1165:9
else:
  static :
    hint("Declaration of " & "Glfwreleasebehaviornone" &
        " already exists, not redeclaring")
when not declared(Glfwnativecontextapi):
  when 221185 is static:
    const
      Glfwnativecontextapi* = 221185 ## Generated based on /usr/local/include/GLFW/glfw3.h:1167:9
  else:
    let Glfwnativecontextapi* = 221185 ## Generated based on /usr/local/include/GLFW/glfw3.h:1167:9
else:
  static :
    hint("Declaration of " & "Glfwnativecontextapi" &
        " already exists, not redeclaring")
when not declared(Glfweglcontextapi):
  when 221186 is static:
    const
      Glfweglcontextapi* = 221186 ## Generated based on /usr/local/include/GLFW/glfw3.h:1168:9
  else:
    let Glfweglcontextapi* = 221186 ## Generated based on /usr/local/include/GLFW/glfw3.h:1168:9
else:
  static :
    hint("Declaration of " & "Glfweglcontextapi" &
        " already exists, not redeclaring")
when not declared(Glfwosmesacontextapi):
  when 221187 is static:
    const
      Glfwosmesacontextapi* = 221187 ## Generated based on /usr/local/include/GLFW/glfw3.h:1169:9
  else:
    let Glfwosmesacontextapi* = 221187 ## Generated based on /usr/local/include/GLFW/glfw3.h:1169:9
else:
  static :
    hint("Declaration of " & "Glfwosmesacontextapi" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtypenone):
  when 225281 is static:
    const
      Glfwangleplatformtypenone* = 225281 ## Generated based on /usr/local/include/GLFW/glfw3.h:1171:9
  else:
    let Glfwangleplatformtypenone* = 225281 ## Generated based on /usr/local/include/GLFW/glfw3.h:1171:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtypenone" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtypeopengl):
  when 225282 is static:
    const
      Glfwangleplatformtypeopengl* = 225282 ## Generated based on /usr/local/include/GLFW/glfw3.h:1172:9
  else:
    let Glfwangleplatformtypeopengl* = 225282 ## Generated based on /usr/local/include/GLFW/glfw3.h:1172:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtypeopengl" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtypeopengles):
  when 225283 is static:
    const
      Glfwangleplatformtypeopengles* = 225283 ## Generated based on /usr/local/include/GLFW/glfw3.h:1173:9
  else:
    let Glfwangleplatformtypeopengles* = 225283 ## Generated based on /usr/local/include/GLFW/glfw3.h:1173:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtypeopengles" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtyped3d9):
  when 225284 is static:
    const
      Glfwangleplatformtyped3d9* = 225284 ## Generated based on /usr/local/include/GLFW/glfw3.h:1174:9
  else:
    let Glfwangleplatformtyped3d9* = 225284 ## Generated based on /usr/local/include/GLFW/glfw3.h:1174:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtyped3d9" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtyped3d11):
  when 225285 is static:
    const
      Glfwangleplatformtyped3d11* = 225285 ## Generated based on /usr/local/include/GLFW/glfw3.h:1175:9
  else:
    let Glfwangleplatformtyped3d11* = 225285 ## Generated based on /usr/local/include/GLFW/glfw3.h:1175:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtyped3d11" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtypevulkan):
  when 225287 is static:
    const
      Glfwangleplatformtypevulkan* = 225287 ## Generated based on /usr/local/include/GLFW/glfw3.h:1176:9
  else:
    let Glfwangleplatformtypevulkan* = 225287 ## Generated based on /usr/local/include/GLFW/glfw3.h:1176:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtypevulkan" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtypemetal):
  when 225288 is static:
    const
      Glfwangleplatformtypemetal* = 225288 ## Generated based on /usr/local/include/GLFW/glfw3.h:1177:9
  else:
    let Glfwangleplatformtypemetal* = 225288 ## Generated based on /usr/local/include/GLFW/glfw3.h:1177:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtypemetal" &
        " already exists, not redeclaring")
when not declared(Glfwwaylandpreferlibdecor):
  when 229377 is static:
    const
      Glfwwaylandpreferlibdecor* = 229377 ## Generated based on /usr/local/include/GLFW/glfw3.h:1179:9
  else:
    let Glfwwaylandpreferlibdecor* = 229377 ## Generated based on /usr/local/include/GLFW/glfw3.h:1179:9
else:
  static :
    hint("Declaration of " & "Glfwwaylandpreferlibdecor" &
        " already exists, not redeclaring")
when not declared(Glfwwaylanddisablelibdecor):
  when 229378 is static:
    const
      Glfwwaylanddisablelibdecor* = 229378 ## Generated based on /usr/local/include/GLFW/glfw3.h:1180:9
  else:
    let Glfwwaylanddisablelibdecor* = 229378 ## Generated based on /usr/local/include/GLFW/glfw3.h:1180:9
else:
  static :
    hint("Declaration of " & "Glfwwaylanddisablelibdecor" &
        " already exists, not redeclaring")
when not declared(Glfwanyposition):
  when 2147483648 is static:
    const
      Glfwanyposition* = 2147483648'i64 ## Generated based on /usr/local/include/GLFW/glfw3.h:1182:9
  else:
    let Glfwanyposition* = 2147483648'i64 ## Generated based on /usr/local/include/GLFW/glfw3.h:1182:9
else:
  static :
    hint("Declaration of " & "Glfwanyposition" &
        " already exists, not redeclaring")
when not declared(Glfwarrowcursor):
  when 221185 is static:
    const
      Glfwarrowcursor* = 221185 ## Generated based on /usr/local/include/GLFW/glfw3.h:1197:9
  else:
    let Glfwarrowcursor* = 221185 ## Generated based on /usr/local/include/GLFW/glfw3.h:1197:9
else:
  static :
    hint("Declaration of " & "Glfwarrowcursor" &
        " already exists, not redeclaring")
when not declared(Glfwibeamcursor):
  when 221186 is static:
    const
      Glfwibeamcursor* = 221186 ## Generated based on /usr/local/include/GLFW/glfw3.h:1202:9
  else:
    let Glfwibeamcursor* = 221186 ## Generated based on /usr/local/include/GLFW/glfw3.h:1202:9
else:
  static :
    hint("Declaration of " & "Glfwibeamcursor" &
        " already exists, not redeclaring")
when not declared(Glfwcrosshaircursor):
  when 221187 is static:
    const
      Glfwcrosshaircursor* = 221187 ## Generated based on /usr/local/include/GLFW/glfw3.h:1207:9
  else:
    let Glfwcrosshaircursor* = 221187 ## Generated based on /usr/local/include/GLFW/glfw3.h:1207:9
else:
  static :
    hint("Declaration of " & "Glfwcrosshaircursor" &
        " already exists, not redeclaring")
when not declared(Glfwpointinghandcursor):
  when 221188 is static:
    const
      Glfwpointinghandcursor* = 221188 ## Generated based on /usr/local/include/GLFW/glfw3.h:1212:9
  else:
    let Glfwpointinghandcursor* = 221188 ## Generated based on /usr/local/include/GLFW/glfw3.h:1212:9
else:
  static :
    hint("Declaration of " & "Glfwpointinghandcursor" &
        " already exists, not redeclaring")
when not declared(Glfwresizeewcursor):
  when 221189 is static:
    const
      Glfwresizeewcursor* = 221189 ## Generated based on /usr/local/include/GLFW/glfw3.h:1218:9
  else:
    let Glfwresizeewcursor* = 221189 ## Generated based on /usr/local/include/GLFW/glfw3.h:1218:9
else:
  static :
    hint("Declaration of " & "Glfwresizeewcursor" &
        " already exists, not redeclaring")
when not declared(Glfwresizenscursor):
  when 221190 is static:
    const
      Glfwresizenscursor* = 221190 ## Generated based on /usr/local/include/GLFW/glfw3.h:1224:9
  else:
    let Glfwresizenscursor* = 221190 ## Generated based on /usr/local/include/GLFW/glfw3.h:1224:9
else:
  static :
    hint("Declaration of " & "Glfwresizenscursor" &
        " already exists, not redeclaring")
when not declared(Glfwresizenwsecursor):
  when 221191 is static:
    const
      Glfwresizenwsecursor* = 221191 ## Generated based on /usr/local/include/GLFW/glfw3.h:1239:9
  else:
    let Glfwresizenwsecursor* = 221191 ## Generated based on /usr/local/include/GLFW/glfw3.h:1239:9
else:
  static :
    hint("Declaration of " & "Glfwresizenwsecursor" &
        " already exists, not redeclaring")
when not declared(Glfwresizeneswcursor):
  when 221192 is static:
    const
      Glfwresizeneswcursor* = 221192 ## Generated based on /usr/local/include/GLFW/glfw3.h:1254:9
  else:
    let Glfwresizeneswcursor* = 221192 ## Generated based on /usr/local/include/GLFW/glfw3.h:1254:9
else:
  static :
    hint("Declaration of " & "Glfwresizeneswcursor" &
        " already exists, not redeclaring")
when not declared(Glfwresizeallcursor):
  when 221193 is static:
    const
      Glfwresizeallcursor* = 221193 ## Generated based on /usr/local/include/GLFW/glfw3.h:1260:9
  else:
    let Glfwresizeallcursor* = 221193 ## Generated based on /usr/local/include/GLFW/glfw3.h:1260:9
else:
  static :
    hint("Declaration of " & "Glfwresizeallcursor" &
        " already exists, not redeclaring")
when not declared(Glfwnotallowedcursor):
  when 221194 is static:
    const
      Glfwnotallowedcursor* = 221194 ## Generated based on /usr/local/include/GLFW/glfw3.h:1272:9
  else:
    let Glfwnotallowedcursor* = 221194 ## Generated based on /usr/local/include/GLFW/glfw3.h:1272:9
else:
  static :
    hint("Declaration of " & "Glfwnotallowedcursor" &
        " already exists, not redeclaring")
when not declared(Glfwhresizecursor):
  when Glfwresizeewcursor is typedesc:
    type
      Glfwhresizecursor* = Glfwresizeewcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1277:9
  else:
    when Glfwresizeewcursor is static:
      const
        Glfwhresizecursor* = Glfwresizeewcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1277:9
    else:
      let Glfwhresizecursor* = Glfwresizeewcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1277:9
else:
  static :
    hint("Declaration of " & "Glfwhresizecursor" &
        " already exists, not redeclaring")
when not declared(Glfwvresizecursor):
  when Glfwresizenscursor is typedesc:
    type
      Glfwvresizecursor* = Glfwresizenscursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1282:9
  else:
    when Glfwresizenscursor is static:
      const
        Glfwvresizecursor* = Glfwresizenscursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1282:9
    else:
      let Glfwvresizecursor* = Glfwresizenscursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1282:9
else:
  static :
    hint("Declaration of " & "Glfwvresizecursor" &
        " already exists, not redeclaring")
when not declared(Glfwhandcursor):
  when Glfwpointinghandcursor is typedesc:
    type
      Glfwhandcursor* = Glfwpointinghandcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1287:9
  else:
    when Glfwpointinghandcursor is static:
      const
        Glfwhandcursor* = Glfwpointinghandcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1287:9
    else:
      let Glfwhandcursor* = Glfwpointinghandcursor ## Generated based on /usr/local/include/GLFW/glfw3.h:1287:9
else:
  static :
    hint("Declaration of " & "Glfwhandcursor" &
        " already exists, not redeclaring")
when not declared(Glfwconnected):
  when 262145 is static:
    const
      Glfwconnected* = 262145 ## Generated based on /usr/local/include/GLFW/glfw3.h:1290:9
  else:
    let Glfwconnected* = 262145 ## Generated based on /usr/local/include/GLFW/glfw3.h:1290:9
else:
  static :
    hint("Declaration of " & "Glfwconnected" &
        " already exists, not redeclaring")
when not declared(Glfwdisconnected):
  when 262146 is static:
    const
      Glfwdisconnected* = 262146 ## Generated based on /usr/local/include/GLFW/glfw3.h:1291:9
  else:
    let Glfwdisconnected* = 262146 ## Generated based on /usr/local/include/GLFW/glfw3.h:1291:9
else:
  static :
    hint("Declaration of " & "Glfwdisconnected" &
        " already exists, not redeclaring")
when not declared(Glfwjoystickhatbuttons):
  when 327681 is static:
    const
      Glfwjoystickhatbuttons* = 327681 ## Generated based on /usr/local/include/GLFW/glfw3.h:1299:9
  else:
    let Glfwjoystickhatbuttons* = 327681 ## Generated based on /usr/local/include/GLFW/glfw3.h:1299:9
else:
  static :
    hint("Declaration of " & "Glfwjoystickhatbuttons" &
        " already exists, not redeclaring")
when not declared(Glfwangleplatformtype):
  when 327682 is static:
    const
      Glfwangleplatformtype* = 327682 ## Generated based on /usr/local/include/GLFW/glfw3.h:1304:9
  else:
    let Glfwangleplatformtype* = 327682 ## Generated based on /usr/local/include/GLFW/glfw3.h:1304:9
else:
  static :
    hint("Declaration of " & "Glfwangleplatformtype" &
        " already exists, not redeclaring")
when not declared(Glfwplatform):
  when 327683 is static:
    const
      Glfwplatform* = 327683 ## Generated based on /usr/local/include/GLFW/glfw3.h:1309:9
  else:
    let Glfwplatform* = 327683 ## Generated based on /usr/local/include/GLFW/glfw3.h:1309:9
else:
  static :
    hint("Declaration of " & "Glfwplatform" & " already exists, not redeclaring")
when not declared(Glfwcocoachdirresources):
  when 331777 is static:
    const
      Glfwcocoachdirresources* = 331777 ## Generated based on /usr/local/include/GLFW/glfw3.h:1314:9
  else:
    let Glfwcocoachdirresources* = 331777 ## Generated based on /usr/local/include/GLFW/glfw3.h:1314:9
else:
  static :
    hint("Declaration of " & "Glfwcocoachdirresources" &
        " already exists, not redeclaring")
when not declared(Glfwcocoamenubar):
  when 331778 is static:
    const
      Glfwcocoamenubar* = 331778 ## Generated based on /usr/local/include/GLFW/glfw3.h:1319:9
  else:
    let Glfwcocoamenubar* = 331778 ## Generated based on /usr/local/include/GLFW/glfw3.h:1319:9
else:
  static :
    hint("Declaration of " & "Glfwcocoamenubar" &
        " already exists, not redeclaring")
when not declared(Glfwx11xcbvulkansurface):
  when 335873 is static:
    const
      Glfwx11xcbvulkansurface* = 335873 ## Generated based on /usr/local/include/GLFW/glfw3.h:1324:9
  else:
    let Glfwx11xcbvulkansurface* = 335873 ## Generated based on /usr/local/include/GLFW/glfw3.h:1324:9
else:
  static :
    hint("Declaration of " & "Glfwx11xcbvulkansurface" &
        " already exists, not redeclaring")
when not declared(Glfwwaylandlibdecor):
  when 339969 is static:
    const
      Glfwwaylandlibdecor* = 339969 ## Generated based on /usr/local/include/GLFW/glfw3.h:1329:9
  else:
    let Glfwwaylandlibdecor* = 339969 ## Generated based on /usr/local/include/GLFW/glfw3.h:1329:9
else:
  static :
    hint("Declaration of " & "Glfwwaylandlibdecor" &
        " already exists, not redeclaring")
when not declared(Glfwanyplatform):
  when 393216 is static:
    const
      Glfwanyplatform* = 393216 ## Generated based on /usr/local/include/GLFW/glfw3.h:1338:9
  else:
    let Glfwanyplatform* = 393216 ## Generated based on /usr/local/include/GLFW/glfw3.h:1338:9
else:
  static :
    hint("Declaration of " & "Glfwanyplatform" &
        " already exists, not redeclaring")
when not declared(Glfwplatformwin32):
  when 393217 is static:
    const
      Glfwplatformwin32* = 393217 ## Generated based on /usr/local/include/GLFW/glfw3.h:1339:9
  else:
    let Glfwplatformwin32* = 393217 ## Generated based on /usr/local/include/GLFW/glfw3.h:1339:9
else:
  static :
    hint("Declaration of " & "Glfwplatformwin32" &
        " already exists, not redeclaring")
when not declared(Glfwplatformcocoa):
  when 393218 is static:
    const
      Glfwplatformcocoa* = 393218 ## Generated based on /usr/local/include/GLFW/glfw3.h:1340:9
  else:
    let Glfwplatformcocoa* = 393218 ## Generated based on /usr/local/include/GLFW/glfw3.h:1340:9
else:
  static :
    hint("Declaration of " & "Glfwplatformcocoa" &
        " already exists, not redeclaring")
when not declared(Glfwplatformwayland):
  when 393219 is static:
    const
      Glfwplatformwayland* = 393219 ## Generated based on /usr/local/include/GLFW/glfw3.h:1341:9
  else:
    let Glfwplatformwayland* = 393219 ## Generated based on /usr/local/include/GLFW/glfw3.h:1341:9
else:
  static :
    hint("Declaration of " & "Glfwplatformwayland" &
        " already exists, not redeclaring")
when not declared(Glfwplatformx11):
  when 393220 is static:
    const
      Glfwplatformx11* = 393220 ## Generated based on /usr/local/include/GLFW/glfw3.h:1342:9
  else:
    let Glfwplatformx11* = 393220 ## Generated based on /usr/local/include/GLFW/glfw3.h:1342:9
else:
  static :
    hint("Declaration of " & "Glfwplatformx11" &
        " already exists, not redeclaring")
when not declared(Glfwplatformnull):
  when 393221 is static:
    const
      Glfwplatformnull* = 393221 ## Generated based on /usr/local/include/GLFW/glfw3.h:1343:9
  else:
    let Glfwplatformnull* = 393221 ## Generated based on /usr/local/include/GLFW/glfw3.h:1343:9
else:
  static :
    hint("Declaration of " & "Glfwplatformnull" &
        " already exists, not redeclaring")
when not declared(Glfwdontcare):
  when -1 is static:
    const
      Glfwdontcare* = -1     ## Generated based on /usr/local/include/GLFW/glfw3.h:1346:9
  else:
    let Glfwdontcare* = -1   ## Generated based on /usr/local/include/GLFW/glfw3.h:1346:9
else:
  static :
    hint("Declaration of " & "Glfwdontcare" & " already exists, not redeclaring")
when not declared(glfwinit):
  proc glfwinit*(): cint {.cdecl, importc: "glfwInit".}
else:
  static :
    hint("Declaration of " & "glfwinit" & " already exists, not redeclaring")
when not declared(glfwterminate):
  proc glfwterminate*(): void {.cdecl, importc: "glfwTerminate".}
else:
  static :
    hint("Declaration of " & "glfwterminate" &
        " already exists, not redeclaring")
when not declared(glfwinithint):
  proc glfwinithint*(hint: cint; value: cint): void {.cdecl,
      importc: "glfwInitHint".}
else:
  static :
    hint("Declaration of " & "glfwinithint" & " already exists, not redeclaring")
when not declared(glfwinitallocator):
  proc glfwinitallocator*(allocator: ptr Glfwallocator_1207969099): void {.
      cdecl, importc: "glfwInitAllocator".}
else:
  static :
    hint("Declaration of " & "glfwinitallocator" &
        " already exists, not redeclaring")
when not declared(glfwgetversion):
  proc glfwgetversion*(major: ptr cint; minor: ptr cint; rev: ptr cint): void {.
      cdecl, importc: "glfwGetVersion".}
else:
  static :
    hint("Declaration of " & "glfwgetversion" &
        " already exists, not redeclaring")
when not declared(glfwgetversionstring):
  proc glfwgetversionstring*(): cstring {.cdecl, importc: "glfwGetVersionString".}
else:
  static :
    hint("Declaration of " & "glfwgetversionstring" &
        " already exists, not redeclaring")
when not declared(glfwgeterror):
  proc glfwgeterror*(description: ptr cstring): cint {.cdecl,
      importc: "glfwGetError".}
else:
  static :
    hint("Declaration of " & "glfwgeterror" & " already exists, not redeclaring")
when not declared(glfwseterrorcallback):
  proc glfwseterrorcallback*(callback: Glfwerrorfun_1207969041): Glfwerrorfun_1207969041 {.
      cdecl, importc: "glfwSetErrorCallback".}
else:
  static :
    hint("Declaration of " & "glfwseterrorcallback" &
        " already exists, not redeclaring")
when not declared(glfwgetplatform):
  proc glfwgetplatform*(): cint {.cdecl, importc: "glfwGetPlatform".}
else:
  static :
    hint("Declaration of " & "glfwgetplatform" &
        " already exists, not redeclaring")
when not declared(glfwplatformsupported):
  proc glfwplatformsupported*(platform: cint): cint {.cdecl,
      importc: "glfwPlatformSupported".}
else:
  static :
    hint("Declaration of " & "glfwplatformsupported" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitors):
  proc glfwgetmonitors*(count: ptr cint): ptr ptr Glfwmonitor_1207969029 {.
      cdecl, importc: "glfwGetMonitors".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitors" &
        " already exists, not redeclaring")
when not declared(glfwgetprimarymonitor):
  proc glfwgetprimarymonitor*(): ptr Glfwmonitor_1207969029 {.cdecl,
      importc: "glfwGetPrimaryMonitor".}
else:
  static :
    hint("Declaration of " & "glfwgetprimarymonitor" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitorpos):
  proc glfwgetmonitorpos*(monitor: ptr Glfwmonitor_1207969029; xpos: ptr cint;
                          ypos: ptr cint): void {.cdecl,
      importc: "glfwGetMonitorPos".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitorpos" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitorworkarea):
  proc glfwgetmonitorworkarea*(monitor: ptr Glfwmonitor_1207969029;
                               xpos: ptr cint; ypos: ptr cint; width: ptr cint;
                               height: ptr cint): void {.cdecl,
      importc: "glfwGetMonitorWorkarea".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitorworkarea" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitorphysicalsize):
  proc glfwgetmonitorphysicalsize*(monitor: ptr Glfwmonitor_1207969029;
                                   widthmm: ptr cint; heightmm: ptr cint): void {.
      cdecl, importc: "glfwGetMonitorPhysicalSize".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitorphysicalsize" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitorcontentscale):
  proc glfwgetmonitorcontentscale*(monitor: ptr Glfwmonitor_1207969029;
                                   xscale: ptr cfloat; yscale: ptr cfloat): void {.
      cdecl, importc: "glfwGetMonitorContentScale".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitorcontentscale" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitorname):
  proc glfwgetmonitorname*(monitor: ptr Glfwmonitor_1207969029): cstring {.
      cdecl, importc: "glfwGetMonitorName".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitorname" &
        " already exists, not redeclaring")
when not declared(glfwsetmonitoruserpointer):
  proc glfwsetmonitoruserpointer*(monitor: ptr Glfwmonitor_1207969029;
                                  pointer: pointer): void {.cdecl,
      importc: "glfwSetMonitorUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwsetmonitoruserpointer" &
        " already exists, not redeclaring")
when not declared(glfwgetmonitoruserpointer):
  proc glfwgetmonitoruserpointer*(monitor: ptr Glfwmonitor_1207969029): pointer {.
      cdecl, importc: "glfwGetMonitorUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwgetmonitoruserpointer" &
        " already exists, not redeclaring")
when not declared(glfwsetmonitorcallback):
  proc glfwsetmonitorcallback*(callback: Glfwmonitorfun_1207969077): Glfwmonitorfun_1207969077 {.
      cdecl, importc: "glfwSetMonitorCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetmonitorcallback" &
        " already exists, not redeclaring")
when not declared(glfwgetvideomodes):
  proc glfwgetvideomodes*(monitor: ptr Glfwmonitor_1207969029; count: ptr cint): ptr Glfwvidmode_1207969083 {.
      cdecl, importc: "glfwGetVideoModes".}
else:
  static :
    hint("Declaration of " & "glfwgetvideomodes" &
        " already exists, not redeclaring")
when not declared(glfwgetvideomode):
  proc glfwgetvideomode*(monitor: ptr Glfwmonitor_1207969029): ptr Glfwvidmode_1207969083 {.
      cdecl, importc: "glfwGetVideoMode".}
else:
  static :
    hint("Declaration of " & "glfwgetvideomode" &
        " already exists, not redeclaring")
when not declared(glfwsetgamma):
  proc glfwsetgamma*(monitor: ptr Glfwmonitor_1207969029; gamma: cfloat): void {.
      cdecl, importc: "glfwSetGamma".}
else:
  static :
    hint("Declaration of " & "glfwsetgamma" & " already exists, not redeclaring")
when not declared(glfwgetgammaramp):
  proc glfwgetgammaramp*(monitor: ptr Glfwmonitor_1207969029): ptr Glfwgammaramp_1207969087 {.
      cdecl, importc: "glfwGetGammaRamp".}
else:
  static :
    hint("Declaration of " & "glfwgetgammaramp" &
        " already exists, not redeclaring")
when not declared(glfwsetgammaramp):
  proc glfwsetgammaramp*(monitor: ptr Glfwmonitor_1207969029;
                         ramp: ptr Glfwgammaramp_1207969087): void {.cdecl,
      importc: "glfwSetGammaRamp".}
else:
  static :
    hint("Declaration of " & "glfwsetgammaramp" &
        " already exists, not redeclaring")
when not declared(glfwdefaultwindowhints):
  proc glfwdefaultwindowhints*(): void {.cdecl,
      importc: "glfwDefaultWindowHints".}
else:
  static :
    hint("Declaration of " & "glfwdefaultwindowhints" &
        " already exists, not redeclaring")
when not declared(glfwwindowhint):
  proc glfwwindowhint*(hint: cint; value: cint): void {.cdecl,
      importc: "glfwWindowHint".}
else:
  static :
    hint("Declaration of " & "glfwwindowhint" &
        " already exists, not redeclaring")
when not declared(glfwwindowhintstring):
  proc glfwwindowhintstring*(hint: cint; value: cstring): void {.cdecl,
      importc: "glfwWindowHintString".}
else:
  static :
    hint("Declaration of " & "glfwwindowhintstring" &
        " already exists, not redeclaring")
when not declared(glfwcreatewindow):
  proc glfwcreatewindow*(width: cint; height: cint; title: cstring;
                         monitor: ptr Glfwmonitor_1207969029;
                         share: ptr Glfwwindow_1207969031): ptr Glfwwindow_1207969031 {.
      cdecl, importc: "glfwCreateWindow".}
else:
  static :
    hint("Declaration of " & "glfwcreatewindow" &
        " already exists, not redeclaring")
when not declared(glfwdestroywindow):
  proc glfwdestroywindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwDestroyWindow".}
else:
  static :
    hint("Declaration of " & "glfwdestroywindow" &
        " already exists, not redeclaring")
when not declared(glfwwindowshouldclose):
  proc glfwwindowshouldclose*(window: ptr Glfwwindow_1207969031): cint {.cdecl,
      importc: "glfwWindowShouldClose".}
else:
  static :
    hint("Declaration of " & "glfwwindowshouldclose" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowshouldclose):
  proc glfwsetwindowshouldclose*(window: ptr Glfwwindow_1207969031; value: cint): void {.
      cdecl, importc: "glfwSetWindowShouldClose".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowshouldclose" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowtitle):
  proc glfwgetwindowtitle*(window: ptr Glfwwindow_1207969031): cstring {.cdecl,
      importc: "glfwGetWindowTitle".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowtitle" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowtitle):
  proc glfwsetwindowtitle*(window: ptr Glfwwindow_1207969031; title: cstring): void {.
      cdecl, importc: "glfwSetWindowTitle".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowtitle" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowicon):
  proc glfwsetwindowicon*(window: ptr Glfwwindow_1207969031; count: cint;
                          images: ptr Glfwimage_1207969091): void {.cdecl,
      importc: "glfwSetWindowIcon".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowicon" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowpos):
  proc glfwgetwindowpos*(window: ptr Glfwwindow_1207969031; xpos: ptr cint;
                         ypos: ptr cint): void {.cdecl,
      importc: "glfwGetWindowPos".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowpos" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowpos):
  proc glfwsetwindowpos*(window: ptr Glfwwindow_1207969031; xpos: cint;
                         ypos: cint): void {.cdecl, importc: "glfwSetWindowPos".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowpos" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowsize):
  proc glfwgetwindowsize*(window: ptr Glfwwindow_1207969031; width: ptr cint;
                          height: ptr cint): void {.cdecl,
      importc: "glfwGetWindowSize".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowsize" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowsizelimits):
  proc glfwsetwindowsizelimits*(window: ptr Glfwwindow_1207969031;
                                minwidth: cint; minheight: cint; maxwidth: cint;
                                maxheight: cint): void {.cdecl,
      importc: "glfwSetWindowSizeLimits".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowsizelimits" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowaspectratio):
  proc glfwsetwindowaspectratio*(window: ptr Glfwwindow_1207969031; numer: cint;
                                 denom: cint): void {.cdecl,
      importc: "glfwSetWindowAspectRatio".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowaspectratio" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowsize):
  proc glfwsetwindowsize*(window: ptr Glfwwindow_1207969031; width: cint;
                          height: cint): void {.cdecl,
      importc: "glfwSetWindowSize".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowsize" &
        " already exists, not redeclaring")
when not declared(glfwgetframebuffersize):
  proc glfwgetframebuffersize*(window: ptr Glfwwindow_1207969031;
                               width: ptr cint; height: ptr cint): void {.cdecl,
      importc: "glfwGetFramebufferSize".}
else:
  static :
    hint("Declaration of " & "glfwgetframebuffersize" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowframesize):
  proc glfwgetwindowframesize*(window: ptr Glfwwindow_1207969031;
                               left: ptr cint; top: ptr cint; right: ptr cint;
                               bottom: ptr cint): void {.cdecl,
      importc: "glfwGetWindowFrameSize".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowframesize" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowcontentscale):
  proc glfwgetwindowcontentscale*(window: ptr Glfwwindow_1207969031;
                                  xscale: ptr cfloat; yscale: ptr cfloat): void {.
      cdecl, importc: "glfwGetWindowContentScale".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowcontentscale" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowopacity):
  proc glfwgetwindowopacity*(window: ptr Glfwwindow_1207969031): cfloat {.cdecl,
      importc: "glfwGetWindowOpacity".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowopacity" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowopacity):
  proc glfwsetwindowopacity*(window: ptr Glfwwindow_1207969031; opacity: cfloat): void {.
      cdecl, importc: "glfwSetWindowOpacity".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowopacity" &
        " already exists, not redeclaring")
when not declared(glfwiconifywindow):
  proc glfwiconifywindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwIconifyWindow".}
else:
  static :
    hint("Declaration of " & "glfwiconifywindow" &
        " already exists, not redeclaring")
when not declared(glfwrestorewindow):
  proc glfwrestorewindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwRestoreWindow".}
else:
  static :
    hint("Declaration of " & "glfwrestorewindow" &
        " already exists, not redeclaring")
when not declared(glfwmaximizewindow):
  proc glfwmaximizewindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwMaximizeWindow".}
else:
  static :
    hint("Declaration of " & "glfwmaximizewindow" &
        " already exists, not redeclaring")
when not declared(glfwshowwindow):
  proc glfwshowwindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwShowWindow".}
else:
  static :
    hint("Declaration of " & "glfwshowwindow" &
        " already exists, not redeclaring")
when not declared(glfwhidewindow):
  proc glfwhidewindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwHideWindow".}
else:
  static :
    hint("Declaration of " & "glfwhidewindow" &
        " already exists, not redeclaring")
when not declared(glfwfocuswindow):
  proc glfwfocuswindow*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwFocusWindow".}
else:
  static :
    hint("Declaration of " & "glfwfocuswindow" &
        " already exists, not redeclaring")
when not declared(glfwrequestwindowattention):
  proc glfwrequestwindowattention*(window: ptr Glfwwindow_1207969031): void {.
      cdecl, importc: "glfwRequestWindowAttention".}
else:
  static :
    hint("Declaration of " & "glfwrequestwindowattention" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowmonitor):
  proc glfwgetwindowmonitor*(window: ptr Glfwwindow_1207969031): ptr Glfwmonitor_1207969029 {.
      cdecl, importc: "glfwGetWindowMonitor".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowmonitor" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowmonitor):
  proc glfwsetwindowmonitor*(window: ptr Glfwwindow_1207969031;
                             monitor: ptr Glfwmonitor_1207969029; xpos: cint;
                             ypos: cint; width: cint; height: cint;
                             refreshrate: cint): void {.cdecl,
      importc: "glfwSetWindowMonitor".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowmonitor" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowattrib):
  proc glfwgetwindowattrib*(window: ptr Glfwwindow_1207969031; attrib: cint): cint {.
      cdecl, importc: "glfwGetWindowAttrib".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowattrib" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowattrib):
  proc glfwsetwindowattrib*(window: ptr Glfwwindow_1207969031; attrib: cint;
                            value: cint): void {.cdecl,
      importc: "glfwSetWindowAttrib".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowattrib" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowuserpointer):
  proc glfwsetwindowuserpointer*(window: ptr Glfwwindow_1207969031;
                                 pointer: pointer): void {.cdecl,
      importc: "glfwSetWindowUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowuserpointer" &
        " already exists, not redeclaring")
when not declared(glfwgetwindowuserpointer):
  proc glfwgetwindowuserpointer*(window: ptr Glfwwindow_1207969031): pointer {.
      cdecl, importc: "glfwGetWindowUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwgetwindowuserpointer" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowposcallback):
  proc glfwsetwindowposcallback*(window: ptr Glfwwindow_1207969031;
                                 callback: Glfwwindowposfun_1207969043): Glfwwindowposfun_1207969043 {.
      cdecl, importc: "glfwSetWindowPosCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowposcallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowsizecallback):
  proc glfwsetwindowsizecallback*(window: ptr Glfwwindow_1207969031;
                                  callback: Glfwwindowsizefun_1207969045): Glfwwindowsizefun_1207969045 {.
      cdecl, importc: "glfwSetWindowSizeCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowsizecallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowclosecallback):
  proc glfwsetwindowclosecallback*(window: ptr Glfwwindow_1207969031;
                                   callback: Glfwwindowclosefun_1207969047): Glfwwindowclosefun_1207969047 {.
      cdecl, importc: "glfwSetWindowCloseCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowclosecallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowrefreshcallback):
  proc glfwsetwindowrefreshcallback*(window: ptr Glfwwindow_1207969031;
                                     callback: Glfwwindowrefreshfun_1207969049): Glfwwindowrefreshfun_1207969049 {.
      cdecl, importc: "glfwSetWindowRefreshCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowrefreshcallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowfocuscallback):
  proc glfwsetwindowfocuscallback*(window: ptr Glfwwindow_1207969031;
                                   callback: Glfwwindowfocusfun_1207969051): Glfwwindowfocusfun_1207969051 {.
      cdecl, importc: "glfwSetWindowFocusCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowfocuscallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowiconifycallback):
  proc glfwsetwindowiconifycallback*(window: ptr Glfwwindow_1207969031;
                                     callback: Glfwwindowiconifyfun_1207969053): Glfwwindowiconifyfun_1207969053 {.
      cdecl, importc: "glfwSetWindowIconifyCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowiconifycallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowmaximizecallback):
  proc glfwsetwindowmaximizecallback*(window: ptr Glfwwindow_1207969031;
                                      callback: Glfwwindowmaximizefun_1207969055): Glfwwindowmaximizefun_1207969055 {.
      cdecl, importc: "glfwSetWindowMaximizeCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowmaximizecallback" &
        " already exists, not redeclaring")
when not declared(glfwsetframebuffersizecallback):
  proc glfwsetframebuffersizecallback*(window: ptr Glfwwindow_1207969031;
                                       callback: Glfwframebuffersizefun_1207969057): Glfwframebuffersizefun_1207969057 {.
      cdecl, importc: "glfwSetFramebufferSizeCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetframebuffersizecallback" &
        " already exists, not redeclaring")
when not declared(glfwsetwindowcontentscalecallback):
  proc glfwsetwindowcontentscalecallback*(window: ptr Glfwwindow_1207969031;
      callback: Glfwwindowcontentscalefun_1207969059): Glfwwindowcontentscalefun_1207969059 {.
      cdecl, importc: "glfwSetWindowContentScaleCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetwindowcontentscalecallback" &
        " already exists, not redeclaring")
when not declared(glfwpollevents):
  proc glfwpollevents*(): void {.cdecl, importc: "glfwPollEvents".}
else:
  static :
    hint("Declaration of " & "glfwpollevents" &
        " already exists, not redeclaring")
when not declared(glfwwaitevents):
  proc glfwwaitevents*(): void {.cdecl, importc: "glfwWaitEvents".}
else:
  static :
    hint("Declaration of " & "glfwwaitevents" &
        " already exists, not redeclaring")
when not declared(glfwwaiteventstimeout):
  proc glfwwaiteventstimeout*(timeout: cdouble): void {.cdecl,
      importc: "glfwWaitEventsTimeout".}
else:
  static :
    hint("Declaration of " & "glfwwaiteventstimeout" &
        " already exists, not redeclaring")
when not declared(glfwpostemptyevent):
  proc glfwpostemptyevent*(): void {.cdecl, importc: "glfwPostEmptyEvent".}
else:
  static :
    hint("Declaration of " & "glfwpostemptyevent" &
        " already exists, not redeclaring")
when not declared(glfwgetinputmode):
  proc glfwgetinputmode*(window: ptr Glfwwindow_1207969031; mode: cint): cint {.
      cdecl, importc: "glfwGetInputMode".}
else:
  static :
    hint("Declaration of " & "glfwgetinputmode" &
        " already exists, not redeclaring")
when not declared(glfwsetinputmode):
  proc glfwsetinputmode*(window: ptr Glfwwindow_1207969031; mode: cint;
                         value: cint): void {.cdecl, importc: "glfwSetInputMode".}
else:
  static :
    hint("Declaration of " & "glfwsetinputmode" &
        " already exists, not redeclaring")
when not declared(glfwrawmousemotionsupported):
  proc glfwrawmousemotionsupported*(): cint {.cdecl,
      importc: "glfwRawMouseMotionSupported".}
else:
  static :
    hint("Declaration of " & "glfwrawmousemotionsupported" &
        " already exists, not redeclaring")
when not declared(glfwgetkeyname):
  proc glfwgetkeyname*(key: cint; scancode: cint): cstring {.cdecl,
      importc: "glfwGetKeyName".}
else:
  static :
    hint("Declaration of " & "glfwgetkeyname" &
        " already exists, not redeclaring")
when not declared(glfwgetkeyscancode):
  proc glfwgetkeyscancode*(key: cint): cint {.cdecl,
      importc: "glfwGetKeyScancode".}
else:
  static :
    hint("Declaration of " & "glfwgetkeyscancode" &
        " already exists, not redeclaring")
when not declared(glfwgetkey):
  proc glfwgetkey*(window: ptr Glfwwindow_1207969031; key: cint): cint {.cdecl,
      importc: "glfwGetKey".}
else:
  static :
    hint("Declaration of " & "glfwgetkey" & " already exists, not redeclaring")
when not declared(glfwgetmousebutton):
  proc glfwgetmousebutton*(window: ptr Glfwwindow_1207969031; button: cint): cint {.
      cdecl, importc: "glfwGetMouseButton".}
else:
  static :
    hint("Declaration of " & "glfwgetmousebutton" &
        " already exists, not redeclaring")
when not declared(glfwgetcursorpos):
  proc glfwgetcursorpos*(window: ptr Glfwwindow_1207969031; xpos: ptr cdouble;
                         ypos: ptr cdouble): void {.cdecl,
      importc: "glfwGetCursorPos".}
else:
  static :
    hint("Declaration of " & "glfwgetcursorpos" &
        " already exists, not redeclaring")
when not declared(glfwsetcursorpos):
  proc glfwsetcursorpos*(window: ptr Glfwwindow_1207969031; xpos: cdouble;
                         ypos: cdouble): void {.cdecl,
      importc: "glfwSetCursorPos".}
else:
  static :
    hint("Declaration of " & "glfwsetcursorpos" &
        " already exists, not redeclaring")
when not declared(glfwcreatecursor):
  proc glfwcreatecursor*(image: ptr Glfwimage_1207969091; xhot: cint; yhot: cint): ptr Glfwcursortypedef_1207969033 {.
      cdecl, importc: "glfwCreateCursor".}
else:
  static :
    hint("Declaration of " & "glfwcreatecursor" &
        " already exists, not redeclaring")
when not declared(glfwcreatestandardcursor):
  proc glfwcreatestandardcursor*(shape: cint): ptr Glfwcursortypedef_1207969033 {.
      cdecl, importc: "glfwCreateStandardCursor".}
else:
  static :
    hint("Declaration of " & "glfwcreatestandardcursor" &
        " already exists, not redeclaring")
when not declared(glfwdestroycursor):
  proc glfwdestroycursor*(cursor: ptr Glfwcursortypedef_1207969033): void {.
      cdecl, importc: "glfwDestroyCursor".}
else:
  static :
    hint("Declaration of " & "glfwdestroycursor" &
        " already exists, not redeclaring")
when not declared(glfwsetcursor):
  proc glfwsetcursor*(window: ptr Glfwwindow_1207969031;
                      cursor: ptr Glfwcursortypedef_1207969033): void {.cdecl,
      importc: "glfwSetCursor".}
else:
  static :
    hint("Declaration of " & "glfwsetcursor" &
        " already exists, not redeclaring")
when not declared(glfwsetkeycallback):
  proc glfwsetkeycallback*(window: ptr Glfwwindow_1207969031;
                           callback: Glfwkeyfun_1207969069): Glfwkeyfun_1207969069 {.
      cdecl, importc: "glfwSetKeyCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetkeycallback" &
        " already exists, not redeclaring")
when not declared(glfwsetcharcallback):
  proc glfwsetcharcallback*(window: ptr Glfwwindow_1207969031;
                            callback: Glfwcharfun_1207969071): Glfwcharfun_1207969071 {.
      cdecl, importc: "glfwSetCharCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetcharcallback" &
        " already exists, not redeclaring")
when not declared(glfwsetcharmodscallback):
  proc glfwsetcharmodscallback*(window: ptr Glfwwindow_1207969031;
                                callback: Glfwcharmodsfun_1207969073): Glfwcharmodsfun_1207969073 {.
      cdecl, importc: "glfwSetCharModsCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetcharmodscallback" &
        " already exists, not redeclaring")
when not declared(glfwsetmousebuttoncallback):
  proc glfwsetmousebuttoncallback*(window: ptr Glfwwindow_1207969031;
                                   callback: Glfwmousebuttonfun_1207969061): Glfwmousebuttonfun_1207969061 {.
      cdecl, importc: "glfwSetMouseButtonCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetmousebuttoncallback" &
        " already exists, not redeclaring")
when not declared(glfwsetcursorposcallback):
  proc glfwsetcursorposcallback*(window: ptr Glfwwindow_1207969031;
                                 callback: Glfwcursorposfun_1207969063): Glfwcursorposfun_1207969063 {.
      cdecl, importc: "glfwSetCursorPosCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetcursorposcallback" &
        " already exists, not redeclaring")
when not declared(glfwsetcursorentercallback):
  proc glfwsetcursorentercallback*(window: ptr Glfwwindow_1207969031;
                                   callback: Glfwcursorenterfun_1207969065): Glfwcursorenterfun_1207969065 {.
      cdecl, importc: "glfwSetCursorEnterCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetcursorentercallback" &
        " already exists, not redeclaring")
when not declared(glfwsetscrollcallback):
  proc glfwsetscrollcallback*(window: ptr Glfwwindow_1207969031;
                              callback: Glfwscrollfun_1207969067): Glfwscrollfun_1207969067 {.
      cdecl, importc: "glfwSetScrollCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetscrollcallback" &
        " already exists, not redeclaring")
when not declared(glfwsetdropcallback):
  proc glfwsetdropcallback*(window: ptr Glfwwindow_1207969031;
                            callback: Glfwdropfun_1207969075): Glfwdropfun_1207969075 {.
      cdecl, importc: "glfwSetDropCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetdropcallback" &
        " already exists, not redeclaring")
when not declared(glfwjoystickpresent):
  proc glfwjoystickpresent*(jid: cint): cint {.cdecl,
      importc: "glfwJoystickPresent".}
else:
  static :
    hint("Declaration of " & "glfwjoystickpresent" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickaxes):
  proc glfwgetjoystickaxes*(jid: cint; count: ptr cint): ptr cfloat {.cdecl,
      importc: "glfwGetJoystickAxes".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickaxes" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickbuttons):
  proc glfwgetjoystickbuttons*(jid: cint; count: ptr cint): ptr uint8 {.cdecl,
      importc: "glfwGetJoystickButtons".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickbuttons" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickhats):
  proc glfwgetjoystickhats*(jid: cint; count: ptr cint): ptr uint8 {.cdecl,
      importc: "glfwGetJoystickHats".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickhats" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickname):
  proc glfwgetjoystickname*(jid: cint): cstring {.cdecl,
      importc: "glfwGetJoystickName".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickname" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickguid):
  proc glfwgetjoystickguid*(jid: cint): cstring {.cdecl,
      importc: "glfwGetJoystickGUID".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickguid" &
        " already exists, not redeclaring")
when not declared(glfwsetjoystickuserpointer):
  proc glfwsetjoystickuserpointer*(jid: cint; pointer: pointer): void {.cdecl,
      importc: "glfwSetJoystickUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwsetjoystickuserpointer" &
        " already exists, not redeclaring")
when not declared(glfwgetjoystickuserpointer):
  proc glfwgetjoystickuserpointer*(jid: cint): pointer {.cdecl,
      importc: "glfwGetJoystickUserPointer".}
else:
  static :
    hint("Declaration of " & "glfwgetjoystickuserpointer" &
        " already exists, not redeclaring")
when not declared(glfwjoystickisgamepad):
  proc glfwjoystickisgamepad*(jid: cint): cint {.cdecl,
      importc: "glfwJoystickIsGamepad".}
else:
  static :
    hint("Declaration of " & "glfwjoystickisgamepad" &
        " already exists, not redeclaring")
when not declared(glfwsetjoystickcallback):
  proc glfwsetjoystickcallback*(callback: Glfwjoystickfun_1207969079): Glfwjoystickfun_1207969079 {.
      cdecl, importc: "glfwSetJoystickCallback".}
else:
  static :
    hint("Declaration of " & "glfwsetjoystickcallback" &
        " already exists, not redeclaring")
when not declared(glfwupdategamepadmappings):
  proc glfwupdategamepadmappings*(string: cstring): cint {.cdecl,
      importc: "glfwUpdateGamepadMappings".}
else:
  static :
    hint("Declaration of " & "glfwupdategamepadmappings" &
        " already exists, not redeclaring")
when not declared(glfwgetgamepadname):
  proc glfwgetgamepadname*(jid: cint): cstring {.cdecl,
      importc: "glfwGetGamepadName".}
else:
  static :
    hint("Declaration of " & "glfwgetgamepadname" &
        " already exists, not redeclaring")
when not declared(glfwgetgamepadstate):
  proc glfwgetgamepadstate*(jid: cint; state: ptr Glfwgamepadstate_1207969095): cint {.
      cdecl, importc: "glfwGetGamepadState".}
else:
  static :
    hint("Declaration of " & "glfwgetgamepadstate" &
        " already exists, not redeclaring")
when not declared(glfwsetclipboardstring):
  proc glfwsetclipboardstring*(window: ptr Glfwwindow_1207969031;
                               string: cstring): void {.cdecl,
      importc: "glfwSetClipboardString".}
else:
  static :
    hint("Declaration of " & "glfwsetclipboardstring" &
        " already exists, not redeclaring")
when not declared(glfwgetclipboardstring):
  proc glfwgetclipboardstring*(window: ptr Glfwwindow_1207969031): cstring {.
      cdecl, importc: "glfwGetClipboardString".}
else:
  static :
    hint("Declaration of " & "glfwgetclipboardstring" &
        " already exists, not redeclaring")
when not declared(glfwgettime):
  proc glfwgettime*(): cdouble {.cdecl, importc: "glfwGetTime".}
else:
  static :
    hint("Declaration of " & "glfwgettime" & " already exists, not redeclaring")
when not declared(glfwsettime):
  proc glfwsettime*(time: cdouble): void {.cdecl, importc: "glfwSetTime".}
else:
  static :
    hint("Declaration of " & "glfwsettime" & " already exists, not redeclaring")
when not declared(glfwgettimervalue):
  proc glfwgettimervalue*(): uint64 {.cdecl, importc: "glfwGetTimerValue".}
else:
  static :
    hint("Declaration of " & "glfwgettimervalue" &
        " already exists, not redeclaring")
when not declared(glfwgettimerfrequency):
  proc glfwgettimerfrequency*(): uint64 {.cdecl,
      importc: "glfwGetTimerFrequency".}
else:
  static :
    hint("Declaration of " & "glfwgettimerfrequency" &
        " already exists, not redeclaring")
when not declared(glfwmakecontextcurrent):
  proc glfwmakecontextcurrent*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwMakeContextCurrent".}
else:
  static :
    hint("Declaration of " & "glfwmakecontextcurrent" &
        " already exists, not redeclaring")
when not declared(glfwgetcurrentcontext):
  proc glfwgetcurrentcontext*(): ptr Glfwwindow_1207969031 {.cdecl,
      importc: "glfwGetCurrentContext".}
else:
  static :
    hint("Declaration of " & "glfwgetcurrentcontext" &
        " already exists, not redeclaring")
when not declared(glfwswapbuffers):
  proc glfwswapbuffers*(window: ptr Glfwwindow_1207969031): void {.cdecl,
      importc: "glfwSwapBuffers".}
else:
  static :
    hint("Declaration of " & "glfwswapbuffers" &
        " already exists, not redeclaring")
when not declared(glfwswapinterval):
  proc glfwswapinterval*(interval: cint): void {.cdecl,
      importc: "glfwSwapInterval".}
else:
  static :
    hint("Declaration of " & "glfwswapinterval" &
        " already exists, not redeclaring")
when not declared(glfwextensionsupported):
  proc glfwextensionsupported*(extension: cstring): cint {.cdecl,
      importc: "glfwExtensionSupported".}
else:
  static :
    hint("Declaration of " & "glfwextensionsupported" &
        " already exists, not redeclaring")
when not declared(glfwgetprocaddress):
  proc glfwgetprocaddress*(procname: cstring): Glfwglproc_1207969025 {.cdecl,
      importc: "glfwGetProcAddress".}
else:
  static :
    hint("Declaration of " & "glfwgetprocaddress" &
        " already exists, not redeclaring")
when not declared(glfwvulkansupported):
  proc glfwvulkansupported*(): cint {.cdecl, importc: "glfwVulkanSupported".}
else:
  static :
    hint("Declaration of " & "glfwvulkansupported" &
        " already exists, not redeclaring")
when not declared(glfwgetrequiredinstanceextensions):
  proc glfwgetrequiredinstanceextensions*(count: ptr uint32): ptr cstring {.
      cdecl, importc: "glfwGetRequiredInstanceExtensions".}
else:
  static :
    hint("Declaration of " & "glfwgetrequiredinstanceextensions" &
        " already exists, not redeclaring")