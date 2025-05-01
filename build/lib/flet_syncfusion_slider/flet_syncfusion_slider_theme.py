import json
from dataclasses import dataclass
from enum import Enum
from typing import Any, List, Optional, Union, Dict

from flet.core.types import ColorValue, OptionalNumber, ColorEnums


@dataclass
class SfSliderTheme:
    """
    Defines the visual style for SyncfusionSlider and SyncfusionRangeSlider controls.

    This class allows customizing the appearance of Syncfusion sliders,
    including colors, sizes, radii, and text styles.

    Example:
    ```python
    import flet as ft
    from flet_syncfusion_slider import SyncfusionSlider, SfSliderTheme

    def main(page: ft.Page):

        theme = SfSliderTheme(
            active_track_height=8.0,
            inactive_track_height=6.0,
            thumb_radius=12.0,
            active_track_color="blue",
            inactive_track_color="lightblue",
            thumb_color="darkblue",
            overlay_radius=24.0,
        )


        slider = SyncfusionSlider(min=0, max=100, value=50, sf_slider_theme=theme)

        page.add(slider)

    ft.app(target=main)
    """

    active_track_height: OptionalNumber = None
    inactive_track_height: OptionalNumber = None

    tick_size_width: OptionalNumber = None
    tick_size_height: OptionalNumber = None
    minor_tick_size_width: OptionalNumber = None
    minor_tick_size_height: OptionalNumber = None

    tick_offset_dx: OptionalNumber = None
    tick_offset_dy: OptionalNumber = None
    label_offset_dx: OptionalNumber = None
    label_offset_dy: OptionalNumber = None

    inactive_label_style: Optional[Dict[str, Any]] = None
    active_label_style: Optional[Dict[str, Any]] = None
    tooltip_text_style: Optional[Dict[str, Any]] = None

    inactive_track_color: Optional[ColorValue] = None
    active_track_color: Optional[ColorValue] = None
    thumb_color: Optional[ColorValue] = None
    thumb_stroke_color: Optional[ColorValue] = None
    active_divider_stroke_color: Optional[ColorValue] = None
    inactive_divider_stroke_color: Optional[ColorValue] = None
    active_tick_color: Optional[ColorValue] = None
    inactive_tick_color: Optional[ColorValue] = None
    disabled_active_tick_color: Optional[ColorValue] = None
    disabled_inactive_tick_color: Optional[ColorValue] = None
    active_minor_tick_color: Optional[ColorValue] = None
    inactive_minor_tick_color: Optional[ColorValue] = None
    disabled_active_minor_tick_color: Optional[ColorValue] = None
    disabled_inactive_minor_tick_color: Optional[ColorValue] = None
    overlay_color: Optional[ColorValue] = None
    inactive_divider_color: Optional[ColorValue] = None
    active_divider_color: Optional[ColorValue] = None
    disabled_active_track_color: Optional[ColorValue] = None
    disabled_inactive_track_color: Optional[ColorValue] = None
    disabled_active_divider_color: Optional[ColorValue] = None
    disabled_inactive_divider_color: Optional[ColorValue] = None
    disabled_thumb_color: Optional[ColorValue] = None
    tooltip_background_color: Optional[ColorValue] = None

    track_corner_radius: OptionalNumber = None
    overlay_radius: OptionalNumber = None
    thumb_radius: OptionalNumber = None
    active_divider_radius: OptionalNumber = None
    inactive_divider_radius: OptionalNumber = None

    thumb_stroke_width: OptionalNumber = None
    active_divider_stroke_width: OptionalNumber = None
    inactive_divider_stroke_width: OptionalNumber = None

    def to_dict(self) -> Dict[str, Any]:
        """
        Convierte el objeto SfSliderTheme a un diccionario para serialización JSON.

        Returns:
            Dict[str, Any]: Un diccionario con las propiedades del tema.
        """

        def _color_to_str(color):
            if color is None:
                return None

            for enum_cls in ColorEnums:
                if isinstance(color, enum_cls):
                    return color.name.lower()

            if hasattr(color, "__str__"):
                return str(color)

            return color

        result = {}

        if self.active_track_height is not None:
            result["active_track_height"] = self.active_track_height
        if self.inactive_track_height is not None:
            result["inactive_track_height"] = self.inactive_track_height

        if self.tick_size_width is not None and self.tick_size_height is not None:
            result["tick_size"] = {
                "width": self.tick_size_width,
                "height": self.tick_size_height,
            }
        if (
            self.minor_tick_size_width is not None
            and self.minor_tick_size_height is not None
        ):
            result["minor_tick_size"] = {
                "width": self.minor_tick_size_width,
                "height": self.minor_tick_size_height,
            }

        if self.tick_offset_dx is not None and self.tick_offset_dy is not None:
            result["tick_offset"] = {
                "dx": self.tick_offset_dx,
                "dy": self.tick_offset_dy,
            }
        if self.label_offset_dx is not None and self.label_offset_dy is not None:
            result["label_offset"] = {
                "dx": self.label_offset_dx,
                "dy": self.label_offset_dy,
            }

        if self.inactive_label_style is not None:
            result["inactive_label_style"] = self.inactive_label_style
        if self.active_label_style is not None:
            result["active_label_style"] = self.active_label_style
        if self.tooltip_text_style is not None:
            result["tooltip_text_style"] = self.tooltip_text_style

        if self.inactive_track_color is not None:
            result["inactive_track_color"] = _color_to_str(self.inactive_track_color)
        if self.active_track_color is not None:
            result["active_track_color"] = _color_to_str(self.active_track_color)
        if self.thumb_color is not None:
            result["thumb_color"] = _color_to_str(self.thumb_color)
        if self.thumb_stroke_color is not None:
            result["thumb_stroke_color"] = _color_to_str(self.thumb_stroke_color)
        if self.active_divider_stroke_color is not None:
            result["active_divider_stroke_color"] = _color_to_str(
                self.active_divider_stroke_color
            )
        if self.inactive_divider_stroke_color is not None:
            result["inactive_divider_stroke_color"] = _color_to_str(
                self.inactive_divider_stroke_color
            )
        if self.active_tick_color is not None:
            result["active_tick_color"] = _color_to_str(self.active_tick_color)
        if self.inactive_tick_color is not None:
            result["inactive_tick_color"] = _color_to_str(self.inactive_tick_color)
        if self.disabled_active_tick_color is not None:
            result["disabled_active_tick_color"] = _color_to_str(
                self.disabled_active_tick_color
            )
        if self.disabled_inactive_tick_color is not None:
            result["disabled_inactive_tick_color"] = _color_to_str(
                self.disabled_inactive_tick_color
            )
        if self.active_minor_tick_color is not None:
            result["active_minor_tick_color"] = _color_to_str(
                self.active_minor_tick_color
            )
        if self.inactive_minor_tick_color is not None:
            result["inactive_minor_tick_color"] = _color_to_str(
                self.inactive_minor_tick_color
            )
        if self.disabled_active_minor_tick_color is not None:
            result["disabled_active_minor_tick_color"] = _color_to_str(
                self.disabled_active_minor_tick_color
            )
        if self.disabled_inactive_minor_tick_color is not None:
            result["disabled_inactive_minor_tick_color"] = _color_to_str(
                self.disabled_inactive_minor_tick_color
            )
        if self.overlay_color is not None:
            result["overlay_color"] = _color_to_str(self.overlay_color)
        if self.inactive_divider_color is not None:
            result["inactive_divider_color"] = _color_to_str(
                self.inactive_divider_color
            )
        if self.active_divider_color is not None:
            result["active_divider_color"] = _color_to_str(self.active_divider_color)
        if self.disabled_active_track_color is not None:
            result["disabled_active_track_color"] = _color_to_str(
                self.disabled_active_track_color
            )
        if self.disabled_inactive_track_color is not None:
            result["disabled_inactive_track_color"] = _color_to_str(
                self.disabled_inactive_track_color
            )
        if self.disabled_active_divider_color is not None:
            result["disabled_active_divider_color"] = _color_to_str(
                self.disabled_active_divider_color
            )
        if self.disabled_inactive_divider_color is not None:
            result["disabled_inactive_divider_color"] = _color_to_str(
                self.disabled_inactive_divider_color
            )
        if self.disabled_thumb_color is not None:
            result["disabled_thumb_color"] = _color_to_str(self.disabled_thumb_color)
        if self.tooltip_background_color is not None:
            result["tooltip_background_color"] = _color_to_str(
                self.tooltip_background_color
            )

        if self.track_corner_radius is not None:
            result["track_corner_radius"] = self.track_corner_radius
        if self.overlay_radius is not None:
            result["overlay_radius"] = self.overlay_radius
        if self.thumb_radius is not None:
            result["thumb_radius"] = self.thumb_radius
        if self.active_divider_radius is not None:
            result["active_divider_radius"] = self.active_divider_radius
        if self.inactive_divider_radius is not None:
            result["inactive_divider_radius"] = self.inactive_divider_radius

        if self.thumb_stroke_width is not None:
            result["thumb_stroke_width"] = self.thumb_stroke_width
        if self.active_divider_stroke_width is not None:
            result["active_divider_stroke_width"] = self.active_divider_stroke_width
        if self.inactive_divider_stroke_width is not None:
            result["inactive_divider_stroke_width"] = self.inactive_divider_stroke_width

        return result

    def __str__(self) -> str:
        """
        Convierte el objeto SfSliderTheme a una cadena JSON.

        Returns:
            str: Una cadena JSON que representa el tema.
        """
        return json.dumps(self.to_dict())
