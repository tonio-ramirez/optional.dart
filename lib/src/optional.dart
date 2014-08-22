part of optional;

/**
 * A container object which may contain a non-null value.
 *
 * Offers several methods which depend on the presence or absence of a contained value.
 */
class Optional<T> {

  final T _value;

  /**
   * The value associated with this Optional, if any.
   *
   * Throws [NoValuePresentError] if no value is present.
   */
  T get value {
    if (_value == null) {
      throw new NoValuePresentError();
    }
    return _value;
  }

  /// Whether the Optional has a value.
  bool get isPresent => _value != null;

  /**
   * Creates a new Optional with the given non-null value.
   *
   * Throws [NoValuePresentError] if value is null.
   */
  Optional.of(T value) : _value = value {
    if (value == null) {
      throw new NoValuePresentError();
    }
  }

  /**
   * Creates a new Optional with the given value, if non-null.  Otherwise, returns an empty Optional.
   */
  const Optional.ofNullable(T value) : _value = value;

  /// Creates an empty Optional.
  const Optional.empty() : this.ofNullable(null);

  /// Returns an Optional with this Optional's value, if there is a value present and it matches the predicate.  Otherwise, returns an empty Optional.
  Optional<T> filter(bool predicate(T val)) {
    if (isPresent && predicate(_value)) return new Optional<T>.of(_value);
    else return new Optional<T>.empty();
  }

  /// Returns an Optional provided by applying the mapper to this Optional's value, if present.  Otherwise, returns an empty Optional.
  Optional<dynamic> flatMap(Optional<dynamic> mapper(T val)) {
    if (isPresent) return mapper(_value);
    else return new Optional.empty();
  }

  /**
   * Returns an Optional containing the result of applying the mapper to this Optional's value, if present.  Otherwise, returns an empty Optional.
   *
   * If the mapper returns a null value, returns an empty Optional.
   */
  Optional<dynamic> map(dynamic mapper(T val)) {
    if (isPresent) return new Optional<dynamic>.ofNullable(mapper(_value));
    else return new Optional<dynamic>.empty();
  }

  /// Returns this Optional's value, if present.  Otherwise, returns other.
  T orElse(T other) => isPresent ? _value : other;

  /// Returns this Optional's value, if present.  Otherwise, returns the result of calling supply().
  T orElseGet(T supply()) => isPresent ? _value : supply();

  /// Returns this Optional's value, if present.  Otherwise, throws the result of calling supplyError().
  T orElseThrow(dynamic supplyError()) {
    if (isPresent) return _value;
    else throw supplyError();
  }

  /// Invokes consume() with this Optional's value, if present.  Otherwise, does nothing.
  void ifPresent(void consume(T val)) => isPresent ? Function.apply(consume, [_value]) : null;

  /// The hashCode of this Optional's value, if present.  Otherwise, 0.
  int get hashCode => _value == null ? 0 : 37 * 17 + _value.hashCode;

  bool operator ==(other) => other is Optional<T> && (other as Optional<T>)._value == _value;

  toString() => isPresent ? "Optional[value: ${_value}]" : "Optional[empty]";
}
