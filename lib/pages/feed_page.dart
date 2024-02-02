import 'package:flutter/material.dart';


class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('フィード')),
      body: SingleChildScrollView(
        child: Column(
          // ここでは左寄せにしている。
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
            child: Row(children: [
              const SizedBox(width: 12,),
              Image.network('https://ferret-one.akamaized.net/images/649be146aed96504432c2be9/normal.png?utime=1687937350',
              width: 25,
              height: 25,),
              const SizedBox(width: 10,),
                const Column(children:[
                  Row(
                    children: [
                      SizedBox(width: 13),
                      Text('instagram', 
                        style: TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: 14,
                        ),
                      ),
                      Icon(Icons.verified,
                      color: Colors.blue,
                      size: 15,
                      ),
                    ],
                  ),
                  Text('サンディエゴ', 
                    style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 12,
                    ),
                  ),
                ]),
                const Spacer(),
                TextButton(onPressed: () {}, 
                  child: const Icon(Icons.more_horiz,
                  color: Colors.black,)
              ),
                ],
              ),
            ),
            Image.network('https://d3d7exujemgi7m.cloudfront.net/upload/recipe/2021/09/6150bfca04a69.jpg'
            ),
            const SizedBox(height: 5,),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(width:12),
              Icon(Icons.favorite_border,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
              ),

              SizedBox(width:12),

              Icon(Icons.sms,
              color: Colors.black,
              size: 30,
              ),

              SizedBox(width:12),

              Icon(Icons.send,
              color: Colors.black,size: 30,
              ),
              Spacer(),
              Icon(Icons.bookmark_border,
              color: Colors.black,
              size: 30,),

              SizedBox(width:12),

            ],),
            const Padding(
              padding: EdgeInsets.only(left:12,bottom: 8,top: 8),
              child: Text('「いいね!」704,899件', 
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12,left: 12),
              child: Text('This is seriously a very good muffin. You are missing out if you have not had one in your life. Seriously. Are you drooling over this picture?', 
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 14,
                      ),
                    ),
            ),
          ]),
      ),
    );
  }
}
