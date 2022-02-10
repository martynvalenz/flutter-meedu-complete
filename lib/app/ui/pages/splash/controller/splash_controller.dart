import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu_complete/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu_complete/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {
  SplashController(){
    _init();
  }

  // final _auth = Get.i.find<AuthenticationRepository>();
  final AuthenticationRepository _auth = Get.i.find();

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async{
    if(await _auth.accesstoken != null){
      _routeName = Routes.HOME; 
    }

    notify();
  }

  @override
  void dispose() {
    print('Dispose splashController');
    super.dispose();
  }
}
  