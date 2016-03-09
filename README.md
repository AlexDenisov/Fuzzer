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
$ wget https://raw.githubusercontent.com/AlexDenisov/Components/master/Components.make/BloodMagic/1.0.0/BloodMagic-iOS.make -O ./Components.make/BloodMagic-iOS.make
# OSX
$ wget https://raw.githubusercontent.com/AlexDenisov/Components/master/Components.make/BloodMagic/1.0.0/BloodMagic-OSX.make -O ./Components.make/BloodMagic-OSX.make
$ components install
```

#### CocoaPods/Carthage

Pull requests are more than welcome!

### Out of the box

#### Builtin Mutations

TBD

#### Builtin replacements

TBD

### License

MIT, see `LICENSE` for details
