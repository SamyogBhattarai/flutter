import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class QR extends StatelessWidget {
  QR({super.key});
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: ScanView(
                  controller: controller,
                  scanAreaScale: .4,
                  scanLineColor: Colors.red,
                  onCapture: (data) {
                    var snackBar = SnackBar(
                      content: Text(data),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }),
            )),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: const Color.fromARGB(255, 255, 17, 0),
                  child: Text(
                    "Scan or Share",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.10,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          color: Colors.red,
                          child: Text(
                            "Scan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          child: Text(
                            "share",
                            style: TextStyle(color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                        )
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(children: [
                    Spacer(),
                    Icon(
                      Icons.photo_album,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.flash_off,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ]),
                ),
                Container(
                  color: Colors.white,
                  height: 40,
                  child: Image.asset(
                    "assets/images/fff.png",
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Scan to pay on Merchnat Outlets",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
