$NetBSD: patch-aw,v 1.2 2010/09/21 15:57:30 taca Exp $

* Portability: include <bstring.h> if exists.

--- sql/sql_string.cc.orig	2010-02-04 11:39:53.000000000 +0000
+++ sql/sql_string.cc
@@ -27,6 +27,10 @@ extern void sql_element_free(void *ptr);
 
 #include "sql_string.h"
 
+#ifdef NEEDS_BSTRING_H
+#include <bstring.h> /* defines bzero() */
+#endif
+
 /*****************************************************************************
 ** String functions
 *****************************************************************************/
