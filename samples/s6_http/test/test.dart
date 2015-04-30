// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s6_http.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import '../web/main.dart';
import 'package:s6_http/component/pirate.dart';

main() {
  const NAME = "Misko";
  const APPELLATION = "Magnificent";

  setUp(() {
   setUpInjector();
   module((Module m) => m.install(new PirateAppModule()));
  });
  tearDown(tearDownInjector);

  group('fetching data', () {
    Injector injector;
    MockHttpBackend backend;
    PirateComponent pirateComponent;

    setUp((){
      inject((Injector _injector, MockHttpBackend _backend) {
        backend = _backend;
        injector = _injector;
        backend.expectGET('packages/s6_http/assets/piratenames.json')
            .respond('''{"names": ["$NAME"], "appellations": ["$APPELLATION"]}''');
      });
    });

    test('should fetch pirate names', async(() {
      expect(PirateComponent.names, isEmpty);
      expect(PirateComponent.appellations, isEmpty);

      pirateComponent = injector.get(PirateComponent);
      expect(pirateComponent.dataLoaded, isFalse);
      expect(pirateComponent.pirateName, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      expect(PirateComponent.names, [NAME]);
      expect(PirateComponent.appellations, [APPELLATION]);
      expect(pirateComponent.dataLoaded, isTrue);
    }));

    test('should set the pirate name', async(() {
      pirateComponent = injector.get(PirateComponent);
      pirateComponent.name = NAME;
      expect(pirateComponent.pirateName, "$NAME the $APPELLATION");
    }));
  });
}
