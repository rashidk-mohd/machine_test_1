import 'package:adss_limited_mechine_test/home/model/user.dart';
import 'package:adss_limited_mechine_test/home/model/user_details_model.dart';
import 'package:adss_limited_mechine_test/home/model/user_postId_model.dart';
import 'package:adss_limited_mechine_test/home/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserConroller with ChangeNotifier {
  UserRepository bookRepo = UserRepository();
  List<User> bookList = [];
  List<UserWithPostIdModel> userWithPostIdModel = [];
  UserDetailsModel? userDetailsModel;
  bool isLoading = false;
  bool isLoadingWhenOffline = false;
  Future<void> getData() async {
    isLoading = true;
    final data = await bookRepo.fetchUser();
    if (data.error == null) {
      bookList = data.book ?? [];
    } else {
      Fluttertoast.showToast(msg: data.error ?? "Something Unexpected happend");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<List<UserWithPostIdModel>> getDataWithPostID({String? id}) async {
    isLoading = true;
    final data = await bookRepo.fetchPostwithPostId(id: id);
    if (data.error == null) {
      userWithPostIdModel = data.userWithPostIdModel ?? [];
    } else {
      Fluttertoast.showToast(msg: data.error ?? "Something Unexpected happend");
    }
    isLoading = false;
    notifyListeners();
    return userWithPostIdModel;
  }

  Future<List<UserWithPostIdModel>> getUserDetails({String? id}) async {
    isLoading = true;
    final data = await bookRepo.fetchUserDetails(id: id);
    if (data.error == null) {
      userDetailsModel = data;
    } else {
      Fluttertoast.showToast(msg: data.error ?? "Something Unexpected happend");
    }
    isLoading = false;
    notifyListeners();
    return userWithPostIdModel;
  }
}
