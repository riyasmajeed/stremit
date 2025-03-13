
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:streamt/controll/datacontroll.dart';

import 'package:streamt/model/databasemodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final sqldatacontroller _sqldatacontroller = sqldatacontroller();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController locationController;

   File? _imageFile; // Store the selected image

  List<data> _datas = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
    _loadLatestData();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> _loadLatestData() async {
    final datas = await _sqldatacontroller.fetchItems();
    if (datas.isNotEmpty) {
      final latestData = datas.last; // Get the last entered data
      setState(() {
        nameController.text = latestData.name;
        emailController.text = latestData.email;
        locationController.text = latestData.location;
        if (latestData.imagePath != null) {
          _imageFile = File(latestData.imagePath!);
        }
      });
    }
 }

 Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("Location permissions are denied");
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String city = place.locality ?? "";
        String state = place.administrativeArea ?? "";
        String country = place.country ?? "";

        setState(() {
          locationController.text = "$city, $state, $country";
        });
      }

      
    } catch (e) {
      print("Error getting location: $e");
    }
  }



  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _addData() async {
      void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
    if (_formKey.currentState!.validate()) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final location = locationController.text.trim();
       final imagePath = _imageFile?.path;

      try {
        await _sqldatacontroller.adddata(name, email, location,imagePath);
        _loadLatestData(); // Reload to reflect changes in text fields
          _showToast("Data saved",);
        print("Adding data...");
      } catch (e) {
        print("Error adding data: $e");
      }
    }

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.red,
 backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null
                        ? Icon(Icons.person, color: Colors.white, size: 50)
                        : null,


                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        hintText: "Name",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(7),
                       ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter a name" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        hintText: "Email",
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(7),
                       ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter an email" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: locationController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        hintText: "Location",
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(7),
                       ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter a location" : null,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.my_location),
                onPressed: _getCurrentLocation,
                label: Text('My Location'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _addData,
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
