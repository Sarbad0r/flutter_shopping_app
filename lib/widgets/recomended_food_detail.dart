import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/data/api/api_with_http.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/models/dimensions.dart';
import 'package:flutter_11_hour_lesson/widgets/app_icon.dart';
import 'package:flutter_11_hour_lesson/widgets/big_text.dart';
import 'package:flutter_11_hour_lesson/widgets/expandable_text.widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${MediaQuery.of(context).size.height}");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: AppIcon(icon: Icons.clear)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.radius20),
                        topLeft: Radius.circular(Dimension.radius20)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      top: Dimension.height10,
                      bottom: Dimension.height10,
                      left: Dimension.width10),
                  width: double.maxFinite,
                  child: BigText(
                    text: "SliverAppABar",
                    color: Colors.black,
                  )),
            ),
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/food.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.radius20),
                      topLeft: Radius.circular(Dimension.radius20))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimension.width20, right: Dimension.width20),
                    child: ExpandedAbleText(
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                right: Dimension.width20,
                left: Dimension.width20,
                top: Dimension.height10,
                bottom: Dimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconsize: Dimension.iconsize24,
                ),
                BigText(
                  text: "\$12.88 " + "x " + "0",
                  size: Dimension.fontSize26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconsize: Dimension.iconsize24,
                ),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimension.height20,
                          bottom: Dimension.height20,
                          left: Dimension.width20,
                          right: Dimension.width20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20)),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimension.height20,
                        bottom: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimension.radius20)),
                    child: BigText(
                      text: '\$10 | Add to cart',
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
