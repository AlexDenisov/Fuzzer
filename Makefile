
test:
	xcodebuild -project JSONFuzzer.xcodeproj \
             -IDEBuildOperationMaxNumberOfConcurrentCompileTasks=`sysctl -n hw.ncpu` \
             -scheme MutationTests \
             test

