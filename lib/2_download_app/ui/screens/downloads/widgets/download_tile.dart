import 'package:flutter/material.dart';

import 'download_controller.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            return _buildNotDownloaded();

          case DownloadStatus.downloading:
            return _buildDownloading();

          case DownloadStatus.downloaded:
            return _buildDownloaded();
        }
      },
    );
  }

  Widget _buildNotDownloaded() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(controller.resource.name),
        trailing: IconButton(
          icon: const Icon(Icons.download),
          onPressed: controller.startDownload,
        ),
      ),
    );
  }

  Widget _buildDownloading() {
    double percentage = controller.progress * 100;
    double downloadedSize = controller.resource.size * controller.progress;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(controller.resource.name),
        subtitle: Text(
          "${percentage.toStringAsFixed(0)}% completed - "
          "${downloadedSize.toStringAsFixed(1)} of "
          "${controller.resource.size} MB",
        ),
        trailing: const SizedBox(
          width: 24,
          height: 24,
          child: Icon(Icons.downloading),
        ),
      ),
    );
  }

  Widget _buildDownloaded() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(controller.resource.name),
        subtitle: Text(
          "100% completed - "
          "${controller.resource.size} of "
          "${controller.resource.size} MB",
        ),
        trailing: const Icon(Icons.folder),
      ),
    );
  }
}
