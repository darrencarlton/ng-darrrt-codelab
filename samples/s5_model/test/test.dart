// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s5_model.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import '../web/main.dart';
import 'package:s5_model/component/pirate.dart';

main() {
  const NAME = "Misko";
  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('PirateName', () {
    PirateName pn;
    var name = "misko";
    var appellation = "magnificent";

    test('constructor with no-args', () {
      pn = new PirateName();
      expect(pn.firstName, isEmpty);
      expect(pn.appellation, isEmpty);
    });
  });


  group('PirateComponent', () {
    Injector injector;
    PirateComponent pirateComponent;

    setUp(module((Module m) {
      m.install(new PirateAppModule());
      inject((Injector _injector) {
              injector = _injector;
      });
    }));

    test('initial state', () {
      pirateComponent = injector.get(PirateComponent);

      expect(PirateComponent.names.length, greaterThan(0));
      expect(pirateComponent.inputIsNotEmpty, isFalse);
      expect(pirateComponent.label, PirateComponent.LABEL2);
    });

    test('generateName() should generate name', () {
      pirateComponent = injector.get(PirateComponent);

      expect(pirateComponent.name, isEmpty);
      pirateComponent.generateName();
      expect(PirateComponent.names.contains(pirateComponent.name), isTrue);
    });

    test('names setter should generate name', () {
      pirateComponent = injector.get(PirateComponent);

      expect(pirateComponent.name, isEmpty);
      expect(pirateComponent.pn.firstName, isEmpty);
      expect(pirateComponent.pn.appellation, isEmpty);
      pirateComponent.name = NAME;
      expect(pirateComponent.pn.firstName, NAME);
      expect(PirateComponent.appellations.contains(pirateComponent.pn.appellation),
          isTrue);
    });
  });


}
