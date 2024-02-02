import 'package:flutter/material.dart';


class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final images = [
  "https://food.foto.ne.jp/img/category_tn_239.jpg",
  "https://food.foto.ne.jp/img/category_tn_240.jpg",
  "https://food.foto.ne.jp/img/category_tn_241.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          // ここでは左寄せにしている。
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
            child: Row(children: [
              const SizedBox(width: 15),
              Image.network('https://ferret-one.akamaized.net/images/649be146aed96504432c2be9/normal.png?utime=1687937350',
              width: 70,
              height: 70,),
              const Spacer(),
              const Column(
                children: [
                  Text('7,041', 
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 16,
                    ),
                  ),
                  Text('投稿'),
                ],
              ),
              const SizedBox(width: 16),
              const Column(
                children: [
                  Text('4.6億',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 16,
                    ),
                  ),
                  Text('フォロワー'),
                ],
              ),
              const SizedBox(width: 16),
              const Column(
                children: [
                  Text('99',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 16,
                    ),
                  ),
                  Text('フォロー'),
                ],
              )          
            ],
                    ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Instagram',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text('#YoursToMake',
                        style: TextStyle(
                        color: Colors.blue,
                        ),
                ),
                Text('help.instagram.com',
                        style: TextStyle(
                        color: Colors.blue,
                        ),
                ),
                    ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // 要素を可能な限り広げたい時に使用する
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ), 
                      child: const Text('フォロー中',
                        style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: OutlinedButton(onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ), 
                      child: const Text('メッセージ', 
                        style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              OutlinedButton(onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ), 
              child: const Icon(Icons.arrow_drop_down,
                color: Colors.black,),
              ),
            ],
          ),
        ),
        GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisCount: 3,
            // mapはforみたいなもの
            children: images.map((imageUrl) {
              return InstagramPostItem(imageUrl: imageUrl,);
            }).toList(),
          )
        ]),
      ),
    );
  }
}

class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({Key? key,required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      // 全体に広げる
      fit: BoxFit.cover,
    );
  }
}