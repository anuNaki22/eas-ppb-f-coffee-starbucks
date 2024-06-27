import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteItemsPage extends StatelessWidget {
  const FavouriteItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  'Favourite Items',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    tileWidget(
                      context,
                      'assets/images/coffee2.png',
                      'Macchiato Short',
                      'Rp 25K',
                    ),
                    tileWidget(
                      context,
                      'assets/images/coffee1.png',
                      'Americano',
                      'Rp 25K',
                    ),
                  ],
                ),
                Row(
                  children: [
                    tileWidget(
                      context,
                      'assets/images/coffee3.png',
                      'Caramel Machiato',
                      'Rp 25K',
                    ),
                    tileWidget(
                      context,
                      'assets/images/coffee4.png',
                      'Espresso',
                      'Rp 25K',
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 5,
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
        ),
      ),
    );
  }

  Widget tileWidget(
      BuildContext context, String image, String title, String price) {
    return Container(
      height: 250.h,
      width: MediaQuery.of(context).size.width / 2.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color(0xFF00643E)
                    : const Color(0xFF1AA570),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/icons/basket.svg',
                  height: 20.h,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Container(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: const Color(0xFF74AA7F),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
