import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static Future<bool> saveUserId(String user_id)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString('user_id',user_id);

  }
  static Future loadUserId()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }
  static Future<bool> removeUserId()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.remove('user_id');
  }
}