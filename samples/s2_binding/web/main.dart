// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s2_binding.main;

import 'package:angular/application_factory.dart';
import 'package:angular/angular.dart';

@Injectable()
class PirateBadge {
  String name;
}

void main() {
  applicationFactory()
      .rootContextType(PirateBadge)
      .run();
}
