#!/bin/bash
mvn -s settings.xml install:install-file -Dfile=libs/flexunit-4.1.0-8-as3_4.1.0.16076.swc -DartifactId=flexunit -DgroupId=com.adobe.flexunit -Dversion=4.1.0-8 -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/loannshark.swc -DartifactId=loanshark -DgroupId=com.loanshark -Dversion=1.0 -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/greensock.swc -DartifactId=greensock -DgroupId=com.greensock -Dversion=12.1.5 -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/robotlegs-framework-v2.2.0.swc -DartifactId=robotlegs-framework -DgroupId=org.robotlegs -Dversion=2.2.0 -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/robotlegs-extensions-SignalCommandMap-v1.0.0b1.swc -DartifactId=SignalCommandMap -DgroupId=org.robotlegs.extensions -Dversion=1.0.0b1 -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/as3-signals-v0.9-BETA.swc -DartifactId=as3-signals -DgroupId=org.osflash -Dversion=0.9-b -Dpackaging=swc
mvn -s settings.xml install:install-file -Dfile=libs/as3commons-logging-2.7.swc -DartifactId=as3commons-logging -DgroupId=org.as3commons -Dversion=2.7.0 -Dpackaging=swc