import 'package:flutter/material.dart';
import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widgets/download_controller.dart';
import 'widgets/download_tile.dart';

class DownloadsScreen extends StatelessWidget {
  // Create the list of fake resources
  final List<Resource> resources = [
    Resource(name: "image1.png", size: 120),
    Resource(name: "image1.png", size: 500),
    Resource(name: "image3.png", size: 12000),
  ];

  final List<DownloadController> controllers = [];

  DownloadsScreen({super.key}) {
    // Create a controllers for each resource
    for (Resource resource in resources) {
      controllers.add(DownloadController(resource));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentThemeColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              color: currentThemeColor.color,
            ),
          ),

          SizedBox(height: 50),

          // TODO - Add the Download tiles
          Expanded(
            child: ListView.builder(
              itemCount: controllers.length,
              itemBuilder: (context, index) {
                return DownloadTile(controller: controllers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
