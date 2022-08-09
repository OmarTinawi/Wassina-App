import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/FAQ/models/question_option.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  int selectedIndex = 2;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "FAQ",
          style: Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
          padding: EdgeInsets.all(0),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding,horizontal: defaultPadding),
            child: Text("Top Questions",
            style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
                itemCount: QuestionOptions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(index==0 ?defaultPadding : defaultPadding/4 , defaultPadding/4, defaultPadding/4, defaultPadding/4),
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: index!=selectedIndex? Colors.transparent:Colors.white,
                      borderRadius: BorderRadius.circular(defaultBorderRadious*2),
                      border: Border.all(color:Colors.white.withOpacity(0.8),width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding , vertical: defaultPadding/2),
                      child: Center(
                        child: Text(
                          QuestionOptions.elementAt(index),
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:blackColor
                          )
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(height: defaultPadding,),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding , vertical:  defaultPadding/2),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(defaultBorderRadious)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding , horizontal: defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "1. How Can I order?",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w800
                                  ),
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.keyboard_arrow_up_rounded,color: blackColor40,))
                              ],
                            ),
                            Text(
                              "You can order easily using our online platform. when you find a product you need, you can add it to cart, then go through the ordering process."
                                  "After the order is ready, you will receive order summary tou your email. Order summary will also be stored to your account.",
                              style: TextStyle(
                                height: 1.5
                              ),
                            ),
                            SizedBox(height: defaultPadding ,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding , vertical:  defaultPadding/2),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(defaultBorderRadious)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2.Can I cancel my order?",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.keyboard_arrow_down_rounded,color: blackColor40,))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding , vertical:  defaultPadding/2),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(defaultBorderRadious)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3.Do you have the product in stock?",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.keyboard_arrow_down_rounded,color: blackColor40,))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding , vertical:  defaultPadding/2),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(defaultBorderRadious)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4.What payment methods can I use?",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.keyboard_arrow_down_rounded,color: blackColor40,))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
