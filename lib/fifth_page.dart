import 'package:flutter/material.dart';
import 'package:sliver_app/Persistent_header.dart';
import 'package:sliver_app/model.dart';
import 'package:sliver_app/sixth_page.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SixthPage(),
              ));
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.next_plan, color: Colors.black),
      ),
      backgroundColor: Colors.black54,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(children: [
          CustomScrollView(
            slivers: [
              makeHeader('Samurai', size.width),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final imgList = images[index];
                  return Column(
                    children: [
                      Center(
                          child: Text(
                        imgList.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.withOpacity(0.6)),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width - 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(imgList.img),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          imgList.body,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
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
          Positioned(
            top: -20,
            child: SafeArea(
              child: BackButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.grey,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
