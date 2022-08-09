import 'package:flutter/material.dart';

import '../../../constants.dart';

class ReviewsStars extends StatelessWidget {
  const ReviewsStars({Key? key,required this.rating,required this.reviews,required this.reviews2}) : super(key: key);
  final double rating;
  final int reviews;
  final List reviews2;

  @override
  Widget build(BuildContext context) {
    int fullStar = rating.toInt();
    double minStar = rating - fullStar;
    int grayStart = 5 - fullStar ;
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          border: Border.all(color: Colors.black38, width: 3)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${rating} ",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 22),
                    ),
                    Text(
                      "/5",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 17, height: 2),
                    ),
                  ],
                ),
                Text(
                  "Based on ${reviews} Reviews",
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  children: [
                    ...List.generate(
                        fullStar,
                            (index) => const Icon(
                          Icons.star_rounded,
                          color: warningColor,
                        )),
                    minStar > 0 && minStar <6 ?
                    Icon(
                      Icons.star_half_rounded,
                      color: warningColor,
                    ): minStar > 6 ?
                    Icon(
                      Icons.star_rounded,
                      color: warningColor,
                    ):
                    Icon(Icons.star_outline_rounded,color: warningColor,),
                    ...List.generate(
                        grayStart-1,
                            (index) => const Icon(Icons.star_outline_rounded,color: warningColor,)),

                  ],
                ),
              ],
            ),
          ),
          Spacer(flex: 3,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                reviews2.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Text("${5 - index} star"),
                      SizedBox(width: 5,),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(
                                    defaultBorderRadious / 2)),
                            height: 8,
                            width:
                            MediaQuery.of(context).size.width * 0.25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(defaultBorderRadious/2)
                                )),
                            height: 8,
                            width: reviews !=0 ?
                            MediaQuery.of(context).size.width *
                                0.25 *
                                (reviews2.elementAt(index)/reviews) : 0,
                          ),
                        ],
                      ),
                      SizedBox(width: 5,),
                    ],
                  ),
                ),
              )
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
