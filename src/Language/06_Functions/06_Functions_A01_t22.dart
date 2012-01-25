/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions include function declarations, methods, getters,
 * setters, constructors and function literals.
 * All functions have a signature and a body.
 * functionSignature:
 *   returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   '=>' expression ';' | block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that the throw statement can't  be a body of a function of
 * the form [functionSignature '=>' expression ';'].
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

f() => throw "exception";

main() {
  try {
    f();
  } catch(var x){}
}
