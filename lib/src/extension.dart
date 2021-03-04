part of optional_internal;

extension OptionalExtension<T extends Object> on T {
  /// Returns an Optional with `this` as its value
  Optional<T> get toOptional => Optional.of(this);
}
