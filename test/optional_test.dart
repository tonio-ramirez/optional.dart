library optional_test;

import 'package:optional/optional.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

part 'src/equality.dart';
part 'src/methods.dart';

void main() {
  group('Methods', runMethodTests);
  group('Equality', runEqualityTests);
}
