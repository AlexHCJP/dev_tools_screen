```dart
// https://pub.dev/packages/depend
import 'package:depend/depend.dart';
import 'package:dev_tools/dev_tools_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meganet/env_app_config.dart';
import 'package:flutter_meganet/src/common/dependencies/dependency_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Usage Example
class DevToolsButton extends StatelessWidget {
  const DevToolsButton({super.key});

  VoidCallback _openDevTools(BuildContext context) => () {
    DevToolsScreen(
      apiSettings: DevToolsApiSettings(
        apiEndpoints: {
          'Development Api': EnvAppConfig.API_DEV,
          'Staging Api': EnvAppConfig.API_STAG,
          'Production Api': EnvAppConfig.API_PROD,
        },
        onChangeApi: (apiUrl) {
          if (apiUrl == null) return;
          // https://pub.dev/packages/depend
          context.depend<RootContainer>().dio.changeApiUrl(apiUrl);
        },
        initialApi: context.depend<RootContainer>().dio.baseUrl,
      ),
      loggerSettings: DevToolsLoggerSettings(
        onOpenLogger: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) =>
                  TalkerScreen(talker: context.depend<RootContainer>().talker),
            ),
          );
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
```
