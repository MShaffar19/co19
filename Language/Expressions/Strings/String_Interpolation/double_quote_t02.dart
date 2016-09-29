/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An interpolated string "s1${e}s2" is equivalent to the
 * concatenation of the strings "s1", e.toString() and "s2".
 * @description Checks that if evaluation of expression e results in exception,
 * string interpolation "s1${e}s2" raises the same exception.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class C {
  var id;
  test() {
    Expect.throws(() {"${[][10]}";}, (e) => e is RangeError);
    Expect.throws(() {"${(const []).add(1)}";}, (e) => e is UnsupportedError);
    Expect.throws(() {"${null.someMethod()}";}, (e) => e is NoSuchMethodError);
    Expect.throws(() {"${id()}";}, (e) => e is NoSuchMethodError);
  }
}

main() {
  new C().test();
}
