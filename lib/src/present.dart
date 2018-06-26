part of optional_internal;

class _Present<T> implements Optional<T> {
  const _Present(this._value);

  final T _value;

  @override
  T get value => _value;

  @override
  bool get isPresent => true;

  @override
  Optional<T> filter(bool predicate(T val)) {
    if (predicate(_value))
      return this;
    else
      return empty;
  }

  @override
  Optional<R> flatMap<R>(Optional<R> mapper(T val)) => mapper(_value);

  @override
  Optional<R> map<R>(R mapper(T val)) => new Optional<R>.ofNullable(mapper(_value));

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
  bool operator ==(Object other) => other is _Present<T> && other._value == _value;

  @override
  Optional<T> operator+(Optional<T> other) => _internalMap(other, (val) => val + other.value);

  @override
  Optional<T> operator-(Optional<T> other) => _internalMap(other, (val) => val - other.value);

  @override
  Optional<T> operator*(Optional<T> other) => _internalMap(other, (val) => val * other.value);

  @override
  Optional<T> operator/(Optional<T> other) => _internalMap(other, (val) => val / other.value);

  @override
  Optional<T> operator~/(Optional<T> other) => _internalMap(other, (val) => val ~/ other.value);

  @override
  Optional<T> operator^(Optional<T> other) => _internalMap(other, (val) => val ^ other.value);

  @override
  Optional<T> operator&(Optional<T> other) => _internalMap(other, (val) => val & other.value);

  @override
  Optional<T> operator%(Optional<T> other) => _internalMap(other, (val) => val % other.value);

  @override
  Optional<T> operator>>(Optional<T> other) => _internalMap(other, (val) => val >> other.value);

  @override
  Optional<T> operator<<(Optional<T> other) => _internalMap(other, (val) => val << other.value);

  @override
  Optional<T> operator-() => _internalMap(this, (val) => -val);

  @override
  Optional<T> operator~() => _internalMap(this, (val) => ~val);

  _internalMap(Optional<T> other, operation(val)) => other.isPresent ? map(operation) : empty;

  @override
  String toString() => 'Optional[value: $_value]';
}
