import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:practicapushnotification/config/router/app_router.dart';
import 'package:practicapushnotification/config/theme/app_theme.dart';
import 'package:practicapushnotification/presentation/providers/head_provider.dart';
import 'package:practicapushnotification/presentation/notifications/bloc/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializeFCM();

  void main() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    runApp(HeadProvider.initProvider(mainAppWidget: const MainApp()));
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
