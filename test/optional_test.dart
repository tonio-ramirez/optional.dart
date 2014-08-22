import 'package:optional/optional.dart';
import 'package:unittest/unittest.dart';
import 'package:mock/mock.dart';

final Matcher throwsNoSuchElementError = throwsA(const isInstanceOf<NoValuePresentError>('NoValuePresentError'));

class MockConsumer<T> extends Mock {
  void call(T value) => super.call(value);
}

void main() {
  groupSep = '.';
  group("new Optional", () {
    test("of(<non-null>) returns normally", () {
      expect(() => new Optional.of(1), returnsNormally);
    });
    test("of(null) throws", () {
      expect(() => new Optional.of(null), throwsArgumentError);
    });
    test("ofNullable() never throws", () {
      expect(() => new Optional.ofNullable(null), returnsNormally);
      expect(() => new Optional.ofNullable(1), returnsNormally);
    });
    test("empty() doesn't throw", () {
      expect(() => new Optional.empty(), returnsNormally);
    });
  });
  groupSep = ' ';
  group("isPresent", () {
    test("when empty is false", () {
      expect(new Optional.empty().isPresent, isFalse);
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
      expect(() => new Optional.empty().value, throwsNoSuchElementError);
    });
    test("when isPresent returns value", () {
      expect(new Optional.of(1).value, equals(1));
    });
  });
  group("filter", () {
    test("filters out", () {
      expect(new Optional.of(1).filter((n) => n != 1).isPresent, isFalse);
    });
    test("passes", () {
      expect(new Optional.of(1).filter((n) => n == 1).isPresent, isTrue);
      expect(new Optional.of(1).filter((n) => n == 1).value, equals(1));
    });
  });
  groupSep = ": ";
  group("maps", () {
    test("flat map when present", () {
      expect(new Optional.of(1).flatMap((n) => new Optional.of(n+1)), equals(new Optional.of(2)));
    });
    test("flat map when empty", () {
      expect(new Optional.empty().flatMap((n) => new Optional.of(n+1)), equals(new Optional.empty()));
    });
    test("map when present", () {
      expect(new Optional.of(1).map((n) => n+1), equals(new Optional.of(2)));
    });
    test("map when empty", () {
      expect(new Optional.empty().map((n) => n+1), equals(new Optional.empty()));
    });
  });
  groupSep = '';
  group("orElse", () {
    test("(val) returns val when empty", () {
      expect(new Optional.empty().orElse(2), equals(2));
    });
    test("(val) returns value when present", () {
      expect(new Optional.of(1).orElse(2), equals(1));
    });
    test("Get(f) returns f() when empty", () {
      expect(new Optional.empty().orElseGet(() => 2), equals(2));
    });
    test("Get(f) returns value when present", () {
      expect(new Optional.of(1).orElseGet(() => 2), equals(1));
    });
    test("Throw(f) throws f() when empty", () {
      expect(() => new Optional.empty().orElseThrow(() => "exception"), throwsA("exception"));
    });
    test("Throw(f) returns value when present", () {
      expect(new Optional.of(1).orElseThrow(() => "exception"), equals(1));
    });
  });
  groupSep=' ';
  group('ifPresent', () {
    final MockConsumer<int> consumer = new MockConsumer<int>();
    tearDown(() => consumer.clearLogs());
    test("calls consumer when present", () {
      expect(() => new Optional.of(1).ifPresent(consumer.call), returnsNormally);
      consumer.getLogs(callsTo('call')).verify(happenedOnce);
    });
    test("does not call consumer when empty", () {
      expect(() => new Optional.empty().ifPresent(consumer.call), returnsNormally);
      consumer.getLogs(callsTo('call')).verify(neverHappened);
    });
  });
  group('hashCode', () {
    test('is 0 when empty', () {
      expect(new Optional.empty().hashCode, equals(0));
    });
    test('is non-zero when present', () {
      expect(new Optional.of(1).hashCode, isNot(0));
    });
  });
  groupSep = ': ';
  group('==', () {
    test('two empty Optionals are equal', () {
      expect(new Optional.empty(), equals(new Optional.empty()));
    });
    test('two Optionals with same value are equal', () {
      expect(new Optional.of(1), equals(new Optional.of(1)));
    });
    test('two Optionals with different values are not equal', () {
      expect(new Optional.of(1), isNot(new Optional.of(2)));
    });
    test('an empty Optional is not equal to an Optional with value', () {
      expect(new Optional.of(1), isNot(new Optional.empty()));
    });
  });
}


