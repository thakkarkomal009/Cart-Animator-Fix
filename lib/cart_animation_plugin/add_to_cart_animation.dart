import 'dart:math';

import 'drag_to_cart_animation_options.dart';

import 'jump_animation_options.dart';
import 'add_to_cart_icon.dart';
import 'globalkeyext.dart';
import 'package:flutter/material.dart';

export 'add_to_cart_icon.dart';
export 'jump_animation_options.dart';
export 'drag_to_cart_animation_options.dart';

class _PositionedAnimationModel {
  bool showAnimation = false;
  bool animationActive = false;
  Offset imageSourcePoint = Offset.zero;
  Offset imageDestPoint = Offset.zero;
  Size imageSourceSize = Size.zero;
  Size imageDestSize = Size.zero;
  bool rotation = false;
  double opacity = 0.85;
  late Container container;
  Duration duration = Duration.zero;
  Curve curve = Curves.easeIn;
}

/// An add to cart animation which provide you an animation by sliding the product to cart in the Flutter app
class AddToCartAnimation extends StatefulWidget {
  final Widget child;

  /// The Global Key of the [AddToCartIcon] element. We need it because we need to know where is the cart icon is located in the screen. Based on the location, we are dragging given widget to the cart.
  // final GlobalKey<CartIconKey> cartKey;

  /// you can receive [runAddToCartAnimation] animation method on [createAddToCartAnimation].
  /// [runAddToCartAnimation] animation method runs the add to cart animation based on the given parameters.
  /// Add to cart animation drags the given widget to the cart based on their location via global keys
  final Function(Future<void> Function(GlobalKey)) createAddToCartAnimation;

  /// What Should the given widget's height while dragging to the cart
  final double height;

  /// What Should the given widget's width while dragging to the cart
  final double width;

  /// What Should the given widget's opacity while dragging to the cart
  final double opacity;

  /// Should the given widget jump before the dragging
  final JumpAnimationOptions jumpAnimation;

  /// The animation options while given widget sliding to cart
  final DragToCartAnimationOptions dragAnimation;

  const AddToCartAnimation({
    Key? key,
    required this.child,
    // required this.cartKey,
    required this.createAddToCartAnimation,
    this.height = 30,
    this.width = 30,
    this.opacity = 0.85,
    this.jumpAnimation = const JumpAnimationOptions(),
    this.dragAnimation = const DragToCartAnimationOptions(),
  }) : super(key: key);

  @override
  _AddToCartAnimationState createState() => _AddToCartAnimationState();
}

class _AddToCartAnimationState extends State<AddToCartAnimation> {
  List<_PositionedAnimationModel> animationModels = [];

  @override
  void initState() {
    super.initState();
    widget.createAddToCartAnimation(runAddToCartAnimation);
  }

  @override
  void dispose() {
    super.dispose(); // Always call the superclass dispose method
    // Ensure to clear the animation models and stop any ongoing animations
    animationModels.clear(); // Clear all animation models

    print("Add to cart disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: Stack(
            children: animationModels
                .map<Widget>((model) => model.showAnimation
                ? AnimatedPositioned(
              top: model.animationActive
                  ? model.imageDestPoint.dx
                  : model.imageSourcePoint.dx,
              left: model.animationActive
                  ? model.imageDestPoint.dy
                  : model.imageSourcePoint.dy,
              height: model.animationActive
                  ? model.imageDestSize.height
                  : model.imageSourceSize.height,
              width: model.animationActive
                  ? model.imageDestSize.width
                  : model.imageSourceSize.width,
              duration: model.duration,
              curve: model.curve,
              child: model.rotation
                  ? TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: pi * 2),
                duration: model.duration,
                child: model.container,
                builder: (context, double value, widget) {
                  return Transform.rotate(
                    angle: value,
                    child: Opacity(
                      opacity: model.opacity,
                      child: widget,
                    ),
                  );
                },
              )
                  : Opacity(
                opacity: model.opacity,
                child: model.container,
              ),
            )
                : Container())
                .toList(),
          ),
        ),
      ],
    );
  }

  Future<void> runAddToCartAnimation(GlobalKey widgetKey, {GlobalKey<CartIconKey>? cartKey}) async {
    _PositionedAnimationModel animationModel = _PositionedAnimationModel()
      ..rotation = false
      ..opacity = widget.opacity;

    animationModel.imageSourcePoint = Offset(
        widgetKey.globalPaintBounds!.top, widgetKey.globalPaintBounds!.left);

    var startingHeight = widget.jumpAnimation.active
        ? widgetKey.currentContext!.size!.height
        : 0;
    animationModel.imageDestPoint = Offset(
        widgetKey.globalPaintBounds!.top - (startingHeight + widget.height),
        widgetKey.globalPaintBounds!.left);

    animationModel.imageSourceSize = Size(widgetKey.currentContext!.size!.width,
        widgetKey.currentContext!.size!.height);

    animationModel.imageDestSize = Size(
        widgetKey.currentContext!.size!.width + widget.width,
        widgetKey.currentContext!.size!.height + widget.height);

    animationModels.add(animationModel);

    animationModel.container = Container(
      child: (widgetKey.currentWidget! as Container).child,
    );

    animationModel.showAnimation = true;

    // Check if widget is mounted before calling setState
    if (mounted) {
      setState(() {});
    }

    await Future.delayed(Duration(milliseconds: 75));

    animationModel.curve = widget.jumpAnimation.curve;
    animationModel.duration =
        widget.jumpAnimation.duration;
    animationModel.animationActive = true;

    // Check if widget is mounted before calling setState
    if (mounted) {
      setState(() {});
    }

    await Future.delayed(animationModel.duration);

    animationModel.curve = widget.dragAnimation.curve;
    animationModel.rotation = widget.dragAnimation.rotation;
    animationModel.duration =
        widget.dragAnimation.duration;

    animationModel.imageDestPoint = Offset(
        cartKey!.globalPaintBounds!.top,
        cartKey.globalPaintBounds!.left);

    animationModel.imageDestSize = Size(
        cartKey.currentContext!.size!.width,
        cartKey.currentContext!.size!.height);

    // Check if widget is mounted before calling setState
    if (mounted) {
      setState(() {});
    }

    await Future.delayed(animationModel.duration);

    animationModel.showAnimation = false;
    animationModel.animationActive = false;

    // Check if widget is mounted before calling setState
    if (mounted) {
      setState(() {});
    }

    return;
  }
}