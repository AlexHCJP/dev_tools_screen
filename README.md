# Dev Tools Screen

A Flutter package for creating a developer tools screen with customizable elements.

## Features

- 🎛️ **DevToolsDropdown** - Dropdown selector for switching between options (e.g., API endpoints)
- 🔘 **DevToolsButton** - Action button for triggering operations (e.g., opening logger)
- 🔄 **DevToolsSwitch** - Toggle switch for feature flags

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dev_tools_screen: ^latest_version
```

## Usage

```dart
import 'package:dev_tools_screen/dev_tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DevTools extends StatelessWidget {
  const DevTools({super.key});

  VoidCallback _openDevTools(BuildContext context) => () {
    DevToolsScreen(
      elements: [
        DevToolsDropdown(
          label: 'Api',
          items: [
            const DropdownMenuItem(
              value: 'Development Api',
              child: Text('Development Api'),
            ),
            const DropdownMenuItem(
              value: 'Stage Api',
              child: Text('Stage Api'),
            ),
            const DropdownMenuItem(
              value: 'Production Api',
              child: Text('Production Api'),
            ),
          ],
          initalElement: 'Development Api',
          onChanged: (value) {
            /// Handle API change
          },
        ),
        DevToolsButton(
          label: 'Open Logger',
          onPressed: () {
            /// Handle logger opening
          },
        ),
        DevToolsSwitch(
          label: 'Premium Mode',
          value: false,
          onChanged: (value) {
            /// Handle switch change
          },
        ),
      ],
    ).view(context);
  };

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return const SizedBox.shrink();

    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: _openDevTools(context),
      child: const FittedBox(
        child: Text(
          kProfileMode ? 'STG' : 'DBG',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
```

## Available Elements

### DevToolsDropdown
Create a dropdown selector for switching between options:
```dart
DevToolsDropdown(
  label: 'Api',
  items: [...], // List of DropdownMenuItem
  initalElement: 'Development Api',
  onChanged: (value) {
    // Handle selection change
  },
)
```

### DevToolsButton
Add an action button:
```dart
DevToolsButton(
  label: 'Open Logger',
  onPressed: () {
    // Handle button press
  },
)
```

### DevToolsSwitch
Add a toggle switch:
```dart
DevToolsSwitch(
  label: 'Premium Mode',
  value: false,
  onChanged: (value) {
    // Handle switch toggle
  },
)
```
