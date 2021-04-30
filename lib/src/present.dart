part of optional_internal;

class _Present<T> extends Iterable<T> implements Optional<T> {
  const _Present(this._value);

  final T _value;

  @override
  T get value => _value;

  @override
  int get length => 1;

  @override
  bool get isPresent => true;

  @override
  Optional<T> filter(bool Function(T) predicate) {
    if (predicate(_value)) {
      return this;
    } else {
      return empty.cast();
    }
  }

  @override
  Optional<R> flatMap<R>(Optional<R> Function(T) mapper) => mapper(_value);

  @override
  Optional<R> map<R>(R Function(T) mapper) =>
      Optional<R>.ofNullable(mapper(_value));

  @override
  bool contains(Object? val) => _value == val;

  @override
  T orElse(T other) => _value;

  @override
  T? orElseNullable(T? other) => _value;

  @override
  T? get orElseNull => _value;

  @override
  T orElseGet(T Function() supply) => _value;

  @override
  T? orElseGetNullable(T? Function() supply) => _value;

  @override
  Future<T> orElseGetAsync(Future<T> Function() supply) async => _value;

  @override
  Future<T?> orElseGetNullableAsync(Future<T?> Function() supply) async =>
      _value;

  @override
  T orElseThrow(Object Function() supplyError) => _value;

  @override
  void ifPresent(void Function(T) consume, {void Function()? orElse}) =>
      consume(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(Object other) => other is _Present && other._value == _value;

  @override
  String toString() => 'Optional[value: $_value]';

  @override
  Optional<R> cast<R>() => _Present(value as R);

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  Iterator<T> get iterator => UnmodifiableSetView({_value}).iterator;
}
