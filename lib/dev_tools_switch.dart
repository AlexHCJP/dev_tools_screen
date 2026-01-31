
import 'package:dev_tools_screen/dev_tools_element.dart';

class DevToolsSwitch extends DevToolsElement {
  DevToolsSwitch({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final void Function(bool value) onChanged;
}