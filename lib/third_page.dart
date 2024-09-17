import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sliver_app/fourth_page.dart';
import 'package:sliver_app/model.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool shimmer = false;
  Future<void> _refresh() async {
    setState(() {
      shimmer = true;
    });

    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) => setState(() {
          shimmer = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FourthPage(),
              ));
        },
        child: const Icon(
          Icons.next_plan,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                _refresh();
              },
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    backgroundColor: Color.fromRGBO(217, 183, 165, 1),
                    title: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        'アニメウィキ',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'nato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    expandedHeight: 120,
                    pinned: true,
                    floating: true,
                  ),

//
//
//                shimmer properties
//
//
//

                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final imgList = images[index];
                      return Column(
                        children: [
                          Center(
                            child: Text(
                              imgList.title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width - 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: shimmer
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.transparent,
                                      direction: ShimmerDirection.ttb,
                                      child: Image.asset(imgList.img),
                                    )
                                  : Image.asset(imgList.img),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              imgList.body,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    }, childCount: images.length),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
