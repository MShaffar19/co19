/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * . . .
 * typeParameter:
 *   metadata identifier (extends typeNotVoid)?
 * ;
 * typeParameters:
 *   '<' typeParameter (',' typeParameter)* '>'
 * ;
 * @description Checks that at least one typeParameter is a must in the generic
 * function.
 * @compile-error
 * @author iarkh@unipro.ru
 */

class Test {
  void function<>() {}
}

main() {
}
