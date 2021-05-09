import 'package:muggles/helpers/data.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class BillingHistoryListGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.43,
      margin: EdgeInsets.only(left: 10,right: 10),
      child: ListView.builder(
          itemCount: billingHistory.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: GroovinExpansionTile(
                  boxDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(-3.0, -3.0),
                        blurRadius: 3.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(3.0, 3.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  leading: Icon(
                    Icons.receipt,
                    color: Color(primaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Amount Paid : ',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '₹ ' + billingHistory[index]['amount'].toString(),
                                style: TextStyle(
                                    color: Color(primaryColor),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Payment method : ',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                billingHistory[index]['method'],
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Transaction ID : ',
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                billingHistory[index]['id'],
                                style: TextStyle(
                                    color: Color(secondaryColor),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                  subtitle: Text(
                    'Click to view transaction details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(secondaryColor),
                    ),
                  ),
                  title: Text(
                    billingHistory[index]['date'],
                    style: TextStyle(
                        color: Color(secondaryColor),
                        fontFamily: 'Poppins',
                        fontSize: 17),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
