
import 'package:dev_tools_screen/localization/dev_tools_localizations.dart';
import 'package:flutter/material.dart';

class DevToolsScreen extends StatefulWidget {
  const DevToolsScreen({super.key, this.apiSettings, this.loggerSettings});

  final DevToolsApiSettings? apiSettings;
  final DevToolsLoggerSettings? loggerSettings;

  Future<void> view(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (context) => this));
  }

  @override
  State<DevToolsScreen> createState() => _DevToolsScreenState();
}

class DevToolsApiSettings {
  DevToolsApiSettings({
    required this.apiEndpoints,
    required this.onChangeApi,
    this.initialApi,
  });

  final Map<String, String> apiEndpoints;
  final void Function(String?) onChangeApi;
  final String? initialApi;
}

class DevToolsLoggerSettings {
  DevToolsLoggerSettings({required this.onOpenLogger});

  final void Function() onOpenLogger;
}

class _DevToolsScreenState extends State<DevToolsScreen> {
  late final ValueNotifier<String?> _selectedApi;

  @override
  void initState() {
    super.initState();
    _selectedApi = ValueNotifier<String?>(widget.apiSettings?.initialApi);
  }

  @override
  void dispose() {
    _selectedApi.dispose();
    super.dispose();
  }

  void _onChangeApi(String? apiUrl) {
    _selectedApi.value = apiUrl;
    widget.apiSettings?.onChangeApi(apiUrl);
  }

  @override
  Widget build(BuildContext context) => Localizations.override(
    context: context,
    delegates: [DevToolsLocalizations.delegate],
    child: Builder(
      builder: (context) {
        final localizations = DevToolsLocalizations.of(context);
        return Scaffold(
          appBar: AppBar(title: Text(localizations.devTools)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (widget.apiSettings != null) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(localizations.selectApiEndpoint),
                      ValueListenableBuilder(
                        valueListenable: _selectedApi,
                        builder: (context, selectedApi, _) =>
                            DropdownButton<String?>(
                              isExpanded: true,
                              value: selectedApi,
                              items: widget.apiSettings?.apiEndpoints.entries
                                  .map(
                                    (entry) => DropdownMenuItem<String?>(
                                      value: entry.value,
                                      child: Text(entry.key),
                                    ),
                                  )
                                  .toList(),
                              onChanged: _onChangeApi,
                            ),
                      ),
                    ],
                  ),
                ],
                if (widget.loggerSettings != null) ...[
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.loggerSettings?.onOpenLogger,
                      child: Text(localizations.talker),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    ),
  );
}
