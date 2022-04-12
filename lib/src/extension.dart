part of optional_internal;

extension OptionalExtension<T extends Object> on T {
  /// Returns an Optional with `this` as its value
  Optional<T> get toOptional => Optional.of(this);
}

extension OptionalWrappedIterableExtension<S, T extends Iterable<S>> on T {
  /// Iterable wrapped in Optional, or `Optional.empty()` if the Iterable is empty.
  Optional<T> get emptyAsOptional {
    if (isEmpty) return Optional.empty();
    return Optional.of(this);
  }
}

/// Extensions that apply to all iterables.
extension OptionalIterableExtension<T> on Iterable<T> {
  /// The first element satisfying [test], or `Optional.empty()` if there are none.
  Optional<T> firstWhereOptional(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return Optional.of(element);
    }
    return Optional.empty();
  }

  /// The first element whose value and index satisfies [test].
  ///
  /// Returns `Optional.empty()` if there are no element and index satisfying [test].
  Optional<T> firstWhereIndexedOptional(
      bool Function(int index, T element) test) {
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) return Optional.of(element);
    }
    return Optional.empty();
  }

  /// The first element, or `Optional.empty()` if the iterable is empty.
  Optional<T> get firstOptional {
    var iterator = this.iterator;
    if (iterator.moveNext()) return Optional.of(iterator.current);
    return Optional.empty();
  }

  /// The last element satisfying [test], or `Optional.empty()` if there are none.
  Optional<T> lastWhereOptional(bool Function(T element) test) {
    T? result;
    for (var element in this) {
      if (test(element)) result = element;
    }
    return Optional.ofNullable(result);
  }

  /// The last element whose index and value satisfies [test].
  ///
  /// Returns `Optional.empty()` if no element and index satisfies [test].
  Optional<T> lastWhereIndexedOptional(
      bool Function(int index, T element) test) {
    T? result;
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) result = element;
    }
    return Optional.ofNullable(result);
  }

  /// The last element, or `Optional.empty()` if the iterable is empty.
  Optional<T> get lastOptional {
    if (isEmpty) return Optional.empty();
    return Optional.of(last);
  }

  /// The single element satisfying [test].
  ///
  /// Returns `Optional.empty()` if there are either no elements
  /// or more than one element satisfying [test].
  ///
  /// **Notice**: This behavior differs from [Iterable.singleWhere]
  /// which always throws if there are more than one match,
  /// and only calls the `orElse` function on zero matchs.
  Optional<T> singleWhereOptional(bool Function(T element) test) {
    T? result;
    var found = false;
    for (var element in this) {
      if (test(element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return Optional.empty();
        }
      }
    }
    return Optional.ofNullable(result);
  }

  /// The single element satisfying [test].
  ///
  /// Returns `Optional.empty()` if there are either none
  /// or more than one element and index satisfying [test].
  Optional<T> singleWhereIndexedOptional(
      bool Function(int index, T element) test) {
    T? result;
    var found = false;
    var index = 0;
    for (var element in this) {
      if (test(index++, element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return Optional.empty();
        }
      }
    }
    return Optional.ofNullable(result);
  }

  /// The single element of the iterable, or `Optional.empty()`.
  ///
  /// The value is `Optional.empty()` if the iterable is empty
  /// or it contains more than one element.
  Optional<T> get singleOptional {
    var iterator = this.iterator;
    if (iterator.moveNext()) {
      var result = iterator.current;
      if (!iterator.moveNext()) {
        return Optional.of(result);
      }
    }
    return Optional.empty();
  }
}
