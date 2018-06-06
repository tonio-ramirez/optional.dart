part of optional_internal;

/// Error thrown when attempting to operate on an empty Optional's value.
class NoValuePresentError extends StateError {
  /// Creates a new NoValuePresentError with a message reading "no value present"
  NoValuePresentError() : super("no value present");
}