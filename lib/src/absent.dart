part of optional_internal;

class Absent<T> implements Optional<T> {
  const Absent();

  const Absent._internal();

  T get value => throw new NoValuePresentError();

  bool get isPresent => false;

  Optional<T> filter(bool predicate(T val)) => this;

  Optional<dynamic> flatMap(Optional<dynamic> mapper(T val)) => this;

  Optional<dynamic> map(dynamic mapper(T val)) => this;

  T orElse(T other) => other;

  T orElseGet(T supply()) => supply();

  T orElseThrow(dynamic supplyError()) => throw supplyError();

  void ifPresent(void consume(T val), {void orElse()}) => orElse == null ? null : orElse();

  int get hashCode => 0;

  bool operator ==(other) => other is Absent<T>;

  Optional<T> operator+(Optional<T> other) => this;

  Optional<T> operator-(Optional<T> other) => this;

  Optional<T> operator*(Optional<T> other) => this;

  Optional<T> operator/(Optional<T> other) => this;

  Optional<T> operator~/(Optional<T> other) => this;

  Optional<T> operator^(Optional<T> other) => this;

  Optional<T> operator&(Optional<T> other) => this;

  Optional<T> operator%(Optional<T> other) => this;

  Optional<T> operator>>(Optional<T> other) => this;

  Optional<T> operator<<(Optional<T> other) => this;

  Optional<T> operator-() => this;
  Optional<T> operator~() => this;

  toString() => "Optional[empty]";
}
