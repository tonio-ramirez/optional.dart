part of optional_internal;

class Present<T> implements Optional<T> {
  final T _value;

  T get value => _value;

  bool get isPresent => true;

  const Present(this._value);

  @override
  Optional<T> filter(bool predicate(T val)) {
    if (predicate(_value)) return this;
    else return new Absent<T>();
  }

  @override
  Optional<T> flatMap(Optional<T> mapper(T val)) => mapper(_value);

  @override
  Optional<T> map(dynamic mapper(T val)) => new Optional<T>.ofNullable(mapper(_value));

  @override
  T orElse(T other) => _value;

  @override
  T orElseGet(T supply()) => _value;

  @override
  T orElseThrow(dynamic supplyError()) => _value;

  @override
  void ifPresent(void consume(T val), {void orElse()}) => Function.apply(consume, [_value]);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is Present<T> && other._value == _value;

  @override
  Optional<T> operator+(Optional<T> other) {
    return _internalMap(other, (val) => val + other.value);
  }

  @override
  Optional<T> operator-(Optional<T> other) {
    return _internalMap(other, (val) => val - other.value);
  }

  @override
  Optional<T> operator*(Optional<T> other) {
    return _internalMap(other, (val) => val * other.value);
  }

  @override
  Optional<T> operator/(Optional<T> other) {
    return _internalMap(other, (val) => val / other.value);
  }

  @override
  Optional<T> operator~/(Optional<T> other) {
    return _internalMap(other, (val) => val ~/ other.value);
  }

  @override
  Optional<T> operator^(Optional<T> other) {
    return _internalMap(other, (val) => val ^ other.value);
  }

  @override
  Optional<T> operator&(Optional<T> other) {
    return _internalMap(other, (val) => val & other.value);
  }

  @override
  Optional<T> operator%(Optional<T> other) {
    return _internalMap(other, (val) => val % other.value);
  }

  @override
  Optional<T> operator>>(Optional<T> other) {
    return _internalMap(other, (val) => val >> other.value);
  }

  @override
  Optional<T> operator<<(Optional<T> other) {
    return _internalMap(other, (val) => val << other.value);
  }

//  Optional<T> operator-() => new Present<T>(-value);
//  Optional<T> operator~() => new Present<T>(~value);

  Optional<T> _internalMap(Optional<T> other, operation(val))
    => other.isPresent ? map(operation) : new Absent<T>();

  @override
  String toString() => "Optional[value: ${_value}]";
}
