part of optional_internal;

class Present<T> implements Optional<T> {
  final T _value;

  T get value => _value;

  bool get isPresent => true;

  const Present(this._value);

  Optional<T> filter(bool predicate(T val)) {
    if (predicate(_value)) return this;
    else return EMPTY;
  }

  Optional<dynamic> flatMap(Optional<dynamic> mapper(T val)) => mapper(_value);

  Optional<dynamic> map(dynamic mapper(T val)) => new Optional<dynamic>.ofNullable(mapper(_value));

  T orElse(T other) => _value;

  T orElseGet(T supply()) => _value;

  T orElseThrow(dynamic supplyError()) => _value;

  void ifPresent(void consume(T val)) => Function.apply(consume, [_value]);

  int get hashCode => _value.hashCode;

  bool operator ==(other) => other is Present<T> && (other as Present<T>)._value == _value;

  Optional<T> operator+(Optional<T> other) {
    return _internalMap(other, (val) => val + other.value);
  }

  Optional<T> operator-(Optional<T> other) {
    return _internalMap(other, (val) => val - other.value);
  }

  Optional<T> operator*(Optional<T> other) {
    return _internalMap(other, (val) => val * other.value);
  }

  Optional<T> operator/(Optional<T> other) {
    return _internalMap(other, (val) => val / other.value);
  }

  Optional<T> operator~/(Optional<T> other) {
    return _internalMap(other, (val) => val ~/ other.value);
  }

  Optional<T> operator^(Optional<T> other) {
    return _internalMap(other, (val) => val ^ other.value);
  }

  Optional<T> operator&(Optional<T> other) {
    return _internalMap(other, (val) => val & other.value);
  }

  Optional<T> operator%(Optional<T> other) {
    return _internalMap(other, (val) => val % other.value);
  }

  Optional<T> operator>>(Optional<T> other) {
    return _internalMap(other, (val) => val >> other.value);
  }

  Optional<T> operator<<(Optional<T> other) {
    return _internalMap(other, (val) => val << other.value);
  }

  Optional<T> operator-() => new Present<T>(-value);
  Optional<T> operator~() => new Present<T>(~value);

  _internalMap(Optional<T> other, operation(val)) => other.isPresent ? map(operation) : EMPTY;

  toString() => "Optional[value: ${_value}]";
}
