import 'package:flutter/material.dart';
import 'package:sliver_app/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<Widget> l2 = [
      Expanded(
        child: SizedBox(
          height: 400,
          child: ListView(
            children: [
              Container(
                height: 100,
                width: 150,
                color: Colors.green.shade200,
              ),
              Container(
                height: 100,
                width: 150,
                color: const Color.fromARGB(255, 52, 84, 53),
              ),
              Container(
                height: 100,
                width: 150,
                color: const Color.fromARGB(255, 11, 16, 11),
              )
            ],
          ),
        ),
      )
    ];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ));
        },
        child: const Icon(Icons.next_plan),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: CustomScrollView(
                slivers: [
                  SliverFixedExtentList(
                      delegate: SliverChildListDelegate([
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink.shade300,
                                  Colors.pink.shade100,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          // SliverFixedExtentList
                          child: const Center(
                              child: Text(
                            'SliverFixedExtentList',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          )),
                        ),
                      ]),
                      itemExtent: 200),

                  // SliverPadding & SliverChildBuilderDelegate

                  SliverPadding(
                    padding: const EdgeInsets.only(left: .1),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.blue,
                            child: Text(
                              '$index'.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.pink),
                            ),
                          ),
                        ),
                        childCount: 15,
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: l2[index],
                                ),
                              ),
                          childCount: l2.length),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
