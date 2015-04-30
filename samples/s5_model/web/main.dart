// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s5_model.main;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:s5_model/component/pirate.dart';
import 'package:s5_model/component/badge.dart';

class PirateAppModule extends Module {
  PirateAppModule() {
    bind(PirateComponent);
    bind(BadgeComponent);
  }
}

void main() {
  applicationFactory()
      .addModule(new PirateAppModule())
      .run();
}
