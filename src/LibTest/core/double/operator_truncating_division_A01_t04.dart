/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator ~/(num other)
 * @description Checks that if both operands are infinite the result is a NaN.
 * @author pagolubev
 * @reviewer msyabro
 */


final double positiveInf = 1 / 0;
final double negativeInf = -1 / 0;

checkNaN(d) {
  var msg = 'expected: NaN, actual: $d';
  Expect.isTrue(d.isNaN(), msg);
}

main() {
  checkNaN(positiveInf ~/ positiveInf);
  checkNaN(positiveInf ~/ negativeInf);
  checkNaN(negativeInf ~/ positiveInf);
  checkNaN(negativeInf ~/ negativeInf);
}
