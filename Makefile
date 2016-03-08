
test:
	xcodebuild -project Fuzzer.xcodeproj \
             -IDEBuildOperationMaxNumberOfConcurrentCompileTasks=`sysctl -n hw.ncpu` \
             -scheme FuzzerTests \
             test

