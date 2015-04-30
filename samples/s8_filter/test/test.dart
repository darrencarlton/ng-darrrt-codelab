// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s8_filter.test;

import 'package:unittest/unittest.dart';

import 'packages/s8_filter/formatter/capitalize_formatter.dart';

void main () {
  group('CapitalizeFilter', () {
    var filter = new CapitalizeFormatter();
    test('with null name', () {
      expect(filter(null), isEmpty);
    });

    test('with empty name', () {
      expect(filter(''), isEmpty);
    });

    test('with un-capitalized name', () {
      expect(filter('misko'), 'Misko');
    });
  });
}