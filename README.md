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
  FZRMutator *mutator = [FZRMutator mutatorForSample:sample withMutationGenerator:[FZRMutationGenerator builtinMutationGenerator]];
  FZREngine *engine = [FZREngine engineWithMutator:mutator];

  NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
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
pod 'Fuzzer', '0.2.0'
```

#### Carthage

Pull requests are more than welcome!

### Out of the box

#### Builtin Mutations

#### Delete Node FZRMutation

Removes random key/value pair from a dictionary

#### Replace Node FZRMutation

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
