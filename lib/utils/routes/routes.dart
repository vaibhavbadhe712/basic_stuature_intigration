


import 'package:basic_intigration/view/phoneScreen/phone_screen.dart';
import 'package:basic_intigration/view/phoneScreen/task_management/create_task_screen.dart';
import 'package:basic_intigration/view/phoneScreen/task_management/task_first_screen.dart';
import 'package:basic_intigration/view/phoneScreen/verify_otp_screen/verify_otp_screen.dart';
import 'package:go_router/go_router.dart';



class Routes {
  static const String initalRoute = '/home';
 
  static const String otpScreen = '/otp';
  static const String  createTask='/createTask';
static const String  assignTask='/assignTask';

  

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: initalRoute,
    routes: [
      GoRoute(
        path: initalRoute,
        builder: (context, state) => const PhoneScreen(),
      ),
         GoRoute(
        path: otpScreen,
        builder: (context, state) {
          var item=state.extra as Map<String, dynamic>;
          String phoneNumber=item['phoneNumber'];
          return VerifyOtpScreen(
            phoneNumber:phoneNumber,
          );
        }
      ),
       GoRoute(
        path: createTask,
        builder: (context, state) =>  TaskCreateScreen(),
      ),
      GoRoute(
        path: assignTask,
        builder: (context, state) =>  TaskManagementScreen(),
      ),
    ],
  );

  //   String _CheckUserLogin() {
  //   final token = LocalStorageUtils.instance.getString('token');
  //   if (token != null && token.isNotEmpty) {
  //     return Routes.bottomScreen;
  //   }
  //   return Routes.initalRoute;
  // }
}
