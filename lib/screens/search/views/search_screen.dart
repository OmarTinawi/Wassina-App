import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/screens/search/controllers/search_controller.dart';

import '../../../constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: GetBuilder <SearchController>(
          init: SearchController(),
          builder: (controller) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: const SizedBox(),
                  leadingWidth: 0,
                  elevation: 1.1,
                  centerTitle: false,
                  title: Image.asset(
                    "assets/logo/logo2-tittle.png",
                    color: Theme.of(context).iconTheme.color,
                    // height: 20,
                    width: 105,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2, horizontal: defaultPadding),
                    child: Focus(
                      onFocusChange: (f) => controller.setFoucs(f),
                      child: TextFormField(
                        onSaved: (search) {
                          // Email
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        cursorColor: primaryColor.withOpacity(0.1),
                        decoration: InputDecoration(
                          filled: false,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadious),
                              borderSide: BorderSide(
                                color: blackColor40,
                                width: 1,
                              )),
                          hintText: "Find something...",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              height: 26,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                controller.foucs?
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Searches",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            TextButton(onPressed: () {}, child: Text("Clear All"))
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Clock.svg",
                                  height: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(0.3),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "White Shirt",
                                  style: TextStyle(color: blackColor80),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.clear,
                                      size: 16,
                                      color: blackColor40,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Clock.svg",
                                  height: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(0.3),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Gray Dress",
                                  style: TextStyle(color: blackColor80),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.clear,
                                      size: 16,
                                      color: blackColor40,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Clock.svg",
                                  height: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color!
                                      .withOpacity(0.3),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Blue Short",
                                  style: TextStyle(color: blackColor80),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.clear,
                                      size: 16,
                                      color: blackColor40,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ):
                    SliverToBoxAdapter(

                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
