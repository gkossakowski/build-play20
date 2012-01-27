#!/usr/bin/env bash
# A script that fixes compiler interface for 2.10.0-M1 release.
# I believe it should be fairly safe to use because sbt ships binary
# interfaces for 2.9.x compiler so this patch wouldn't affect them.
# Author: Grzegorz Kossakowski <grzegorz.kossakowski@gmail.com>
# NOTE: This will fix sbt 0.11.2 only! I'll make it a bit more robust tomorrow.

PATCH=$(cat <<EOF
--- API.scala.orig	2011-10-19 21:25:46.000000000 +0200
+++ API.scala	2012-01-19 23:57:23.000000000 +0100
@@ -260,7 +260,7 @@
 			None
 	}
 	private def ignoreClass(sym: Symbol): Boolean =
-		sym.isLocalClass || sym.isAnonymousClass || sym.fullName.endsWith(LocalChild)
+    sym.isLocalClass || sym.isAnonymousClass || sym.fullName.endsWith(LocalChild.toString)
 
 	// This filters private[this] vals/vars that were not in the original source.
 	//  The getter will be used for processing instead.
EOF
)

CD=`pwd`

for i in $(find $CD/build/Play20/framework/sbt/boot/scala-2.9.1/org.scala-tools.sbt/sbt/0.11.2/compiler-interface-src -name 'compiler-interface-src-0.11.*.jar'); do
  t="${i%.jar}-tmp"
  echo $t
  unzip $i -d $t
  cd $t
  patch <<< "$PATCH"
  rm $i
  zip -r $i .
  cd ..
  rm -rf $t
done
