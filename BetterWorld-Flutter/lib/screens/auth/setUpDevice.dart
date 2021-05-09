import 'package:muggles/widgets/customButton.dart';
import 'package:muggles/widgets/customeInput.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SetUpDevice extends StatefulWidget {
  @override
  _SetUpDeviceState createState() => _SetUpDeviceState();
}

class _SetUpDeviceState extends State<SetUpDevice> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;
  String deviceCode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: QRView(
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 300,
                      // cutOutSize: 24,
                    ),
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.26,
              minChildSize: 0.26,
              maxChildSize: 0.26,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Unable to scan? enter device code:',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5,),
                          CustomTextInput(
                            width: MediaQuery.of(context).size.width * 0.85,
                            hintText: 'Enter Device Number',
                            leading: Icons.device_hub,
                            obscure: false,
                            keyboard: TextInputType.text,
                            userTyped: (val) {
                              deviceCode = val;
                            },
                          ),
                          SizedBox(height: 10,),
                          CustomButton(
                            width: MediaQuery.of(context).size.width * 0.85,
                              accentColor: Color(primaryColor),
                              onpress: () async {
                                // TODO: LogIn
                                // if (password != null && email != null) {
                                //   setState(() {
                                //     loggingin = true;
                                //   });
                                //   try {
                                //     final loggedUser =
                                //         await _auth.signInWithEmailAndPassword(
                                //             email: email, password: password);
                                //     if (loggedUser != null) {
                                //       setState(() {
                                //         loggingin = false;
                                //       });
                                //       Navigator.pushNamed(context, '/');
                                //     }
                                //   } catch (e) {
                                //     setState(() {
                                //       loggingin = false;
                                //     });
                                //     EdgeAlert.show(
                                //       context,
                                //       title: 'Login Failed',
                                //       description: e.toString(),
                                //       gravity: EdgeAlert.BOTTOM,
                                //       icon: Icons.error,
                                //       backgroundColor: Color(primaryColor),
                                //     );
                                //   }
                                // } else {
                                //   EdgeAlert.show(
                                //     context,
                                //     title: 'Uh oh!',
                                //     description: 'Please enter the email and password.',
                                //     gravity: EdgeAlert.BOTTOM,
                                //     icon: Icons.error,
                                //     backgroundColor: Color(primaryColor),
                                //   );
                                // }
                                Navigator.pushReplacementNamed(
                                    context, '/dashboard');
                              },
                              text: 'Set up device',
                              mainColor: Colors.white),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}
