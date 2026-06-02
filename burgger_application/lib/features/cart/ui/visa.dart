import 'package:burgger_application/core/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes_string.dart';
import '../../../core/shared/app_button.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';

class Visa extends StatefulWidget {
  const Visa({super.key});

  @override
  State<Visa> createState() => _VisaState();
}

class _VisaState extends State<Visa> {
  final TextEditingController cardnum = TextEditingController();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      }, // بتخلي الكيبورد لما افتح الفورم ينزل لتحت
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Colors.grey.shade900,
                  isHolderNameVisible: true, // بتخلي الاسم يظهر
                ),

                CreditCardForm(
                  inputConfiguration: InputConfiguration(
                    cardNumberTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    cardHolderTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    expiryDateTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    cvvCodeTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  formKey: _key,

                  cardNumber: cardNumber,

                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true,
                ),
                Gap(54),

                AppButton(
                  buttonText: "Confirm",
                  textStyle: AppTextStyle.font18TextColorExtraBold,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Payment Successful',
                            style: TextStyle(color: Colors.black87),
                          ),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  'Your payment has been processed successfully!',
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: AppColors.primaryColor,
                                disabledForegroundColor: Colors.grey
                                    .withOpacity(0.38),
                              ),
                              onPressed: () {
                                context.pushNamed(RoutesString.root);
                              },
                              child: const Text('Continue'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  buttonWidth: 200.w,
                  buttonHeight: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دي فانكشن بتخليني كل ما اكتب حاجه تظهر في الفيزا

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }
}
