import 'package:get/get.dart';

import '../../../models/address_model.dart';

class AddressesController extends GetxController {
  int defaultIndex = 1;
  AddressModel? tmp ;
  bool toDelete = false;

  void setDefaultIndex(int newIndex){
    defaultIndex = newIndex;
    update();
  }

  void setAddress(AddressModel address){
    tmp = address;
  }

  void resetAddress(){
    tmp = null;
  }

  void addAddress(AddressModel address){
    addresses.add(address);
    update();
  }

  void setToDelete(bool b){
    toDelete = b;
    update();
  }

  void deleteAddress(int index){
    addresses.removeAt(index);
    update();
  }

  void replaceAddress(int index , AddressModel addressModel){
    addresses.removeAt(index);
    addresses.insert(index, addressModel);
    update();
  }
}