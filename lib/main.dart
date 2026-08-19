import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PortfolioApp());


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suganya Gunasekaran | Senior Flutter Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF7C5CFC),
        scaffoldBackgroundColor: const Color(0xFF08090D),
        cardTheme: const CardThemeData(
          color: Color(0xFF12141C),
          elevation: 0,
          margin: EdgeInsets.zero,
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _home = GlobalKey();
  final _about = GlobalKey();
  final _skills = GlobalKey();
  final _experience = GlobalKey();
  final _projects = GlobalKey();
  final _contact = GlobalKey();

  Future<void> open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void go(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SG', style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: false,
        actions: [
          _nav('About', _about),
          _nav('Skills', _skills),
          _nav('Experience', _experience),
          _nav('Projects', _projects),
          _nav('Contact', _contact),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _hero(),
                  _section(_about, _aboutSection()),
                  _section(_skills, _skillsSection()),
                  _section(_experience, _experienceSection()),
                  _section(_projects, _projectsSection()),
                  _section(_contact, _contactSection()),
                  const SizedBox(height: 60),
                  const Text(
                    '© 2026 Suganya Gunasekaran • Built with Flutter',
                    style: TextStyle(color: Colors.white38),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nav(String text, GlobalKey key) => TextButton(
        onPressed: () => go(key),
        child: Text(text),
      );

  Widget _hero() => Container(
        key: _home,
        constraints: const BoxConstraints(minHeight: 650),
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (_, c) {
            final compact = c.maxWidth < 760;
            return Flex(
              direction: compact ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: compact ? 0 : 3,
                  child: Column(
                    crossAxisAlignment: compact
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SENIOR SOFTWARE ENGINEER',
                        style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Suganya\nGunasekaran',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 58,
                          height: 1.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Flutter & Mobile Engineer',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFFBBAAFF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        '6+ years in mobile application development • 3+ years with Flutter & Dart • FinTech',
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.6,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FilledButton.icon(
                            onPressed: () => open(
                              'https://github.com/suganyagunasekaran',
                            ),
                            icon: const Icon(Icons.code),
                            label: const Text('GitHub'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => open(
                              'https://linkedin.com/in/suganyagunasekaranmobiledeveloper',
                            ),
                            icon: const Icon(Icons.work_outline),
                            label: const Text('LinkedIn'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => open(
                              'mailto:suganya.g6197@gmail.com',
                            ),
                            icon: const Icon(Icons.email_outlined),
                            label: const Text('Email Me'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (!compact) const SizedBox(width: 70),
                Container(
                  width: compact ? 210 : 260,
                  height: compact ? 210 : 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white12, width: 2),
                  ),
                  child: const Icon(Icons.phone_android, size: 120),
                ),
              ],
            );
          },
        ),
      );

  Widget _section(GlobalKey key, Widget child) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: 100),
        child: child,
      );

  Widget _heading(String title, String subtitle) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Text(subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.white54)),
          const SizedBox(height: 28),
        ],
      );

  Widget _aboutSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading('About Me', 'Building scalable mobile experiences'),
          const Text(
            'Senior Software Engineer with 6+ years of experience in mobile application development, '
            'including 3+ years specializing in Flutter and Dart in FinTech. Experienced in building '
            'high-performance Android and iOS applications, real-time data systems, financial and trading '
            'platforms, and responsive UI architecture.',
            style: TextStyle(fontSize: 18, height: 1.8, color: Colors.white70),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              _stat('6+', 'Years Mobile'),
              _stat('3+', 'Years Flutter'),
              _stat('10K+', 'Active Traders'),
              _stat('50%+', 'Performance / Effort Gains'),
            ],
          ),
        ],
      );

  Widget _stat(String value, String label) => SizedBox(
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                Text(label, style: const TextStyle(color: Colors.white54)),
              ],
            ),
          ),
        ),
      );

  Widget _skillsSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading('Technical Skills', 'Tools and technologies from my professional experience'),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              'Dart', 'Flutter', 'Swift', 'Objective-C', 'Riverpod', 'BLoC',
              'Provider', 'ChangeNotifier', 'ValueNotifier', 'Clean Architecture',
              'MVVM', 'MVC', 'SOLID', 'Repository Pattern', 'Dependency Injection',
              'REST APIs', 'GraphQL', 'WebSockets', 'Dio', 'HTTP', 'OAuth 2.0',
              'JWT', 'Firebase', 'Hive', 'SQLite', 'SharedPreferences',
              'Secure Storage', 'Flutter DevTools', 'Unit Testing', 'Widget Testing',
              'Integration Testing', 'TDD', 'Git', 'GitHub', 'CI/CD', 'Android',
              'iOS', 'Xcode', 'Android Studio'
            ].map((s) => Chip(label: Text(s))).toList(),
          ),
        ],
      );

  Widget _experienceSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading('Experience', 'Professional journey'),
          _job(
            'Senior Software Engineer',
            'Samco Securities Limited • Chennai, India',
            '13/06/2023 – 14/05/2026',
            [
              'Developed a high-performance Flutter trading application delivering real-time market data via WebSockets to 10,000+ active traders with sub-second price updates.',
              'Optimized application performance using Riverpod, reducing unnecessary widget rebuilds by 50%+.',
              'Migrated native iOS Swift/Objective-C modules to a Flutter hybrid architecture, reducing duplicate codebase maintenance by 50%+.',
              'Integrated GraphQL and REST APIs, reducing data payload size by 30% and cutting average API response time to 25ms.',
              'Built reusable responsive UI components following Clean Architecture and SOLID principles, cutting new feature development time by 40% and reducing UI-related bug reports by 70%.',
            ],
          ),
          const SizedBox(height: 24),
          _job(
            'Mobile Application Developer',
            'Smart Gladiator • Chennai, India',
            '20/02/2020 – 15/04/2023',
            [
              'Developed and deployed native iOS applications using Swift and Objective-C.',
              'Designed, developed, tested and released a supply-chain media proof application end-to-end.',
              'Improved application stability, reducing crash and instability incidents by 30–50% using memory profiling, debugging and Xcode Instruments.',
              'Managed App Store submissions, TestFlight beta releases, versioning and production deployments.',
              'Integrated REST APIs and implemented reusable components in an Agile environment.',
            ],
          ),
        ],
      );

  Widget _job(String role, String company, String dates, List<String> bullets) =>
      Card(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(role,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text(company,
                  style: const TextStyle(
                      fontSize: 17, color: Color(0xFFBBAAFF))),
              const SizedBox(height: 5),
              Text(dates, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 18),
              ...bullets.map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 7, right: 10),
                        child: Icon(Icons.circle, size: 6),
                      ),
                      Expanded(
                        child: Text(b,
                            style: const TextStyle(
                                height: 1.55, color: Colors.white70)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _projectsSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading('Key Projects', 'Selected work and GitHub projects'),
          _projectCard(
            'Real-Time Trading Dashboard',
            'Live data streaming architecture delivering sub-second market updates via WebSockets to 10,000+ traders.',
            Icons.candlestick_chart,
          ),
          const SizedBox(height: 14),
          _projectCard(
            'Watchlist & Portfolio Module',
            'Optimized UI for stock tracking and performance analytics, improving load time by 50%+.',
            Icons.analytics_outlined,
          ),
          const SizedBox(height: 14),
          _projectCard(
            'Flutter Migration',
            'Hybrid architecture migration from native iOS, reducing code duplication by 50%+ and streamlining releases.',
            Icons.sync_alt,
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              _githubProject('Creators Markets',
                  'https://github.com/suganyagunasekaran/creators_markets'),
              _githubProject('Geolocation Live Tracker',
                  'https://github.com/suganyagunasekaran/geolocation_live_tracker'),
              _githubProject('Counter App',
                  'https://github.com/suganyagunasekaran/counter_app'),
              _githubProject(
                  'Games', 'https://github.com/suganyagunasekaran/Games'),
            ],
          ),
        ],
      );

  Widget _projectCard(String title, String text, IconData icon) => Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: Icon(icon, size: 38),
          title: Text(title,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(text,
                style: const TextStyle(height: 1.5, color: Colors.white60)),
          ),
        ),
      );

  Widget _githubProject(String title, String url) => OutlinedButton.icon(
        onPressed: () => open(url),
        icon: const Icon(Icons.code),
        label: Text(title),
      );

  Widget _contactSection() => Card(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              _heading('Let’s Connect',
                  'Available for opportunities and immediate joining'),
              const Text(
                'Chennai, India',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              const Text(
                'suganya.g6197@gmail.com',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => open(
                        'mailto:suganya.g6197@gmail.com'),
                    icon: const Icon(Icons.email_outlined),
                    label: const Text('Email'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => open(
                        'https://linkedin.com/in/suganyagunasekaranmobiledeveloper'),
                    icon: const Icon(Icons.work_outline),
                    label: const Text('LinkedIn'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => open(
                        'https://github.com/suganyagunasekaran'),
                    icon: const Icon(Icons.code),
                    label: const Text('GitHub'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
