part of optional_test;

void runEqualityTests() {
  group('==', () {
    test('two empty dynamic Optionals are equal', () {
      expect(const Optional<dynamic>.empty(),
          equals(const Optional<dynamic>.empty()));
    });
    test('two Optionals with same value are equal', () {
      expect(Optional.of(1), equals(Optional.of(1)));
    });
    test('two Optionals with different values are not equal', () {
      expect(Optional.of(1), isNot(Optional.of(2)));
    });
    test('two Optionals with equal values of different types are equal', () {
      expect(Optional.of(1), equals(Optional.of(1.0)));
    });
    test('an empty Optional is not equal to an Optional with value', () {
      expect(Optional.of(1), isNot(const Optional<int>.empty()));
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
