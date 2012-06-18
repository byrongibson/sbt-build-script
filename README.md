sbt-build-script
================

Port of [Html5Boilerplate Ant build script][1] to [SBT][0].  This will better enable compiled, preprocessed, minified H5BP integration with Scala web projects.  Not to mention the fact that SBT is much more concise than Ant.

###Project Structure

One challenge with this port is converting the Ant project structure to a more [idiomatic SBT project structure][3].  The directory layout and build properties will be very different than the Ant version.

./:                         Project root, [contains the basic build properties file (build.sbt)][2], .gitignore, .gitmodules, README.md.
/project:                   SBT config files (build.scala, build.properties, default.properties, plugins.sbt, etc.)
/src:                       All source files - Scala, Java, HTML, CSS, Js, etc. (for both main and test).  For this project, only HTML, CSS, Js files and no /src/test.
/src/main/web/h5bp/src:     Raw, unprocessed Html5Boilerplate files.  Your working directory.
/src/main/web/h5bp/build:   Build working directory, temporary, created during build and deleted afterwards.
/src/main/web/h5bp/publish: The destination for H5BP compiled sources, the output of this build script.
/lib:                       [Unmanaged dependencies][4].  Unmanaged dependencies are where you just drop the dependency jar file in /lib and you're done.  By contrast, managed dependencies are specified in build.sbt and project/\*.sbt/properties/scala config files and are downloaded and managed automatically by SBT.  In this case, /lib/\* is manually copied over from submodules/ant-build-script/tools/\* by the update-tools.sh script, to keep them version-synced with the parent Ant build script.
/scripts:                   Helper scripts
/submodules:                Primarily for h5bp/ant-build-script, to keep the various compilers, preprocessors, and minifiers of sbt-build-script synced with the parent project.
/target:                    Compiled Scala and Java sources.  Automatically created and managed by SBT when it builds your project, no need to manually create or manage.


[0]:    https://github.com/harrah/xsbt
[1]:    https://github.com/h5bp/ant-build-script
[2]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Hello
[3]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Directories
[4]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Library-Dependencies

