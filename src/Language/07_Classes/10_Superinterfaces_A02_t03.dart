/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of a class C 
 *  specifies a malformed type as a superinterface.
 * @description Checks that it is a compile-time error when the type expression
 * in a class's implements clause denotes a variable name.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 3182
 */

int foo;

class A implements foo {}

main() {
  try {
    A a = new A();
  } catch (e){}
}
