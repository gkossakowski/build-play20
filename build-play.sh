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
    git apply ../../scala_stm.diff
  else
    cd build/scala-stm
  fi
  sbt publish-local
  cd ../../
}

scala_stm
