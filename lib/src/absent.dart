part of optional_internal;

class _Absent<T> implements Optional<T> {
  const _Absent();

  const _Absent._internal();

  @override
  T get value => throw new NoValuePresentError();

  @override
  bool get isPresent => false;

  @override
  Optional<T> filter(bool predicate(T val)) => this;

  @override
  Optional<dynamic> flatMap(Optional<dynamic> mapper(T val)) => this;

  @override
  Optional<dynamic> map(dynamic mapper(T val)) => this;

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
  bool operator ==(Object other) => other is _Absent<T>;

  @override
  Optional<T> operator+(Optional<T> other) => this;

  @override
  Optional<T> operator-(Optional<T> other) => this;

  @override
  Optional<T> operator*(Optional<T> other) => this;

  @override
  Optional<T> operator/(Optional<T> other) => this;

  @override
  Optional<T> operator~/(Optional<T> other) => this;

  @override
  Optional<T> operator^(Optional<T> other) => this;

  @override
  Optional<T> operator&(Optional<T> other) => this;

  @override
  Optional<T> operator%(Optional<T> other) => this;

  @override
  Optional<T> operator>>(Optional<T> other) => this;

  @override
  Optional<T> operator<<(Optional<T> other) => this;

  @override
  Optional<T> operator-() => this;

  @override
  Optional<T> operator~() => this;

  @override
  String toString() => "Optional[empty]";
}
