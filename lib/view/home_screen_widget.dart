import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.price});
  final String title;
  final String image;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 30)],
                  ),
                ],
              ),
            ),
            height: 220,
            width: 170,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 120, 216, 125),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(title),
          Text("${price}")
        ],
      ),

      // SizedBox(
      //   height: 30,
      // )
    );
  }
}
