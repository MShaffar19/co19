/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If f is marked async, then a fresh instance o implementing the
 * built-in class Future is associated with the invocation and immediately
 * returned to the caller. The body of f is scheduled for execution at some
 * future time. The future o will complete when f terminates. The value used
 * to complete o is the current return value, if it is defined, and the
 * current exception otherwise.
 *
 * @description Check that returned future o is completed, when body of the
 * function is executed
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import '../../../Utils/async_utils.dart';

bool bodyCompleted = false;

Future test() async {
  bodyCompleted = true;
  return 1;
}

main() {
  asyncStart();
  test().then((v) {
    Expect.isTrue(bodyCompleted);
    asyncEnd();
  });
}
