part of optional_test;

void runEqualityTests() {
  group('==', () {
    test('two empty untyped Optionals are equal', () {
      expect(const Optional.empty(), equals(const Optional.empty()));
    });
    test('two Optionals with same value are equal', () {
      expect(new Optional.of(1), equals(new Optional.of(1)));
    });
    test('two Optionals with different values are not equal', () {
      expect(new Optional.of(1), isNot(new Optional.of(2)));
    });
    test('two Optionals with equal values of different types are equal', () {
      expect(new Optional.of(1), equals(new Optional.of(1.0)));
    });
    test('an empty Optional is not equal to an Optional with value', () {
      expect(new Optional.of(1), isNot(const Optional.empty()));
    });
    test('two empty Optionals of different types are equal', () {
      expect(
          const Optional<int>.empty(), equals(const Optional<String>.empty()));
    });
    test('two empty Optionals of same type are equal', () {
      expect(const Optional<int>.empty(), equals(const Optional<int>.empty()));
    });
  });
}
