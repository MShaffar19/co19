/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Uri({scheme, String userInfo: "", String host: "", port: 0,
 * String path, Iterable<String> pathSegments, String query, Map<String,
 * String> queryParameters, fragment: ""})
 * Creates a new URI from its components.
 * The query component is set through either query or
 * queryParameters. When query is used the provided string is expected to be
 * fully percent-encoded and is used in its literal form. When queryParameters
 * is used the query is built from the provided map. Each key and value in the
 * map is percent-encoded and joined using equal and ampersand characters.
 * The percent-encoding of the keys and values encodes all characters except
 * for the unreserved characters.
 * @description Checks query set via [queryParameters] on space, unreserved,
 * basic and extended unicode characters
 * @author ilya
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

String unreserved = "0123456789"
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "-._~";

encodeOctet(int x) =>
  (x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}')
  .toUpperCase();

enc(String s) => s.runes
  .map((x) =>
      unreserved.runes.contains(x)
      ? new String.fromCharCode(x)
      : x == 32
        ? '+'
        : utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  var x = '$unreserved ';
  var y = '\u1111\u2222\u3333\u{10000}\u{10001} ';
  var uri = new Uri(queryParameters: {x:x, y:y});
  Expect.equals('${enc(x)}=${enc(x)}&${enc(y)}=${enc(y)}', uri.query);
}
