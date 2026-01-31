import 'package:dev_tools_screen/dev_tools_button.dart';
import 'package:dev_tools_screen/dev_tools_dropdown.dart';
import 'package:dev_tools_screen/dev_tools_element.dart';
import 'package:dev_tools_screen/dev_tools_switch.dart';
import 'package:flutter/material.dart';

class DevToolsScreen extends StatefulWidget {
  const DevToolsScreen({super.key, this.elements = const []});

  final List<DevToolsElement> elements;

  Future<void> view(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (context) => this));
  }

  @override
  State<DevToolsScreen> createState() => _DevToolsScreenState();
}

class _DevToolsScreenState extends State<DevToolsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Dev Tools')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 24,
        children: [
          ...widget.elements.map(
            (value) => switch (value) {
              DevToolsButton() => ElevatedButton(
                onPressed: value.onPressed,
                child: Text(value.label),
              ),
              DevToolsSwitch() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value.label),
                  Switch(value: value.value, onChanged: value.onChanged),
                ],
              ),
              DevToolsDropdown() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value.label),
                  DropdownButton(
                    value: value.initalElement,
                    items: value.items,
                    onChanged: value.onChanged,
                  ),
                ],
              ),
              DevToolsElement() => const SizedBox.shrink(),
            },
          ),
        ],
      ),
    ),
  );
}
