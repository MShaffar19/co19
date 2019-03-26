/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Spec:
 * We require that at least one component unambiguously determine the literal
 * form, otherwise it is a compile-time error. So, given:
 *    dynamic x = <int, int>{};
 *    Iterable l = [];
 *    Map m = {};
 *    Then:
 *    {...x}       // Static error, because it is ambiguous.
 *    {...x, ...l} // Statically a set, runtime error when spreading x.
 *    {...x, ...m} // Statically a map, no runtime error.
 *    {...l, ...m} // Static error, because it must be both a set and a map.
 * @description Checks that if one of the spreadable element is [Set], result
 * is statically [Set]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  dynamic x1 = <int, int>{};
  dynamic x2 = <int>{};
  dynamic x3 = [1, 2, 3];
  dynamic x = 14;

  var y1 = {...?x1};   //# 01: compile-time error
  var y2 = {...?x2};   //# 02: compile-time error
  var y3 = {...?x3};   //# 03: compile-time error
  var y4 = {...?x4};   //# 04: compile-time error

  Map y5 = {...?x1};
  Set y6 = {...?x2};
  Set y7 = {...?x3};

  Map y8 = {...?x4};   //# 05: compile-time error
  Set y9 = {...?x4};   //# 06: compile-time error
}
