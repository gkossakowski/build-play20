#/bin/bash

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
    git clone https://github.com/jboner/akka.git
    cd akka
    git checkout v2.0-M2
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
    git checkout SPECS2-1.6.1
    git apply ../../specs2.diff
  else
    cd build/specs2
  fi
  sbt publish-local
  cd ../../
}

Play20() {
  if [ $FRESH ]
  then
    cd build
    git clone git://github.com/playframework/Play20.git
    (cd ..; sh fix-sbt.sh)
    cd Play20/framework
    git checkout 154a2e4214b9fc38524d8a8a7e13d8cd4de91fb7
    git apply ../../../play20.diff
  else
    cd build/Play20/framework
  fi
  sh build
}

scala_stm
jerkson
scala_arm
scala_io
akka
scalacheck
specs2
Play20
