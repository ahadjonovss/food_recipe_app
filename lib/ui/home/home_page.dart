import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  alignment: Alignment.center,
                  height: 48,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      color: Colors.grey.withOpacity(0.2)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 48,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Colors.grey.withOpacity(0.3)),
                ),
              ],
            ),
            Text("Meals", style: GoogleFonts.lato(fontSize: 32)),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.bottomCenter,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://source.unsplash.com/random/200x200?sig=1"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  child: Text(
                    "Random ovqat",
                    maxLines: 2,
                    style: GoogleFonts.lato(
                        color: Colors.white, fontWeight: FontWeight.w500),
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