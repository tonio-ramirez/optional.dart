part of optional_test;

void runExtensionTests() {
  group('null.toOptional', () {
    test('null.toOptional is not present', () {
      expect(null.toOptional.isPresent, isFalse);
    });
    test('null.toOptional == Optional.empty()', () {
      expect(null.toOptional, equals(Optional<dynamic>.empty()));
    });
  });
  group('val.toOptional', () {
    test('val.toOptional is present', () {
      expect(1.toOptional.isPresent, isTrue);
    });
    test('val.toOptional == Optional.of(val)', () {
      expect(1.toOptional, equals(Optional.of(1)));
    });
  });
}
