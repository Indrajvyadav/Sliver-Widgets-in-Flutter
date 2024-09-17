import 'package:flutter/material.dart';
import 'package:sliver_app/fifth_page.dart';
import 'package:sliver_app/model.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  late PageController _pageController;
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: .90, initialPage: initialPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
                builder: (context) => const FifthPage(),
              ));
        },
        child: const Icon(Icons.next_plan),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber.withOpacity(0.6),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // ignore: avoid_unnecessary_containers
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Expanded(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          final imgList = images[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey.withOpacity(0.8),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    imgList.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.amber),
                                  ),

                                  //TextOverflow.properties

                                  Image.asset(imgList.img),
                                  SingleChildScrollView(
                                    child: Text(
                                      imgList.body,
                                      maxLines: 10,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
