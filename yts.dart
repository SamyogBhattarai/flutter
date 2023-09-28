import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Yts extends StatefulWidget {
  const Yts({super.key});

  @override
  State<Yts> createState() => _YtsState();
}

class _YtsState extends State<Yts> {
  Dio dio = Dio();

  bool loader = false;
  var response1;
  void getValueFromApi() async {
    await dio.get("https://yts.mx/api/v2/list_movies.json").then((value) {
      setState(() {
        loader = false;
        response1 = value;
      });
    });
  }

  @override
  void initState() {
    getValueFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage("assets/images/yts.png"),
                  color: Color.fromARGB(255, 2, 150, 6),
                  size: 100,
                ),
                Spacer(),
                CustomIcon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Customtext("4k",
                    color: Colors.green,
                    fontsize: 26,
                    fontWeight: FontWeight.w700),
                const SizedBox(
                  width: 10,
                ),
                CustomIcon(
                  Icons.bar_chart,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/zx.png",
                  height: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomIcon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ]),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.telegram,
                color: Colors.blue,
              ),
              Customtext("YTMSX_UPDATES", color: Colors.blue, fontsize: 14),
              Customtext("|", color: Colors.white),
              Image.asset(
                "assets/images/tw.jpg",
                height: 20,
              ),
              Customtext("Upcoming: GRAN TURIISMO",
                  color: Colors.blue, fontsize: 14),
            ],
          ),
          Customtext("(2023)  on 26 September.",
              color: Colors.blue, fontsize: 14),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Customtext("Popular Downloads",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 15),
                Spacer(),
                Image.asset(
                  "assets/images/yk.png",
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Customtext("More Featured...",
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontsize: 15),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 0.2,
            color: Colors.white,
          ),
          response1 != null
              ? Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: response1.data["data"]["movies"].length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: Image.network(
                              "${response1.data["data"]["movies"][index]["small_cover_image"]}",
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                        );
                      }),
                )
              : SizedBox(),
        ]),
      ),
    );
  }

  Widget Customtext(String text,
      {Color? color, double? fontsize, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontsize ?? 14,
          fontWeight: fontWeight),
    );
  }

  Widget CustomIcon(IconData? icon, {double? size, Color? color}) {
    return Icon(icon, size: size, color: color);
  }
}
