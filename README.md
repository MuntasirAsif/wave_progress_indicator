# 🌊 Wave Progress Indicator

A customizable and animated wave progress indicator widget for Flutter. Perfect for visualizing progress with a fluid, liquid-like motion.

<p align="center">
  <img src="https://github.com/MuntasirAshif/wave_progress_indicator/raw/main/asset/preview-1.gif" width="48%"  alt=""/>
  <img src="https://github.com/MuntasirAshif/wave_progress_indicator/raw/main/asset/preview-2.gif" width="48%"  alt=""/>
</p>


## ✨ Features

- 🎨 Customizable gradient or solid wave fill
- 🌊 Adjustable wave height and animation speed
- 🧱 Optional rounded corners via `BorderRadius`
- 🧩 Overlay support via `child` widget
- ⚡ Smooth and lightweight animation

### Parameters:
- `value` (required): Progress value between 0.0 and 1.0.
- `gradientColors`: List of colors used to build a default gradient if `gradient` is not provided.
- `gradient`: A custom `LinearGradient` for the wave fill.
- `waveHeight`: The amplitude of the wave.
- `speed`: The speed of the wave animation.
- `borderRadius`: The radius to apply to the clipped container.
- `child`: An optional widget to display over the wave (e.g., text or icon).

## 🛠 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  wave_progress_indicator: ^1.0.0
