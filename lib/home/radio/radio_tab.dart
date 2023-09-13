import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.2,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        children: [
          Center(child: Image.asset("assets/images/radio_image.png")),
          Text(
            "اذاعة القران الكريم",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        color: Theme.of(context).primaryColor,
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.07),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).primaryColor,
                            size: 35,
                          ))),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
