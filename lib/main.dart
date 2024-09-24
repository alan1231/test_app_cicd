import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:testv/config/config.dart';
import 'app.dart';

Future<void> main() async {
  // 從命令行中獲取 FLAVOR 變數，默認為 'development'
  const String environment = String.fromEnvironment('FLAVOR', defaultValue: 'development');

  // 根據 environment 動態設置 .env 文件路徑
  String envFilePath;
  if (environment == 'development') {
    envFilePath = "lib/env/.env.development";
  } else if (environment == 'production') {
    envFilePath = "lib/env/.env.production";
  } else if (environment == 'client4Development') {
    envFilePath = "lib/env/.env.client4development";
  } else {
    // 默認加載開發環境
    envFilePath = "lib/env/.env.development";
  }

  // 動態加載對應的 .env 文件
  await dotenv.load(fileName: envFilePath);

  // 將 .env 文件中的變量存儲到全域變量中
  Config.apiUrl = dotenv.env['API_URL'] ?? 'https://default-api.com';
  Config.appName = dotenv.env['APP_NAME'] ?? 'Default App Name';

  // 運行應用
  runApp(MyApp(flavor: environment));
}