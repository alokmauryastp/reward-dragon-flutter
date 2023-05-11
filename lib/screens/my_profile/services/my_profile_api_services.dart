import 'dart:convert';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/my_profile/model/avatar_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../dashboard_screen/controller/dashboard_controller.dart';
import '../model/update_avatar_model.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../model/upload_image.dart';

class MyProfileApiService {

  Future<void> updateUserName(firstName, lastName) async {
    var id = LocalStorage.user().id;
    Uri uri = Uri.parse('$updateProfileUrl$id/');
    var token = LocalStorage.user().token;
    try {
      var headers = <String, String>{'Authorization': token};
      var body = <String, String>{
        'first_name': firstName,
        'last_name': lastName,
      };
      final response = await http.put(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        LocalStorage.setString(keyUserFirstName, firstName);
        LocalStorage.setString(keyUserLastName, lastName);
        LocalStorage.setString(
            keyUserProfileUpdatedAt, obj['user_profile_updated_at']);
        Fluttertoast.showToast(msg: 'Profile Updated!');
        if(obj['reward_points_data']['reward_points']!=null){
          int point = obj['reward_points_data']['reward_points'];
          if (point > 0) {
            DashboardController().showAlertDialog(point, obj['reward_points_data']['reward_message']);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UploadImage> uploadProfileImage(File image) async {
    Uri uri = Uri.parse(uploadProfileImageUrl);
    var user = LocalStorage.user();
    try {

      // open a byteStream
      // var stream1 = http.ByteStream(DelegatingStream.typed(image.openRead()));

      var stream = http.ByteStream(image.openRead())..cast();

      // get file length
      var length = await image.length();

      // create multipart request
      var request = http.MultipartRequest("POST", uri);

      request.headers['Authorization'] = user.token;

      // if you need more parameters to parse, add those like this. i added "user_id". here this "user_profile_id" is a key of the API request
      request.fields["user_profile_id"] = user.id.toString();

      // multipart that takes file.. here this "image_file" is a key of the API request
      var multipartFile = http.MultipartFile('user_image', stream, length,
          filename: basename(image.path));

      // add file to multipart
      request.files.add(multipartFile);

      final response = await request.send();
      var data = await response.stream.bytesToString();
      final uploadImage = uploadImageFromJson(data);
      return uploadImage;
    } catch (e) {
      rethrow;
    }
  }

  Future<AvatarModel> getAvatarImageList() async {
    Uri uri = Uri.parse(avtarImageListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final avatarModel = avatarModelFromJson(response.body);
      return avatarModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateAvatarModel> updateAvatarImage(avatarId) async {
    Uri uri = Uri.parse(updateAvtarImageUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'avatar_image_id': avatarId
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final updateAvatarModel = updateAvatarModelFromJson(response.body);
      return updateAvatarModel;
    } catch (e) {
      rethrow;
    }
  }

}
