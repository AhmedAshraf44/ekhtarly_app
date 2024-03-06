import 'package:ekhtarly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EkhtarlyApp());
}

class EkhtarlyApp extends StatelessWidget {
  const EkhtarlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: AppRouter.router,
   );
  }
}