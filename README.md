Optional.dart
=============

Optional.dart is an implementation of the `Optional` type, inspired by Java 8's [Optional][javaOptional] class.

`Optional` helps avoid `null` reference errors by wrapping values in an object that holds information
regarding whether the value is present or not.

For example, when applying a set of operations to a value, any of which might return `null`,
you can get rid of the `null` checks by using `Optional.map()`:

```dart
String getString() {
  // ..
  if (condition) {
    return null;
  } else {
    return "12";
  }
}

int calculateSomething(String str) {
  // ...
  if (someCondition) {
    return null;
  } else {
    return 3 + int.parse(str);
  }
} 

double calculateSomethingElse(int val) {
  // ...
  if (anotherCondition) {
    return null;
  } else {
    return val * 1.42;
  }
}

void main() {
  
  // before
  
  String str;
  int i;
  double d;
  
  str = getString();
  
  if (str != null) {
    i = calculateSomething(str);
  }
  
  if (i != null) {
    d = calculateSomethingElse(i);
  }
  
  if (d != null) {
    print(d);
  }
  
  // with Optional
  
  Optional.ofNullable(getString())
    .map(calculateSomething)
    .map(calculateSomethingElse)
    .ifPresent(print);
}
```

[javaOptional]: http://docs.oracle.com/javase/8/docs/api/java/util/Optional.html