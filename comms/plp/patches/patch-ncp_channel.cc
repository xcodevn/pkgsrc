$NetBSD$

Remove unnecessary header.

--- ncp/channel.cc.orig	1999-04-12 21:16:50.000000000 +0000
+++ ncp/channel.cc
@@ -20,8 +20,6 @@
 //  e-mail philip.proudman@btinternet.com
 
 
-#include <stream.h>
-
 #include "bool.h"
 #include "channel.h"
 #include "ncp.h"
