import 'package:flutter/material.dart';

import '../../../constants.dart';

class UpgradeCard extends StatelessWidget {
  const UpgradeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadious),
        color: primaryColor,
      ),
      height: MediaQuery.of(context).size.height*0.21,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2,),
                Text(
                  "Starter Plan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: defaultPadding/4,),
                Text(
                  "Upgrade to unlock all features!",
                  style: TextStyle(
                      color: Colors.black45
                  ),
                ),
                Spacer(flex: 2,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                      color: Colors.white
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding/2 , horizontal: defaultPadding/1.5),
                      child: Text(
                        "Upgrade",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 15
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2,)
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Center(
                child: Image.asset(
                  "assets/images/upgrade.png",
                  height: MediaQuery.of(context).size.height*0.15,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
