import 'package:flutter/material.dart';
import 'package:movie_database/movie_list.dart';


class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: const watchlist(),
    );
  }
}


class watchlist extends StatelessWidget {
  const watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: const <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Your Watchlist',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    child: const Text(
                      'See More >>',
                      style: TextStyle(color: Colors.yellow, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => movie_list(),
                      ));
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 180,
                child: ListView.builder(
                  //physics: const ClampingScrollPhysics(),
                  //shrinkWrap: true,
                  scrollDirection: Axis.horizontal, /// Card itemlerinin yatayda sıralanmasını sağlıyor.
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) => const Card(
                    color: Colors.white38,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        widthFactor: 1.5,

                        /// Card'ların genişliğini ayarlıyor.
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Movie Name',
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
