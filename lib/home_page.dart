import 'package:flutter/material.dart';
import 'package:sliver_app/first_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> sList = [
      'INDRAJ',
      'HARISH',
      'GURUNATH',
      'AKSHAY',
      'NEERAJ',
      'LALITH'
    ];
    final List<String> iList = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
    ];
    final List<Widget> text = [
      Expanded(
        child: SizedBox(
          height: 310,
          child: ListView(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.purple.shade300,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.purple.shade200,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.purple.shade100,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 100,
        width: size.width,
        child: ListView.builder(
          itemCount: sList.length,
          itemBuilder: (context, index) => Center(
            child: Text(
              sList[index],
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 300,
          width: 150,
          child: ListView.builder(
            itemCount: iList.length,
            itemBuilder: (context, index) => Image.asset(
              iList[index],
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstPage(),
                ));
          },
          child: const Icon(Icons.next_plan),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: text.length,
                        (context, index) => text[index],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
