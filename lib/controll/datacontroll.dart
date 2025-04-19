// import 'package:streamt/controll/sqldatabase.dart';
// import 'package:streamt/model/databasemodel.dart';

// class sqldatacontroller{

//   final DatabaseService _dbhelper = DatabaseService.instance;
  
  


//   Future<List<data>> fetchItems()async{
//     return await _dbhelper.getItems();

//   }

//   Future<void> adddata(String name,String email,String location,String? imagePath)async{
//     final newdata = data(name: name, email: email, location: location,imagePath: imagePath);
//     await _dbhelper.insertItem(newdata);

//   }
// }


import 'package:get/get.dart';
import 'package:streamt/controll/sqldatabase.dart';
import 'package:streamt/model/databasemodel.dart';

class UserSQLController extends GetxController {
  final DatabaseService _sqlController = DatabaseService.instance; // ✅ FIXED LINE
  var currentUser = Rxn<data>();

  Future<void> loadUser() async {
    final allUsers = await _sqlController.getItems(); // also corrected method name
    if (allUsers.isNotEmpty) {
      currentUser.value = allUsers.last;
    }
  }

  Future<void> saveUser(String name, String email, String location, String? imagePath) async {
    await _sqlController.insertItem(data(
      name: name,
      email: email,
      location: location,
      imagePath: imagePath,
    ));
    await loadUser();
  }
}
