/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When a type annotation [T] on the form qualified denotes a generic
 * class (so [T] is raw), instantiate to bound is used to provide the missing
 * type argument list. It is a compile-time error if the instantiate to bound
 * process fails.
 * @description Checks that compile error appears if instantiate to bound
 * process fails during the object creation.
 * @author iarkh@unipro.ru
 * @compile-error
 */
import "../../../Utils/expect.dart";

class G<X1 extends X2, X2 extends X3, X3 extends G<X1, X2, X3>> {}

main() {
  G g = new G();
}
