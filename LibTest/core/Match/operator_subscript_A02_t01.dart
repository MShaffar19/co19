/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws RangeError if [group] is out of bounds
 * @description Checks that exception is thrown.
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";
 
void check(String str, String pattern, int index) {
  RegExp re = new RegExp(pattern, multiLine: false, caseSensitive: true);
  Match? m = re.firstMatch(str);
  Expect.throws(() { m?[index]; }, (e) => e is RangeError);
}
 
main() {
  check("a", "a", 1);
  check("a", "(a)", 2);
  check("abcdef", "(([a-z])*)", 3);
  check("abcdef", "(([a-z])*)", 65536);
  check("abcdef", "(([a-z])*)", -1);
  check("abcdef", "(([a-z])*)", -65536);
}
