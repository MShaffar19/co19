/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Every function declaration includes a formal parameter list, which consists of
 * a list of required parameters, followed by any optional parameters. Optional
 * parameters consist of a list of named parameters.
 * formalParameterList:
 *   '(' ')' |
 *   '(' normalFormalParameters ( ', ' namedFormalParameters)? ')' |
 *   (namedFormalParameters)
 * ;
 * normalFormalParameters:
 *   normalFormalParameter (', ' normalFormalParameter)*
 * ;
 * namedFormalParameters:
 *   '[' defaultFormalParameter (', ' defaultFormalParameter)* ']'
 * ;
 * @description Checks that at least one formal parameter after a comma is a must.
 * @compile-error
 * @author iefremov
 */

void f(var p1, ) {}

main () {
  try {
    f(1);
  } catch(var x){}
}
