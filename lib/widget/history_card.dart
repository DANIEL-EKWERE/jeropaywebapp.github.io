import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

class PriceListCard extends StatelessWidget {
  const PriceListCard({
    super.key,
    required this.fiveHundredMb,
    required this.oneGb,
    required this.twoGb,
    required this.threeGb,
    required this.fiveGb,
    required this.tenGb,
    required this.image,
  });
  final String fiveHundredMb;
  final String oneGb;
  final String twoGb;
  final String threeGb;
  final String fiveGb;
  final String tenGb;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: kBrown.withOpacity(0.2),
              spreadRadius: -2.0,
              blurRadius: 10.0,
              offset: const Offset(0, 5),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('500 mb'),
                    Text('1GB'),
                    Text('2GB'),
                    Text('3GB'),
                    Text('5GB'),
                    Text('10GB'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(fiveHundredMb),
                    Text(oneGb),
                    Text(twoGb),
                    Text(threeGb),
                    Text(fiveGb),
                    Text(tenGb),
                  ],
                ),
              ],
            ),
            // Row(
            //   children: [

            //     Text('inital Bal:$initialBal',
            //         style: const TextStyle(
            //           color: Colors.red,
            //         )),
            //     const Spacer(),
            //     Text(
            //       'final Bal:$finalBal',
            //       style: const TextStyle(
            //         color: Colors.green,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

// historyDataCard(transType1, dataType1, beneficiary1) {
//  final  String transType = transType1;
//   final String dataType = dataType1;
//   final String beneficiary = beneficiary1;
//   return Container(
//     width: double.infinity,
//     height: 20,
// child: Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//   const Padding(
//     padding: EdgeInsets.symmetric(horizontal: 24),
//     child: Column(
//       mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
//       children: [
//         Text('Transac. Type'),
//         Text('Data Type'),
//         Text('Beneficiary'),
//       ],
//     ),
//   ),
//   Column(
//     children: [
//       Text(transType),
//       Text(dataType),
//       Text(beneficiary),
//     ],
//   ),
// ],
// ),
//   );
// }
