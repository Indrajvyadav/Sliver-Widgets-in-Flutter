import 'package:flutter/material.dart';
import 'package:sliver_app/third_page.dart';
import 'dart:math' as math;

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThirdPage(),
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              color: index.isEven ? Colors.grey : Colors.black,
                              alignment: Alignment.lerp(Alignment.centerLeft,
                                  Alignment.centerRight, 1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(190, 224, 255, 1),

                                  //Container alignment uses
                                  // .isEven
                                  // box shadow uses
                                  //list[number]=index or number.isEven/isOdd/isNan=not a number value/isNegative/isFinite/isInfinite

                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset.fromDirection(math.pi, 40),
                                      blurRadius: 6,
                                      spreadRadius: 8,
                                      color: Color.fromRGBO(242, 249, 255, 1),
                                    )
                                  ],
                                ),
                                child: const Text(
                                  'data',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ),
                            ),
                        childCount: 30),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1),
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
