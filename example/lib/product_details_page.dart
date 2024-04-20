import 'package:ecmpplugin/ecmpplugin.dart';
import 'package:ecmpplugin/models/ecmp_additional_field.dart';
import 'package:ecmpplugin/models/ecmp_payment_info.dart';
import 'package:ecmpplugin/models/ecmp_payment_options.dart';
import 'package:ecmpplugin/models/ecmp_recipient_info.dart';
import 'package:ecmpplugin/models/ecmp_recurrent_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final ecmpPlugin = EcmpPlugin();
          //create payment info
          final paymentInfo = EcmpPaymentInfo(
            projectId: 12312,
            paymentId: "paymentId",
            paymentAmount: 100,
            paymentCurrency: "USD",
          );

          //get params for signature
          final paramsForSignature =
              await ecmpPlugin.getParamsForSignature(paymentInfo);
          debugPrint(paramsForSignature);
          //calculate and set signature and set it inti payment info
          paymentInfo.signature = "signature";

          final paymentOptions = EcmpPaymentOptions(
            actionType: EcmpActionType.sale,
            paymentInfo: paymentInfo,
            isDarkTheme: false,
            //if need use real service- set EcmpMockModeType.DISABLED
            mockModeType: EcmpMockModeType.success,
            //set display mode if need
            screenDisplayModes: [EcmpScreenDisplayMode.hideDeclineFinalScreen],
            //set additional fields if need
            additionalFields: [
              EcmpAdditionalField(type: "email", value: "mail@mail.com"),
              EcmpAdditionalField(type: "first_name", value: "firstName"),
            ],
            //set recipient info if need
            recipientInfo: EcmpRecipientInfo(),
            //set recurrent info if need
            recurrentData: EcmpRecurrentData(),
          );

          try {
            final response = await ecmpPlugin.sdkRun(paymentOptions);
            debugPrint(response.toString());
          } on PlatformException {
            debugPrint("PlatformException");
          }
        },
        label: const Text('Purchase'),
      ),
      body: ListView(
        children: [
          // Product image
          Container(
            height: 300,
            color: Colors.grey,
          ),

          // Product title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text(
              'Digital Print Poly Cotton Goa Style Tropical Wear Mens Shirt, Half Sleeves, Magic Cotton',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),

          // Product description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget risus lacus. Curabitur a turpis eros. Cras congue dui nec magna aliquet, quis vehicula libero egestas. Nullam at sollicitudin sem. Sed a augue dictum, tempor mi quis, feugiat neque. Aliquam egestas lectus orci, et rhoncus augue suscipit quis. Ut quis porta magna.'),
          ),

          // Product price
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '\$100',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
