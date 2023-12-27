import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:databank/backend/models/api_models.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final AirtimePurchaseModel? airtimePurchaseModel;

  TransactionDetailsScreen({required this.airtimePurchaseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Receipt'),
      ),
      body: SingleChildScrollView(
        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height * 40,
                        // color:
                        //     kYellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Transaction Receipt'),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Details:'),
                                  FittedBox(
                                      child: Text(
                                          airtimePurchaseModel!.data!.detail!,
                                          style: kEncodeSansBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                1.5,
                                          )))
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Date and Time:'),
                                  Text(airtimePurchaseModel!.data!.dateAndTime!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Old Balance:'),
                                  Text(airtimePurchaseModel!.data!.oldBalance!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('New Balance:'),
                                  Text(airtimePurchaseModel!.data!.newBalance!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Phone:'),
                                  Text(airtimePurchaseModel!.data!.phoneNumber!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Status:'),
                                  Text(airtimePurchaseModel!.data!.status!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Amount:'),
                                  Text(airtimePurchaseModel!.data!.amount!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Type:'),
                                  Text(airtimePurchaseModel!.data!.type!)
                                ]),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                            Divider(),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                           
                          ],
                        ),
                      ),
                    ),
      ),
    );
  }
}
