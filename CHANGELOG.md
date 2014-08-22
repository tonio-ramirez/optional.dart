# Changelog

### 1.2.0
  * Operators are now overloaded, so you can add, subtract, etc., Optionals.  Any operation involving an empty Optional
    will return an empty Optional.
  * Added examples.

### 1.1.0
  * `Optional.ofNullable()` and `Optional.empty()` constructors are now `const`.
  * `Optional.of()` constructor now throws `ArgumentError` when passed null, instead of `NoValuePresentError`.
  * `NoValuePresentError` now extends `StateError`.

### 1.0.0
  * Initial release