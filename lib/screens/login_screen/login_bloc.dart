import 'package:tart_labs_store/models/token.dart';
import 'package:tart_labs_store/repositories/login_repository.dart';
import 'package:tart_labs_store/repositories/profile_repository.dart';
import 'package:tart_labs_store/responses/profile_response.dart';
import 'package:tart_labs_store/utils/app_utils.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

class LoginBloc {
  Future<bool> login(username, password) async {
    try {
      Token token = await LoginRepository.authenticate(username, password);
      if (token != null) {
        PreferenceHelper.saveToken(token);

        ProfileResponse user = await ProfileRepository.getUser();
        if (user.error != null) {
          AppUtils.showToast(user.message);
          return false;
        } else
          PreferenceHelper.saveName(user.user.name);
        return true;
      }
    } catch (error) {
      return false;
    }
    return false;
  }
}
