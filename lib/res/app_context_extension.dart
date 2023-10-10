
import 'package:flutter/cupertino.dart';
import 'resources.dart';
import 'dimentions/app_dimension.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}