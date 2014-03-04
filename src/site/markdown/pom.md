Maven Project Descriptor
========================

The Maven project descriptor is formatted according to the rules specified in
the following URLs.

* https://maven.apache.org/developers/conventions/code.html
* http://maven.apache.org/ref/3.2.1/maven-model/maven.html

Along with a few common sense rules like `groupId` should be before 
`artifactId`.

The `dependencies`, `plugins`, `extensions` should also be ordered 
by `scope`, `groupId`, and `artifactId`. 

An [XSLT is provided to clean up the `pom.xml`][1] file.

[1]: pom-clean.xslt
