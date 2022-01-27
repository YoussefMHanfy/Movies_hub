// @dart=2.9

import 'package:flutter/material.dart';
import 'package:move_hub/modules/Movie_screen.dart';

class ContentList extends StatelessWidget {
  ContentList({@required this.content, this.pathName});

  final List content;
  final String pathName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: content.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen(
                name: content[index][pathName] !=null ? content[index][pathName] : '',
                bannerURL: content[index]['backdrop_path'] !=null ? 'https://image.tmdb.org/t/p/w500'+content[index]['backdrop_path'] : 'https://image.tmdb.org/t/p/w500'+content[index]['poster_path'],
                posterURL: content[index]['poster_path'] != null ? 'https://image.tmdb.org/t/p/w500'+content[index]['poster_path'] : 'https://cdn.wallpapersafari.com/41/18/MKgIGn.png',
                description: content[index]['overview'] ,
                vote: content[index]['vote_average'].toString() != null ? content[index]['vote_average'].toString(): '',
                launchDate: content[index]['release_date'] != null ? content[index]['release_date'] : content[index]['first_air_date'],
              )));
            },
            child: Container(
              width: 140,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500'+content[index]['poster_path']),
                      ),
                    ),
                  ),

                  SizedBox(height: 5,),

                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(content[index][pathName]!=null ? content[index][pathName] : 'Loading', style: TextStyle(),),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
