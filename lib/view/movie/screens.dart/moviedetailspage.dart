import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailPage extends StatelessWidget {
  final String imageUrl;

  const MovieDetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Movie Detail'),
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
      // body: Center(
      //   child: Image.network(imageUrl),
      // ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              
        width: double.infinity,
        height: 250,
        decoration:BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill,
            image: NetworkImage(imageUrl))
        ),
              ),
        
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    height: 18,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text('Action',style: TextStyle(
                        color: Colors.black ,fontSize: 13
                      ),),
                    ),
                  ),
        SizedBox(width: 5,),
                  Text(' Action • ',style: TextStyle(color: Colors.white,fontSize: 13),),
                                  Text('Adventure •',style: TextStyle(color: Colors.white,fontSize: 13),),
        
           Text(' Sci-Fi',style: TextStyle(color: Colors.white,fontSize: 13),)
                ],
              ),
        SizedBox(height: 10,),
              Text('Shrek',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        
              Row(
                children: [
        Icon(Icons.star,color: Colors.red,size: 20,),
        Icon(Icons.star,color: Colors.red,size: 20,),
        Icon(Icons.star,color: Colors.red,size: 20,),
        Icon(Icons.star_half,color: Colors.red,size: 20,),
        Icon(Icons.star_border_outlined,color: Color.fromARGB(255, 37, 35, 35),size: 20,),
        
        
        Text('  [3.4]',style:TextStyle(color: Colors.white,fontSize: 15) ,)
                ],
              ),
        
              Text('2hr:6mins September 17,2010',style:TextStyle(color: Colors.white,fontSize: 15) ,),
        SizedBox(height: 10,),
        
        Container(
          height: 50,
          width:double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 21, 4),
        
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Text('STREAM NOW',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
        SizedBox(width: 5,),
        Icon(Icons.play_arrow,color: Colors.white ,size: 15,)
            ],
          ),
        ),
        SizedBox(height: 15,),
        Text('This film follows science teacher Alom Shaha as he goes on a journey to explore the use of demonstrations in science teaching. The film tells an interesting story and is primarily intended to encourage secondary',
        style: TextStyle(
          color: Colors.white,fontSize: 15,
        ),),
        SizedBox(height: 15,),
        
        Row(
         
          children: [
            Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)
        
        ),
        child: Center(
          child: Icon(Icons.favorite,color: Colors.grey,size: 22,),
        ),
            ),
             SizedBox(width: 10,),

                        Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)
        
        ),
        child: Center(
          child: Icon(Icons.bookmark,color: Colors.grey,size: 22,),
        ),
            ),
             SizedBox(width: 10,),
                        Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)
        
        ),
        child: Center(
          child: Icon(Icons.playlist_add_check_circle_sharp,color: Colors.grey,size: 22,),
        ),
            ),
          ],
        )
            ],
          ),
        ),
      ),
    );
  }
}
