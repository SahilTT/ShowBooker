import 'package:flutter/material.dart';
import 'package:show_booker/res/app_context_extension.dart';

class BookingConfirmationBottomSheet extends StatelessWidget {
  final String filmName;
  final String cinemaName;
  final String dateOfShow;
  final String showTiming;
  Function() onCliCk;

  BookingConfirmationBottomSheet({super.key,
    required this.filmName,
    required this.cinemaName,
    required this.dateOfShow,
    required this.showTiming,
    required this.onCliCk
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Booking Confirmation',
                  style: TextStyle(
                      fontSize: context.resources.dimension.bigText,
                      fontWeight: FontWeight.w700,
                      fontFamily: context.resources.font.josefinSans,
                      color: context.resources.color.colorAccentBg),
                ),
              ),

              const SizedBox(height:20),

              Text(
                'Film Name: $filmName',
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallMediumText,
                    fontWeight: FontWeight.w600,
                    color: context.resources.color.colorPrimaryText),
              ),
              const SizedBox(height: 12),
              Text(
                'Cinema Name: $cinemaName',
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallMediumText,
                    fontWeight: FontWeight.w600,
                    color: context.resources.color.colorPrimaryText),
              ),
              const SizedBox(height: 12),
              Text(
                'Date of Show: $dateOfShow',
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallText,
                    fontWeight: FontWeight.w500,
                    color: context.resources.color.colorPrimaryText),
              ),
              const SizedBox(height: 12),
              Text(
                'Show Timing: $showTiming',
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallText,
                    fontWeight: FontWeight.w500,
                    color: context.resources.color.colorPrimaryText),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onCliCk();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.resources.color.colorAccentBg,
                  padding: const EdgeInsets.symmetric(vertical: 16), // Increase vertical padding
                  minimumSize: const Size(double.infinity, 48), // Make the button wider
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    color: context.resources.color.colorSecondaryText,
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.mediumText
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
