import 'package:get/get.dart';
import 'package:users_api/services/services.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  var userList = [].obs;
  ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future fetchUsers() async {
    try {
      var response = await apiService.getUser();
      userList.assignAll(response.map((e) => UserModel.fromJson(e)));
    } catch (e) {
      print(e.toString());
    }
  }
}
