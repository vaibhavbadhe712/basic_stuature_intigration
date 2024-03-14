
import 'package:basic_intigration/app_config.dart';
import 'package:basic_intigration/constant/api_endpoints.dart';
import 'package:basic_intigration/models/api_base_model.dart';
import 'package:basic_intigration/utils/preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/initial_binding/initial_binding.dart';
import 'utils/routes/routes.dart';

void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final appConfig = await AppConfig().forEnvironment(env);
 initialBiniding();
  await LocalStorageUtils.init();
  runApp(MyApp(
    config: appConfig,
    sharedPreferences: sharedPreferences,
  ));
}

late ApiEndPoints apiEndpoints;

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.config,
    required this.sharedPreferences,
  });

  final ApiBaseModel config;
  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    apiEndpoints = ApiEndPoints(apiBaseModel: widget.config);
    super.initState();
  }

  final appRoutes = Routes();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'People Management',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      routeInformationParser: appRoutes.router.routeInformationParser,
      routeInformationProvider: appRoutes.router.routeInformationProvider,
      routerDelegate: appRoutes.router.routerDelegate,
      builder: (_, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 360, name: MOBILE),
          const Breakpoint(start: 361, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
