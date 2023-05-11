import 'package:flutter/widgets.dart';

//Shared Preference Keys
const keySharedPrefName = "rewardDragonSharedPref";
const keyId = "keyId";
const keyUniqueCode = "keyUniqueCode";
const keyUserFirstName = "keyUserFirstName";
const keyUserLastName = "keyUserLastName";
const keyEmail = "keyEmail";
const keyMobile = "keyMobile";
const keyRoleId = "keyRoleId";
const keyRoleName = "keyRoleName";
const keyCompanyName = "keyCompanyName";
const keyCompanyImage = "keyCompanyImage";
const keyOrganizationCode = "keyOrganizationCode";
const keyGender = "keyGender";
const keyDesignation = "keyDesignation";
const keyBaseLocation = "keyBaseLocation";
const keyTeamId = "keyTeamId";
const keyTeamName = "keyTeamName";
const keyManagerId = "keyManagerId";
const keyManagerName = "keyManagerName";
const keyDefaultLanguage = "keyDefaultLanguage";
const keyMemberSince = "keyMemberSince";
const keyLastActiveOn = "keyLastActiveOn";
const keyIsVerified = "keyIsVerified";
const keyFirebaseToken = "keyFirebaseToken";
const keyCreatedAt = "keyCreatedAt";
const keyUpdateAt = "keyUpdateAt";
const keyToken = "keyToken";
const keyAvatarImage = "keyAvatarImage";
const keyUserProfileUpdatedAt = "userProfileUpdatedAt";
const keyIsActive = "keyIsActive";
const keyDeviceId = "keyDeviceId";
const keyAccessToken = "keyAccessToken";
const keyIdToken = "keyIdToken";

const yellowApp = Color(0xFFFFBE31);
const blackApp = Color(0xFF252525);
const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);
const red = Color(0xFFFF0000);
const yellow = Color(0xffFFC016);
const cyan = Color(0xFF00E5FF);
const purple = Color(0xFFD500F9);
const green = Color(0xff16ae57);
const greenLight = Color(0xff70ad47);
const orange = Color(0xFFF4511E);
const orangeChart = Color(0xFFff8800);
const blueChart = Color(0xFF4472c4);
const greenDark = Color(0xff16ae57);
const amber = Color(0xffed7d31);
const title = 'Reward Dragon';
const firebaseToken = 'firebaseToken';
const deviceId = 'deviceId';
const deviceName = 'deviceName';

String getMoodImage(int? teamMood) {
  switch (teamMood) {
    case 5:
      return 'assets/images/happy.png';
    case 4:
      return 'assets/images/satisfied.png';
    case 3:
      return 'assets/images/okay.png';
    case 2:
      return 'assets/images/sad.png';
    case 1:
      return 'assets/images/angry.png';
  }
  return 'assets/images/satisfied.png';
}

String getMood(int? teamMood) {
  switch (teamMood) {
    case 5:
      return 'Awesome';
    case 4:
      return 'Good';
    case 3:
      return 'Okay';
    case 2:
      return 'Upset';
    case 1:
      return 'Stressed';
  }
  return '';
}

String getMoodMessage(int? teamMood) {
  switch (teamMood) {
    case 5:
      return 'The team is feeling awesome\ntoday';
    case 4:
      return 'The team is feeling good\ntoday';
    case 3:
      return 'The team is feeling Okay\ntoday';
    case 2:
      return 'The team is feeling Low/Upset\ntoday';
    case 1:
      return 'The team is feeling Angry/Stressed\ntoday';
  }
  return 'The team is feeling good\ntoday';
}

String daysCounter(date) {
  //date : 2022-11-05
  DateTime today = DateTime.parse(DateTime.now().toString().substring(0, 10));
  DateTime lastDay = DateTime.parse(date);
  return "${today.difference(lastDay).inDays} Days";
}

String formatTime(int time) {
  Duration duration = Duration(seconds: time.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(' : ');
}

//styles

const accountStyle =
    TextStyle(color: white, fontWeight: FontWeight.w400, fontSize: 15);

//constant Texts
const blackGradient = LinearGradient(
    colors: [Color(0xff414141), Color(0xff000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

const yellowGradient = LinearGradient(
    colors: [Color(0xffFFFFFF), Color(0xffFFC516)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const okayMoodGradient = LinearGradient(
    colors: [Color(0xffFFE78F), Color(0xffFCD5F2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const greenGradient = LinearGradient(
    colors: [Color(0xff04791E), Color(0xff54FA09)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
