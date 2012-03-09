These scripts build Play 2.0 (and its Scala dependencies) with a local
build of Scala-Virtualized, as required for
[play-js-validation](http://github.com/namin/play-js-validation).

### Setup

1. Setup [JavaScript as an embedded DSL in Scala](http://github.com/namin/lms-sandbox), including all its dependencies. You can locally deploy Scala-Virtualized with the following commands:
  * `ant fastdist && ant distpack`
  * `(cd dists/maven/latest; ant deploy.snapshot.local)`

2. Copy the file `local.properties` from virtualization-lms-core to this root project directory.

3. Run `./build-play.sh`.
  * In case of problems with sbt's compiler interface, run this [script](https://gist.github.com/1643715).
