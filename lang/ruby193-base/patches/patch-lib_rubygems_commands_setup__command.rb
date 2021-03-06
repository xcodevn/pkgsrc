$NetBSD$

Make sure to setup under DESTDIR.

--- lib/rubygems/commands/setup_command.rb.orig	2011-08-05 20:18:14.000000000 +0000
+++ lib/rubygems/commands/setup_command.rb
@@ -110,7 +110,7 @@ By default, this RubyGems will install g
 
     uninstall_old_gemcutter
 
-    install_rdoc
+    install_rdoc install_destdir
 
     say
     if @verbose then
@@ -221,16 +221,20 @@ TEXT
     end
   end
 
-  def install_rdoc
+  def install_rdoc(install_destdir)
     gem_doc_dir = File.join Gem.dir, 'doc'
     rubygems_name = "rubygems-#{Gem::VERSION}"
     rubygems_doc_dir = File.join gem_doc_dir, rubygems_name
 
+    unless install_destdir.empty?
+      FileUtils.mkdir_p gem_doc_dir unless File.exist?(gem_doc_dir)
+    end
+
     if File.writable? gem_doc_dir and
        (not File.exist? rubygems_doc_dir or
         File.writable? rubygems_doc_dir) then
       say "Removing old RubyGems RDoc and ri" if @verbose
-      Dir[File.join(Gem.dir, 'doc', 'rubygems-[0-9]*')].each do |dir|
+      Dir[File.join(gem_doc_dir, 'rubygems-[0-9]*')].each do |dir|
         rm_rf dir
       end
 
