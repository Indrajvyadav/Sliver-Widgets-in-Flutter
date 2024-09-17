import 'package:flutter/material.dart';
import 'package:sliver_app/seventh_page.dart';

class SixthPage extends StatelessWidget {
  const SixthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SeventhPage(),
            ),
          );
        },
        child: const Icon(Icons.next_plan),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const SliverAppBar.medium(
                  title: Center(
                    child: Text(
                      'Sliver Widgets:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.grey.withOpacity(0.8),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'The Number is : $index',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.yellow,
                    height: 25,
                    width: size.width,
                    child: const Center(
                      child: Text(
                        'SliverToBoxAdapter',
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
