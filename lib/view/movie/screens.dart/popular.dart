import 'package:flutter/material.dart';
import 'package:streamt/view/movie/screens.dart/moviedetailspage.dart';

class Popularhomepage extends StatefulWidget {
  const Popularhomepage({super.key});

  @override
  State<Popularhomepage> createState() => _PopularhomepageState();
}

class _PopularhomepageState extends State<Popularhomepage> {
  final List<String> moviePosters = [
    'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png',
    'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png',
    'https://i0.wp.com/sreditingzone.com/wp-content/uploads/2018/03/special-photo-4.png?resize=678%2C1024&ssl=1',
   'https://www.researchgate.net/profile/Stefan-Bolea/publication/309717420/figure/fig1/AS:425102790664192@1478363811754/Fight-Club-movie-poster-1999.png',
    'https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/6408f676b5811234c887ca62_top%20gun%20maverick-min.png',
    'https://in.originalfilmart.com/cdn/shop/products/Lucy_2014_original_film_art_5000x.jpg?v=1636660403',
   
  ];

  final List<String> actionmoviePosters = [
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSruB3WEn_niTxcfLi3fKc10thftjkwSIQGPA&s',
   'https://upload.wikimedia.org/wikipedia/en/f/f4/%C3%86on_Flux_%28film%29.png',
   'https://bloximages.chicago2.vip.townnews.com/desototimes.com/content/tncms/assets/v3/editorial/a/e7/ae7bb800-2f2f-11ef-bce5-17a8c986ae42/66746f8b29213.image.png?resize=333%2C500',
   'https://www.avsforum.com/attachments/screen-shot-2019-12-30-at-15-42-14-png.2661660/',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSruB3WEn_niTxcfLi3fKc10thftjkwSIQGPA&s',
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
       child: Column(
        children: [
         Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Movies',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 175,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: moviePosters.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
       
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(imageUrl: moviePosters[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 115,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(moviePosters[index]),
                              ),
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      SizedBox(height: 10,),
              Container(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: actionmoviePosters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 115,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(actionmoviePosters[index]),
                          ),
                          color: const Color.fromARGB(71, 0, 187, 212),
                        ),
                      ),
                    );
                  },
                ),
              ),
      SizedBox(height: 10,),
                Container(
                  height: 175,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: moviePosters.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
       
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(imageUrl: moviePosters[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 115,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(moviePosters[index]),
                              ),
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
     
       
        ],
       ),
     ),
   ),
    );
  }
}