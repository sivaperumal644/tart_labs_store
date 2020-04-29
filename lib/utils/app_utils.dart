import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  static String getUpdatedDate(String date) {
    DateTime dateString = DateTime.parse(date);
    return DateFormat.yMMMd().format(dateString);
  }
}
