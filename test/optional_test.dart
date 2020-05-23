library optional_test;

import 'package:optional/optional.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'dart:async';

part 'src/equality.dart';
part 'src/methods.dart';
part 'src/extension.dart';
part 'src/iterable.dart';
part 'src/async.dart';

void main() {
  group('Methods', runMethodTests);
  group('Equality', runEqualityTests);
  group('Extension', runExtensionTests);
  group('Iterable', runIterableTests);
  group('Async', runAsyncTests);
}
