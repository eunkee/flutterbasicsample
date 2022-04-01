import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2022/02/19/06/46/red-dragonfly-7021985_960_720.jpg',
  'https://cdn.pixabay.com/photo/2022/02/14/06/54/bird-7012586_960_720.jpg',
  'https://cdn.pixabay.com/photo/2022/03/24/14/42/animal-7089224_960_720.jpg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  final _pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //배경을 흰 색으로
        title: const Text('복잡한 UI', style: TextStyle(color: Colors.black),), // 글자를 검은 색으로
        centerTitle: true, // 제목을 가운데로
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black,),
            onPressed: (){
            },
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index; // 선택된 탭의 인덱스로 _index 를 변경
          });
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '이용서비스'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '내정보'),
        ],
      ),
    );
  }
}

// 홈
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  print('클릭');
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('대리'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Opacity(
                opacity: 0.0, //투명
                child: Column(
                  children: const [
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('대리'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
      ),
      items: dummyItems.map((url){
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    url,
                    fit:BoxFit.cover
                  ),
                ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i) {
      return const ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항입니다'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작 금지
      shrinkWrap: true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정해야 함
      children: items,
    );
  }
}

// 이용서비스
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '이용서비스',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

// 내 정보
class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}