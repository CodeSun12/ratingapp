import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double rating = 0;

  Widget buildRating() => RatingBar.builder(
    initialRating: rating,
      minRating: 0,
      updateOnDrag: true,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
      onRatingUpdate: (rating) => setState(() {
        this.rating = rating;
      })
  );


  void showRating() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Rate This App"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Please leave a star rating....", style: TextStyle(fontSize: 18),),
            SizedBox(height: 26,),
            buildRating(),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Ok", style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Rating App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rating: $rating", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(height: 15,),
            RatingBar.builder(
              minRating: 0,
                initialRating: rating,
                updateOnDrag: true,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                onRatingUpdate: (rating) => setState(() {
                  this.rating = rating;
                })
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () => showRating(),
              color: Colors.deepPurpleAccent,
              shape: StadiumBorder(),
              child: Text("Show Dialog", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
