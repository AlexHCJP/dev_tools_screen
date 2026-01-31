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
              child: Text('Production Api'),
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
