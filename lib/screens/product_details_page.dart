import 'package:coffee_starbucks/screens/mybasket_page.dart';
import 'package:coffee_starbucks/widgets/button.dart';
import 'package:coffee_starbucks/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 0;
  String sugarLevel = 'Normal'; // Nilai awal untuk radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(context),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Macchiato Short',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'Rp 25K',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: const Color(0xFF74AA7F),
                                ),
                      ),
                    ],
                  ),
                  Text(
                    'Macchiato Short',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Sugar Level',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Normal',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      Radio<String>(
                        value: 'Normal',
                        groupValue: sugarLevel,
                        onChanged: (value) {
                          setState(() {
                            sugarLevel = value!;
                          });
                        },
                        activeColor: const Color(0xFF74AA7F),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Less Sugar',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      Radio<String>(
                        value: 'Less Sugar',
                        groupValue: sugarLevel,
                        onChanged: (value) {
                          setState(() {
                            sugarLevel = value!;
                          });
                        },
                        activeColor: const Color(0xFF74AA7F),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Special Instructions',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        '  Optional',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const SizedBox(
                    height: 100,
                    child: CustomTextFieldWidget(
                        hintText: 'E.g No onions, please',
                        isPasswordField: false),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            quantity--;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xFF74AA7F),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          '$quantity',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xFF74AA7F),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ButtonWidget(
                    text: 'Add to Basket',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyBasketPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/coffee2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 40,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF1AA570).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 20.h,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1AA570).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
