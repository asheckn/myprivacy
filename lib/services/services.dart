

import 'package:myprivacy/api/api_service.dart';

import '../models/user.dart';
ApiService apiService = new ApiService();


Future<List<User>> getUsers()async {
  var result = await apiService.getUsers() as List;
  List<User> users = result.map((i) => User.fromJson(i)).toList();
  return users;
}

Future<bool> updateUser(User user) async {
  bool result = await apiService.updateUser(user);
  return result;
}