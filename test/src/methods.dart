part of optional_test;

final Matcher throwsNoSuchElementError =
    throwsA(const TypeMatcher<NoValuePresentError>());

class Consumer<T> {
  void call(T value) {}
}

class Method {
  void call() {}
}

class MockConsumer<T> extends Mock implements Consumer<T> {}

class MockMethod extends Mock implements Method {}

void runMethodTests() {
  group('constructor', () {
    test('new Optional.of(<non-null>) returns normally', () {
      expect(() => Optional.of(1), returnsNormally);
    });
    test('new Optional.of(null) throws', () {
      expect(() => Optional.of(null), throwsArgumentError);
    });
    test('new Optional.ofNullable() never throws', () {
      expect(() => Optional.ofNullable(null), returnsNormally);
      expect(() => Optional.ofNullable(1), returnsNormally);
    });
    test('new Optional.empty() does not throw', () {
      expect(() => const Optional<dynamic>.empty(), returnsNormally);
    });
  });
  group('isPresent', () {
    test('when empty is false', () {
      expect(const Optional<dynamic>.empty().isPresent, isFalse);
    });
    test('when ofNullable(null) is false', () {
      expect(Optional.ofNullable(null).isPresent, isFalse);
    });
    test('when ofNullable(<non-null>) is true', () {
      expect(Optional.ofNullable(1).isPresent, isTrue);
    });
    test('when of(value) is true', () {
      expect(Optional.of(1).isPresent, isTrue);
    });
  });
  group('value', () {
    test('when empty throws', () {
      expect(() => const Optional<dynamic>.empty().value,
          throwsNoSuchElementError);
    });
    test('when isPresent returns value', () {
      expect(Optional.of(1).value, equals(1));
    });
  });
  group('filter', () {
    test('returns empty when non-match', () {
      expect(Optional.of(1).filter((n) => n != 1).isPresent, isFalse);
    });
    test('returns Optional with same value when match', () {
      expect(Optional.of(1).filter((n) => n == 1).isPresent, isTrue);
      expect(Optional.of(1).filter((n) => n == 1).value, equals(1));
    });
  });
  group('maps', () {
    test('flat map when present returns result of map operation', () {
      expect(Optional.of(1).flatMap((n) => Optional.of(n + 1)),
          equals(Optional.of(2)));
    });
    test('flat map when empty returns empty', () {
      expect(const Optional<int>.empty().flatMap((n) => Optional.of(n + 1)),
          equals(const Optional<int>.empty()));
    });
    test('map when present returns new Optional of result of map operation',
        () {
      expect(Optional.of(1).map((n) => n + 1), equals(Optional.of(2)));
    });
    test('map when empty returns empty', () {
      expect(const Optional<int>.empty().map((n) => n + 1),
          equals(const Optional<int>.empty()));
    });
    test('map when generic type changes', () {
      final o = new Optional<int>.ofNullable(null).map((i) => 'i=$i');
      expect(o, equals(const Optional<String>.empty()));
    });

    test('map empty optional and then use orElse', () {
      final o = const Optional<int>.empty().map((i) => 'i=$i').orElse('');
      expect(o, equals(''));
    });


    test('map not empty optional and then use orElse', () {
      final o = Optional<int>.of(5).map((i) => 'i=$i').orElse('');
      expect(o, equals('i=5'));
    });
  });


  group('or', () {
    test('orElse(val) returns val when empty', () {
      expect(const Optional<int>.empty().orElse(2), equals(2));
    });
    test('orElse(val) returns value when present', () {
      expect(Optional.of(1).orElse(2), equals(1));
    });
    test('orElseGet(f) returns f() when empty', () {
      expect(const Optional<int>.empty().orElseGet(() => 2), equals(2));
    });
    test('orElseGet(f) returns value when present', () {
      expect(Optional.of(1).orElseGet(() => 2), equals(1));
    });
    test('orElseThrow(f) throws f() when empty', () {
      expect(() => const Optional<int>.empty().orElseThrow(() => 'exception'),
          throwsA('exception'));
    });
    test('orElseThrow(f) returns value when present', () {
      expect(Optional.of(1).orElseThrow(() => 'exception'), equals(1));
    });
    test('orElse(val) of ofNullable(null) returns value', (){
      expect(Optional<int>.ofNullable(null).orElse(1), equals(1));
    });
  });
  group('ifPresent', () {
    final consumer = MockConsumer<int>();
    final orElse = MockMethod();

    void callConsumer(int i) => consumer.call(i);
    void callOrElse() => orElse.call();

    tearDown(() {
      clearInteractions(consumer);
      clearInteractions(orElse);
    });

    test('calls consumer when present', () {
      expect(() => Optional.of(1).ifPresent(callConsumer), returnsNormally);
      verify(consumer.call(1)).called(1);
    });
    test('does not call orElse when present', () {
      expect(() => Optional.of(1).ifPresent(callConsumer, orElse: callOrElse),
          returnsNormally);
      verifyNever(orElse.call());
    });
    test('does not call consumer when empty', () {
      expect(() => const Optional<int>.empty().ifPresent(callConsumer),
          returnsNormally);
      verifyNever(consumer.call(any));
    });
    test('calls orElse when empty', () {
      expect(
          () => const Optional<int>.empty()
              .ifPresent(callConsumer, orElse: callOrElse),
          returnsNormally);
      verify(orElse.call()).called(1);
    });
  });
  group('hashCode', () {
    test('is 0 when empty', () {
      expect(const Optional<int>.empty().hashCode, equals(0));
    });
    test("is equal to value's hash code when present", () {
      expect(Optional.of(1).hashCode, equals(1.hashCode));
    });
  });
  group('cast', () {
    test('is not required to upcast', () {
      expect(Optional<int>.of(1), const TypeMatcher<Optional<num>>());
    });
    test('is required to downcast', () {
      expect(Optional<num>.of(1), isNot(const TypeMatcher<Optional<int>>()));
    });
    test('casts internal value', () {
      expect(Optional<num>.of(1).cast<int>(), const TypeMatcher<Optional<int>>());
    });
    test('casts empty value', () {
      expect(const Optional<int>.empty().cast<String>(), const TypeMatcher<Optional<String>>());
    });
    test('preseves equality', () {
      final num1 = Optional<num>.of(1);
      expect(num1, equals(num1.cast<int>()));
    });
  });
}
