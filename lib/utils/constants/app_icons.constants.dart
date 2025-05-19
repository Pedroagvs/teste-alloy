abstract final class AppIcons {
  static const String linkBroken = 'assets/icons/link_broken.svg';
  static const String search = 'assets/icons/search.svg';
  static const String twoPerson = 'assets/icons/two_person.svg';
  static const String user = 'assets/icons/user.svg';
  static const String userAdd = 'assets/icons/user_add.svg';

  static String getCustom(String fileName, {String? folder}) {
    if (folder != null && folder.isNotEmpty) {
      return 'assets/icons/$folder/$fileName';
    }
    return 'assets/icons/$fileName';
  }
}
