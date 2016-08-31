/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an expression is required to be a
 * constant expression but its evaluation would raise an exception.
 * @description Checks that using null in a shift constant expression is a
 * compile-time error.
 * @compile-error
 * @author kaigorodov
 */

class C {
  final m;

  const C() :
    m = null >> 2;
}

main() {
  const C();
}
