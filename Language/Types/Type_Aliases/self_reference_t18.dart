/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a type alias, either directly or recursively
 * via another type declaration, is a compile-time error
 * @description Checks that any self reference in a type alias is a compile-time
 * error. Test direct reference
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class C<T> {}

typedef CAlias1<T> = C<CAlias1>;
// [error line 16, column 0]
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias2<T extends CAlias2> = C<T>;
// [error line 20, column 0]
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias3 = CAlias3;
// [error line 24, column 0]
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
