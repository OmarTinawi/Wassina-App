import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants.dart';

import 'new_address.dart';

class NoAddress extends StatelessWidget {
  const NoAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            "assets/icons/angle-left.svg",
            height: 20,
            color: Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding*2,vertical: defaultPadding*2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: SvgPicture.asset(
                "assets/undraw/undraw_notify_re_65on.svg",
                // height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
             Spacer(),
             Text(
              "No Address found",
              style: Theme.of(context).textTheme.titleLarge,
            ),
             SizedBox(height: defaultPadding/2,),
             const Text(
              "Enabling push notification allows us to send you info about our new products, sales, events and more!"
            ),
            const SizedBox(height: defaultPadding*2,),
            ElevatedButton(
              onPressed: () {
                Get.to(()=> NewAddress() , transition: Transition.downToUp ,duration: const Duration(milliseconds: 500));
              },
              // style: ElevatedButton.styleFrom(
              //   onPrimary: Colors.white,//change text color of button
              // ),
              child: const Text("Add address"),
            ),
          ],
        ),
      ),
    );
  }
}
