part of optional_internal;

class Absent<T> implements Optional<T> {
  const Absent();

  const Absent._internal();

  T get value => throw new NoValuePresentError();

  bool get isPresent => false;

  @override
  Optional<T> filter(bool predicate(T val)) => this;

  @override
  Optional<T> flatMap(Optional<T> mapper(T val)) => this;

  @override
  Optional<T> map(dynamic mapper(T val)) => this;

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
  bool operator ==(other) => other is Absent<T>;

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

//  Optional<T> operator-() => this;
//  Optional<T> operator~() => this;

  toString() => "Optional[empty]";
}
