import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony_app/services/multi_provider_list.dart';
import 'package:matrimony_app/view/custom_widgets/gender_avatar.dart';
import 'package:matrimony_app/view/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserGender.load();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const VivahBharathApp());
}

class VivahBharathApp extends StatelessWidget {
  const VivahBharathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderList.providerList,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(debugShowCheckedModeBanner: false, home: child);
        },
        child: SplashScreen(),
      ),
    );
  }
}
