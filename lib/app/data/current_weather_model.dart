import 'dart:convert';

CurrentWeatherModel currentWeatherModelFromJson(String str) => CurrentWeatherModel.fromJson(json.decode(str));
String currentWeatherModelToJson(CurrentWeatherModel data) => json.encode(data.toJson());
class CurrentWeatherModel {
  CurrentWeatherModel({
      this.latitude, 
      this.longitude, 
      this.generationtimeMs, 
      this.utcOffsetSeconds, 
      this.timezone, 
      this.timezoneAbbreviation, 
      this.elevation, 
      this.currentUnits, 
      this.current, 
      this.hourlyUnits, 
      this.hourly, 
      this.dailyUnits, 
      this.daily,});

  CurrentWeatherModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null ? CurrentUnits.fromJson(json['current_units']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    dailyUnits = json['daily_units'] != null ? DailyUnits.fromJson(json['daily_units']) : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['generationtime_ms'] = generationtimeMs;
    map['utc_offset_seconds'] = utcOffsetSeconds;
    map['timezone'] = timezone;
    map['timezone_abbreviation'] = timezoneAbbreviation;
    map['elevation'] = elevation;
    if (currentUnits != null) {
      map['current_units'] = currentUnits?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    if (hourlyUnits != null) {
      map['hourly_units'] = hourlyUnits?.toJson();
    }
    if (hourly != null) {
      map['hourly'] = hourly?.toJson();
    }
    if (dailyUnits != null) {
      map['daily_units'] = dailyUnits?.toJson();
    }
    if (daily != null) {
      map['daily'] = daily?.toJson();
    }
    return map;
  }

}

Daily dailyFromJson(String str) => Daily.fromJson(json.decode(str));
String dailyToJson(Daily data) => json.encode(data.toJson());
class Daily {
  Daily({
      this.time, 
      this.temperature2mMax, 
      this.weathercode, 
      this.windspeed10mMax, 
      this.rainSum,});

  Daily.fromJson(dynamic json) {
    time = json['time'] != null ? json['time'].cast<String>() : [];
    temperature2mMax = json['temperature_2m_max'] != null ? json['temperature_2m_max'].cast<num>() : [];
    weathercode = json['weathercode'] != null ? json['weathercode'].cast<num>() : [];
    windspeed10mMax = json['windspeed_10m_max'] != null ? json['windspeed_10m_max'].cast<num>() : [];
    rainSum = json['rain_sum'] != null ? json['rain_sum'].cast<num>() : [];
  }
  List<String>? time;
  List<num>? temperature2mMax;
  List<num>? weathercode;
  List<num>? windspeed10mMax;
  List<num>? rainSum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temperature_2m_max'] = temperature2mMax;
    map['weathercode'] = weathercode;
    map['windspeed_10m_max'] = windspeed10mMax;
    map['rain_sum'] = rainSum;
    return map;
  }

}

DailyUnits dailyUnitsFromJson(String str) => DailyUnits.fromJson(json.decode(str));
String dailyUnitsToJson(DailyUnits data) => json.encode(data.toJson());
class DailyUnits {
  DailyUnits({
      this.time, 
      this.temperature2mMax, 
      this.weathercode, 
      this.windspeed10mMax, 
      this.rainSum,});

  DailyUnits.fromJson(dynamic json) {
    time = json['time'];
    temperature2mMax = json['temperature_2m_max'];
    weathercode = json['weathercode'];
    windspeed10mMax = json['windspeed_10m_max'];
    rainSum = json['rain_sum'];
  }
  String? time;
  String? temperature2mMax;
  String? weathercode;
  String? windspeed10mMax;
  String? rainSum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temperature_2m_max'] = temperature2mMax;
    map['weathercode'] = weathercode;
    map['windspeed_10m_max'] = windspeed10mMax;
    map['rain_sum'] = rainSum;
    return map;
  }

}

Hourly hourlyFromJson(String str) => Hourly.fromJson(json.decode(str));
String hourlyToJson(Hourly data) => json.encode(data.toJson());
class Hourly {
  Hourly({
      this.time, 
      this.temperature2m, 
      this.weatherCode,});

  Hourly.fromJson(dynamic json) {
    time = json['time'] != null ? json['time'].cast<String>() : [];
    temperature2m = json['temperature_2m'] != null ? json['temperature_2m'].cast<num>() : [];
    weatherCode = json['weather_code'] != null ? json['weather_code'].cast<num>() : [];
  }
  List<String>? time;
  List<num>? temperature2m;
  List<num>? weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temperature_2m'] = temperature2m;
    map['weather_code'] = weatherCode;
    return map;
  }

}

HourlyUnits hourlyUnitsFromJson(String str) => HourlyUnits.fromJson(json.decode(str));
String hourlyUnitsToJson(HourlyUnits data) => json.encode(data.toJson());
class HourlyUnits {
  HourlyUnits({
      this.time, 
      this.temperature2m, 
      this.weatherCode,});

  HourlyUnits.fromJson(dynamic json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    weatherCode = json['weather_code'];
  }
  String? time;
  String? temperature2m;
  String? weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temperature_2m'] = temperature2m;
    map['weather_code'] = weatherCode;
    return map;
  }

}

Current currentFromJson(String str) => Current.fromJson(json.decode(str));
String currentToJson(Current data) => json.encode(data.toJson());
class Current {
  Current({
      this.time, 
      this.interval, 
      this.temperature2m, 
      this.relativeHumidity2m, 
      this.isDay, 
      this.rain, 
      this.showers, 
      this.snowfall, 
      this.cloudCover, 
      this.windSpeed10m, 
      this.weatherCode,});

  Current.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    isDay = json['is_day'];
    rain = json['rain'];
    showers = json['showers'];
    snowfall = json['snowfall'];
    cloudCover = json['cloud_cover'];
    windSpeed10m = json['wind_speed_10m'];
    weatherCode = json['weather_code'];
  }
  String? time;
  num? interval;
  num? temperature2m;
  num? relativeHumidity2m;
  num? isDay;
  num? rain;
  num? showers;
  num? snowfall;
  num? cloudCover;
  num? windSpeed10m;
  int? weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature_2m'] = temperature2m;
    map['relative_humidity_2m'] = relativeHumidity2m;
    map['is_day'] = isDay;
    map['rain'] = rain;
    map['showers'] = showers;
    map['snowfall'] = snowfall;
    map['cloud_cover'] = cloudCover;
    map['wind_speed_10m'] = windSpeed10m;
    map['weather_code'] = weatherCode;
    return map;
  }

}

CurrentUnits currentUnitsFromJson(String str) => CurrentUnits.fromJson(json.decode(str));
String currentUnitsToJson(CurrentUnits data) => json.encode(data.toJson());
class CurrentUnits {
  CurrentUnits({
      this.time, 
      this.interval, 
      this.temperature2m, 
      this.relativeHumidity2m, 
      this.isDay, 
      this.rain, 
      this.showers, 
      this.snowfall, 
      this.cloudCover, 
      this.windSpeed10m, 
      this.weatherCode,});

  CurrentUnits.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    isDay = json['is_day'];
    rain = json['rain'];
    showers = json['showers'];
    snowfall = json['snowfall'];
    cloudCover = json['cloud_cover'];
    windSpeed10m = json['wind_speed_10m'];
    weatherCode = json['weather_code'];
  }
  String? time;
  String? interval;
  String? temperature2m;
  String? relativeHumidity2m;
  String? isDay;
  String? rain;
  String? showers;
  String? snowfall;
  String? cloudCover;
  String? windSpeed10m;
  String? weatherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature_2m'] = temperature2m;
    map['relative_humidity_2m'] = relativeHumidity2m;
    map['is_day'] = isDay;
    map['rain'] = rain;
    map['showers'] = showers;
    map['snowfall'] = snowfall;
    map['cloud_cover'] = cloudCover;
    map['wind_speed_10m'] = windSpeed10m;
    map['weather_code'] = weatherCode;
    return map;
  }

}