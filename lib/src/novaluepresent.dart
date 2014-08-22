part of optional;

/// Error thrown when attempting to operate on an empty Optional's value.
class NoValuePresentError extends StateError {
  NoValuePresentError() : super("no value present");
}