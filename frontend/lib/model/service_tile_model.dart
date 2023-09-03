import 'package:project/presentation/strings.dart';

class ServiceModel {
  final String imgUrl;
  final String description;
  final double rating;
  final String title;

  ServiceModel(
      {required this.imgUrl,
      required this.description,
      required this.rating,
      required this.title});
}

List<ServiceModel> serviceModelList = [
  ServiceModel(
      imgUrl: AppImageUrls.bulb,
      description: AppStrings.servicesElectricianDescription,
      rating: 0,
      title: AppStrings.servicesElectricianTitle),
  ServiceModel(
      imgUrl: AppImageUrls.fixer,
      description: AppStrings.servicesPlummerDescription,
      rating: 0,
      title: AppStrings.servicesPlummerTitle),
  ServiceModel(
      imgUrl: AppImageUrls.gardener,
      description: AppStrings.servicesGardenerDescription,
      rating: 0,
      title: AppStrings.servicesGardenerTitle),
  ServiceModel(
      imgUrl: AppImageUrls.fixer,
      description: AppStrings.servicesCarpenterDescription,
      rating: 0,
      title: AppStrings.servicesCarpenterTitle),
];
