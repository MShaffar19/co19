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
 * @description Checks that the foreach statement can't  be a body of a function of
 * the form [functionSignature '=>' expression ';'].
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

f() => for(var i in [1,2,3]);

main() {
  try {
    f();
  } catch(var x){}
}
