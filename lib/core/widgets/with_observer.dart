import 'package:flutter/material.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/services/services.dart';

class ConnectionObserver {
  static bool connected = false;
}

class WithObserver extends StatefulWidget {
  const WithObserver({super.key, required this.child});
  final Widget child;

  @override
  State<WithObserver> createState() => _WithObserverState();
}

class _WithObserverState extends State<WithObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    sl.get<QuranPlayer>().player.dispose();
    MainBox.closeBox();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      MainBox.set(
        BoxKeys.lastTime,
        sl.get<QuranPlayer>().player.position.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
