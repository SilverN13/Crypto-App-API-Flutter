import 'package:flutter/material.dart';

class Item2 extends StatelessWidget {
  var item;
   Item2({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:EdgeInsets.symmetric(vertical: myHeight*0.02,horizontal:myWidth*0.03),
      child: Container(
        padding:EdgeInsets.symmetric(vertical: myHeight*0.02,horizontal:myWidth*0.03),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: myHeight*0.03,
                child: Image.network(item.image),
            ),
            SizedBox(height: myHeight*0.02,),
            Text(item.id,style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: myHeight*0.002,),
            Row(
              children: [
                Text(
                  '\$'+ item.priceChange24H.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: myWidth * 0.03,
                ),
                Text(
                  item.marketCapChangePercentage24H.toStringAsFixed(2)+'%',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: item.marketCapChangePercentage24H >= 0
                          ? Colors.green
                          : Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
