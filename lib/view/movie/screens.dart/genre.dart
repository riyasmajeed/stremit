import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
    final List<Map<String, String>> genres = [
    {'name': 'Action', 'image': 'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png'},
    {'name': 'Adventure', 'image': 'https://upload.wikimedia.org/wikipedia/en/f/f4/%C3%86on_Flux_%28film%29.png',},
    {'name': 'Animation', 'image': 'https://bloximages.chicago2.vip.townnews.com/desototimes.com/content/tncms/assets/v3/editorial/a/e7/ae7bb800-2f2f-11ef-bce5-17a8c986ae42/66746f8b29213.image.png?resize=333%2C500',},
    {'name': 'Comedy', 'image':  'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png'},
    {'name': 'Crime', 'image':  'https://www.researchgate.net/profile/Stefan-Bolea/publication/309717420/figure/fig1/AS:425102790664192@1478363811754/Fight-Club-movie-poster-1999.png',},
    {'name': 'Drama', 'image': 'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png',},
    {'name': 'Horror', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSruB3WEn_niTxcfLi3fKc10thftjkwSIQGPA&s',},
    {'name': 'Mystery', 'image':  'https://i0.wp.com/sreditingzone.com/wp-content/uploads/2018/03/special-photo-4.png?resize=678%2C1024&ssl=1',},
    {'name': 'Romance', 'image':'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png',},
    {'name': 'Sci-Fi', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSruB3WEn_niTxcfLi3fKc10thftjkwSIQGPA&s',},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Genres',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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

      // body: Padding(
      //   padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      //   child: Column(
      //     children: [
      //       Row(children: [
      //         Container(
      //           height: 85,
      //           width: 182,
      //           decoration: BoxDecoration(
               
      //               borderRadius: BorderRadius.circular(10),
      //               image: DecorationImage(image: NetworkImage( 'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png',),
      //               fit:BoxFit.cover),
      //     color: const Color.fromARGB(42, 76, 175, 79),
      //           ),
      //         ),
      //         Spacer(),
      //          Container(
      //           height: 85,
      //           width: 182,
      //           decoration: BoxDecoration(
      //             color: Colors.green,
      //             borderRadius: BorderRadius.circular(10)
      //           ),
      //         )
      //       ],)
      //     ],
      //   ),
      // ),/
       body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: genres.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            final genre = genres[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(genre['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Center(
                  child: Text(
                    genre['name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

    );


  }
}