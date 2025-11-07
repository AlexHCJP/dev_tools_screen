import 'package:dev_tools_screen/dev_tools_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DevToolsButton extends StatelessWidget {
  const DevToolsButton({super.key});

  VoidCallback _openDevTools(BuildContext context) => () {
    DevToolsScreen(
      apiSettings: DevToolsApiSettings(
        apiEndpoints: {
          'Development Api': '...',
          'Staging Api': '...',
          'Production Api': '...',
        },
        onChangeApi: (apiUrl) {
          /// Handle API change
        },
        initialApi: '...',
      ),
      loggerSettings: DevToolsLoggerSettings(
        onOpenLogger: () {
          /// Handle logger opening
        },
      ),
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