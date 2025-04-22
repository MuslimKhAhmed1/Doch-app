import 'package:doch_app/Provider/theme_provider.dart';
import 'package:doch_app/localization/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localizations = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map Display Widget
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations?.translate('interactive_map') ??
                      'Interactive Map',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/cap.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          child: const Icon(Icons.my_location),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            localizations?.translate('erbil_city') ??
                                'Erbil City',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 3D Model Display Widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations?.translate('3d_models') ?? '3D Models',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/arr.JPG'),
                      fit: BoxFit.cover,
                    ),
                    color: themeProvider.isDarkMode
                        ? Colors.grey[800]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(
                        //   Icons.view_in_ar,
                        //   size: 60,
                        //   color: themeProvider.isDarkMode
                        //       ? Colors.white70
                        //       : Colors.black54,
                        // ),
                        const SizedBox(height: 10),
                        // Text(
                        //   localizations?.translate('tap_to_view_3d') ??
                        //       'Tap to view 3D model',
                        //   style: TextStyle(
                        //     color: themeProvider.isDarkMode
                        //         ? Colors.white70
                        //         : Colors.black54,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            localizations?.translate('load_model') ??
                                'Load Model',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Popular Places Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localizations?.translate('popular_place') ??
                          'Popular Place',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        localizations?.translate('see_more') ?? 'See more',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    PlaceCard(
                      title: localizations?.translate('erbil_citadel') ??
                          'Erbil Citadel',
                      icon: Icons.restaurant,
                      isDark: themeProvider.isDarkMode,
                    ),
                    const PlaceCard(
                      title: 'Places',
                      imageUrl: 'assets/citadel.jpeg',
                    ),
                    PlaceCard(
                      title: localizations?.translate('best_shopping') ??
                          'Best places for shopping',
                      icon: Icons.shopping_bag,
                      isDark: themeProvider.isDarkMode,
                    ),
                    PlaceCard(
                      title: localizations?.translate('best_drink') ??
                          'Best Place for a drink',
                      icon: Icons.local_drink,
                      isDark: themeProvider.isDarkMode,
                    ),
                  ],
                ),
                //
                // Blogs Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations?.translate('latest_blogs') ??
                                'Latest Blogs',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              localizations?.translate('see_all') ?? 'See all',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            BlogCard(
                              title: localizations?.translate('blog_title_1') ??
                                  'Exploring Erbil Citadel',
                              author:
                                  localizations?.translate('blog_author_1') ??
                                      'Dara Ahmed',
                              date: '12 Mar 2025',
                              isDark: themeProvider.isDarkMode,
                            ),
                            const SizedBox(width: 16),
                            BlogCard(
                              title: localizations?.translate('blog_title_2') ??
                                  'Kurdish Cuisine Guide',
                              author:
                                  localizations?.translate('blog_author_2') ??
                                      'Sara Hassan',
                              date: '5 Mar 2025',
                              isDark: themeProvider.isDarkMode,
                            ),
                            const SizedBox(width: 16),
                            BlogCard(
                              title: localizations?.translate('blog_title_3') ??
                                  'Local Festivals',
                              author:
                                  localizations?.translate('blog_author_3') ??
                                      'Alan Jamal',
                              date: '28 Feb 2025',
                              isDark: themeProvider.isDarkMode,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Keeping the original PlaceCard widget
class PlaceCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final IconData? icon;
  final bool isDark;

  const PlaceCard({
    super.key,
    required this.title,
    this.imageUrl,
    this.icon,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        image: imageUrl != null
            ? DecorationImage(
                image: AssetImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          if (icon != null)
            Positioned(
              top: 8,
              left: 8,
              child: Icon(icon),
            ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              title,
              style: TextStyle(
                color: imageUrl != null ? Colors.white : null,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.bookmark_border,
              color: imageUrl != null ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}

// New BlogCard widget
class BlogCard extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final bool isDark;

  const BlogCard({
    super.key,
    required this.title,
    required this.author,
    required this.date,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            author,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)?.translate('read_more') ??
                      'Read more',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
