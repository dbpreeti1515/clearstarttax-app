import 'dart:math';

import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/apiModal/getDashboardModal.dart';
import 'package:preeti_s_application3/presentation/status_screen/models/status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local_database/database_helper/database_helper.dart';

/// A controller class for the StatusScreen.
///
/// This class manages the state of the StatusScreen, including the
/// current statusModelObj
class StatusController extends GetxController {
  final getDashboardData = Rxn<GetDashBoardModel>();
  Rx<StatusModel> statusModelObj = StatusModel().obs;
  final DatabaseHelper dbHelper = DatabaseHelper();
  RxString password = ''.obs;
  RxString randomText1 = ''.obs;
  RxString randomText2 = ''.obs;
  final db = Rxn<UserModel>();
  @override
  void onInit()async {

   db.value = await dbHelper.getUsers();
   password.value= db.value!.password;
   print(password.value);
    super.onInit();

   randomText1.value = generateRandomText(16);
   randomText2.value = generateRandomText(16);

  }
  String generateRandomText(int length) {
    final random = Random();
    const chars = 'dr0123fh456789aw'; // You can include additional characters if needed

    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  }
