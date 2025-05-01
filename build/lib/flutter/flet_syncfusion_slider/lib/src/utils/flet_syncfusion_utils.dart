import 'package:flutter/material.dart';
import 'package:flet/flet.dart';
import 'package:syncfusion_flutter_core/theme.dart';

SfSliderThemeData? sfSliderThemeDataFromJSON(
    ThemeData theme, Map<String, dynamic>? json,
    [double? defaultActiveTrackHeight,
    double? defaultInactiveTrackHeight,
    Size? defaultTickSize,
    Size? defaultMinorTickSize,
    Offset? defaultTickOffset,
    Offset? defaultLabelOffset,
    TextStyle? defaultInactiveLabelStyle,
    TextStyle? defaultActiveLabelStyle,
    TextStyle? defaultTooltipTextStyle,
    Color? defaultInactiveTrackColor,
    Color? defaultActiveTrackColor,
    Color? defaultThumbColor,
    Color? defaultThumbStrokeColor,
    Color? defaultActiveDividerStrokeColor,
    Color? defaultInactiveDividerStrokeColor,
    Color? defaultActiveTickColor,
    Color? defaultInactiveTickColor,
    Color? defaultDisabledActiveTickColor,
    Color? defaultDisabledInactiveTickColor,
    Color? defaultActiveMinorTickColor,
    Color? defaultInactiveMinorTickColor,
    Color? defaultDisabledActiveMinorTickColor,
    Color? defaultDisabledInactiveMinorTickColor,
    Color? defaultOverlayColor,
    Color? defaultInactiveDividerColor,
    Color? defaultActiveDividerColor,
    Color? defaultDisabledActiveTrackColor,
    Color? defaultDisabledInactiveTrackColor,
    Color? defaultDisabledActiveDividerColor,
    Color? defaultDisabledInactiveDividerColor,
    Color? defaultDisabledThumbColor,
    Color? defaultTooltipBackgroundColor,
    double? defaultTrackCornerRadius,
    double? defaultOverlayRadius,
    double? defaultThumbRadius,
    double? defaultActiveDividerRadius,
    double? defaultInactiveDividerRadius,
    double? defaultThumbStrokeWidth,
    double? defaultActiveDividerStrokeWidth,
    double? defaultInactiveDividerStrokeWidth]) {
  if (json == null) {
    return null;
  }

  return SfSliderThemeData(
    activeTrackHeight: parseDouble(
        json["active_track_height"], defaultActiveTrackHeight ?? 6.0)!,
    inactiveTrackHeight: parseDouble(
        json["inactive_track_height"], defaultInactiveTrackHeight ?? 4.0)!,
    tickSize: json["tick_size"] != null
        ? sizeFromJson(json["tick_size"])
        : defaultTickSize,
    minorTickSize: json["minor_tick_size"] != null
        ? sizeFromJson(json["minor_tick_size"])
        : defaultMinorTickSize,
    tickOffset: json["tick_offset"] != null
        ? offsetFromJson(json["tick_offset"])
        : defaultTickOffset,
    labelOffset: json["label_offset"] != null
        ? offsetFromJson(json["label_offset"])
        : defaultLabelOffset,
    inactiveLabelStyle: json["inactive_label_style"] != null
        ? textStyleFromJson(theme, json["inactive_label_style"])
        : defaultInactiveLabelStyle,
    activeLabelStyle: json["active_label_style"] != null
        ? textStyleFromJson(theme, json["active_label_style"])
        : defaultActiveLabelStyle,
    tooltipTextStyle: json["tooltip_text_style"] != null
        ? textStyleFromJson(theme, json["tooltip_text_style"])
        : defaultTooltipTextStyle,
    inactiveTrackColor: parseColor(theme, json["inactive_track_color"]) ??
        defaultInactiveTrackColor,
    activeTrackColor: parseColor(theme, json["active_track_color"]) ??
        defaultActiveTrackColor,
    thumbColor: parseColor(theme, json["thumb_color"]) ?? defaultThumbColor,
    thumbStrokeColor: parseColor(theme, json["thumb_stroke_color"]) ??
        defaultThumbStrokeColor,
    activeDividerStrokeColor:
        parseColor(theme, json["active_divider_stroke_color"]) ??
            defaultActiveDividerStrokeColor,
    inactiveDividerStrokeColor:
        parseColor(theme, json["inactive_divider_stroke_color"]) ??
            defaultInactiveDividerStrokeColor,
    activeTickColor:
        parseColor(theme, json["active_tick_color"]) ?? defaultActiveTickColor,
    inactiveTickColor: parseColor(theme, json["inactive_tick_color"]) ??
        defaultInactiveTickColor,
    disabledActiveTickColor:
        parseColor(theme, json["disabled_active_tick_color"]) ??
            defaultDisabledActiveTickColor,
    disabledInactiveTickColor:
        parseColor(theme, json["disabled_inactive_tick_color"]) ??
            defaultDisabledInactiveTickColor,
    activeMinorTickColor: parseColor(theme, json["active_minor_tick_color"]) ??
        defaultActiveMinorTickColor,
    inactiveMinorTickColor:
        parseColor(theme, json["inactive_minor_tick_color"]) ??
            defaultInactiveMinorTickColor,
    disabledActiveMinorTickColor:
        parseColor(theme, json["disabled_active_minor_tick_color"]) ??
            defaultDisabledActiveMinorTickColor,
    disabledInactiveMinorTickColor:
        parseColor(theme, json["disabled_inactive_minor_tick_color"]) ??
            defaultDisabledInactiveMinorTickColor,
    overlayColor:
        parseColor(theme, json["overlay_color"]) ?? defaultOverlayColor,
    inactiveDividerColor: parseColor(theme, json["inactive_divider_color"]) ??
        defaultInactiveDividerColor,
    activeDividerColor: parseColor(theme, json["active_divider_color"]) ??
        defaultActiveDividerColor,
    disabledActiveTrackColor:
        parseColor(theme, json["disabled_active_track_color"]) ??
            defaultDisabledActiveTrackColor,
    disabledInactiveTrackColor:
        parseColor(theme, json["disabled_inactive_track_color"]) ??
            defaultDisabledInactiveTrackColor,
    disabledActiveDividerColor:
        parseColor(theme, json["disabled_active_divider_color"]) ??
            defaultDisabledActiveDividerColor,
    disabledInactiveDividerColor:
        parseColor(theme, json["disabled_inactive_divider_color"]) ??
            defaultDisabledInactiveDividerColor,
    disabledThumbColor: parseColor(theme, json["disabled_thumb_color"]) ??
        defaultDisabledThumbColor,
    tooltipBackgroundColor:
        parseColor(theme, json["tooltip_background_color"]) ??
            defaultTooltipBackgroundColor,
    trackCornerRadius:
        parseDouble(json["track_corner_radius"], defaultTrackCornerRadius),
    overlayRadius:
        parseDouble(json["overlay_radius"], defaultOverlayRadius ?? 24.0)!,
    thumbRadius: parseDouble(json["thumb_radius"], defaultThumbRadius ?? 10.0)!,
    activeDividerRadius:
        parseDouble(json["active_divider_radius"], defaultActiveDividerRadius),
    inactiveDividerRadius: parseDouble(
        json["inactive_divider_radius"], defaultInactiveDividerRadius),
    thumbStrokeWidth:
        parseDouble(json["thumb_stroke_width"], defaultThumbStrokeWidth),
    activeDividerStrokeWidth: parseDouble(
        json["active_divider_stroke_width"], defaultActiveDividerStrokeWidth),
    inactiveDividerStrokeWidth: parseDouble(
        json["inactive_divider_stroke_width"],
        defaultInactiveDividerStrokeWidth),
  );
}
