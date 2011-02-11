$NetBSD$

--- src/osd/sdl/sdlsync_ntc.c.orig	2010-01-15 20:12:06.000000000 +0000
+++ src/osd/sdl/sdlsync_ntc.c
@@ -19,6 +19,11 @@
 #include <mach/mach.h>
 #endif
 
+#ifdef SDLMAME_NETBSD
+/* for SIGKILL */
+#include <signal.h>
+#endif
+
 // standard C headers
 #include <math.h>
 #include <unistd.h>
