name := "xml-tester"

version := "1.2.4"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
  "mysql" % "mysql-connector-java" % "5.1.18",
  "avalon-framework" % "avalon-framework-api" % "4.2.0",
  "avalon-framework" % "avalon-framework-impl" % "4.2.0",
  "commons-codec" % "commons-codec" % "1.7",
  "org.apache.xmlgraphics" % "fop" % "1.1" excludeAll(
    ExclusionRule(organization = "org.apache.avalon.framework")
    )
)

play.Project.playJavaSettings

sources in (Compile, doc) := Seq.empty

publishArtifact in (Compile, packageDoc) := false
