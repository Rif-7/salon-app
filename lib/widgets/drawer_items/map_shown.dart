import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapShown extends StatelessWidget {
  const MapShown({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    void launchGoogleMaps() async {
      return;
      // const String latitude = '24.91200367349444';
      // const String longitude = '67.19563394956498';
      // const url =
      //     'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      // final uri = Uri.parse(url);

      // if (await canLaunchUrl(uri)) {
      //   await launchUrl(uri);
      // } else {
      //   throw 'Error';
      // }
    }

    void launchHairMorphAI() async {
      const String hairMorphUrl =
          'https://huggingface.co/spaces/AIRI-Institute/HairFastGAN';
      final uri = Uri.parse(hairMorphUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Error launching HairMorph AI link';
      }
    }

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.042,
        vertical:
            (screenSize.height - MediaQuery.of(context).padding.top) * 0.021,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HairMorph AI',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                Text(
                  'HairMorph AI is an application that allows you to try different custom hairstyles on your face, providing a realistic preview of new looks.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: launchHairMorphAI,
                  child: const Text('Visit HairMorph AI'),
                ),
              ],
            ),
          ),
          // Stack(
          //   alignment: Alignment.bottomCenter,
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(15),
          //       child: InteractiveViewer(
          //         minScale: 0.1,
          //         maxScale: 4.0,
          //         child: Image.asset(
          //           height: (screenSize.height -
          //                   MediaQuery.of(context).padding.top) *
          //               0.4,
          //           'assets/images/location.jpg',
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //     // SizedBox(
          //     //   width: double.infinity,
          //     //   height:
          //     //       (screenSize.height - MediaQuery.of(context).padding.top) *
          //     //           0.06,
          //     //   child: ElevatedButton(
          //     //     style: ElevatedButton.styleFrom(
          //     //       shape: const RoundedRectangleBorder(
          //     //         borderRadius: BorderRadius.vertical(
          //     //           bottom: Radius.circular(15),
          //     //         ),
          //     //       ),
          //     //       backgroundColor: Theme.of(context).colorScheme.primary,
          //     //       foregroundColor: Theme.of(context).colorScheme.onPrimary,
          //     //     ),
          //     //     onPressed: launchGoogleMaps,
          //     //     child: Text(
          //     //       'See Full Location',
          //     //       style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //     //             color: Theme.of(context).colorScheme.onPrimary,
          //     //           ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
