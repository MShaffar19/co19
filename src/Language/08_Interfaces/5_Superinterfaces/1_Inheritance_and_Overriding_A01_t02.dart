/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface I inherits any members of its superinterfaces that 
 * are not overridden by members declared in I.
 * @description Checks that an interface does not inherit static members of its 
 * superinterfaces (which can only be final initialized fields, according to grammar).
 * Expects a NoSuchMethodError when trying to access a superinterface's static member
 * via a subinterface, as specified in ch. 10.15.
 * @author vasya
 * @reviewer rodionov
 */

abstract class S {
  static final int foo = 1;
}

abstract class I implements S {
}

main() {
  try {
    var x = I.foo; /// static type warning cannot resolve 'foo'
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(ok) {}
}
