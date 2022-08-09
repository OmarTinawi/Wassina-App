import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../components/network_image_with_loader.dart';
import '../../../constants.dart';
import '../../section/views/section_screen.dart';

List <SectionCard> sections =  [
  SectionCard(
    img: "https://wassina.net/ecdata/stores/YFSVMV7478/image/cache/data/435%D8%A7%D9%84%D9%81%D8%A7%D8%B1%D9%88%D9%82-1000x500-1000x500.jpg",
    name: "Al Farouk Restaurant",
    location: "Damascus",
  ),
  SectionCard(
    img: "https://wassina.net/ecdata/stores/YFSVMV7478/image/cache/data/WhatsApp%20Image%202021-05-23%20at%204.54.57%20PM-1000x500.jpeg",
    name: "Dajajati Restaurant",
    location: "Damascus",
  ),
  SectionCard(
    img: "https://i.ibb.co/0CM9W29/4-1000x500.jpg",
    name: "MAISON SLIK Chocolate",
    location: "Damascus",
  ),
];


class SectionCard extends StatelessWidget {
  final String img , name , location;

  const SectionCard({Key? key, required this.img,required this.name,required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(defaultPadding / 2),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.black26),
            minimumSize: const Size(double.infinity, 250),
            maximumSize: const Size(double.infinity, 250),
            padding: const EdgeInsets.all(8)),
        onPressed: () {
          Get.to(() => SectionScreen(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 500),
              preventDuplicates: false);
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.96,
              child: NetworkImageWithLoader(
                img,
                radius: defaultBorderRadious,
              ),
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      location,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                )),
          ],
        ),
      ),
      // child: OutlinedButton(
      //   style: OutlinedButton.styleFrom(
      //       backgroundColor: Colors.white,
      //       side: BorderSide(color: Colors.black26),
      //       minimumSize: const Size(double.infinity, 270),
      //       maximumSize: const Size(double.infinity, 270),
      //       padding: const EdgeInsets.all(8)),
      //   onPressed: () {
      //     Get.to(()=> SectionScreen() , transition: Transition.fadeIn ,duration: const Duration(milliseconds: 500) , preventDuplicates: false);
      //   },
      //   child: Column(
      //     children: [
      //       AspectRatio(
      //         aspectRatio: 1.87,
      //         child: NetworkImageWithLoader(
      //           ,
      //           radius: defaultBorderRadious,
      //         ),
      //       ),
      //       Expanded(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "Dajajati Restaurant",
      //             style: Theme.of(context).textTheme.titleLarge,
      //           ),
      //           Text(
      //             "Damascus",
      //             style: Theme.of(context).textTheme.titleMedium,
      //           )
      //         ],
      //       )),
      //     ],
      //   ),
      // ),
    );
  }
}

