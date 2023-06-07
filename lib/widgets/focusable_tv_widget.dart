import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef FocusableTVWidgetBuilder = Widget Function(
  BuildContext context,
  bool isFocused,
);

typedef FunctionBuilder = void Function(
  BuildContext context,
);

class FocusableTVWidget extends StatefulWidget {
  final FocusableTVWidgetBuilder child;
  final FunctionBuilder? onTap;

  const FocusableTVWidget({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _FocusableTVWidget();
}

class _FocusableTVWidget extends State<FocusableTVWidget> {
  late bool _focused = false;
  late final Map<Type, Action<Intent>> _actionMap;
  final Map<ShortcutActivator, Intent> _shortcutMap =
      const <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
  };

  @override
  void initState() {
    super.initState();
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<Intent>(
        onInvoke: (Intent intent) => widget.onTap?.call(context),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(context),
      child: FocusableActionDetector(
          actions: _actionMap,
          shortcuts: _shortcutMap,
          descendantsAreFocusable: false,
          descendantsAreTraversable: false,
          onFocusChange: _onFocusChanged,
          child: Builder(builder: (context) {
            return widget.child(context, _focused);
          })),
    );
  }

  void _onFocusChanged(bool value) {
    setState(() {
      _focused = value;
    });
  }
}
