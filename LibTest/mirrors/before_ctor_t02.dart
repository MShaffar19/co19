/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  constructor ...
 * @description Check that metadata is allowed before class constant constructor
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

class B {
  @A() const B();
  @A() const B.b();
}

main() {
  Symbol ctorName1 = MirrorSystem.getSymbol('B');
  DeclarationMirror ctorMirror1 =
      reflectClass(B).declarations[ctorName1] as DeclarationMirror;
  InstanceMirror aMirror1 = ctorMirror1.metadata[0];
  Expect.equals('.A', MirrorSystem.getName(aMirror1.type.qualifiedName));

  Symbol ctorName2 = MirrorSystem.getSymbol('B.b');
  DeclarationMirror ctorMirror2 =
      reflectClass(B).declarations[ctorName2] as DeclarationMirror;
  InstanceMirror aMirror2 = ctorMirror2.metadata[0];
  Expect.equals('.A', MirrorSystem.getName(aMirror2.type.qualifiedName));
}
