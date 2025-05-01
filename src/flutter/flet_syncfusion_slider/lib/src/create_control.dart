import 'package:flet/flet.dart';

import 'flet_syncfusion_slider.dart';
import 'flet_syncfusion_range_slider.dart';

CreateControlFactory createControl = (CreateControlArgs args) {
  switch (args.control.type) {
    case "flet_syncfusion_slider":
      return FletSyncfusionSliderControl(
        parent: args.parent,
        control: args.control,
        children: args.children,
        parentDisabled: args.parentDisabled,
        parentAdaptive: args.parentAdaptive,
        backend: args.backend,
      );
    case "flet_syncfusion_range_slider":
      return FletSyncfusionRangeSliderControl(
        parent: args.parent,
        control: args.control,
        children: args.children,
        parentDisabled: args.parentDisabled,
        parentAdaptive: args.parentAdaptive,
        backend: args.backend,
      );
    default:
      return null;
  }
};

void ensureInitialized() {
  // nothing to initialize
}
