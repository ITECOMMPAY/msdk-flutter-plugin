# MSDK UI Flutter plugin

A new Flutter plugin project.

## Getting Started

Dowload this repository to your PC
Add dependency in your flutter project
```
ecmpplugin:
 path: [PATH_TO_PLUGIN]
```

## Use
### Opening payment form

To open the payment form:
1. Create the `EcmpPaymentInfo` object.

This object must contain the following required parameters:

- `projectId`  (int) — a project identifier assigned by Ecommpay
- `paymentId`  (String) — a payment identifier unique within the project
- `paymentCurrency`  (String) — the payment currency code in the ISO 4217 alpha-3 format
- `paymentAmount`  (int) — the payment amount in the smallest currency units
- `customerId`  (String) — a customer's identifier within the project
- `signature`  (String) — a request signature generated after all required parameters have been specified

```
final paymentInfo = EcmpPaymentInfo(
            projectId: 12312,
            paymentId: "paymentId",
            paymentAmount: 100,
            paymentCurrency: "USD",
          );
```
2. Sign the parameters contained in the `EcmpPaymentInfo` object.

```
final paramsForSignature = await ecmpPlugin.getParamsForSignature(paymentInfo);
paymentInfo.signature = "CALCULATED_SIGNATURE_FROM_YOUR_BACKEND";
```

3. Create the `EcmpPaymentOptions` object that contains the required parameter `actionType` (enum) with the value specifying the required operation type:
- `EcmpActionType.Sale`
- `EcmpActionType.Auth`
- `EcmpActionType.Verify`
- `EcmpActionType.Tokenize`
In addition to the required  `EcmpPaymentInfo`  object and the  `actionType`  parameter, the following example contains several additional parameters including the  `EcmpAdditionalFields`  object with data specified in the fields that are used for collecting customer information.

```
 final paymentOptions = EcmpPaymentOptions(
    actionType: EcmpActionType.Sale,
    paymentInfo: paymentInfo,
    isDarkTheme: false,
    //if need use real service- set EcmpMockModeType.DISABLED
    mockModeType: EcmpMockModeType.SUCCESS,
    //set display mode if need
    screenDisplayModes: [
      EcmpScreenDisplayMode.HIDE_SUCCESS_FINAL_SCREEN
    ],
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
```

4. Create the `EcmpPlugin` object.
```
final ecmpPlugin = EcmpPlugin();
```

6. Open the payment form and handle result.

```
final response = await ecmpPlugin.sdkRun(paymentOptions);
```
