part of optional_test;

// ignore: public_member_api_docs
final Matcher throwsNoSuchElementError = throwsA(const isInstanceOf<NoValuePresentError>());

// ignore: public_member_api_docs
class Consumer<T> {
// ignore: public_member_api_docs
  void call(T value) {}
}

// ignore: public_member_api_docs
class Method {
// ignore: public_member_api_docs
  void call() {}
}

// ignore: public_member_api_docs
class MockConsumer<T> extends Mock implements Consumer<T> {
}

// ignore: public_member_api_docs
class MockMethod extends Mock implements Method {
}

// ignore: public_member_api_docs
void runMethodTests() {
  group("constructor", () {
    test("new Optional.of(<non-null>) returns normally", () {
      expect(() => new Optional.of(1), returnsNormally);
    });
    test("new Optional.of(null) throws", () {
      expect(() => new Optional.of(null), throwsArgumentError);
    });
    test("new Optional.ofNullable() never throws", () {
      expect(() => new Optional.ofNullable(null), returnsNormally);
      expect(() => new Optional.ofNullable(1), returnsNormally);
    });
    test("new Optional.empty() doesn't throw", () {
      expect(() => const Optional.empty(), returnsNormally);
    });
  });
  group("isPresent", () {
    test("when empty is false", () {
      expect(const Optional.empty().isPresent, isFalse);
    });
    test("when ofNullable(null) is false", () {
      expect(new Optional.ofNullable(null).isPresent, isFalse);
    });
    test("when ofNullable(<non-null>) is true", () {
      expect(new Optional.ofNullable(1).isPresent, isTrue);
    });
    test("when of(value) is true", () {
      expect(new Optional.of(1).isPresent, isTrue);
    });
  });
  group("value", () {
    test("when empty throws", () {
      expect(() => const Optional.empty().value, throwsNoSuchElementError);
    });
    test("when isPresent returns value", () {
      expect(new Optional.of(1).value, equals(1));
    });
  });
  group("filter", () {
    test("returns empty when non-match", () {
      expect(new Optional.of(1).filter((n) => n != 1).isPresent, isFalse);
    });
    test("returns Optional with same value when match", () {
      expect(new Optional.of(1).filter((n) => n == 1).isPresent, isTrue);
      expect(new Optional.of(1).filter((n) => n == 1).value, equals(1));
    });
  });
  group("maps", () {
    test("flat map when present returns result of map operation", () {
      expect(new Optional.of(1).flatMap((n) => new Optional.of(n+1)), equals(new Optional.of(2)));
    });
    test("flat map when empty returns empty", () {
      expect(const Optional.empty().flatMap((n) => new Optional.of(n+1)), equals(const Optional.empty()));
    });
    test("map when present returns new Optional of result of map operation", () {
      expect(new Optional.of(1).map((n) => n+1), equals(new Optional.of(2)));
    });
    test("map when empty returns empty", () {
      expect(const Optional.empty().map((n) => n+1), equals(const Optional.empty()));
    });
  });
  group("or", () {
    test("orElse(val) returns val when empty", () {
      expect(const Optional.empty().orElse(2), equals(2));
    });
    test("orElse(val) returns value when present", () {
      expect(new Optional.of(1).orElse(2), equals(1));
    });
    test("orElseGet(f) returns f() when empty", () {
      expect(const Optional.empty().orElseGet(() => 2), equals(2));
    });
    test("orElseGet(f) returns value when present", () {
      expect(new Optional.of(1).orElseGet(() => 2), equals(1));
    });
    test("orElseThrow(f) throws f() when empty", () {
      expect(() => const Optional.empty().orElseThrow(() => "exception"), throwsA("exception"));
    });
    test("orElseThrow(f) returns value when present", () {
      expect(new Optional.of(1).orElseThrow(() => "exception"), equals(1));
    });
  });
  group('ifPresent', () {
    final consumer = new MockConsumer<int>();
    final orElse = new MockMethod();

    // ignore: type_annotate_public_apis
    void callConsumer(i) => consumer.call(i);
    void callOrElse() => orElse.call();

    tearDown(() {
      clearInteractions(consumer);
      clearInteractions(orElse);
    });

    test("calls consumer when present", () {
      expect(() => new Optional.of(1).ifPresent(callConsumer), returnsNormally);
      verify(consumer.call(1)).called(1);
    });
    test("does not call orElse when present", () {
      expect(() => new Optional.of(1).ifPresent(callConsumer, orElse: callOrElse), returnsNormally);
      verifyNever(orElse.call());
    });
    test("does not call consumer when empty", () {
      expect(() => const Optional.empty().ifPresent(callConsumer), returnsNormally);
      verifyNever(consumer.call(any));
    });
    test("calls orElse when empty", () {
      expect(() => const Optional.empty().ifPresent(callConsumer, orElse: callOrElse), returnsNormally);
      verify(orElse.call()).called(1);
    });
  });
  group('hashCode', () {
    test('is 0 when empty', () {
      expect(const Optional.empty().hashCode, equals(0));
    });
    test("is equal to value's hash code when present", () {
      expect(new Optional.of(1).hashCode, equals(1.hashCode));
    });
  });
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
    test('an empty Optional is not equal to an Optional with value', () {
      expect(new Optional.of(1), isNot(const Optional.empty()));
    });
    test('two empty Optionals of different types are not equal', () {
      expect(const Optional<int>.empty(), isNot(const Optional<String>.empty()));
    });
    test('two empty Optionals of same type are equal', () {
      expect(const Optional<int>.empty(), equals(const Optional<int>.empty()));
    });
  });
}


