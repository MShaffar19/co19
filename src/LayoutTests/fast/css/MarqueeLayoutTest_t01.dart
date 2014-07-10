/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description The height of a horizontal marquee is computed as normal for
 * inline-blocks. The 'auto' height of a vertical marquee defaults to 200px.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      .pre {
          background: green;
          display: inline-block;
          width: 50px;
      }
      .post {
          background: red;
          display: inline-block;
          width: 50px;
      }
      marquee {
          background: silver;
          width: 50px;
      }

      #horiz .pre {
          height: 10px;
      }
      #horiz .post {
          height: 20px;
      }
      #horiz marquee {
          font-size: 20px;
          height: 10px;
      }

      #vertAuto .pre {
          height: 200px;
      }
      #vertAuto .post {
      }
      #vertAuto marquee {
          height: auto;
      }

      #vertFixed .pre {
          height: 100px;
      }
      #vertFixed .post {
          height: 200px;
      }
      #vertFixed marquee {
          height: 100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test passes if all silver blocks are the same size as the green blocks next to them.
      <div id='horiz'>
          <div class='pre'></div>
          <marquee>foo</marquee>
          <div class='post'></div>
      </div>
      <hr>
      <div id='vertAuto'>
          <div class='pre'></div>
          <marquee direction='up'>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
          </marquee>
          <div class='post'>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
          </div>
      </div>
      <hr>
      <div id='vertFixed'>
          <div class='pre'></div>
          <marquee direction='up'>
              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
          </marquee>
          <div class='post'></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var horiz = document.querySelector('#horiz marquee');
  var vertAuto = document.querySelector('#vertAuto marquee');
  var vertFixed = document.querySelector('#vertFixed marquee');
  shouldBe(horiz.getComputedStyle().height, "10px");
  shouldBe(vertAuto.getComputedStyle().height, "200px");
  shouldBe(vertFixed.getComputedStyle().height, "100px");
}
