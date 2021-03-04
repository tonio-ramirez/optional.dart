part of optional_test;

void runExtensionTests() {
  group('val.toOptional', () {
    test('val.toOptional is present', () {
      expect(1.toOptional.isPresent, isTrue);
    });
    test('val.toOptional == Optional.of(val)', () {
      expect(1.toOptional, equals(Optional.of(1)));
    });
  });
}
