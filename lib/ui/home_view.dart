import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: RichText(
              text: TextSpan(
                  text: 'Farm',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                  children: [
                TextSpan(
                    text: 'Keep',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              ])),
          actions: [CircleAvatar()]),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Color.fromRGBO(198, 246, 168, 1),
          onPressed: (() {})),
      body: BodyWiget(),
    );
  }
}

class BodyWiget extends StatefulWidget {
  @override
  State<BodyWiget> createState() => _BodyWigetState();
}

class _BodyWigetState extends State<BodyWiget> {
  final scrollController = ScrollController();
  int? selectedIndex;

  final Color yellowColor = Color.fromRGBO(245, 244, 228, 1);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        controller: scrollController,
        children: [
          Row(
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Record book for',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                    TextSpan(
                      text: 'Farm1',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    )
                  ])),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "GENERATE QR CODE",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.qr_code)
                    ],
                  ))
            ],
          ),
          SizedBox(height: 16),

          OrientationBuilder(builder: (context, orientation) {
            return GridView.builder(
                controller: scrollController,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .9,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    crossAxisCount:
                        orientation == Orientation.portrait ? 2 : 3),
                itemCount: 20,
                itemBuilder: (context, index) => InkWell(
                      onTap: (() {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                      child: GridItem(
                        backgroundColor: selectedIndex == null
                            ? Colors.white
                            : (selectedIndex == index
                                ? yellowColor
                                : Colors.white),
                      ),
                    ));
          })

          // GridItem(
          //   backgroundColor: yellowColor,
          // )
        ]);
  }
}

class GridItem extends StatelessWidget {
  const GridItem({Key? key, this.backgroundColor}) : super(key: key);
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  "https://images.unsplash.com/photo-1651546956748-1390db784d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  height: 120),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Text(
                      "Photography",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Material(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Harvest",
                            style: TextStyle(color: Colors.green),
                          ),
                        ))
                  ],
                ),
              ),
              Text("4th May")
            ],
          ),
          backgroundColor == Colors.white
              ? SizedBox.shrink()
              : Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ))
        ],
      ),
    );
  }
}
