[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods compatible](https://cocoapod-badges.herokuapp.com/v/Fuzzer/badge.png)](https://cocoapods.org/?q=fuzzer)

# Fuzzer

> Do not crash when your server lies

### What is that?

> We all know that the API has a specification. We all write tests to cover “happy paths” and to cover “unhappy paths” when work with the API.

> It may seem that we’re pretty safe if we have tests and follow the specification. Well, actually no. Usually it works well in theory, but doesn’t really work in practice.

> We can write as many tests as we need to cover all edge cases, but that is both time consuming and error prone. The best choice would be is to automate this process.

from [Crash-free code with Fuzzer](https://tech.blacklane.com/2016/03/11/crash-free-code-with-fuzzer/)

### Example

```objectivec
- (void)test {
  NSDictionary *sample = @{
    @“name” : @“John Doe”,
    @“age” : @42
  };

  UserDeserializer *deserializer = [UserDeserializer new];

  FZRRunner *runner = [FZRRunner runnerWithBuiltinMutationsForSample:sample];

  NSArray *reports = [runner enumerateMutantsUsingBlock:^(NSDictionary *mutant) {
    [deserializer deserializeUser:mutant];
  }];

  XCTAssertEqual(reports.count, 0);
}
```

### Installation

#### Components (used by maintainers)

Get the latest [component .make file for Fuzzer](https://github.com/AlexDenisov/Components/tree/master/Components.make/Fuzzer).

#### CocoaPods

```ruby
pod 'Fuzzer', '0.3.2'
```

#### Carthage

Add the line below to your `Cartfile` to get the latest version of Fuzzer.

```
github "AlexDenisov/Fuzzer"
```

Please consider [Carthage Documentation](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md) if you want to install a specific version of Fuzzer or make any advanced setup.

```
Note : Carthage support has been introduded in v0.3.1
So older versions of Fuzzer cannot be installed with Carthage.
```


#### Building From Source

Typically, you won't have to do this. But if you do, a preferred approach for building from source is using [sub-projects](https://www.cocoanetics.com/2011/12/sub-projects-in-xcode/).


You can use either of the targets below depending on your needs:

* `Fuzzer-lib-ios-static` - for legacy projects (up to `iOS 6`)
* `Fuzzer-iOS-dynamic` - for swift and modern projects




### Out of the box

#### Builtin Mutations

#### Delete Node Mutation

Removes random key/value pair from a dictionary

#### Replace Node Mutation

Takes random key from dictionary and replaces its value with a value provided by [Node Replacement](https://github.com/AlexDenisov/Fuzzer#builtin-replacements)

#### Builtin Replacements

  - integer replacement:    replaces value with 'random' integer
  - float replacement:      replaces value with 'random' float
  - string replacement:     replaces value with 'random' string
  - boolean replacement:    replaces value with 'random' boolean
  - array replacement:      replaces value with 'random' array
  - dictionary replacement: replaces value with 'random' dictionary
  - null replacement:       replaces value with `[NSNull null]`
  - nil replacement:        replaces value with `nil` (leads to removing key/value from dictionary)

### License

MIT, see `LICENSE` for details
