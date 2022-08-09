import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/address_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key, required this.address , required this.defaultAddress}) : super(key: key);
  final AddressModel address;
  final bool defaultAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          border: Border.all(
              width: 1.5,
              color:defaultAddress ? primaryColor : blackColor20),
        ),
        child: ClipRect(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRect(),
                    Text(
                      address.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                          fontWeight: FontWeight.w700,
                          color: defaultAddress
                              ? primaryColor
                              : blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: defaultPadding / 2,
                          ),
                          Text(address.country + ", " + address.city),
                          Text(
                            address.address1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // address.address2 != null
                          //     ? Text(address.address2!)
                          //     : SizedBox(),
                          SizedBox(
                            height: defaultPadding / 4,
                          ),
                          Text(address.name),
                          SizedBox(
                            height: defaultPadding / 4,
                          ),
                          Text(address.phone),
                          // SizedBox(height: defaultPadding/4,),
                          // Text(address.telephone),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: defaultPadding*2,
                      backgroundImage: NetworkImage(
                          address.city=="Damascus"?
                          'https://adhunters.com/uploads/addhunters_chat_2624_1639402581_%D8%B3%D9%8A%D9%81.jpg'
                              :'https://sha3la.s3-accelerate.amazonaws.com/2020/12/51295-f.jpg'
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
