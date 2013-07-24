/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? (superclass mixins?)? interfaces?
 *   '{' (metadata classMemberDefinition)* '}'
 * ;
 * classMemberDefinition:
 *   declaration ‘;’ |
 *   methodSignature functionBody
 * ;
 * methodSignature:
 *   constructorSignature initializers? |
 *   factoryConstructorSignature |
 *   static? functionSignature |
 *   static? getterSignature |
 *   static? setterSignature |
 *   operatorSignature
 * ;
 * declaration:
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   external constantConstructorSignature |
 *   external constructorSignature |
 *   (external static?)? getterSignature |
 *   (external static?)? setterSignature |
 *   external? operatorSignature |
 *   (external static?)? functionSignature |
 *   static (final | const) type? staticFinalDeclarationList |
 *   const type? staticFinalDeclarationList |
 *   final type? initializedIdentifierList |
 *   static? (var | type) initializedIdentifierList
 * ;
 * @compile-error
 * @description Checks that a class can't be defined inside another class as it is not among
 * the allowed class member definitions.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  class B {}
}

main() {
  try {
    A a = new A();
  } catch (e) {}
}
