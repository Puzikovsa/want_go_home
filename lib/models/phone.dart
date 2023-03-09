import 'package:shared_preferences/shared_preferences.dart';

class Phone{

  static String? phone;
  final String key = 'action';


  void addPhone(String number) => phone = number;

  Future<void> writeData(String value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(key);
    await pref.setString(key,  value);
    print(pref.getString(key));
  }

  Future get readData async {
    final pref = await SharedPreferences.getInstance();
    phone = pref.getString(key);
  }
}