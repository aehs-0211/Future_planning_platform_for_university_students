class UserManager {
  // 使用静态变量来存储用户数据
  static Map<String, String> _userDatabase = {};

  // 静态方法来注册用户
  static void registerUser(String username, String password) {
    _userDatabase[username] = password;
  }

  // 静态方法来验证用户
  static bool loginUser(String username, String password) {
    return _userDatabase.containsKey(username) && _userDatabase[username] == password;
  }
}