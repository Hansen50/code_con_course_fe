import 'package:flutter/material.dart';

enum WindowsSizes { compact, medium, expanded }

extension BuildContextExtension on BuildContext {
  WindowsSizes get windowsSize => switch (MediaQuery.sizeOf(this).width) {
        < 600 => WindowsSizes.compact,
        >= 600 && < 840 => WindowsSizes.medium,
        _ => WindowsSizes.expanded,
      };

  double get contentWidth => MediaQuery.sizeOf(this).width >= 1200
      ? 1280
      : MediaQuery.sizeOf(this).width;

  Future<T?> show<T>(Widget dialog) => showDialog<T>(
        context: this,
        builder: (context) => dialog,
      );
}
