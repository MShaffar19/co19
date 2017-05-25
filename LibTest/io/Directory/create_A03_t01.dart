/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> create({bool recursive: false})
 * Creates the directory with this name.
 *
 * If recursive is false, only the last directory in the path is created. If
 * recursive is true, all non-existing path components are created. If the
 * directory already exists nothing is done.
 *
 * Returns a Future<Directory> that completes with this directory once it has
 * been created. If the directory cannot be created the future completes with an
 * exception.
 * @description Checks that if recursive is true, all non-existing path
 * components are created
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "directory_utils.dart";

test() async {
  getTempDirectory("TestDir").then((tmp) {
    getTempDirectory(tmp.path).then((dir) {
      dir.create(recursive: true).then((created) {
        created.exists().then((result) {
          try {
            Expect.isTrue(result);
          } finally {
            tmp.delete(recursive: true);
            asyncEnd();
          }
        });
      });
    });
  });
}

main() {
  asyncStart();
  test();
}
