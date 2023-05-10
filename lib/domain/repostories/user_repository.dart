import 'package:prueba_itti/domain/models/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();

  Future<User> getUser(int id);
}
