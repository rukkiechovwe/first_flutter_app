import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Container(
      padding: const EdgeInsets.all(16.0),
      height: double.infinity,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      'Cake',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5,
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: const Text(
                        'Enjoy the taste of this sliced cake',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5,
                          fontSize: 18,
                        ),
                      ))
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                        // mainAxisSize: ,

                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.star,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.star,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.star,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.star,
                                color: Colors.black,
                              ))
                        ]),
                    Text('170 Reviews')
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cake.jpeg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          )
        ],
      ),
    ))));
  }
}
