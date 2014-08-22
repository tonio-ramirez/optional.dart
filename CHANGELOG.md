# Changelog

### 1.1.0
  * `Optional.ofNullable()` and `Optional.empty()` constructors are now `const`.
  * `Optional.of()` constructor now throws `ArgumentError` when passed null, instead of `NoValuePresentError`.
  * `NoValuePresentError` now extends `StateError`.

### 1.0.0
  * Initial release
