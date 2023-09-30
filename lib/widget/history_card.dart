import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.transType,
      required this.beneficiary,
      required this.dataType,
      required this.initialBal,
      required this.finalBal,
      required this.status});
  final String transType;
  final String dataType;
  final String beneficiary;
  final String initialBal;
  final String finalBal;
  final String status;
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
          children: [
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
                    Text('Status'),
                    Text('Transac. Type'),
                    Text('Data Type'),
                    Text('Beneficiary'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(status),
                    Text(transType),
                    Text(dataType),
                    Text(beneficiary),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                
                Text('inital Bal:$initialBal',
                    style: const TextStyle(
                      color: Colors.red,
                    )),
                const Spacer(),
                Text(
                  'final Bal:$finalBal',
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            )
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
