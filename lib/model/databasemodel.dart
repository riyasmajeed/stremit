class data{
  final int? id;
  final String name;
  final String email;
  final String location;
  final String? imagePath;


  data({this.id,required this.name,required this.email,required this.location,
   this.imagePath});

  factory data.fromMap(Map<String,dynamic>map){
    return data(id: map['id'],
      name: map['name'], email: map['email'], location: map['location'], imagePath: map['imagePath'],);
  }


  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'email':email,
      'location':location,
       'imagePath': imagePath,
    };
  }
}