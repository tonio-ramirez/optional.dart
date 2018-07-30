part of optional_internal;

class _Absent<T> implements Optional<T> {
  const _Absent();

  const _Absent._internal();

  @override
  T get value => throw new NoValuePresentError();

  @override
  bool get isPresent => false;

  @override
  Optional<T> filter(bool predicate(T val)) => empty;

  @override
  Optional<R> flatMap<R>(Optional<R> mapper(T val)) => empty;

  @override
  Optional<R> map<R>(R mapper(T val)) => empty;

  @override
  T orElse(T other) => other;

  @override
  T orElseGet(T supply()) => supply();

  @override
  T orElseThrow(dynamic supplyError()) => throw supplyError();

  @override
  void ifPresent(void consume(T val), {void orElse()}) => orElse == null ? null : orElse();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is _Absent;

  @override
  String toString() => 'Optional[empty]';

  @override
  Optional<R> cast<R>() => const _Absent();
}
