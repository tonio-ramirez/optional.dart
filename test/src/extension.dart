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
  group('iterable.firstWhereOptional', () {
    test('iterable.firstWhereOptional is present', () {
      expect(
          <int>[1, 2, 3].firstWhereOptional((v) => v == 3).isPresent, isTrue);
    });
    test('iterable.firstWhereOptional is empty', () {
      expect(<int>[1, 2, 3].firstWhereOptional((v) => v == 4).isEmpty, isTrue);
    });
  });
  group('iterable.firstWhereIndexedOptional', () {
    test('iterable.firstWhereIndexedOptional is present', () {
      expect(
          <int>[1, 2, 3].firstWhereIndexedOptional((i, v) => i == 2).isPresent,
          isTrue);
    });
    test('iterable.firstWhereIndexedOptional is empty', () {
      expect(<int>[1, 2, 3].firstWhereIndexedOptional((i, v) => i == 4).isEmpty,
          isTrue);
    });
  });
  group('iterable.firstOptional', () {
    test('iterable.firstOptional is present', () {
      expect(<int>[1, 2, 3].firstOptional.isPresent, isTrue);
    });
    test('iterable.firstOptional is empty', () {
      expect(<int>[].firstOptional.isEmpty, isTrue);
    });
  });
  group('iterable.lastWhereOptional', () {
    test('iterable.lastWhereOptional is present', () {
      expect(<int>[1, 2, 3].lastWhereOptional((v) => v == 3).isPresent, isTrue);
    });
    test('iterable.lastWhereOptional is empty', () {
      expect(<int>[1, 2, 3].lastWhereOptional((v) => v == 4).isEmpty, isTrue);
    });
  });
  group('iterable.lastWhereIndexedOptional', () {
    test('iterable.lastWhereIndexedOptional is present', () {
      expect(
          <int>[1, 2, 3].lastWhereIndexedOptional((i, v) => i == 2).isPresent,
          isTrue);
    });
    test('iterable.lastWhereIndexedOptional is empty', () {
      expect(<int>[1, 2, 3].lastWhereIndexedOptional((i, v) => i == 4).isEmpty,
          isTrue);
    });
  });
  group('iterable.lastOptional', () {
    test('iterable.lastOptional is present', () {
      expect(<int>[1, 2, 3].lastOptional.isPresent, isTrue);
    });
    test('iterable.lastOptional is empty', () {
      expect(<int>[].lastOptional.isEmpty, isTrue);
    });
  });
  group('iterable.singleWhereOptional', () {
    test('iterable.singleWhereOptional is present', () {
      expect(
          <int>[1, 2, 3].singleWhereOptional((v) => v == 2).isPresent, isTrue);
    });
    test('iterable.singleWhereOptional is present', () {
      expect(
          <int>[1, 2, 2, 3].singleWhereOptional((v) => v == 2).isEmpty, isTrue);
    });
    test('iterable.singleWhereOptional is empty', () {
      expect(<int>[1, 2, 3].singleWhereOptional((v) => v == 4).isEmpty, isTrue);
    });
  });
  group('iterable.singleWhereIndexedOptional', () {
    test('iterable.singleWhereIndexedOptional is present', () {
      expect(
          <int>[1, 2, 3].singleWhereIndexedOptional((i, v) => i == 2).isPresent,
          isTrue);
    });
    test('iterable.singleWhereIndexedOptional is present', () {
      expect(
          <int>[1, 2, 3]
              .singleWhereIndexedOptional((i, v) => i == 2 || v == 2)
              .isEmpty,
          isTrue);
    });
    test('iterable.singleWhereIndexedOptional is empty', () {
      expect(
          <int>[1, 2, 3].singleWhereIndexedOptional((i, v) => i == 4).isEmpty,
          isTrue);
    });
  });
  group('iterable.singleOptional', () {
    test('iterable.singleOptional is present', () {
      expect(<int>[1].singleOptional.isPresent, isTrue);
    });
    test('iterable.singleOptional is empty', () {
      expect(<int>[1, 2, 3].singleOptional.isEmpty, isTrue);
    });
  });
}
