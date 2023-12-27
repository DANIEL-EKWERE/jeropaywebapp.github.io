import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
       SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return  Scaffold(
      appBar: AppBar(
        title: Text('About DATABANK',style:TextStyle(color:kWhite),),
        centerTitle: true,
        iconTheme: IconThemeData(color: kWhite),
flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff6A6A6A),
              Color.fromARGB(255, 79, 78, 78),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),),
          Padding(
            padding: const EdgeInsets.only(left:24,right:24,bottom:50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Welcome to DATABANK',style: kEncodeSansSemiBold.copyWith(color: kYellow,fontSize: sizeHorizontal*2.5),),
            SizedBox(height: sizeVertical*2,),
            Text('Data bank is a registered telecommunication company that offers instant Data top-up,Airtime Recharge,Cable TV subscription (DSTV,GOtv,StarTimes),Electricity Bill Payment,Airtime to Cash Bulk SMS,Data Card Pin generation and more. \n we have one of the best telecommunication platforms in Nigeria with a detailed API documentation, swift multi-wallet funding channels and a robust customer service unit.'),
            SizedBox(height: sizeVertical*3,),
            Text('We are automated:',style: kEncodeSansSemiBold.copyWith(color: kYellow,fontSize: sizeHorizontal*2.5),),
            SizedBox(height: sizeVertical*2,),
            Text('we use cutting-edge technology to run our platform. Our delivery and wallet funding are all automated and any service requested is delivered promptly.'),
            SizedBox(height: sizeVertical*3,),
            Text('we are reliable:',style: kEncodeSansSemiBold.copyWith(color: kYellow,fontSize: sizeHorizontal*2.5),),
            SizedBox(height: sizeVertical*2,),
            Text('Our platform is fully optimized plaform that is credible and reliable. you get 100% value for any transaction you carry out with us.'),
            SizedBox(height: sizeVertical*3,),
            Text('we are safe and secure:',style: kEncodeSansSemiBold.copyWith(color: kYellow,fontSize: sizeHorizontal*2.5),),
            SizedBox(height: sizeVertical*2,),
            Text('Our system ensures that you are fully in control of your wallet, you determine when money leaves and stays in your wallet.'),
            SizedBox(height: sizeVertical*3,),
            Text('we are always here',style: kEncodeSansSemiBold.copyWith(color: kYellow,fontSize: sizeHorizontal*2.5),),
            SizedBox(height: sizeVertical*2,),
            Text('Our customer service is a click away. We  respond to our client needs promptly.'),
            // SizedBox(height: sizeVertical*5,)
              ]
            ),
          )
        ],
      ),
    );
  }
}