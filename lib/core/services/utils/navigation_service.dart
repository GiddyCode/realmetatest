import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../main.dart';
import '../../routes/navigation_routes.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void pop() {
    return _navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndCleanUntil(
      String routeName, String lastRouteName,
      {dynamic arguments}) async {
    try {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
          routeName, ModalRoute.withName(lastRouteName),
          arguments: arguments);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> cleanTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TabNavigatorRoutes.studentAuthPage:
        return _getPageRoute(viewToShow: Container());


      case TabNavigatorRoutes.mainApp:
        return _getPageRoute(viewToShow: const MyApp());

      // case TabNavigatorRoutes.onBoarding:
      //   return _getPageRoute(
      //       //Todo: add onboarding page widget here...
      //       viewToShow: const OnboardingScreen());

      // case TabNavigatorRoutes.splashScreen:
      //   return _getPageRoute(viewToShow: const SplashScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  PageRoute _getPageRoute(
      {String? routeName, required Widget viewToShow, Object? arguments}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => viewToShow,
      settings: RouteSettings(name: routeName, arguments: arguments),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      // transitionDuration: Duration(seconds: 4),
    );
  }
}
