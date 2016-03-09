# Fuzzer

> Do not crash when your server lies

### Example

```objectivec
- (void)test {
  NSDictionary *sample = @{
    @“name” : @“John Doe”,
    @“age” : @42
  };

  UserDeserializer *deserializer = [UserDeserializer new];
  Mutator *mutator = [Mutator mutatorForSample:sample withMutationGenerator:[MutationGenerator builtinMutationGenerator]];
  Engine *engine = [Engine engineWithMutator:mutator];

  NSArray *reports = [engine runEngineOverMutants:^(NSDictionary *mutant) {
    [deserializer deserializeUser:mutant];
  }];

  XCTAssertEqual(reports.count, 0);
}
```

### Installation

#### [Components](https://github.com/AlexDenisov/Components)

```bash
$ mkdir -p ./Components.make
# iOS
$ wget https://raw.githubusercontent.com/AlexDenisov/Components/master/Components.make/Fuzzer/0.2.0/Fuzzer-iOS.make -O ./Components.make/Fuzzer-iOS.make
# OSX
$ wget https://raw.githubusercontent.com/AlexDenisov/Components/master/Components.make/Fuzzer/0.2.0/Fuzzer-OSX.make -O ./Components.make/Fuzzer-OSX.make
$ components install
```

#### CocoaPods

```ruby
pod 'Fuzzer', '0.2.0'
```

#### Carthage

Pull requests are more than welcome!

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
