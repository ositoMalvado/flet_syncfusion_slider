import flet as ft
from flet_syncfusion_slider import (
    SyncfusionSlider,
    SyncfusionVerticalSlider,
    SyncfusionRangeSlider,
    SyncfusionVerticalRangeSlider,
    SfSliderTheme,
)


def main(page: ft.Page):
    print(SfSliderTheme().__str__())
    page.title = "Syncfusion Sliders Demonstration"
    page.theme_mode = ft.ThemeMode.LIGHT
    page.padding = 20
    page.scroll = "auto"

    # Function to display the basic slider value
    def basic_slider_changed(e):
        basic_slider_text.value = f"Value: {round(e.control.value)}"
        page.update()

    # Function to display the slider value with ticks
    def ticks_slider_changed(e):
        ticks_slider_text.value = f"Value: {round(e.control.value)}"
        inner_text.value = round(e.control.value)
        page.update()

    # Function to display the slider value with step_size
    def step_size_slider_changed(e):
        step_size_slider_text.value = f"Value: {round(e.control.value)}"
        page.update()

    # Function to display the slider value with minor ticks
    def minor_ticks_slider_changed(e):
        minor_ticks_slider_text.value = f"Value: {round(e.control.value)}"
        page.update()

    # Function to display the vertical slider value
    def vertical_slider_changed(e):
        vertical_slider_text.value = f"Value: {round(e.control.value)}"
        page.update()

    # Function to display the vertical slider value with step_size
    def vertical_step_size_slider_changed(e):
        vertical_step_size_slider_text.value = f"Value: {round(e.control.value)}"
        page.update()

    # Function to display the range slider value
    def range_slider_changed(e):
        range_slider_text.value = (
            f"Range: {round(e.control.start_value)} - {round(e.control.end_value)}"
        )
        page.update()

    # Function to display the range slider value with step_size
    def range_slider_step_size_changed(e):
        range_slider_step_size_text.value = (
            f"Range: {round(e.control.start_value)} - {round(e.control.end_value)}"
        )
        page.update()

    # Function to display the range slider value with colors
    def range_slider_colors_changed(e):
        range_slider_colors_text.value = (
            f"Range: {round(e.control.start_value)} - {round(e.control.end_value)}"
        )
        page.update()

    # Function to display the vertical range slider value
    def vertical_range_slider_changed(e):
        vertical_range_slider_text.value = (
            f"Range: {round(e.control.start_value)} - {round(e.control.end_value)}"
        )
        page.update()

    # 1. Basic Slider
    basic_slider_text = ft.Text("Value: 30", size=16)
    basic_slider = SyncfusionSlider(
        value=30,
        min=0,
        max=100,
        on_change=basic_slider_changed,
        width=400,
    )

    # 2. Slider with ticks, labels and tooltip
    ticks_slider_text = ft.Text("Value: 50", size=16)
    inner_text = ft.Text("50")
    ticks_slider = SyncfusionSlider(
        value=50,
        min=0,
        max=100,
        interval=10,
        show_ticks=True,
        show_labels=True,
        show_dividers=True,
        enable_tooltip=True,
        should_always_show_tooltip=True,
        active_color=ft.Colors.BLUE,
        inactive_color=ft.Colors.GREY_300,
        on_change=ticks_slider_changed,
        width=400,
        thumb_icon=ft.Container(
            expand=True, content=inner_text, alignment=ft.alignment.center
        ),
    )

    # 3. Slider with step_size
    step_size_slider_text = ft.Text("Value: 25", size=16)
    step_size_slider = SyncfusionSlider(
        value=25,
        min=0,
        max=100,
        interval=10,
        step_size=5,  # Increments of 5 units
        show_ticks=True,
        show_labels=True,
        enable_tooltip=True,
        # active_color=ft.Colors.RED,
        # inactive_color=ft.Colors.GREY_300,
        on_change=step_size_slider_changed,
        width=400,
        sf_slider_theme=SfSliderTheme(
            thumb_radius=15,
            thumb_color=ft.Colors.GREEN,
            tick_size_height=2,
            overlay_radius=50.0,
            thumb_stroke_width=20.0,
            overlay_color=ft.Colors.BLACK,
            tooltip_background_color=ft.Colors.with_opacity(0.5, ft.Colors.PRIMARY),
            track_corner_radius=0,
        ),
    )

    # 4. Slider with minor ticks
    minor_ticks_slider_text = ft.Text("Value: 60", size=16)
    minor_ticks_slider = SyncfusionSlider(
        value=60,
        min=0,
        max=100,
        interval=20,
        minor_ticks_per_interval=4,  # 4 minor marks between each main interval
        show_ticks=True,
        show_labels=True,
        show_dividers=True,
        enable_tooltip=True,
        active_color=ft.Colors.AMBER,
        inactive_color=ft.Colors.GREY_300,
        on_change=minor_ticks_slider_changed,
        width=400,
    )

    # 5. Vertical slider with custom configuration
    vertical_slider_text = ft.Text("Value: 40", size=16)
    vertical_slider = SyncfusionVerticalSlider(
        value=40,
        min=0,
        max=100,
        interval=20,
        show_ticks=True,
        show_labels=True,
        minor_ticks_per_interval=1,
        active_color=ft.Colors.GREEN,
        inactive_color=ft.Colors.GREY_300,
        on_change=vertical_slider_changed,
        height=300,
    )

    # 6. Vertical slider with step_size
    vertical_step_size_slider_text = ft.Text("Value: 35", size=16)
    vertical_step_size_slider = SyncfusionVerticalSlider(
        value=35,
        min=0,
        max=100,
        interval=10,
        step_size=5,  # Increments of 5 units
        show_ticks=True,
        show_labels=True,
        enable_tooltip=True,
        active_color=ft.Colors.INDIGO,
        inactive_color=ft.Colors.GREY_300,
        on_change=vertical_step_size_slider_changed,
        height=300,
    )

    # 7. Basic Range Slider
    range_slider_text = ft.Text("Range: 20 - 80", size=16)
    range_slider = SyncfusionRangeSlider(
        start_value=20,
        end_value=80,
        min=0,
        max=100,
        interval=10,
        show_ticks=True,
        show_labels=True,
        on_change=range_slider_changed,
        width=400,
    )

    # 8. Range Slider with step_size
    range_slider_step_size_text = ft.Text("Range: 15 - 75", size=16)
    range_slider_step_size = SyncfusionRangeSlider(
        start_value=15,
        end_value=75,
        min=0,
        max=100,
        interval=10,
        step_size=5,  # Increments of 5 units
        show_ticks=True,
        show_labels=True,
        enable_tooltip=True,
        active_color=ft.Colors.TEAL,
        inactive_color=ft.Colors.GREY_300,
        on_change=range_slider_step_size_changed,
        width=400,
    )

    # 9. Range Slider with colors and custom tooltip
    range_slider_colors_text = ft.Text("Range: 30 - 70", size=16)
    range_slider_colors = SyncfusionRangeSlider(
        start_value=30,
        end_value=70,
        min=0,
        max=100,
        interval=25,
        show_ticks=True,
        show_labels=True,
        show_dividers=True,
        enable_tooltip=True,
        should_always_show_tooltip=True,
        active_color=ft.Colors.ORANGE,
        inactive_color=ft.Colors.GREY_300,
        on_change=range_slider_colors_changed,
        width=400,
    )

    # 10. Vertical Range Slider
    vertical_range_slider_text = ft.Text("Range: 10 - 90", size=16)
    vertical_range_slider = SyncfusionVerticalRangeSlider(
        start_value=10,
        end_value=90,
        min=0,
        max=100,
        interval=20,
        show_ticks=True,
        show_labels=True,
        enable_tooltip=True,
        active_color=ft.Colors.PURPLE,
        inactive_color=ft.Colors.GREY_300,
        on_change=vertical_range_slider_changed,
        height=300,
    )

    # Organize sliders on the page
    page.add(
        ft.Text(
            "Syncfusion Sliders Demonstration",
            size=24,
        ),
        ft.Divider(),
        # Row 1: Basic Horizontal Sliders
        ft.Text(
            "Basic Horizontal Sliders",
            size=20,
        ),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.Text("Basic Slider", size=18),
                        basic_slider_text,
                        basic_slider,
                    ],
                    spacing=10,
                ),
                ft.Column(
                    [
                        ft.Text("Slider with Ticks and Labels", size=18),
                        ticks_slider_text,
                        ticks_slider,
                    ],
                    spacing=10,
                ),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=40,
            wrap=True,
        ),
        ft.Divider(),
        # Row 2: Horizontal Sliders with step_size and minor_ticks
        ft.Text(
            "Horizontal Sliders with Step Size and Minor Ticks",
            size=20,
        ),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.Text("Slider with Step Size (5)", size=18),
                        step_size_slider_text,
                        step_size_slider,
                    ],
                    spacing=10,
                ),
                ft.Column(
                    [
                        ft.Text("Slider with Minor Ticks (4)", size=18),
                        minor_ticks_slider_text,
                        minor_ticks_slider,
                    ],
                    spacing=10,
                ),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=40,
            wrap=True,
        ),
        ft.Divider(),
        # Row 3: Horizontal Range Sliders
        ft.Text(
            "Horizontal Range Sliders",
            size=20,
        ),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.Text("Basic Range Slider", size=18),
                        range_slider_text,
                        range_slider,
                    ],
                    spacing=10,
                ),
                ft.Column(
                    [
                        ft.Text("Range Slider with Step Size (5)", size=18),
                        range_slider_step_size_text,
                        range_slider_step_size,
                    ],
                    spacing=10,
                ),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=40,
            wrap=True,
        ),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.Text("Range Slider with Colors", size=18),
                        range_slider_colors_text,
                        range_slider_colors,
                    ],
                    spacing=10,
                ),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=40,
            wrap=True,
        ),
        ft.Divider(),
        # Row 4: Vertical Sliders
        ft.Text(
            "Vertical Sliders",
            size=20,
        ),
        ft.Row(
            [
                ft.Column(
                    [
                        ft.Text("Vertical Slider", size=18),
                        vertical_slider_text,
                        vertical_slider,
                    ],
                    horizontal_alignment=ft.CrossAxisAlignment.CENTER,
                    spacing=10,
                ),
                ft.Column(
                    [
                        ft.Text("Vertical Slider with Step Size (5)", size=18),
                        vertical_step_size_slider_text,
                        vertical_step_size_slider,
                    ],
                    horizontal_alignment=ft.CrossAxisAlignment.CENTER,
                    spacing=10,
                ),
                ft.Column(
                    [
                        ft.Text("Vertical Range Slider", size=18),
                        vertical_range_slider_text,
                        vertical_range_slider,
                    ],
                    horizontal_alignment=ft.CrossAxisAlignment.CENTER,
                    spacing=10,
                ),
            ],
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=40,
            wrap=True,
        ),
    )


ft.app(target=main)
