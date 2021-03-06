import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'controller/items_controller.dart';
import 'widgets/contextual_action_bar.dart';

class ContextualScaffold<T> extends StatelessWidget {
  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final bool externalProvider;

  final bool allowZeroItems;

  final PreferredSizeWidget? appBar;
  final ContextualAppBar<T> contextualAppBar;
  final Key? scaffoldKey;

  final Widget? body;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final List<Widget>? persistentFooterButtons;

  final Widget? drawer;

  final Widget? endDrawer;

  final Color? drawerScrimColor;

  final Color? backgroundColor;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final bool? resizeToAvoidBottomInset;

  final bool primary;
  final double? drawerEdgeDragWidth;
  final DragStartBehavior drawerDragStartBehavior;

  const ContextualScaffold({
    Key? key,
    this.appBar,
    required this.contextualAppBar,
    this.scaffoldKey,
    this.externalProvider = false,
    this.allowZeroItems = false,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (externalProvider) {
      return buildScaffold(context);
    } else {
      return ChangeNotifierProvider<ItemsController<T>>(
          create: (BuildContext context) => ItemsController<T>(allowZeroItems: allowZeroItems),
          builder: (BuildContext context, Widget? child) {
            return buildScaffold(context);
          }
      );
    }
  }

  Widget buildScaffold(BuildContext context) {
    return Consumer<ItemsController<T>>(
      builder: (context, itemsController, child) {
        bool isActionModeEnable() => itemsController.actionModeEnable;
        return Scaffold(
          key: scaffoldKey,
          appBar: isActionModeEnable() ? contextualAppBar : appBar,
          body: child,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBody,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
        );
      },
      child: body!,
    );
  }
}
