import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/splash_controller.dart';
import 'controller/splash_provider.dart';
import 'package:flutter_meedu/router.dart' as router;

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      /* onDispose: (_,controller){
        print('onDispose ProviderListener');
        splashProvider.dispose();
      }, */
      onChange: (_,controller){
        final routeName = controller.routeName;
        if(routeName != null){
          // Navigator.pushReplacementNamed(_, routeName);
          router.pushReplacementNamed(
            routeName,
            transition: router.Transition.zoom
          );
        }
      },
      builder: (_,__){
        return const Scaffold(
          body:Center(
            child:CircularProgressIndicator()
          )
        );
      }
    );
  }
}
  