import 'package:carousel_slider/carousel_slider.dart';
import 'package:leqahy/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:leqahy/services/home_services/banners_services.dart';

import '../../../model/home_models/banners_model/oc_banner.dart';

bannerWiget({required dynamic size, required List<OcBanners> banners}) {
  if (banners.length > 0) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: banners.length != 0
              ? Image.network(
                  banners[index].image!,
                )
              : Image.asset('assets/images/logoMark.png'),
        );
      },
      options: CarouselOptions(
          autoPlay: true, enlargeCenterPage: true, height: size.height * 0.25),
    );
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
