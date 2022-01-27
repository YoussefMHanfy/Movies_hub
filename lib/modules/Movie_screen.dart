// @dart=2.9
import 'package:flutter/material.dart';

import '../constants.dart';

 class MovieScreen extends StatelessWidget {
  final String name, description, bannerURL, posterURL, vote, launchDate;

  const MovieScreen({
    this.name,
    this.description,
    this.bannerURL,
    this.posterURL,
    this.vote,
    this.launchDate});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBar,
        title: Text(name),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              bannerURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Text(
                            ' ⭐ Average Rating - ' + vote,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  name != null ? name : 'Not Loaded',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Release Date: '+launchDate),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 100,
                    child: Image.network(posterURL),
                  ),

                  Flexible(child: Container(
                    child: Text(description, style: TextStyle(fontSize: 18),),
                  ))
                ],
              ),
              SizedBox(
                height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
