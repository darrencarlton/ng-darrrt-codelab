// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s8_filter.main;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:s8_filter/component/pirate.dart';
import 'package:s8_filter/component/badge.dart';
import 'package:s8_filter/service/names_service.dart';
import 'package:s8_filter/formatter/capitalize_formatter.dart';

class PirateAppModule extends Module {
  PirateAppModule() {
    bind(PirateComponent);
    bind(BadgeComponent);
    bind(NamesService);
    bind(CapitalizeFormatter);
  }
}

void main() {
  applicationFactory()
      .addModule(new PirateAppModule())
      .run();
}
