import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/address_model.dart';
import 'package:shop/screens/addresses/components/address_form.dart';
import 'package:shop/screens/addresses/controller/addresses_controller.dart';

class NewAddress extends StatefulWidget {
  NewAddress({Key? key}) : super(key: key);

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    AddressesController addressesController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New address",
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
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding , vertical: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: AddressForm(formKey: _addressKey),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Set default address",
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  CupertinoSwitch(
                      value: isDefault,
                      onChanged: (value){
                        setState(() {
                          isDefault = value;
                        });
                      },
                    activeColor: primaryColor,
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: defaultPadding*2,),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding , vertical: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: (){
                  if (_addressKey.currentState!.validate()) {
                    _addressKey.currentState!.save();
                    if(isDefault){
                      addressesController.setDefaultIndex(addresses.length-1);
                    }
                    Get.back();
                  }
                },
                child: const Text(
                  "Save address"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
