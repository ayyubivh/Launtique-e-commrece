import 'package:e_shoppie/core/global_variables.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/core/utils.dart';
import 'package:e_shoppie/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../common/custom_textfeild.dart';
import '../../../core/colors.dart';
import '../services/address_Services.dart';

class Addrresscreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const Addrresscreen({super.key, required this.totalAmount});

  @override
  State<Addrresscreen> createState() => _AddrresscreenState();
}

class _AddrresscreenState extends State<Addrresscreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  String addressToBeUsed = "";
  final AddressServices addressServies = AddressServices();

  String defaultGooglePay = '''{
  "provider": "google_pay",
  "data": {
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    "allowedPaymentMethods": [
      {
        "type": "CARD",
        "tokenizationSpecification": {
          "type": "PAYMENT_GATEWAY",
          "parameters": {
            "gateway": "example",
            "gatewayMerchantId": "gatewayMerchantId"
          }
        },
        "parameters": {
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          "billingAddressRequired": true,
          "billingAddressParameters": {
            "format": "FULL",
            "phoneNumberRequired": true
          }
        }
      }
    ],
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      "merchantName": "Example Merchant Name"
    },
    "transactionInfo": {
      "countryCode": "US",
      "currencyCode": "USD"
    }
  }
}''';

  // String defaultGooglePay;
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  // void onGooglePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServies.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServies.placeOrder(
  //       context: context,
  //       address: addressToBeUsed,
  //       totalSum: double.parse(widget.totalAmount));
  // }
  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServies.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServies.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
    onGooglePayResult(addressFromProvider);
  }

  List<PaymentItem> paymentItems = [];
  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(
      amount: widget.totalAmount,
      label: 'Total Amount',
      status: PaymentItemStatus.final_price,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
        backgroundColor: kwhite.withOpacity(0.2),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (address.isNotEmpty)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            address,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                Form(
                  key: _addressFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: flatBuildingController,
                        hinTtext: 'Flat, House no, Building',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: areaController,
                        hinTtext: 'Area, Street',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: pincodeController,
                        hinTtext: 'Pincode',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: cityController,
                        hinTtext: 'Town/City',
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // GooglePayButton(
                //   onPressed: () => payPressed(address),
                //   // paymentConfigurationAsset: 'gpay.json',
                //   paymentConfiguration:
                //       // PaymentConfiguration.fromJsonString(defaultGooglePay),
                //   onPaymentResult: onGooglePayResult,
                //   paymentItems: paymentItems,
                //   height: 50,
                //   // style: GooglePayButtonStyle.black,
                //   type: GooglePayButtonType.buy,
                //   margin: const EdgeInsets.only(top: 15),
                //   loadingIndicator: const Center(
                // child: CircularProgressIndicator(),
                // ),
                // ),
                GooglePayButton(
                  type: GooglePayButtonType.buy,
                  width: double.infinity,
                  height: 50,
                  paymentConfiguration:
                      PaymentConfiguration.fromJsonString(defaultGooglePay),
                  onPaymentResult: onGooglePayResult,
                  paymentItems: paymentItems,
                  margin: const EdgeInsets.only(top: 15),
                  loadingIndicator:
                      const Center(child: CircularProgressIndicator()),
                  onPressed: () => payPressed(address),
                ),
                kHeight10,
                InkWell(
                  child: Container(
                    color: kwhite,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'cash on delivery',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    payPressed(address);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
