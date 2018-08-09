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
      return empty.cast();
  }

  @override
  Optional<R> flatMap<R>(Optional<R> mapper(T val)) => mapper(_value);

  @override
  Optional<R> map<R>(R mapper(T val)) => Optional<R>.ofNullable(mapper(_value));

  @override
  T orElse(T other) => _value;

  @override
  T orElseGet(T supply()) => _value;

  @override
  T orElseThrow(dynamic supplyError()) => _value;

  @override
  void ifPresent(void consume(T val), {void orElse()}) => consume(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(Object other) => other is _Present && other._value == _value;

  @override
  String toString() => 'Optional[value: $_value]';

  @override
  Optional<R> cast<R, T extends R>() => this as Optional<R>;
}
