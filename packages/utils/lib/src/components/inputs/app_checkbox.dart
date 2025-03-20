import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';

import '../../../utils.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.signal,
    this.label,
    this.isActive = true,
    this.size = 20.0,
  });

  final Signal<bool> signal;
  final String? label;
  final bool isActive;
  final double size;

  @override
  Widget build(BuildContext context) {
    return signal.builder(
      (value) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: isActive ? () => signal.value = !value : null,
          child: Opacity(
            opacity: isActive ? 1.0 : 0.5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        value
                            ? null
                            : Border.all(
                              color: AppColors.textSecondary,
                              width: 1.5,
                            ),
                    gradient: value ? AppColors.primaryGradient : null,
                    boxShadow:
                        value
                            ? [
                              BoxShadow(
                                color: AppColors.primary.op(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child:
                      value
                          ? Center(
                            child: Icon(
                              Icons.check,
                              size: size * 0.7,
                              color: Colors.white,
                            ),
                          )
                          : null,
                ),
                if (label != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    label!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
