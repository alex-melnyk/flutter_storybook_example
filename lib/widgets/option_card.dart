import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    this.child,
    this.color,
    this.checked = false,
    this.onChecked,
  }) : super(key: key);

  final Widget? child;
  final Color? color;
  final bool checked;
  final VoidCallback? onChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChecked,
      child: Card(
        color: color,
        child: AnimatedOpacity(
          opacity: onChecked != null ? 1.0 : 0.5,
          duration: const Duration(milliseconds: 250),
          child: Container(
            width: 150,
            height: 150,
            child: Stack(
              children: [
                Center(child: child),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        checked ? Icons.check_circle_rounded : Icons.circle,
                        key: ValueKey<bool>(checked),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
