/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 *   scriptTag? libraryName? libraryImport* partDirective* topLevelDefinition*
 * ;
 * topLevelDefinition:
 *     classDefinition
 *   | functionTypeAlias
 *   | external functionSignature
 *   | external getterSignature
 *   | external setterSignature
 *   | functionSignature functionBody
 *   | returnType? getOrSet identifier formalParameterList functionBody
 *   | (final | const) type? staticFinalDeclarationList ';'
 *   | variableDeclaration ';'
 * ;
 * getOrSet:
 *     get
 *   | set
 * ;
 * @description Checks that it is a compile-time error when a colon character
 * is used in place of a top level definition in a script.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

f() {}
:
g() {}

main() {
  try {
    g();
  } catch(e) {}
}
