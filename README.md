sbt-build-script
================

Port of [Html5Boilerplate (H5BP) Ant build script][1] to [SBT][0].  This will better enable compiled, preprocessed, minified H5BP integration with Scala web projects.  Not to mention the fact that SBT is much more concise than Ant.

###Setup

This script works a little differently than the [parent Ant build script][1].  Instead of copying/cloning the build script into the H5BP root directory, you will first clone this SBT project, then copy or clone H5BP into this build script's source directory, more specifically into ./src/main/web/h5bp/src.

Running the build script will then copy the compiled/minified H5BP from ./src/main/web/h5bp/src into ./src/main/web/h5bp/publish (or wherever you specify for the publish directory in the SBT settings file ./project/build.properties).

Scala SBT projects keep all sources in ./src/main/, so this build script follows that convention.

###Project Structure

One challenge with this port is converting the Ant project structure to a more [idiomatic SBT project structure][4].  The directory layout and build properties will be very different than the Ant version.

./:                         Project root, [contains the basic build properties file (build.sbt)][3], .gitignore, .gitmodules, README.md.

/project:                   SBT config files (build.scala, build.properties, default.properties, plugins.sbt, etc.)

/src:                       All source files - Scala, Java, HTML, CSS, Js, etc. (for both main and test).  For this project, only HTML, CSS, Js files and no /src/test.

/src/main/web/h5bp/src:     Raw, unprocessed Html5Boilerplate files.  Your working directory.

/src/main/web/h5bp/build:   Build working directory, temporary, created during build and deleted afterwards.

/src/main/web/h5bp/publish: The destination for H5BP compiled sources, the output of this build script.

/lib:                       [Unmanaged dependencies][5].  Unmanaged dependencies are where you just drop the dependency jar file in /lib and you're done.  By contrast, managed dependencies are specified in build.sbt and project/\*.sbt/properties/scala config files and are downloaded and managed automatically by SBT.

/lib/scripts:               Helper scripts

/lib/submodules:            Primarily for the parent projects - [h5bp/ant-build-script][1] and [h5bp/html5-boilerplate][2].   Used to keep the various compilers, preprocessors, and minifiers, and source code of sbt-build-script synced with the parent projects.

/target:                    Compiled Scala and Java sources.  Automatically created and managed by SBT when it builds your project, no need to manually create or manage.


[0]:    https://github.com/harrah/xsbt
[1]:    https://github.com/h5bp/ant-build-script
[2]:    https://github.com/h5bp/html5-boilerplate
[3]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Hello
[4]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Directories
[5]:    https://github.com/harrah/xsbt/wiki/Getting-Started-Library-Dependencies

