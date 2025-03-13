import 'package:streamt/controll/sqldatabase.dart';
import 'package:streamt/model/databasemodel.dart';

class sqldatacontroller{

  final DatabaseService _dbhelper = DatabaseService.instance;
  
  


  Future<List<data>> fetchItems()async{
    return await _dbhelper.getItems();

  }

  Future<void> adddata(String name,String email,String location,String? imagePath)async{
    final newdata = data(name: name, email: email, location: location,imagePath: imagePath);
    await _dbhelper.insertItem(newdata);

  }
}