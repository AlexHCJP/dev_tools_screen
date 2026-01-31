
import 'dart:ui';

import 'package:dev_tools_screen/dev_tools_element.dart';

class DevToolsButton extends DevToolsElement {
  DevToolsButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;
}
