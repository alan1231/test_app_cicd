import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:testv/config/config.dart';

class MyApp extends StatelessWidget {
  final String flavor;

  MyApp({required this.flavor});

  @override
  Widget build(BuildContext context) {
    // 根據平台顯示不同的訊息
    String platform = "";
    if (defaultTargetPlatform == TargetPlatform.android) {
      platform = "Android";
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = "iOS";
    } else {
      platform = "Unknown Platform";
    }

    return MaterialApp(
      title: Config.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Config.appName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flavor: $flavor'),
              Text('API URL: ${Config.apiUrl}'),
              Text('App Name: ${Config.appName}'),
              Text('Running on: $platform'),  // 顯示當前平台
            ],
          ),
        ),
      ),
    );
  }
}