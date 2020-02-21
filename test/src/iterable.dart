part of optional_test;

final Matcher _throwsStateError = throwsA(const TypeMatcher<StateError>());

void runIterableTests() {
  group('empty', () {
    test('iterates 0 times', () {
      var count = 0;
      for (var _ in empty) {
        count++;
      }
      expect(count, equals(0));
    });
    test('.length == 0', () {
      expect(empty.length, equals(0));
    });
    test('.isEmpty == true', () {
      expect(empty.isEmpty, isTrue);
    });
    test('.isNotEmpty == false', () {
      expect(empty.isNotEmpty, isFalse);
    });
    test('.first throws', () {
      expect(() => empty.first, _throwsStateError);
    });
    test('.last throws', () {
      expect(() => empty.last, _throwsStateError);
    });
    test('.single throws', () {
      expect(() => empty.single, _throwsStateError);
    });
  });

  group('present', () {
    const value = 'value';
    var optional = Optional.of(value);
    test('iterates once', () {
      var count = 0;
      for (var _ in optional) {
        count++;
      }
      expect(count, equals(1));
    });
    test('iterates over value', () {
      for (var val in optional) {
        expect(val, equals(value));
      }
    });
    test('.length == 1', () {
      expect(optional.length, equals(1));
    });
    test('.isEmpty == false', () {
      expect(optional.isEmpty, isFalse);
    });
    test('.isNotEmpty == false', () {
      expect(optional.isNotEmpty, isTrue);
    });
    test('.first returns value', () {
      expect(optional.first, equals(value));
    });
    test('.last returns value', () {
      expect(optional.last, equals(value));
    });
    test('.single returns value', () {
      expect(optional.single, equals(value));
    });
  });
}
