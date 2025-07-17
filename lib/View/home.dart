import 'package:crypto_app/View/Components/item2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/coinModel.dart';
import 'Components/item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 253, 225, 112), Color(0xffFBC700)],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: myHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.02, vertical: myHeight * 0.005),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Main Portfolio',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    'Top 10 coins',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Exprimental',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ 6,500.30',
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    padding: EdgeInsets.all(myWidth * 0.02),
                    height: myHeight * 0.05,
                    width: myWidth * 0.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5)),
                    child: Image.asset('assets/icons/5.1.png'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
              child: Row(
                children: [
                  Text(
                    '+162% all time',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: myHeight * 0.02,
            ),
            Container(
              height: myHeight * 0.7,
              width: myWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: myHeight * 0.009),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assets',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.002,
                  ),
                  isRefreshing == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Item(item: coinMarket![index]);
                          },
                        ),
                  SizedBox(height: myHeight*0.002,),
                   Padding(
                     padding:EdgeInsets.symmetric(horizontal:myWidth*0.05),
                     child: Row(
                        children: [
                          Text('Recommend to Buy',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                   ),
                    SizedBox(height: myHeight*0.002,),
                  Expanded(
                    child: Container(
                      // height: myWidth*0.23,
                      width: myWidth,
                      // color: Colors.green,
                      child: ListView.builder(
                        itemCount: coinMarket!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Item2(item: coinMarket![index]);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }
}
