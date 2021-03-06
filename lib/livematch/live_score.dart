import 'package:cricket/fun/fun.dart';
import 'package:cricket/livematch/livematch.dart';
import 'package:cricket/login/account.dart';
import 'package:cricket/login/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import '../login/login_page/profile.dart';
import 'serieslist.dart';

class live_score extends StatefulWidget {
  const live_score({Key? key}) : super(key: key);

  @override
  State<live_score> createState() => _live_scoreState();
}

class _live_scoreState extends State<live_score> {
  set() async {
    await fun.getdata();
    setState(() {});
    await fun.getdata_2();
    setState(() {});
  }

  @override
  void initState() {
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 180, 137),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 0, 180, 137),
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'asstes/green_logo.png',
                height: 100,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: account.login == false
                    ? Center(
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 180, 137),
                                ),
                              ]),
                          child: InkWell(
                            onTap: () => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                )
                                .then((value) => {setState(() {})}),
                            child: Center(
                              child: Text(
                                'Log in',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 180, 137),
                            ),
                          ]),
                          child: IconButton(
                            onPressed: () => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                      builder: (context) => profile()),
                                )
                                .then((value) => {setState(() {})}),
                            icon: Center(
                              child: Icon(Icons.person_rounded),
                            ),
                          ),
                        ),
                      ),
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              tabs: [
                Tab(
                  text: 'Live-Match',
                ),
                Tab(
                  text: 'Upcoming-Series',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              live_match(),
              myapp(),
            ],
          )),
    ));
  }
}
