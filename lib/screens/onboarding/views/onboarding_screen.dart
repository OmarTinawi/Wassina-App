import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/components/safe_back.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/onboarding/views/components/dot_indicator.dart';
import 'package:shop/screens/onboarding/views/components/onboard.dart';
import '../../../main.dart';
import '../controllers/onboarding_controller.dart';
import 'components/onbaord_content.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeBack(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: (){
                sharedPreferences!.setInt("skip", 1);
                Get.offAllNamed("/login");
              },
              child: const Text("Skip",style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600 , fontSize: 16),),
            )
          ],
        ),
          body: GetBuilder <OnBoardingController>(
            init: OnBoardingController(),
            builder: (controller)=> Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: controller.pageController,
                          itemCount: demo_data.length,
                          onPageChanged: (newIndex){
                          controller.changeIndex(newIndex);
                          },
                          itemBuilder: (context, index) =>
                              OnboardContent(
                                image: demo_data.elementAt(index).image,
                                tittle: demo_data[index].title,
                                description: demo_data[index].description,
                              )),
                    ),
                  Row(
                    children: [
                      ...List.generate(demo_data.length, (index) =>
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: DotIndicator(isActive: controller.index == index ? true : false,),
                          )
                      ),
                      const Spacer(),
                      controller.index != demo_data.length-1 ?
                      SizedBox(
                        height: 50,
                        width: 50,
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                            onPressed: () {
                            controller.nextPage();
                            },
                            child: const Center(child: Icon(Icons.arrow_forward_ios , color: Colors.black87,) ))
                      )
                          :InkWell(
                        onTap: (){
                          sharedPreferences!.setInt("skip", 1);
                          Get.offAllNamed("/login");
                        },
                            child: Container(
                        decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25)
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.5,
                        child:
                        const Center(
                              child: Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                    "Get Started",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                        )
                      ),
                          )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

