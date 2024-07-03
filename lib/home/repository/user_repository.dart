import 'dart:convert';
import 'dart:developer';
import 'package:adss_limited_mechine_test/home/model/user.dart';
import 'package:adss_limited_mechine_test/home/model/user_details_model.dart';
import 'package:adss_limited_mechine_test/home/model/user_postId_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  Future<UserListModel> fetchUser() async {
    try {
      List<User> bookList = [];
      const url = 'https://jsonplaceholder.typicode.com/posts';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body) as List;
        for (var values in jsonData) {
          
          final book = User.fromJson(values);
          bookList.add(book);
        }
        
        return UserListModel(book: bookList, error: null);
      } else {
        return UserListModel(
            book: null, error: "Somthing Unecxpected happend");
      }
    } catch (e) {
      return UserListModel(book: null, error: e.toString());
    }
  }
  Future<UserModel> fetchPostwithPostId({String? id}) async {
    try {
      List<UserWithPostIdModel> bookList = [];
      var url = 'https://jsonplaceholder.typicode.com/comments?postId=$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body) as List;
        for (var values in jsonData) {
          
          final book = UserWithPostIdModel.fromJson(values);
          bookList.add(book);
        }
        
        return UserModel(userWithPostIdModel: bookList, error: null);
      } else {
        return UserModel(
            userWithPostIdModel: null, error: "Somthing Unecxpected happend");
      }
    } catch (e) {
      log("error==>>$e");
      return UserModel(userWithPostIdModel: null, error: e.toString());
    }
  }
  Future<UserDetailsModel> fetchUserDetails({String? id}) async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/users/$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
       
        
        return UserDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        return UserDetailsModel(error: "Something Unexpected happend");
      }
    } catch (e) {
      log("error==>>$e");
      return UserDetailsModel(error: "Something Unexpected happend");
    }
  }
 
}
