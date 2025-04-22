import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.1.234:8000/api';

  Future<List<Site>> fetchSites() async {
    final response = await http.get(Uri.parse('$baseUrl/sites'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> siteList = jsonResponse['sites'];
      return siteList.map((json) => Site.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sites');
    }
  }

  Future<Site> fetchSiteById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/sites/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Site.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load site with id: $id');
    }
  }
}

class Site {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String? externalLink;
  final String? phone1;
  final String? phone2;
  final String? email;
  final String city;
  final SiteType siteType;
  final List<Gallery> galleries;
  final List<OpenHour> openHours;
  final List<ChModel> chModels;

  Site({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    this.externalLink,
    this.phone1,
    this.phone2,
    this.email,
    required this.city,
    required this.siteType,
    required this.galleries,
    required this.openHours,
    required this.chModels,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      externalLink: json['external_link'],
      phone1: json['phone_1'],
      phone2: json['phone_2'],
      email: json['email'],
      city: json['city'],
      siteType: SiteType.fromJson(json['site_type']),
      galleries: (json['galleries'] as List)
          .map((gallery) => Gallery.fromJson(gallery))
          .toList(),
      openHours: (json['open_hours'] as List)
          .map((hour) => OpenHour.fromJson(hour))
          .toList(),
      chModels: (json['ch_models'] as List)
          .map((model) => ChModel.fromJson(model))
          .toList(),
    );
  }
}

class SiteType {
  final int id;
  final String name;

  SiteType({
    required this.id,
    required this.name,
  });

  factory SiteType.fromJson(Map<String, dynamic> json) {
    return SiteType(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Gallery {
  final int id;
  final String path;

  Gallery({
    required this.id,
    required this.path,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'],
      path: json['path'],
    );
  }
}

class OpenHour {
  final int id;
  final String day;
  final String openingTime;
  final String closingTime;

  OpenHour({
    required this.id,
    required this.day,
    required this.openingTime,
    required this.closingTime,
  });

  factory OpenHour.fromJson(Map<String, dynamic> json) {
    return OpenHour(
      id: json['id'],
      day: json['day'],
      openingTime: json['opening_time'],
      closingTime: json['closing_time'],
    );
  }
}

class ChModel {
  final int id;
  final String name;
  final String description;
  final String path;
  final String? thumbnail;
  final int userId;
  final String? originDate;
  final String? originCountry;
  final String? currentLocation;
  final int? categoryId;
  final int? conditionId;
  final int? functionId;
  final int? materialId;
  final int? usageContextId;
  final String? scanningMethod;
  final String? scanDate;
  final String? softwareUsed;

  ChModel({
    required this.id,
    required this.name,
    required this.description,
    required this.path,
    this.thumbnail,
    required this.userId,
    this.originDate,
    this.originCountry,
    this.currentLocation,
    this.categoryId,
    this.conditionId,
    this.functionId,
    this.materialId,
    this.usageContextId,
    this.scanningMethod,
    this.scanDate,
    this.softwareUsed,
  });

  factory ChModel.fromJson(Map<String, dynamic> json) {
    return ChModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      path: json['path'],
      thumbnail: json['thumbnail'],
      userId: json['user_id'],
      originDate: json['origin_date'],
      originCountry: json['origin_country'],
      currentLocation: json['current_location'],
      categoryId: json['category_id'],
      conditionId: json['condition_id'],
      functionId: json['function_id'],
      materialId: json['material_id'],
      usageContextId: json['usage_context_id'],
      scanningMethod: json['scanning_method'],
      scanDate: json['scan_date'],
      softwareUsed: json['software_used'],
    );
  }
}
