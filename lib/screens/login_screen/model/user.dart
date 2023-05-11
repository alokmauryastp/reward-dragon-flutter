
class User {
  User({
    required this.id,
    required this.uniqueCode,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNo,
    required this.roleId,
    required this.roleName,
    required this.companyName,
    required this.organizationCode,
    required this.gender,
    required this.designation,
    required this.baseLocation,
    required this.teamId,
    required this.teamName,
    required this.managerId,
    required this.managerName,
    required this.defaultLanguage,
    required this.memberSince,
    required this.lastActiveOn,
    required this.isVerifiedByAdmin,
    required this.firebaseToken,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.deviceId,
    required this.avatarImage,
    // required this.organization,
    required this.userProfileUpdatedAt,
    required this.token,
  });

  factory User.fromJson(dynamic json) => User(
      id: json['id'],
      uniqueCode: json['unique_code'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      roleId: json['role_id'],
      roleName: json['role_name'],
      companyName: json['company_name'],
      organizationCode: json['organization_code']??"",
      gender: json['gender']??"",
      designation: json['designation'],
      baseLocation: json['base_location']??"",
      teamId: json['team_id']??0,
      teamName: json['team_name'] ??"",
      managerId: json['manager_id'] ?? 0,
      managerName: json['manager_name'] ??'',
      defaultLanguage: json['default_language'] ??"",
      memberSince: json['member_since'],
      lastActiveOn: json['last_active_on'],
      isVerifiedByAdmin: json['is_verified_by_admin'],
      firebaseToken: json['firebase_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      deviceId: json['device_id'],
      avatarImage: json['avatar_image'],
      // organization: (json['organization'] != null
      //     ? Organization.fromJson(json['organization'])
      //     : null)!,
      userProfileUpdatedAt: json['user_profile_updated_at'],
      token: json['token']);

  int id;
  String uniqueCode;
  String firstName;
  String lastName;
  String email;
  String mobileNo;
  int roleId;
  String roleName;
  String companyName;
  String organizationCode;
  String gender;
  String designation;
  String baseLocation;
  int teamId;
  String teamName;
  int managerId;
  String managerName;
  String defaultLanguage;
  String memberSince;
  String lastActiveOn;
  bool isVerifiedByAdmin;
  String firebaseToken;
  String createdAt;
  String updatedAt;
  int isActive;
  String deviceId;
  String avatarImage;
  // Organization organization;
  String userProfileUpdatedAt;
  String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['unique_code'] = uniqueCode;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['mobile_no'] = mobileNo;
    map['role_id'] = roleId;
    map['role_name'] = roleName;
    map['company_name'] = companyName;
    map['organization_code'] = organizationCode;
    map['gender'] = gender;
    map['designation'] = designation;
    map['base_location'] = baseLocation;
    map['team_id'] = teamId;
    map['team_name'] = teamName;
    map['manager_id'] = managerId;
    map['manager_name'] = managerName;
    map['default_language'] = defaultLanguage;
    map['member_since'] = memberSince;
    map['last_active_on'] = lastActiveOn;
    map['is_verified_by_admin'] = isVerifiedByAdmin;
    map['firebase_token'] = firebaseToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_active'] = isActive;
    map['device_id'] = deviceId;
    map['avatar_image'] = avatarImage;
    // map['organization'] = organization.toJson();
    map['user_profile_updated_at'] = userProfileUpdatedAt;
    map['token'] = token;
    return map;
  }
}

class Organization {
  Organization({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.organizationName,
    required this.landlineCountryCode,
    required this.landlineStateCode,
    required this.landlineNumber,
    required this.mobileCountryCode,
    required this.organizationCode,
    required this.uniqueCode,
    required this.mobileNumber,
    required this.email,
    required this.password,
    required this.address,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.pincode,
    required this.status,
    required this.companyImage,
    required this.approvedStatus,
  });

  factory Organization.fromJson(dynamic json) {
    return Organization(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      organizationName: json['organization_name'],
      landlineCountryCode: json['landline_country_code'],
      landlineStateCode: json['landline_state_code'],
      landlineNumber: json['landline_number'],
      mobileCountryCode: json['mobile_country_code'],
      organizationCode: json['organization_code'],
      uniqueCode: json['unique_code'],
      mobileNumber: json['mobile_number'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      pincode: json['pincode'],
      status: json['status'],
      companyImage: json['company_image'],
      approvedStatus: json['approved_status'],
    );
  }

  int id;
  String createdAt;
  String updatedAt;
  String organizationName;
  String landlineCountryCode;
  String landlineStateCode;
  String landlineNumber;
  String mobileCountryCode;
  String organizationCode;
  String uniqueCode;
  String mobileNumber;
  String email;
  String password;
  String address;
  int countryId;
  int stateId;
  int cityId;
  String pincode;
  int status;
  String companyImage;
  int approvedStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['organization_name'] = organizationName;
    map['landline_country_code'] = landlineCountryCode;
    map['landline_state_code'] = landlineStateCode;
    map['landline_number'] = landlineNumber;
    map['mobile_country_code'] = mobileCountryCode;
    map['organization_code'] = organizationCode;
    map['unique_code'] = uniqueCode;
    map['mobile_number'] = mobileNumber;
    map['email'] = email;
    map['password'] = password;
    map['address'] = address;
    map['country_id'] = countryId;
    map['state_id'] = stateId;
    map['city_id'] = cityId;
    map['pincode'] = pincode;
    map['status'] = status;
    map['company_image'] = companyImage;
    map['approved_status'] = approvedStatus;
    return map;
  }
}
