import 'package:deyarakapp/Featurs/Home/data/Models/property_model/property_model.dart';
import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    required this.propertyModel,
  });
  final PropertyModell propertyModel;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 24, bottom: 12, right: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  propertyModel.data!.owner!.photo!.url.toString(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    propertyModel.data!.owner!.name.toString(),
                    style:
                        Fonts.textstyle30.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    propertyModel.data!.owner!.ratingsAverage.toString(),
                    style:
                        Fonts.textstyle18.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.star,
                    size: 16,
                  ),
                ],
              ),
              const Text(
                'Rating',
                style: Fonts.textstyle12,
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
