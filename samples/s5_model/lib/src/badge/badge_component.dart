// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s5_model.badge_component;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'badge',
    templateUrl: 'packages/s5_model/src/badge/badge_component.html',
    cssUrl: 'packages/s5_model/src/badge/badge_component.css',
    publishAs: 'cmp'
)
class BadgeComponent {
  @NgAttr('name')
  String name;
}
