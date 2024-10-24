import 'package:flutter/material.dart';
import 'package:kartex_web/feature/home/mixin/home_view_mixin.dart';
import 'package:kartex_web/feature/home/widgets/header/header_mobile.dart';
import 'package:kartex_web/feature/home/widgets/mining_section/mining_section_desktop.dart';
import 'package:kartex_web/feature/home/widgets/mining_section/mining_section.dart';
import 'package:kartex_web/feature/home/widgets/footer_section/footer_section.dart';
import 'package:kartex_web/feature/home/widgets/header/header_desktop.dart';
import 'package:kartex_web/feature/home/widgets/header/header_drawer.dart';
import 'package:kartex_web/feature/home/widgets/home_section/home_section.dart';
import 'package:kartex_web/feature/home/widgets/texttile_section/texttile_section.dart';
import 'package:kartex_web/feature/home/widgets/texttile_section/texttile_section_desktop.dart';
import 'package:kartex_web/responsive/responsive.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: isMobile ? HeaderDrawer(sectionNavButton: scrollToSection) : null,
      body: SafeArea(
        child: Stack(
          children: [
            _BodyContent(
              scrollController: scrollController,
              sectionKeys: sectionKeys,
              isMobile: isMobile,
              homeSectionButton: () {
                scrollToSection(3);
              },
            ),
            if (!isMobile)
              HeaderDesktop(
                sectionNavButton: scrollToSection,
                isHeaderTransparent: isHeaderTransparent,
              ),
            if (isMobile)
              HeaderMobile(
                sectionNavButton: scrollToSection,
                scaffoldKey: scaffoldKey,
                isHeaderTransparent: isHeaderTransparent,
              ),
          ],
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    required this.scrollController,
    required this.sectionKeys,
    required this.isMobile,
    required this.homeSectionButton,
  });

  final ScrollController scrollController;
  final List<GlobalKey<State<StatefulWidget>>> sectionKeys;
  final bool isMobile;
  final VoidCallback homeSectionButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                key: sectionKeys.first,
              ),
              HomeSection(
                homeSectionButton: homeSectionButton,
              ),
              Responsive(
                mobile: TexttileSection(key: sectionKeys[1]),
                tablet: TexttileSection(key: sectionKeys[1]),
                desktop: TexttileSectionDesktop(key: sectionKeys[1]),
              ),
              Responsive(
                mobile: MiningSection(key: sectionKeys[2]),
                tablet: MiningSection(key: sectionKeys[2]),
                desktop: MiningSectionDesktop(key: sectionKeys[2]),
              ),
              FooterSection(
                key: sectionKeys[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
