import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/helpers/background_gradient.dart';
import 'package:product_viewer/widgets/helpers/background_gradient_wrapper.dart';

class BasicScaffold extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSize? bottomAppBar;
  final bool horizontalPadding;
  final bool centerTitle;
  final bool withGradient;
  final bool scrollableScreen;
  final double? titleSpacing;
  final bool flexibleTitle;
  final double? leadingWidth;
  final double? appBarHeight;
  final EdgeInsets? flexibleTitlePadding;
  final double flexibleTitleScale;
  final bool pinAppBar;

  final bool automaticallyImplyLeading;

  const BasicScaffold({
    super.key,
    this.title,
    required this.body,
    this.backgroundColor,
    this.actions,
    this.leading,
    this.bottomAppBar,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.horizontalPadding = false,
    this.withGradient = false,
    this.scrollableScreen = true,
    this.titleSpacing,
    this.flexibleTitle = false,
    this.appBarHeight,
    this.leadingWidth,
    this.flexibleTitlePadding,
    this.flexibleTitleScale = 1.5,
    this.pinAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: BackgroundGradientWrapper(
        gradient: withGradient ? const BackgroundGradient() : const SizedBox(),
        child: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: !scrollableScreen ? const NeverScrollableScrollPhysics() : null,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: pinAppBar ? context.colorScheme.surface : null,
                  centerTitle: centerTitle,
                  titleSpacing: titleSpacing,
                  leadingWidth: leadingWidth,
                  expandedHeight: appBarHeight,
                  collapsedHeight: appBarHeight,
                  // pinned: true,
                  automaticallyImplyLeading: automaticallyImplyLeading,
                  actions: actions == null ? null : [...actions!, const Gap(12)],
                  flexibleSpace: flexibleTitle
                      ? FlexibleSpaceBar(
                          expandedTitleScale: flexibleTitleScale,
                          titlePadding: flexibleTitlePadding ?? EdgeInsets.zero,
                          title: title,
                        )
                      : null,
                  title: !flexibleTitle ? title : null,
                  bottom: bottomAppBar,
                  pinned: pinAppBar,
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding ? context.paddingScheme.p3 : 0,
              ),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
