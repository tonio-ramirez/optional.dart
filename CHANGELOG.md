# Changelog
### 6.1.0
  * Added iterable extensions

### 6.0.0
  * Removed `test_coverage` dependency.

### 6.0.0-nullsafety.2
  * Format files

### 6.0.0-nullsafety.1
  * Added `or` methods returning nullable types.

### 6.0.0-nullsafety.0
  * Added null-safety support
  * **(Breaking change)** Removed extension methods on `null`, since they're not compatible with null-safety.

### 5.0.0
  * Refactored `async` support to `orElseGetAsync()` to avoid bogus dartanalyzer errors
  * **(Breaking change)** `or*()` methods no longer support `async`.  Instead, use `orElseGetAsync()`
 
### 4.2.0
  * Added `async` support
    * The `or*()` methods now accept and return `FutureOr`

### 4.1.0
  * `Optional` now implements `Iterable`
    * The `toSet()` and `toList()` methods now return modifiable collections.
    * The `toList()` method now accepts a `growable` optional named parameter, to comply with the `Iterable` interface.

### 4.0.1
  * Fixed dartdoc generation

### 4.0.0
  * Added `toOptional` extension method
  * **Note that this requires the minimum SDK version to be 2.6.0**,
    please continue to use version 3.1.0 if upgrading to SDK version 2.6.0
    is not an option.

### 3.1.0
  * Added `contains(val)` method.
  * Added `toSet()` method.
  * Added `toList()` method.
  
### 3.0.2
  * Fix Present `cast()` issue

### 3.0.1
  * Absent `cast()` method bug-fix

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
