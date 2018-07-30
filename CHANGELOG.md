# Changelog

### 3.0.0
  * **(Breaking change)** Removed operator overloads.  They were breaking strong-mode type checks.
  * **(Breaking change)** Made equality checks more consistent with Dart standards.  Now any two empty `Optional`s are
    equal, and two non-empty `Optional`s are equal if their values are equal, regardless of their types.
  * Added a `cast()` method, similar to `List.cast()`.

### 2.0.2
  * Better use of generic methods (no more `dynamic`).

### 2.0.0
  * Compatibility with Dart 2

### 1.2.3
  * Add an optional `orElse` parameter to `ifPresent`.

### 1.2.2
  * `Optional.empty()` constructor is now `const`.

### 1.2.1
  * `Absent` and `Present` are now subclasses of `Optional`.  You should continue to use constructors in `Optional`, and not
    the `Absent` or `Present` ones.
  * `EMPTY` is now a top-level constant.

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
