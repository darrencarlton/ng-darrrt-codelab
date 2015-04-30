// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s4_component.test;

import 'dart:async';
import 'dart:html' show HttpRequest;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import '../web/main.dart';
import 'package:s4_component/component/pirate.dart';
import 'package:s4_component/component/badge.dart';

main() {
  const NAME = 'Misko';
  TestBed tb;

  setUp(() {
    setUpInjector();
    module((Module m) => m.install(new PirateAppModule()));
  });
  tearDown(tearDownInjector);

  group('BadgeComponent', () {


    test('pirate initial state', inject((PirateComponent pirate) {
      expect(pirate.name, isEmpty);
    }));

    test('badge initial state', inject((BadgeComponent badge) {
      expect(badge.name, isEmpty);
    }));

    test('updates the DOM when the name is changed', inject((PirateComponent pirate) {
          var path = 'packages/s4_component/component/badge.html';
          new Future(expectAsync((){
            HttpRequest.getString(path).then((_template) {
              new MockHttpBackend().expect('GET').respond(_template);
              tb.compile(_template.trim());
              var el = tb.rootElement.querySelector('#badge-name');
              expect(el.innerHtml, isNot(isEmpty));
              pirate.name = NAME;
              microLeap();
              tb.rootScope.apply();
              expect(el.innerHtml, NAME);
            });
        }));
     }));
  });
}
