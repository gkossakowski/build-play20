#/bin/bash

set -e

SCALA_VERSION_DIFF=2.10.0-virtualized-SNAPSHOT
SCALA_VERSION_WANTED=2.10.0-M2-0020-geab3b7e4d7-2012-07-12

alias sbt="sbt @`pwd`/sbt.boot.properties"

FRESH=1
mkdir -p build

substitute_scala_version() {
  sed "s/$SCALA_VERSION_DIFF/$SCALA_VERSION_WANTED/g"
}

substitute_home() {
  sed "s:__HOME__:$HOME:g"
}

# http://nbronson.github.com/scala-stm/index.html
scala_stm() {
  if [ $FRESH ]
  then
    cd build
    git clone https://github.com/nbronson/scala-stm.git
    cd scala-stm
 	git checkout release-0.5
    cat ../../scala_stm.diff | substitute_scala_version | git apply -
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
    cat ../../jerkson.diff | substitute_scala_version | git apply -
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
    cat ../../scala_arm.diff | substitute_scala_version | git apply -
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
    git checkout 0.4.0
    cat ../../scala_io.diff | substitute_scala_version | git apply -
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
    git checkout v2.0.2
    cat ../../akka.diff | substitute_scala_version | git apply -
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
    cat ../../scalacheck.diff | substitute_scala_version | git apply -
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
    git checkout SPECS2-1.9
    cat ../../specs2.diff | substitute_scala_version | git apply -
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
    git checkout v0.11.3
    cat ../../xsbt.diff | substitute_scala_version | git apply -
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
    git checkout 2.0.2
    cat ../../../play20.diff | substitute_scala_version | substitute_home | git apply -
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
