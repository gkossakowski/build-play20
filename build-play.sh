#/bin/bash

# Scripts that builds Play 2.0 (and its Scala dependencies)
# against *local* build of Scala virtualized compiler.
#
# In order to use this script you need to build and
# publish locally Scala virtualized compiler. You find version
# that is known to work well with Play 2.0 here:
# https://github.com/gkossakowski/scala/tree/play20
#
# After checking it out, run:
# ant && ant fastdist && ant distpack
# (cd dists/maven/latest; ant deploy.snapshot.local)
#
# Once scala's snapshot is locally deployed you can
# run this script. In case of problems with sbt's
# compiler interface, check following script:
# https://gist.github.com/1643715

set -e

FRESH=1
mkdir -p build

# http://nbronson.github.com/scala-stm/index.html
scala_stm() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/nbronson/scala-stm.git
    cd scala-stm
 	git checkout release-0.4
    git apply ../../scala_stm.diff
  else
    cd build/scala-stm
  fi
  sbt publish-local
  cd ../../
}

jerkson() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/codahale/jerkson.git
    cd jerkson
	git checkout v0.5.0
    git apply ../../jerkson.diff
  else
    cd build/jerkson
  fi
  sbt publish-local
  cd ../../
}

scala_arm() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/jsuereth/scala-arm.git 
    cd scala-arm
    git checkout 1.1
    git apply ../../scala_arm.diff
  else
    cd build/scala-arm
  fi
  sbt publish-local
  cd ../../
}

scala_io() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/jesseeichar/scala-io.git
    cd scala-io
    git checkout 0.2.0
    git apply ../../scala_io.diff
  else
    cd build/scala-io
  fi
  sbt publish-local
  cd ../../
}

akka() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/akka/akka.git
    cd akka
    git checkout v2.0-RC2
    git apply ../../akka.diff
  else
    cd build/akka
  fi
  sbt publish-local
  cd ../../
}

scalacheck() {
  if [ $FRESH ]
  then
    cd build
    git clone git://github.com/rickynils/scalacheck.git
    cd scalacheck
    git checkout 1.9
    git apply ../../scalacheck.diff
  else
    cd build/scalacheck
  fi
  sbt publish-local
  cd ../../
}


specs2() {
  if [ $FRESH ]
  then
    cd build
    git clone git://github.com/etorreborre/specs2.git
    cd specs2
    git checkout SPECS2-1.7.1
    git apply ../../specs2.diff
  else
    cd build/specs2
  fi
  sbt publish-local
  cd ../../
}

xsbt() {
  if [ $FRESH ]
  then
    cd build
    git clone git://github.com/harrah/xsbt.git
    cd xsbt
    git checkout v0.11.2
    git apply ../../xsbt.diff
  else
    cd build/xsbt
  fi
  sbt publish-local
  cd ../../
}

Play20() {
  if [ $FRESH ]
  then
    cd build
    git clone git://github.com/playframework/Play20.git
    cd Play20/framework
    git checkout 2.0-RC3
    git apply ../../../play20.diff
  else
    cd build/Play20/framework
  fi
  sh build publish-local
}

scala_stm
jerkson
scala_arm
scala_io
akka
scalacheck
specs2
xsbt
Play20
