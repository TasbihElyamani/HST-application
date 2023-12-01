// import 'dart:developer';

import 'package:app/model/postmodel.dart';
import 'package:app/service/provider_service.dart';
import 'package:flutter/foundation.dart';

class ProviderOperation extends ChangeNotifier {
  final servic = ProviderService();
  bool isLoading = false;
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  getAllPosts() async {
    isLoading = true;
    notifyListeners();
    final res = await servic.getAll();
    _posts = res;
    isLoading = false;
    notifyListeners();
  }

  SendActivity(var body) async {
    isLoading = true;
    notifyListeners();
    final res = await servic.postMethod(body);
    var data = res;
    isLoading = false;
    notifyListeners();
  }
}
