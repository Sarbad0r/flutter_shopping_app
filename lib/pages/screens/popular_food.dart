import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';
import 'package:flutter_11_hour_lesson/widgets/app_icon.dart';
import 'package:flutter_11_hour_lesson/widgets/expandable_text.widget.dart';

import '../../models/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFood extends StatelessWidget {
  const PopularFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: Dimension.bottomNavContainerSize,
          padding: EdgeInsets.only(
              top: Dimension.height30,
              bottom: Dimension.height30,
              left: Dimension.width20,
              right: Dimension.width20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimension.radius20 * 2,
                  ),
                  topRight: Radius.circular(
                    Dimension.radius20 * 2,
                  ))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.radius20)),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(
                    text: '0',
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  bottom: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimension.radius20)),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            )
          ]),
        ),
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimension.popularFoodImgSize,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/restaurant-chinese.jpg'))),
                )),
            Positioned(
                top: Dimension.height30,
                left: Dimension.width20,
                right: Dimension.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        iconColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        iconColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.radius30),
                        topRight: Radius.circular(Dimension.radius30)),
                    color: Colors.white,
                  ),
                  height: Dimension.bottomStackPopular,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimension.width10,
                        top: Dimension.height20,
                        right: Dimension.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Nutritious fruit meal in China"),
                            SizedBox(
                              height: Dimension.height10,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: AppColors.mainColor,
                                            size: Dimension.iconSize16,
                                          )),
                                ),
                                SmallText(text: "With Chinese characteristics"),
                              ],
                            ),
                            SizedBox(
                              height: Dimension.height20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: 'Normal',
                                    color: Colors.black54,
                                    iconColor: AppColors.iconColor1),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: '1.7km',
                                    color: Colors.black54,
                                    iconColor: AppColors.iconColor2),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: '1.7km',
                                    color: Colors.black54,
                                    iconColor: AppColors.iconColor2)
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        BigText(text: "Introduce"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandedAbleText(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
