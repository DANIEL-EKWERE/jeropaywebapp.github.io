import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import '../backend/provider/user_details/user_details.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({super.key});

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  // UserDetails? baln;
  var balance;
  var refCode;
  var recommended_by;
  List<String> referalsList = [];
  Future<String>? gatherBalance() async {
    final balancex = await UserDetails().getUserAccountBalanace();
    setState(() {
      balance = balancex;
    });
    print("balance is $balance method");
    return balance;
    // return balancex;
  }

  Future<void> gatherBalance1() async {
    final balancex = await UserDetails().getUserAccountBalanace();
    setState(() {
      balance = balancex;
    });
    print("balance is $balance method");
    return balance;
    // return balancex;
  }

  Future<void> getReferree() async {
    final ref_list = await AuthenticationProvider().my_referee;
    setState(() {
      referalsList = ref_list;
    });
    // print("balance is $balance method");
    return balance;
    // return balancex;
  }

  Future<void> gatherRecommendedBy() async {
    final recBy = await DataBaseProvider().getRecommendedBy();
    setState(() {
      recommended_by = recBy;
    });
    print("balance is $balance method");
    //return balance;
    // return balancex;
  }

  Future<String> gatherUserName() async {
    final usernamex = await DataBaseProvider().getUserName();
    setState(() {
      refCode = usernamex;
    });
    print("user name is $refCode method");
    return usernamex;
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   baln = Provider.of<UserDetails>(context, listen: false);
    //   baln!.getUserAccountBalanace();
    // });

    // baln!.getUserAccountBalanace();
    gatherBalance();
    gatherUserName();
    gatherRecommendedBy();
    getReferree();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("earnings page"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text('Confirm Log Out'),
                          content: Text(
                              'Your sure you want to log out of your data bank account?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Future.delayed(
                                  const Duration(seconds: 5),
                                ).then((value) => context
                                    .read<DataBaseProvider>()
                                    .logOut(context));
                                
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text('Log Out sucesful!!!'),
                                //     backgroundColor: Colors.green,
                                //   ),
                                // );

                                successMessage(
                                    context: context,
                                    message: 'Log Out sucesful!!!',
                                    x: Color.fromARGB(255, 15, 175, 20));
                              },
                              child: Text('yes'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: Text('cancel'),
                            ),
                          ]);
                    });

                context.read<DataBaseProvider>().logOut(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder<String>(
          future: gatherBalance(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //  final data = snapshot.data!.docs[0];
            final earnings = snapshot.data;
            // referalsList = ['daniel', 'moses', 'victor', 'emmanuel', 'emeka'];

            // refCode = 'admin';
            // recommended_by = 'admin';

            return Container(
              padding: const EdgeInsets.all(10),
              child: RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return gatherBalance1();
                  // baln!.getUserAccountBalanace();
                  //Future.delayed(const Duration(seconds: 3));
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: const Text("Earnings"),
                              subtitle: Text("NGN $earnings"),
                            ),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Card(
                            child: ListTile(
                              title: const Text("Referal Code"),
                              subtitle: Text(refCode),
                              trailing: IconButton(
                                  onPressed: () {
                                    ClipboardData data =
                                        ClipboardData(text: refCode);

                                    Clipboard.setData(data);

                                    warning(
                                        context: context,
                                        message: "$refCode code copied");
                                  },
                                  icon: const Icon(Icons.copy)),
                            ),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Card(
                            child: ListTile(
                              title: const Text("Recommended By"),
                              subtitle: Text(recommended_by),
                              trailing: IconButton(
                                  onPressed: () {
                                    ClipboardData data =
                                        ClipboardData(text: recommended_by);

                                    Clipboard.setData(data);

                                    warning(
                                        context: context,
                                        message: "$recommended_by copied");
                                  },
                                  icon: const Icon(Icons.copy)),
                            ),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Card(
                              child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "Invite your friends to our app and earn NGN 50 when they register with your referal code",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                child: TextButton(
                                    onPressed: () {
                                      String shareLink =
                                          "Hey! use this app for your data top up,airtime and bill payments and earns bonuses after using my ref code ($refCode) Link:(app link here)";

                                      Share.share(shareLink);
                                    },
                                    child: const Text("Share link")),
                              )
                            ],
                          )),
                          const Divider(
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Referals"),
                                Text("${referalsList.length}"),
                              ],
                            ),
                          ),
                          if (referalsList.isEmpty) const Text("No referrals"),
                          ...List.generate(referalsList.length, (index) {
                            final data = referalsList[index];
                            return Container(
                              height: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text("${index + 1}"),
                                ),
                                title: Text(data),
                              ),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
