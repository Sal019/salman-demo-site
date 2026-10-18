import 'package:flutter/material.dart';

void main() {
  runApp(const DemoSiteApp());
}

class DemoSiteApp extends StatelessWidget {
  const DemoSiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salman — Demo Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
      ),
      home: const HomePage(),
    );
  }
}

const _ink = Color(0xFF111827);
const _muted = Color(0xFF6B7280);
const _accent = Color(0xFF4F46E5);
const _accent2 = Color(0xFF0EA5A4);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Header(),
            Hero(),
            StatsBand(),
            FeaturesSection(),
            InteractiveDemo(),
            ServicesSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class _Wrap extends StatelessWidget {
  final Widget child;
  const _Wrap({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: _Wrap(
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [_accent, _accent2]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.flutter_dash, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            const Text('Salman.dev',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: _ink)),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 640) ...[
              const _NavItem('Features'),
              const _NavItem('Live Demo'),
              const _NavItem('Services'),
              const SizedBox(width: 12),
            ],
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(backgroundColor: _accent),
              child: const Text('Get in touch'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  const _NavItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _ink)),
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 800;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEEF2FF), Color(0xFFE0F7F6)],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: wide ? 84 : 52),
      child: _Wrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: const Text('✦ Demo website — built with Flutter',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _accent)),
            ),
            const SizedBox(height: 22),
            Text(
              'One codebase.\nEvery platform.',
              style: TextStyle(
                fontSize: wide ? 56 : 38,
                height: 1.08,
                fontWeight: FontWeight.w900,
                color: _ink,
              ),
            ),
            const SizedBox(height: 18),
            const SizedBox(
              width: 620,
              child: Text(
                'This page is a real Flutter website, written once in Dart and '
                'compiled for the web. The very same code can also become an '
                'Android app — that is the power of cross-platform development.',
                style: TextStyle(fontSize: 17, height: 1.55, color: _muted),
              ),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.rocket_launch, size: 18),
                  label: const Text('Start a project'),
                  style: FilledButton.styleFrom(
                    backgroundColor: _accent,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle_outline, size: 18),
                  label: const Text('See the live demo below'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatsBand extends StatelessWidget {
  const StatsBand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _ink,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: const _Wrap(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 24,
          runSpacing: 16,
          children: [
            _Stat('1', 'codebase'),
            _Stat('4+', 'platforms: web, Android, iOS, desktop'),
            _Stat('100%', 'responsive design'),
            _Stat('Fast', 'hot reload while developing'),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String big;
  final String small;
  const _Stat(this.big, this.small);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(big,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
        Text(small, style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF))),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _SectionTitle(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: _ink)),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(fontSize: 16, color: _muted, height: 1.5)),
        const SizedBox(height: 28),
      ],
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: _Wrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(
              'Why Flutter?',
              'The same reasons this demo exists — it was designed, coded and built end-to-end by your AI agent.',
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final cols = constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 520 ? 2 : 1);
                final w = (constraints.maxWidth - (cols - 1) * 16) / cols;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(width: w, child: const _FeatureCard(Icons.devices, 'Cross-platform', 'Write once, run on web, Android, iOS and desktop. No duplicate work, no drift between versions.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.palette, 'Beautiful UI', 'Pixel-perfect, customisable widgets with smooth animations at 60 frames per second.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.bolt, 'Fast to build', 'Hot reload shows changes in under a second, so ideas turn into screens quickly.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.code, 'One language', 'Everything — layout, logic and styling — lives in a single Dart codebase.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.smartphone, 'Native feel', 'Apps compile to native code and use real platform components, not a web view.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.group, 'Backed by Google', 'A large, active open-source community and long-term support from Google.')),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const _FeatureCard(this.icon, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _accent, size: 28),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: _ink)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(fontSize: 14, height: 1.5, color: _muted)),
        ],
      ),
    );
  }
}

/// Interactive widget: proves this is a real app, not a static page.
class InteractiveDemo extends StatefulWidget {
  const InteractiveDemo({super.key});

  @override
  State<InteractiveDemo> createState() => _InteractiveDemoState();
}

class _InteractiveDemoState extends State<InteractiveDemo> {
  int _count = 0;
  Color _color = _accent;

  static const _palette = [Color(0xFF4F46E5), Color(0xFF0EA5A4), Color(0xFFF59E0B), Color(0xFFEF4444), Color(0xFF8B5CF6)];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F7FF),
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: _Wrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(
              'Live demo — try it',
              'This card is interactive. Tap the button and pick a colour: it updates instantly, in your browser, with no page reload.',
            ),
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(color: _color, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text('$_count',
                        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white)),
                  ),
                  const SizedBox(height: 18),
                  FilledButton.icon(
                    onPressed: () => setState(() => _count++),
                    icon: const Icon(Icons.add),
                    label: Text('Tap me — tapped $_count time${_count == 1 ? '' : 's'}'),
                    style: FilledButton.styleFrom(backgroundColor: _color),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final c in _palette)
                        GestureDetector(
                          onTap: () => setState(() => _color = c),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: c,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _color == c ? _ink : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
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

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: _Wrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(
              'What can be built next?',
              'This demo is a starting point. The same setup can grow into any of these — just ask.',
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final cols = constraints.maxWidth > 800 ? 3 : 1;
                final w = (constraints.maxWidth - (cols - 1) * 16) / cols;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(width: w, child: const _FeatureCard(Icons.storefront, 'Business website', 'A polished site for a shop or company — pages, gallery, contact form and maps.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.person, 'Portfolio', 'Show your work and story, with a design that feels personal and professional.')),
                    SizedBox(width: w, child: const _FeatureCard(Icons.shopping_cart, 'Online shop app', 'One codebase gives you both a shopping website and an Android app for customers.')),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _ink,
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: const _Wrap(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Salman.dev — demo website',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
            SizedBox(height: 8),
            Text(
              'Designed and built with Flutter 3.47.7 by Muse, on 18 October 2026. '
              'Source code and build output are saved on Muse\'s computer, ready to extend.',
              style: TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
      ),
    );
  }
}
