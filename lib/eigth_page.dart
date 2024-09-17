import 'package:flutter/material.dart';

class EightPage extends StatefulWidget {
  const EightPage({super.key});

  @override
  State<EightPage> createState() => _EightPageState();
}

class _EightPageState extends State<EightPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  title: Text(
                    'Sliver Appbar properties',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.amber,
                  automaticallyImplyLeading: true,
                  centerTitle: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
