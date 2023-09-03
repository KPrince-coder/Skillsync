import '../presentation/strings.dart';

class SplashItem {
  String label;
  String imgUrl;

  SplashItem({required this.label, required this.imgUrl});
}

List<SplashItem> splashItems = [
  SplashItem(label: AppStrings.appIconString, imgUrl: AppImageUrls.appIcon),
  SplashItem(
      label: AppStrings.fixerSplashScreenString, imgUrl: AppImageUrls.fixer),
  SplashItem(
      label: AppStrings.gardenerSplashScreenString,
      imgUrl: AppImageUrls.gardener),
  SplashItem(
      label: AppStrings.bulbSplashScreenString, imgUrl: AppImageUrls.bulb),
  SplashItem(
      label: AppStrings.techTeamSplashScreenString,
      imgUrl: AppImageUrls.techTeam),
];
