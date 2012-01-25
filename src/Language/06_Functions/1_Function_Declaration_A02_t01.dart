/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration of the form 
 * T0 id(T1 a1, ..., Tn an, [Tn+1 xn+1 = d1, ..., Tn+k xn+k = dk]){s}
 * is equivalent to a variable declaration of the form
 * final F id = (T1 a1 , . . . , Tn an , [Tn+1 xn+1 = d1 , . . . , Tn+k xn+k = dk]){s},
 * where F is the function type alias (13.3.1)
 * typedef T0 F (T1 a1, ..., Tn an, [Tn+1 xn+1, ..., Tn+k xn+k]).
 * @description Checks that both forms are equivalent, variable is local.
 * @author kaigorodov
 * @reviewer iefremov
 */

double id1(int a1, [double x1 = 1.0]){
  return a1*x1;
}

typedef double F(int a1, [double x1]);

main() {
  final F id2 = (int a1, [double x1 = 1.0]){
    return a1*x1;
  };
  Expect.equals(id1(1), id2(1));
  Expect.equals(id1(2, 3.0), id2(2, 3.0));
}