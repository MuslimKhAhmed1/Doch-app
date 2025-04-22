import 'package:doch_app/localization/appLocalizations.dart';
import 'package:doch_app/services/sitesService.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArtifactDetailPage extends StatefulWidget {
  final ChModel modelData;
  final String siteName;

  const ArtifactDetailPage(
      {Key? key, required this.modelData, required this.siteName})
      : super(key: key);

  @override
  _ArtifactDetailPageState createState() => _ArtifactDetailPageState();
}

class _ArtifactDetailPageState extends State<ArtifactDetailPage> {
  bool isExpanded = false;
  final String baseUrl = 'http://192.168.1.234:8000';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final localizations = AppLocalizations.of(context);
    final model = widget.modelData;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isExpanded ? model.name : model.name,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          if (!isExpanded) ...[
            IconButton(
              icon: Icon(Icons.bookmark_border,
                  color: isDarkMode ? Colors.white : Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share,
                  color: isDarkMode ? Colors.white : Colors.black),
              onPressed: () {},
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // 3D Model Viewer
                SizedBox(
                  width: double.infinity,
                  height: isExpanded ? MediaQuery.of(context).size.height : 400,
                  child: ModelViewer(
                    src: '$baseUrl/${model.path}',
                    backgroundColor: isDarkMode ? Colors.black54 : Colors.white,
                    ar: false,
                    autoRotate: true,
                    cameraControls: true,
                    loading: Loading.eager,
                  ),
                ),

                // Expand/Collapse button
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isExpanded ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isExpanded) ...[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            widget.siteName,
                            style: TextStyle(
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          Spacer(),
                          if (model.currentLocation != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.grey[800]
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                model.currentLocation!,
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white70
                                      : Colors.black87,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Artifact details section
                      _buildDetailItem(
                        isDarkMode,
                        'Description',
                        model.description,
                      ),

                      if (model.originDate != null)
                        _buildDetailItem(
                          isDarkMode,
                          'Origin Date',
                          model.originDate!,
                        ),

                      if (model.originCountry != null)
                        _buildDetailItem(
                          isDarkMode,
                          'Origin Country',
                          model.originCountry!,
                        ),

                      // Technical details
                      SizedBox(height: 16),
                      Text(
                        localizations?.translate('technical_details') ??
                            'Technical Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),

                      if (model.scanningMethod != null)
                        _buildDetailItem(
                          isDarkMode,
                          'Scanning Method',
                          model.scanningMethod!,
                        ),

                      if (model.scanDate != null)
                        _buildDetailItem(
                          isDarkMode,
                          'Scan Date',
                          model.scanDate!,
                        ),

                      if (model.softwareUsed != null)
                        _buildDetailItem(
                          isDarkMode,
                          'Software Used',
                          model.softwareUsed!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailItem(bool isDarkMode, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[800],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
