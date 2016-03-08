### Dirs

BUILD_DIR_OSX=Build-OSX
BUILD_DIR_SIMULATOR=Build-Simulator

### SDK

SDK_OSX=macosx
SDK_SIMULATOR=iphonesimulator

### Platform

PLATFORM_OSX=OSX
PLATFORM_SIMULATOR=iPhoneSimulator

### Version

VERSION=$(shell xcodebuild -showBuildSettings 2> /dev/null | grep CURRENT_PROJECT_VERSION | awk ' { print $$NF } ')

### Colors

RESET=\033[0;39m
RED=\033[0;31m
GREEN=\033[0;32m

### Actions

.PHONY: archive archive_osx archive_simulator

archive: test archive_osx archive_simulator

archive_osx: archive.OSX

archive_simulator: archive.SIMULATOR

archive.%: build.%
	cd $(BUILD_DIR_$*) && zip -r -X Fuzzer-$(PLATFORM_$*)-$(VERSION).zip Fuzzer.framework

build.%:
	xcodebuild -sdk $(SDK_$*) \
             -project Fuzzer.xcodeproj \
             -scheme Fuzzer \
             -configuration Release \
             CONFIGURATION_BUILD_DIR=$(BUILD_DIR_$*) \
             clean build

test:
	xcodebuild -project Fuzzer.xcodeproj \
             -IDEBuildOperationMaxNumberOfConcurrentCompileTasks=`sysctl -n hw.ncpu` \
             -scheme FuzzerTests \
             test

clean:
	rm -rf $(BUILD_DIR_OSX)
	rm -rf $(BUILD_DIR_SIMULATOR)

