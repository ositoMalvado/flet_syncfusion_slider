import 'package:flet/flet.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_sliders/src/slider_shapes.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:syncfusion_flutter_core/theme.dart';
import 'utils/flet_syncfusion_utils.dart';
import 'dart:convert';

class FletSyncfusionRangeSliderControl extends StatefulWidget {
  final Control? parent;
  final Control control;
  final List<Control> children;
  final bool parentDisabled;
  final bool? parentAdaptive;
  final FletControlBackend backend;

  const FletSyncfusionRangeSliderControl({
    super.key,
    required this.parent,
    required this.control,
    required this.children,
    required this.parentDisabled,
    required this.parentAdaptive,
    required this.backend,
  });

  @override
  State<FletSyncfusionRangeSliderControl> createState() =>
      _FletSyncfusionRangeSliderControlState();
}

class _FletSyncfusionRangeSliderControlState
    extends State<FletSyncfusionRangeSliderControl> {
  double get min => widget.control.attrDouble("range_min", 0.0)!;
  double get max => widget.control.attrDouble("range_max", 0.0)!;
  SfRangeValues _values = SfRangeValues(0.0, 0.0);
  final _debouncer = Debouncer(milliseconds: isDesktopPlatform() ? 10 : 100);

  @override
  void initState() {
    super.initState();
    double start_value = widget.control.attrDouble("start_value", 0.0)!;
    double end_value = widget.control.attrDouble("end_value", 100.0)!;
    double min = widget.control.attrDouble("min", 0.0)!;
    double max = widget.control.attrDouble("max", 100.0)!;

    // Asegurar que los valores estén dentro de los límites
    double start = start_value.clamp(min, max);
    double end = end_value.clamp(min, max);

    // Actualizar los valores en el control para mantener sincronización
    if ((start_value - start).abs() > 0.00001 ||
        (end_value - end).abs() > 0.00001) {
      var props = {"start": start.toString(), "end": end.toString()};
      widget.backend
          .updateControlState(widget.control.id, props, server: false);
    }

    _values = SfRangeValues(start, end);
    debugPrint(
        "SyncfusionRangeSlider initState: Initial values=$_values from start_value=$start_value, end_value=$end_value");
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FletSyncfusionRangeSliderControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    double newStart = widget.control.attrDouble("start", 0.0)!;
    double newEnd = widget.control.attrDouble("end", 0.0)!;

    // También verificar si start_value o end_value han cambiado
    double newStartValue = widget.control.attrDouble("start_value", 0.0)!;
    double newEndValue = widget.control.attrDouble("end_value", 100.0)!;
    double min = widget.control.attrDouble("min", 0.0)!;
    double max = widget.control.attrDouble("max", 100.0)!;

    // Si start_value o end_value cambiaron, actualizar start y end
    if ((oldWidget.control.attrDouble("start_value", 0.0)! - newStartValue)
                .abs() >
            0.00001 ||
        (oldWidget.control.attrDouble("end_value", 100.0)! - newEndValue)
                .abs() >
            0.00001) {
      newStart = newStartValue.clamp(min, max);
      newEnd = newEndValue.clamp(min, max);

      var props = {"start": newStart.toString(), "end": newEnd.toString()};
      widget.backend
          .updateControlState(widget.control.id, props, server: false);
    }

    if ((_values.start - newStart).abs() > 0.00001 ||
        (_values.end - newEnd).abs() > 0.00001) {
      debugPrint(
          "SyncfusionRangeSlider didUpdateWidget: Values changed externally from $_values to SfRangeValues($newStart, $newEnd)");
      _values = SfRangeValues(newStart, newEnd);
    }
  }

  void handleChange(dynamic values) {
    SfRangeValues newValues = values as SfRangeValues;
    debugPrint("SyncfusionRangeSlider onChanged: New values=$newValues");

    setState(() {
      _values = newValues;
    });

    var props = {
      "start": newValues.start.toString(),
      "end": newValues.end.toString(),
      "start_value": newValues.start.toString(),
      "end_value": newValues.end.toString()
    };
    widget.backend.updateControlState(widget.control.id, props, server: false);

    _debouncer.run(() {
      widget.backend.updateControlState(widget.control.id, props);
      widget.backend.triggerControlEvent(
          widget.control.id, "change", "${newValues.start},${newValues.end}");
    });
  }

  void handleChangeStart(dynamic startValues) {
    SfRangeValues values = startValues as SfRangeValues;
    debugPrint("SyncfusionRangeSlider onChangeStart: Values=$values");
    widget.backend.triggerControlEvent(
        widget.control.id, "change_start", "${values.start},${values.end}");
  }

  void handleChangeEnd(dynamic endValues) {
    SfRangeValues values = endValues as SfRangeValues;
    debugPrint("SyncfusionRangeSlider onChangeEnd: Values=$values");
    widget.backend.triggerControlEvent(
        widget.control.id, "change_end", "${values.start},${values.end}");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "FletSyncfusionRangeSliderControl build: ${widget.control.id}, Current internal values=$_values");

    // Basic properties

    double start_value = widget.control.attrDouble("start_value", 0.0)!;
    double end_value = widget.control.attrDouble("end_value", 100.0)!;

    double min = widget.control.attrDouble("min", 0.0)!;
    double max = widget.control.attrDouble("max", 100.0)!;
    double interval = widget.control
        .attrDouble("interval", (max > min ? (max - min) / 10 : 10.0))!;
    if (interval <= 0) interval = 10.0;
    double? stepSize = widget.control.attrDouble("step_size");

    // Visualization properties
    bool showTicks = widget.control.attrBool("show_ticks", false)!;
    bool showLabels = widget.control.attrBool("show_labels", false)!;
    bool showDividers = widget.control.attrBool("show_dividers", false)!;
    bool enableTooltip = widget.control.attrBool("enable_tooltip", true)!;
    bool shouldAlwaysShowTooltip =
        widget.control.attrBool("should_always_show_tooltip", false)!;
    bool enableIntervalSelection =
        widget.control.attrBool("enable_interval_selection", false)!;
    int minorTicksPerInterval =
        widget.control.attrInt("minor_ticks_per_interval", 0)!;

    // Orientation and direction
    bool isVertical = widget.control.attrBool("vertical", false)!;
    bool isInversed = widget.control.attrBool("inversed", false)!;

    // Drag mode
    String dragModeStr = widget.control.attrString("drag_mode", "onThumb")!;
    SliderDragMode dragMode = SliderDragMode.onThumb;
    if (dragModeStr == "betweenThumbs") {
      dragMode = SliderDragMode.betweenThumbs;
    } else if (dragModeStr == "both") {
      dragMode = SliderDragMode.both;
    }

    // Colors
    Color? activeColor =
        widget.control.attrColor("active_color", context) ?? null;
    Color? inactiveColor =
        widget.control.attrColor("inactive_color", context) ?? null;

    // Label and tooltip settings
    String labelPlacementStr =
        widget.control.attrString("label_placement", "onTicks")!;
    LabelPlacement labelPlacement = LabelPlacement.onTicks;
    if (labelPlacementStr == "betweenTicks") {
      labelPlacement = LabelPlacement.betweenTicks;
    }

    String edgeLabelPlacementStr =
        widget.control.attrString("edge_label_placement", "auto")!;
    EdgeLabelPlacement edgeLabelPlacement = EdgeLabelPlacement.auto;
    if (edgeLabelPlacementStr == "inside") {
      edgeLabelPlacement = EdgeLabelPlacement.inside;
    } else if (edgeLabelPlacementStr == "auto") {
      edgeLabelPlacement = EdgeLabelPlacement.auto;
    }

    // Shapes
    SfTooltipShape tooltipShape = const SfRectangularTooltipShape();
    String tooltipShapeStr =
        widget.control.attrString("tooltip_shape", "rectangular")!;
    if (tooltipShapeStr == "paddle") {
      tooltipShape = const SfPaddleTooltipShape();
    }

    SfTrackShape trackShape = const SfTrackShape();
    SfDividerShape dividerShape = const SfDividerShape();
    SfOverlayShape overlayShape = const SfOverlayShape();
    SfThumbShape thumbShape = const SfThumbShape();
    SfTickShape tickShape = const SfTickShape();

    SfTickShape? minorTickShape;
    String? minorTickShapeType = widget.control.attrString("minor_tick_shape");
    if (minorTickShapeType == "SfTickShape") {
      minorTickShape = const SfTickShape();
    } else {
      minorTickShape = const SfMinorTickShape();
    }

    // Thumb icons
    var startThumbIconCtrls = widget.children
        .where((c) => c.name == "start_thumb_icon" && c.isVisible);
    var endThumbIconCtrls =
        widget.children.where((c) => c.name == "end_thumb_icon" && c.isVisible);

    bool? adaptive =
        widget.control.attrBool("adaptive") ?? widget.parentAdaptive;
    bool disabled = widget.control.isDisabled || widget.parentDisabled;

    Widget? startThumbIcon = null;
    if (startThumbIconCtrls.isNotEmpty) {
      startThumbIcon = createControl(
          widget.control, startThumbIconCtrls.first.id, disabled,
          parentAdaptive: adaptive);
    }

    Widget? endThumbIcon = null;
    if (endThumbIconCtrls.isNotEmpty) {
      endThumbIcon = createControl(
          widget.control, endThumbIconCtrls.first.id, disabled,
          parentAdaptive: adaptive);
    }

    SliderTooltipPosition tooltipPosition;
    if (widget.control.attrString("tooltip_position") == "left") {
      tooltipPosition = SliderTooltipPosition.left;
    } else {
      tooltipPosition = SliderTooltipPosition.right;
    }

    // Formatting
    NumberFormat? numberFormat = null;
    DateFormat? dateFormat = null;
    DateIntervalType? dateIntervalType = null;

    // Clamp values within current min/max
    double currentStart = _values.start.clamp(min, max);
    double currentEnd = _values.end.clamp(min, max);
    if ((_values.start - currentStart).abs() > 0.00001 ||
        (_values.end - currentEnd).abs() > 0.00001) {
      debugPrint(
          "SyncfusionRangeSlider build: Clamping internal values from $_values to SfRangeValues($currentStart, $currentEnd) based on min=$min, max=$max");
      _values = SfRangeValues(currentStart, currentEnd);

      // Actualizar también start_value y end_value para mantener sincronización
      var props = {
        "start": currentStart.toString(),
        "end": currentEnd.toString(),
        "start_value": currentStart.toString(),
        "end_value": currentEnd.toString()
      };
      widget.backend
          .updateControlState(widget.control.id, props, server: false);
    }

    SfSliderThemeData? themeStyle = SfSliderThemeData();
    String? styleName = widget.control.attrString("sf_slider_theme");
    if (styleName != null) {
      Map<String, dynamic> json = jsonDecode(styleName);
      themeStyle = sfSliderThemeDataFromJSON(Theme.of(context), json)!;
    }
    

    Widget sliderWidget;
    if (isVertical) {
      sliderWidget = SfSliderTheme(
          data: themeStyle,
          child: SfRangeSlider.vertical(
            min: min,
            max: max,
            values: _values,
            interval: interval,
            stepSize: stepSize,
            minorTicksPerInterval: minorTicksPerInterval,
            showTicks: showTicks,
            showLabels: showLabels,
            showDividers: showDividers,
            enableTooltip: enableTooltip,
            shouldAlwaysShowTooltip: shouldAlwaysShowTooltip,
            enableIntervalSelection: enableIntervalSelection,
            dragMode: dragMode,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            labelPlacement: labelPlacement,
            edgeLabelPlacement: edgeLabelPlacement,

            // * shapes
            trackShape: trackShape,
            dividerShape: dividerShape,
            overlayShape: overlayShape,
            thumbShape: thumbShape,
            tickShape: tickShape,
            minorTickShape: minorTickShape,
            tooltipShape: tooltipShape,

            // * icons and tooltip position
            startThumbIcon: startThumbIcon,
            endThumbIcon: endThumbIcon,
            tooltipPosition: tooltipPosition,

            // last
            numberFormat: numberFormat,
            dateFormat: dateFormat,
            dateIntervalType: dateIntervalType,
            // labelFormatterCallback
            // tooltipTextFormatterCallback
            // semanticFormatterCallback

            // * inversed and handlers
            isInversed: isInversed,
            onChanged: !disabled ? handleChange : null,
            onChangeStart: !disabled ? handleChangeStart : null,
            onChangeEnd: !disabled ? handleChangeEnd : null,
          ));
    } else {
      sliderWidget = SfSliderTheme(
          data: themeStyle,
          child: SfRangeSlider(
            min: min,
            max: max,
            values: _values,
            interval: interval,
            stepSize: stepSize,
            minorTicksPerInterval: minorTicksPerInterval,
            showTicks: showTicks,
            showLabels: showLabels,
            showDividers: showDividers,
            enableTooltip: enableTooltip,
            shouldAlwaysShowTooltip: shouldAlwaysShowTooltip,
            enableIntervalSelection: enableIntervalSelection,
            dragMode: dragMode,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            labelPlacement: labelPlacement,
            edgeLabelPlacement: edgeLabelPlacement,

            // * shapes
            trackShape: trackShape,
            dividerShape: dividerShape,
            overlayShape: overlayShape,
            thumbShape: thumbShape,
            tickShape: tickShape,
            minorTickShape: minorTickShape,
            tooltipShape: tooltipShape,

            // * icons
            startThumbIcon: startThumbIcon,
            endThumbIcon: endThumbIcon,

            // last
            numberFormat: numberFormat,
            dateFormat: dateFormat,
            dateIntervalType: dateIntervalType,
            // labelFormatterCallback
            // tooltipTextFormatterCallback
            // semanticFormatterCallback

            // * inversed and handlers
            onChanged: !disabled ? handleChange : null,
            onChangeStart: !disabled ? handleChangeStart : null,
            onChangeEnd: !disabled ? handleChangeEnd : null,
          ));
    }

    return constrainedControl(
        context, sliderWidget, widget.parent, widget.control);
  }
}
