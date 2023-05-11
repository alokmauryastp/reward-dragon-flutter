import 'package:flutter_state_management/constants/literals.dart';
import 'package:get_storage/get_storage.dart';
import '../screens/login_screen/model/user.dart';

class LocalStorage {

  static late GetStorage _localStorage;
  static const _token = 'token';

  static Future init() async {
    await GetStorage.init();
    _localStorage = GetStorage();
  }

  static Future<void> setToken(String token) async {
    _localStorage.write(_token, token);
  }

  static Future<void> setString(key, value) async {
    _localStorage.write(key, value);
  }

  static Future<void> userLogin(User user) async {
    _localStorage.write(keyId, user.id);
    _localStorage.write(keyUniqueCode, user.uniqueCode);
    _localStorage.write(keyUserFirstName, user.firstName);
    _localStorage.write(keyUserLastName, user.lastName);
    _localStorage.write(keyEmail, user.email);
    _localStorage.write(keyMobile, user.mobileNo);
    _localStorage.write(keyRoleId, user.roleId);
    _localStorage.write(keyRoleName, user.roleName);
    _localStorage.write(keyCompanyName, user.companyName);
    _localStorage.write(keyOrganizationCode, user.organizationCode);
    _localStorage.write(keyGender, user.gender);
    _localStorage.write(keyDesignation, user.designation);
    _localStorage.write(keyBaseLocation, user.baseLocation);
    _localStorage.write(keyTeamId, user.teamId);
    _localStorage.write(keyTeamName, user.teamName);
    _localStorage.write(keyManagerId, user.managerId);
    _localStorage.write(keyManagerName, user.managerName);
    _localStorage.write(keyDefaultLanguage, user.defaultLanguage);
    _localStorage.write(keyMemberSince, user.memberSince);
    _localStorage.write(keyLastActiveOn, user.lastActiveOn);
    _localStorage.write(keyIsVerified, user.isVerifiedByAdmin);
    _localStorage.write(keyFirebaseToken, user.firebaseToken);
    _localStorage.write(keyCreatedAt, user.createdAt);
    _localStorage.write(keyUpdateAt, user.updatedAt);
    _localStorage.write(keyIsActive, user.isActive);
    _localStorage.write(keyDeviceId, user.deviceId);
    _localStorage.write(keyToken, user.token);
    _localStorage.write(keyAvatarImage, user.avatarImage);
    _localStorage.write(keyUserProfileUpdatedAt, user.userProfileUpdatedAt);
  }

  static User user() {
    return User(
        id: _localStorage.read(keyId),
        uniqueCode: _localStorage.read(keyUniqueCode),
        firstName: _localStorage.read(keyUserFirstName),
        lastName: _localStorage.read(keyUserLastName),
        email: _localStorage.read(keyEmail),
        mobileNo: _localStorage.read(keyMobile),
        roleId: _localStorage.read(keyRoleId),
        roleName: _localStorage.read(keyRoleName),
        companyName: _localStorage.read(keyCompanyName),
        organizationCode: _localStorage.read(keyOrganizationCode),
        gender: _localStorage.read(keyGender),
        designation: _localStorage.read(keyDesignation),
        baseLocation: _localStorage.read(keyBaseLocation),
        teamId: _localStorage.read(keyTeamId),
        teamName: _localStorage.read(keyTeamName),
        managerId: _localStorage.read(keyManagerId),
        managerName: _localStorage.read(keyManagerName),
        defaultLanguage: _localStorage.read(keyDefaultLanguage),
        memberSince: _localStorage.read(keyMemberSince),
        lastActiveOn: _localStorage.read(keyLastActiveOn),
        isVerifiedByAdmin: _localStorage.read(keyIsVerified),
        firebaseToken: _localStorage.read(keyFirebaseToken),
        createdAt: _localStorage.read(keyCreatedAt),
        updatedAt: _localStorage.read(keyUpdateAt),
        isActive: _localStorage.read(keyIsActive),
        deviceId: _localStorage.read(keyDeviceId),
        avatarImage: _localStorage.read(keyAvatarImage),
        userProfileUpdatedAt: _localStorage.read(keyUserProfileUpdatedAt),
        token: _localStorage.read(keyToken));
  }

  static bool isLoggedIn() {
    return _localStorage.read(keyUserFirstName) != null ? true : false;
  }

  static logout() {
    _localStorage.erase();
  }

  static String getString(key) => _localStorage.read(key) ??"";

  static String getToken() => _localStorage.read(_token);

}
