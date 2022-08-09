import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/address_model.dart';
import 'package:shop/screens/addresses/controller/addresses_controller.dart';
import 'package:shop/screens/addresses/views/no_address_screen.dart';

import '../components/address_card.dart';
import 'edit_address.dart';
import 'new_address.dart';

class Address extends StatelessWidget {
  Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int defaultIndex = 0;
    SlidableController slidableController = new SlidableController();

    return GetBuilder<AddressesController>(
        init: AddressesController(),
        builder: (addressesController) => addresses.length > 0
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Address",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/angle-left.svg",
                      height: 20,
                      color: Theme.of(context).iconTheme.color!.withOpacity(
                          Theme.of(context).brightness == Brightness.dark
                              ? 0.3
                              : 1),
                    ),
                  ),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: blackColor20,
                        radius: Radius.circular(defaultBorderRadious),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => NewAddress(),
                                transition: Transition.downToUp,
                                duration: const Duration(milliseconds: 500));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.all(defaultPadding),
                            onPrimary: primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Location.svg",
                                height: 25,
                              ),
                              SizedBox(
                                width: defaultPadding / 2,
                              ),
                              Text(
                                "Add new address",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        // itemCount: 1,
                        itemCount: addresses.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: defaultPadding / 2,
                              horizontal: defaultPadding),
                          child: Slidable(
                            controller: slidableController,
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            closeOnScroll: true,
                            key: Key(index.toString()),
                            actions: [
                              FloatingActionButton(
                                onPressed: () {
                                  addressesController.setDefaultIndex(index);
                                },
                                backgroundColor:
                                    addressesController.defaultIndex == index
                                        ? primaryColor
                                        : blackColor40,
                                child: SvgPicture.asset(
                                  "assets/icons/star-light.svg",
                                  height: 27,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            secondaryActions: [
                              FloatingActionButton(
                                heroTag: "delete",
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierColor:
                                          blackColor80.withOpacity(0.8),
                                      builder: (_) => Dialog(
                                            insetPadding:
                                                EdgeInsets.all(defaultPadding),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      defaultBorderRadious),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          defaultBorderRadious)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    defaultPadding * 1.5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "Delete Address",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    SizedBox(
                                                      height: defaultPadding,
                                                    ),
                                                    Text(
                                                      "Are you sure want to delete address ",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: blackColor80,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          defaultPadding / 2,
                                                    ),
                                                    Text(
                                                      "\"" +
                                                          addresses
                                                              .elementAt(index)
                                                              .title +
                                                          "\"",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: blackColor80,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: defaultPadding,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          blackColor40,
                                                                      shadowColor:
                                                                          Colors
                                                                              .black,
                                                                      padding: EdgeInsets.all(
                                                                          defaultPadding /
                                                                              4),
                                                                      onPrimary:
                                                                          blackColor80,
                                                                    ),
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall!
                                                                          .copyWith(
                                                                              color: Colors.white),
                                                                    ))),
                                                        SizedBox(
                                                          width: defaultPadding,
                                                        ),
                                                        Expanded(
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      addressesController
                                                                          .deleteAddress(
                                                                              index);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          errorColor,
                                                                      shadowColor:
                                                                          Colors
                                                                              .black,
                                                                      padding: EdgeInsets.all(
                                                                          defaultPadding /
                                                                              4),
                                                                      onPrimary:
                                                                          Color(
                                                                              0xff720000),
                                                                    ),
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleSmall!
                                                                          .copyWith(
                                                                              color: Colors.white),
                                                                    ))),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                },
                                backgroundColor: errorColor,
                                child: SvgPicture.asset(
                                  "assets/icons/trash.svg",
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                              FloatingActionButton(
                                heroTag: "edit",
                                onPressed: () {
                                  Get.to(() => EditAddress(index: index),
                                      transition: Transition.downToUp,
                                      preventDuplicates: true,
                                      duration:
                                          const Duration(milliseconds: 500));
                                },
                                backgroundColor: purpleColor,
                                child: SvgPicture.asset(
                                  "assets/icons/Edit Square.svg",
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            child: AddressCard(
                              address: addresses.elementAt(index),
                              defaultAddress:
                                  addressesController.defaultIndex == index,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
              )
            : NoAddress());
  }
}
