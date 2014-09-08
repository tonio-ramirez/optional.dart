library optional_internal;

part 'src/absent.dart';
part 'src/present.dart';
part 'src/novaluepresent.dart';

const EMPTY = const Absent();

/**
 * A container object which may contain a non-null value.
 *
 * Offers several methods which depend on the presence or absence of a contained value.
 */
abstract class Optional<T> {
  /**
   * The value associated with this Optional, if any.
   *
   * Throws [NoValuePresentError] if no value is present.
   */
  T get value;

  /// Whether the Optional has a value.
  bool get isPresent;

  /**
   * Creates a new Optional with the given non-null value.
   *
   * Throws [ArgumentError] if value is null.
   */
  factory Optional.of(T value) {
    if(value == null) {
      throw new ArgumentError("value must be non-null");
    } else {
      return new Present<T>(value);
    }
  }

  /**
   * Creates a new Optional with the given value, if non-null.  Otherwise, returns an empty Optional.
   */
  factory Optional.ofNullable(T value) {
    if(value == null) {
      return new Absent<T>();
    } else {
      return new Present<T>(value);
    }
  }

  /// Creates an empty Optional.
  factory Optional.empty() => new Absent<T>();

  /// Returns an Optional with this Optional's value, if there is a value present and it matches the predicate.  Otherwise, returns an empty Optional.
  Optional<T> filter(bool predicate(T val));

  /// Returns an Optional provided by applying the mapper to this Optional's value, if present.  Otherwise, returns an empty Optional.
  Optional<dynamic> flatMap(Optional<dynamic> mapper(T val));

  /**
   * Returns an Optional containing the result of applying the mapper to this Optional's value, if present.  Otherwise, returns an empty Optional.
   *
   * If the mapper returns a null value, returns an empty Optional.
   */
  Optional<dynamic> map(dynamic mapper(T val));

  /// Returns this Optional's value, if present.  Otherwise, returns other.
  T orElse(T other);

  /// Returns this Optional's value, if present.  Otherwise, returns the result of calling supply().
  T orElseGet(T supply());

  /// Returns this Optional's value, if present.  Otherwise, throws the result of calling supplyError().
  T orElseThrow(dynamic supplyError());

  /// Invokes consume() with this Optional's value, if present.  Otherwise, does nothing.
  void ifPresent(void consume(T val));

  /// The hashCode of this Optional's value, if present.  Otherwise, 0.
  int get hashCode;

  bool operator ==(other);

  Optional<T> operator+(Optional<T> other);

  Optional<T> operator-(Optional<T> other);

  Optional<T> operator*(Optional<T> other);

  Optional<T> operator/(Optional<T> other);

  Optional<T> operator~/(Optional<T> other);

  Optional<T> operator^(Optional<T> other);

  Optional<T> operator&(Optional<T> other);

  Optional<T> operator%(Optional<T> other);

  Optional<T> operator>>(Optional<T> other);

  Optional<T> operator<<(Optional<T> other);

  Optional<T> operator-();
  Optional<T> operator~();
}