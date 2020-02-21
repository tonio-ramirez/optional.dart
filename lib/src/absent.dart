part of optional_internal;

class _Absent<T> extends Iterable<T> implements Optional<T> {
  const _Absent();

  const _Absent._internal();

  @override
  T get value => throw NoValuePresentError();

  @override
  int get length => 0;

  @override
  bool get isPresent => false;

  @override
  Optional<T> filter(bool Function(T) predicate) => empty.cast();

  @override
  Optional<R> flatMap<R>(Optional<R> Function(T) mapper) => empty.cast();

  @override
  Optional<R> map<R>(R Function(T) mapper) => empty.cast();

  @override
  bool contains(Object val) => false;

  @override
  T orElse(T other) => other;

  @override
  T orElseGet(T Function() supply) => supply();

  @override
  T orElseThrow(dynamic Function() supplyError) => throw supplyError();

  @override
  void ifPresent(void Function(T) consume, {void Function() orElse}) =>
      orElse == null ? null : orElse();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is _Absent;

  @override
  String toString() => 'Optional[empty]';

  @override
  Optional<R> cast<R>() => _Absent<R>();

  @override
  bool get isEmpty => true;

  @override
  bool get isNotEmpty => false;

  @override
  Iterator<T> get iterator => UnmodifiableSetView<T>.empty().iterator;
}
