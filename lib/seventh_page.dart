import 'package:flutter/material.dart';
import 'package:sliver_app/eigth_page.dart';

class SeventhPage extends StatelessWidget {
  const SeventhPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EightPage(),
          ),
        );
      }),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const SliverAppBar.medium(
                  backgroundColor: Colors.green,
                  title: Center(
                      child: Text(
                    'Other Sliver-Widgets',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),

                const SliverToBoxAdapter(
                    child: Center(child: Text('Header for list'))),

                // Used if we scroll down let the top list items be less visible

                SliverOpacity(
                  opacity: 0.3,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.orange,
                                  ],
                                ),
                              ),
                              child: const Text('Sliver Opacity'),
                            ),
                        childCount: 5),
                  ),
                ),

                const SliverToBoxAdapter(
                    child: Center(child: Text('footer for list'))),
                //end of the last sliver
                //usually a retry button

                const SliverFillRemaining(child: Center(child: Text('Over'))),

                // end of the scrollable area placed widget
                //and takes available space of the child in this case Container();
                //used for reload data from network

                SliverFillViewport(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.yellow,
                                  Colors.orange,
                                ],
                              ),
                            ),
                            child: const Text('Sliver Opacity'),
                          ),
                      childCount: 5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
