/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped. Scopes may nest. A name or declaration d is
 * available in scope S if d is in the namespace induced by S or if d is available
 * in the lexically enclosing scope of S. We say that a name or declaration d is in
 * scope if d is available in the current scope.
 * It is a compile-time error if there is more than one entity, other than a setter and a getter,
 * with the same name declared in the same scope.
 * @description Checks that it is a compile-time error if a variable and an interface
 * with the same name are declared within the library scope.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

var conflictingName;

interface conflictingName {}

class C implements conflictingName {}

main() {
  try {
    new C();
  } catch(var e) {}
}
