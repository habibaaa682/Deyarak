import 'package:flaticon_downloader/flaticon_downloader.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

abstract class PropertyModel {
  static IconData amentiesIcon({required String amentyname}) {
    if (amentyname == 'Wifi') {
      return Icons.wifi;
    } else if (amentyname == 'Pool') {
      return Icons.pool;
    } else if (amentyname == 'Gym') {
      return Icons.fitness_center_outlined;
    } else if (amentyname == 'Kitchen') {
      return Icons.kitchen;
    } else if (amentyname == 'Parking') {
      return Icons.car_repair_rounded;
    } else if (amentyname == 'TV') {
      return Icons.tv;
    } else if (amentyname == 'Washer') {
      return Icons.wash;
    } else if (amentyname == 'Iron') {
      return Icons.iron_sharp;
    } else if (amentyname == 'Heating') {
      return Icons.fireplace_sharp;
    } else if (amentyname == 'Smoke Alarm') {
      return FontAwesomeIcons.fire;
    } else if (amentyname == 'Air Conditioner') {
      return FontAwesomeIcons.snowflake;
    } else if (amentyname == 'Security') {
      return Icons.security;
    } else if (amentyname == 'Power Packup') {
      return Icons.power_rounded;
    } else {
      return Icons.no_photography_rounded;
    }
  }

  static IconData propertyInfoIcon({required String label}) {
    if (label == 'Price') {
      return Icons.money_outlined;
    }

    if (label == 'Address') {
      return Icons.location_on_outlined;
    }
    if (label == 'Size') {
      return FontAwesomeIcons.upRightAndDownLeftFromCenter;
    }
    if (label == 'Rooms') {
      return Icons.bedroom_parent_outlined;
    }
    if (label == 'Halls') {
      return Icons.chair;
    }
    if (label == 'Bath') {
      return Icons.bathtub_outlined;
    }
    if (label == 'Building Age') {
      return Icons.house_rounded;
    }
    if (label == 'Elevator') {
      return Icons.elevator_outlined;
    }
    if (label == 'Completion') {
      return Icons.design_services_rounded;
    }
    if (label == 'Furniture') {
      return Icons.light_outlined;
    } else {
      return Icons.no_photography_rounded;
    }
  }
}
