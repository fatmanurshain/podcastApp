import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:podcast_app/models/Podcast_Cart_Model.dart';
import 'package:podcast_app/shared/constants/strings.dart';

class HomeView extends StatelessWidget {
  // Dinamik kartların listesi
  final List<Podcast> podcasts = [
    Podcast(
        image: 'assets/images/photo1.png',
        title: AppStrings.musicTitle1,
        subtitle: AppStrings.musicSubtitle1,
        audioPath: 'assets/sounds/sound1.mp3'),
    Podcast(
        image: 'assets/images/photo2.png',
        title: AppStrings.musicTitle2,
        subtitle: AppStrings.musicSubtitle2,
        audioPath: 'assets/sounds/sound1.mp3'),
    Podcast(
        image: 'assets/images/photo3.png',
        title: AppStrings.musicTitle3,
        subtitle: AppStrings.musicSubtitle3,
        audioPath: 'assets/sounds/sound1.mp3'),
    Podcast(
        image: 'assets/images/photo4.png',
        title: AppStrings.musicTitle4,
        subtitle: AppStrings.musicSubtitle4,
        audioPath: 'assets/sounds/sound1.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.podcesTitle,
          style: TextStyle(
              fontFamily: "PoppinsBold", fontSize: 18.sp, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffix: Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(37, 40, 54, 100),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  print("Search input: $value");
                },
              ),
            ),

            SizedBox(height: 16.h),

            Text(
              AppStrings.onboardingHeadline,
              style: TextStyle(fontFamily: "InterBold", fontSize: 24.sp),
            ),

            // Kategoriler
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(label: 'All', isSelected: true),
                  CategoryChip(label: 'Life'),
                  CategoryChip(label: 'Comedy'),
                  CategoryChip(label: 'Tech'),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                ),
                itemCount: podcasts.length,
                itemBuilder: (context, index) {
                  final podcast = podcasts[index];
                  return PodcastCard(
                    image: podcast.image,
                    title: podcast.title,
                    subtitle: podcast.subtitle,
                    audioPath: 'assets/sounds/sound1.mp3',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CategoryChip Widget (ScreenUtil ile)
class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(fontSize: 14.sp),
        ),
        selected: isSelected,
        onSelected: (selected) {
          print('Selected category: $label');
        },
      ),
    );
  }
}

// PodcastCard Widget
class PodcastCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String audioPath;

  const PodcastCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.audioPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/player', arguments: {
          'title': title,
          'image': image,
          'subtitle': subtitle,
          'audioPath': audioPath,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(image, fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontFamily: "InterBold"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                    fontFamily: "InterMedium", color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
