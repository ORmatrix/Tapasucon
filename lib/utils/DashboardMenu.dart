import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  final List<MenuItem> items;

  const DashboardMenu({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 per row
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1, // make them square
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return _MenuCard(item: item);
      },
    );
  }
}

class _MenuCard extends StatelessWidget {
  final MenuItem item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => item.page),
      ),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.85),
              item.color.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: item.color.withOpacity(0.5),
              blurRadius: 16,
              offset: Offset(0, 6),
            )
          ],
        ),
        child: Stack(
          children: [
            // Large faded icon background
            Positioned(
              right: -20,
              bottom: -20,
              child: Icon(
                item.icon,
                size: 120,
                color: Colors.white.withOpacity(0.1),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Small icon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  Spacer(),
                  // Title
                  Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.6,
                    ),
                  ),
                  SizedBox(height: 6),
                  // Subtitle (optional)
                  Text(
                    item.subtitle ?? "",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  MenuItem({
    required this.title,
    this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}
