import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:doch_app/localization/appLocalizations.dart';

class MapPage extends StatelessWidget {
  final LatLng center = const LatLng(36.1901, 44.0091); // Erbil coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          FlutterMap(
            options: MapOptions(
              initialCenter: center,
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              // Add markers for restaurants and cafes
              MarkerLayer(
                markers: [
                  // Restaurant markers
                  Marker(
                    point: LatLng(36.1920, 44.0099),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.restaurant, color: Colors.grey[800]),
                  ),
                  // Cafe markers
                  Marker(
                    point: LatLng(36.1890, 44.0080),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.local_cafe, color: Colors.grey[800]),
                  ),
                ],
              ),
            ],
          ),
          // Top bar with menu and bookmark
          // Positioned(
          //   top: 40,
          //   left: 20,
          //   right: 20,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton.outlined(
          //         highlightColor: Colors.white,
          //         focusColor: Colors.white,
          //         icon: const Icon(Icons.menu),
          //         onPressed: () {},
          //         color: Colors.black,
          //       ),
          //       IconButton.outlined(
          //         icon: const Icon(Icons.bookmark_border),
          //         onPressed: () {},
          //         color: Colors.black,
          //       ),
          //     ],
          //   ),
          // ),
          // Bottom section with search and filters
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[600]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)
                                      ?.translate('search') ??
                                  'search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Dropdown filters
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: 'Erbil',
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                    value: 'Erbil', child: Text('Erbil')),
                                DropdownMenuItem(
                                    value: 'Soleimani',
                                    child: Text('Soleimani')),
                                DropdownMenuItem(
                                    value: 'Duhok', child: Text('Duhok')),
                                DropdownMenuItem(
                                    value: 'Halabja', child: Text('Halabja')),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: 'Erbil Citadel',
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                    value: 'Erbil Citadel',
                                    child: Text('Erbil Citadel')),
                                DropdownMenuItem(
                                    value: 'Erbil Monument',
                                    child: Text('Erbil Monument')),
                                DropdownMenuItem(
                                    value: 'Taajil', child: Text('Taajil')),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Bottom navigation
                ],
              ),
            ),
          ),
          // Current location button
          Positioned(
            bottom: 250,
            right: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              child: const Icon(Icons.my_location, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
// class MapPage extends StatelessWidget {
//   final LatLng center =
//       const LatLng(36.1877, 44.0107); // Example: San Francisco

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Flutter Map")),
//       body: FlutterMap(
//         options: MapOptions(
//           initialCenter: center,
//           initialZoom: 10,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             // subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: center,
//                 width: 80,
//                 height: 80,
//                 child:
//                     const Icon(Icons.location_pin, color: Colors.red, size: 40),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
