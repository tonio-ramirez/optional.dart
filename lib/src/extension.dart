part of optional_internal;

extension OptionalExtension<T> on T {
  Optional<T> get toOptional => Optional.ofNullable(this);
}
