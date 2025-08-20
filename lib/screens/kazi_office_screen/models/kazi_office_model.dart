
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';

class KaziOfficeModel{
  final String imgPath;
  final String name;
  final String location;
  bool isFavourite;

  KaziOfficeModel({required this.imgPath, required this.name, required this.location, this.isFavourite = false});

  static List<KaziOfficeModel> kaziOfficeList = [
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
    KaziOfficeModel(imgPath: AppUrls.kaziOfficePng, name: "Islamic Nikah Service New York", location: 'New York'),
  ];

  void toggleFavourite(){
    isFavourite = !isFavourite;
  }
}