import 'package:flutter/material.dart';
import 'package:crypto_app/View/navBar.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/image/1.gif'),
             const Column(
               children: [
                Text(
                   'The Future',
                   style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                 ),
                 Text(
                   'Learn more about cryptocurrency, look to',
                   style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.normal,
                       color: Colors.grey),
                 ),
                 Text(
                   'the future in Crypto',
                   style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.normal,
                       color: Colors.grey),
                 ),
               ],
             ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: myWidth * 0.14),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFBC700),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: myWidth * 0.05,
                      vertical: myHeight * 0.013
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create PORTFOLIO',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          RotationTransition(turns: AlwaysStoppedAnimation(310 / 360),
                            child: Icon(Icons.arrow_forward_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
