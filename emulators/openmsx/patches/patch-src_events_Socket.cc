$NetBSD$

--- src/events/Socket.cc.orig	2011-11-24 02:41:51.000000000 +0000
+++ src/events/Socket.cc
@@ -3,6 +3,7 @@
 #include "Socket.hh"
 #include "MSXException.hh"
 #include <map>
+#include <string.h>
 
 namespace openmsx {
 
