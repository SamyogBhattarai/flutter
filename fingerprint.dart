import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_5/kumari.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'kumari.dart';

class Fp extends StatefulWidget {
  const Fp({super.key});

  @override
  State<Fp> createState() => _FpState();
}

class _FpState extends State<Fp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 9, 99, 255),
              Color.fromARGB(255, 255, 22, 6)
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 98, top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      SizedBox(
                        height: 90,
                        width: 170,
                        child: Image.asset(
                          "assets/images/nb.jpg",
                        ),
                      ),
                      const Text(
                        "Digital Sansar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    const SizedBox(
                      width: 6,
                    ),
                    const Icon(
                      Icons.sms_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Image.asset("assets/images/vv.png"),
            ),
            const Icon(
              Icons.more_horiz_outlined,
              color: Colors.white,
              size: 67,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: const Row(children: [
                Row(
                  children: [
                    Text(
                      "Quick Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "User ID",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
            ),
            const Divider(
              color: Colors.white,
              thickness: 3,
              indent: 10,
              endIndent: 279,
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    bool a = await checkForBiometric();
                    if (a) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Kumaribank()));
                    } else {
                      var snackbar = SnackBar(
                        content: Text("Not valid"),
                      );
                    }
                  },
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.fingerprint_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Tap here to open a prompt for \n          fingerprint scanner ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: const Icon(
                        Icons.question_mark,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Unable to login",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ]),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Digital Sansar",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: 270,
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
              child: Image.asset(
                "assets/images/di.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ]),
        ),
      )),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.currency_rupee_rounded), label: "Payments"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits_outlined),
                  label: "Products"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_outlined), label: "More"),
            ]),
      ),
    );
  }

  checkForBiometric() async {
    bool didAuthenticate = false;
    final LocalAuthentication auth = LocalAuthentication();
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticate) {
      try {
        didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to show account balance',
            options: const AuthenticationOptions(useErrorDialogs: false));
        // ···
      } on PlatformException catch (e) {
        print(e);
      }
      return didAuthenticate;
    }
  }
}
