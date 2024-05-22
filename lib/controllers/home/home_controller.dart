import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/services/auth/auth_service.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  final String date = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  CollectionReference userName =
      FirebaseFirestore.instance.collection('userInfo');

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  void fetchUserName() async {
    try {
      var uid = AuthService.firebase().uid;
      var doc = await userName.doc(uid).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        name.value = data['name'];
      } else {
        name.value = 'No user name';
      }
    } catch (e) {
      name.value = 'Error: $e';
    }
  }
}
