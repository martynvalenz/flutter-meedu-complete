import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu_complete/app/data/data_source/apis/authentication_api.dart';
import 'package:flutter_meedu_complete/app/data/http/http.dart';
import 'package:flutter_meedu_complete/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_meedu_complete/app/domain/repositories/authentication_repository.dart';
import 'app/my_app.dart';

void main() {
  // Get.i.lazyPut<AuthenticationRepository>(
  //   () => AuthenticationRepositoryImpl()
  // );
  // runApp(const MyApp());
  runApp(TmpPage());
}
  
class TmpPage extends StatefulWidget {
  const TmpPage({ Key? key }) : super(key: key);

  @override
  _TmpPageState createState() => _TmpPageState();
}

class _TmpPageState extends State<TmpPage> {
  @override
  void initState() {
    super.initState();
    final http = Http(baseUrl: 'https://reqres.in');
    final AuthenticationRepository auth = AuthenticationRepositoryImpl(
      AuthenticationAPI(http),
    );
    auth.login('eve.holt@reqres.in', 'cityslicka')
    .then((value) => print(value));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}