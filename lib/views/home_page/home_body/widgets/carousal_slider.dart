import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_favouritrebutton.dart';

class CarousalSlider extends StatelessWidget {
  final double sb;
  const CarousalSlider({super.key, required this.sb});

  @override
  Widget build(BuildContext context) {
    final HomeBodyController controller = Get.put(HomeBodyController());
    return Container(
        height: sb * 3,
        child: CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: true,
              // autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: .7,
              autoPlayCurve: Curves.easeInBack),
          items: [
            1,
            2,
            3,
          ].map((item) {
            return Container(
                width: sb * 3.5,
                height: sb * 3.5,

                //margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    AppDecoration.boxShadow,
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          Imagepath.homedemo,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: sb * 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sb * .08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Name House",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "₹3,40,000",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                IconsaxPlusBold.location,
                                color: Color(0xFFB9B9B9),
                                size: 15,
                              ),
                              Text(
                                "beyorore calicut",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    //  fontSize: 15,
                                    color: Color(0xFFB9B9B9)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Obx(() => GestureDetector(
                                  child: Icon(
                                    controller.isFavorite(item)
                                        ? IconsaxPlusBold.heart
                                        : IconsaxPlusLinear.heart,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                  onTap: () => controller.toggleFavorite(item),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sb * 0,
                    )
                  ],
                ));
          }).toList(),
        ));
  }
}
