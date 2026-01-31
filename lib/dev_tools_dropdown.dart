import 'package:dev_tools_screen/dev_tools_element.dart';
import 'package:flutter/material.dart';

class DevToolsDropdown<T> extends DevToolsElement {
  DevToolsDropdown({
    required this.label,
    required this.items,
    required this.initalElement,
    required this.onChanged,
  });

  final String label;
  final List<DropdownMenuItem<T>>? items;
  final T initalElement;
  final void Function(T? value) onChanged;
}
