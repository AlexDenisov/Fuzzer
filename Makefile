### Dirs

BUILD_DIR_OSX=Build-OSX
BUILD_DIR_IOS=Build-iOS

### SDK

SDK_OSX=macosx
SDK_IOS=iphonesimulator

### Platform

PLATFORM_IOS=iOS
PLATFORM_OSX=OSX

### Version

VERSION=$(shell xcodebuild -showBuildSettings 2> /dev/null | grep CURRENT_PROJECT_VERSION | awk ' { print $$NF } ')

### Actions

.PHONY: archive archive_osx archive_ios deploy_cocoapods

deploy_cocoapods:
	pod trunk push Fuzzer.podspec

archive: test archive_osx archive_ios

archive_osx: archive.OSX

archive_ios: archive.IOS

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
                   -verbose \
                   test

clean:
	rm -rf $(BUILD_DIR_OSX)
	rm -rf $(BUILD_DIR_IOS)
	rm -rf ./DerivedData

