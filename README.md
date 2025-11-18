# GyroSpline

A playground project exploring how to embed Spline 3D scenes into SwiftUI applications using Spline's native runtime. This demo combines device motion sensors with interactive 3D scenes for a fun, immersive experience.

<img width="256" height="256" alt="Spline Gyro@1-1024x1024 (8)" src="https://github.com/user-attachments/assets/6933ed89-7a95-4b24-8493-8e0a473aefee" />


https://github.com/user-attachments/assets/8b5a60d4-82db-4a78-a03c-79c801cee647


## Overview

This is an experimental project that demonstrates integrating Spline's native iOS runtime with SwiftUI. The app uses CoreMotion to track your device's accelerometer data and translates it into real-time 3D object rotations in a Spline scene. Tilt your device to control the 3D scene interactively!

**Want to learn more about Spline's Code API for SwiftUI?** Check out the [official documentation](https://docs.spline.design/exporting-your-scene/apple-platform/code-api-for-swift-ui).

## Embedding Spline Scenes

This project demonstrates two ways to embed Spline scenes in your SwiftUI app:

- **Cloud Embedding**: The app currently loads the scene from Spline's cloud service (see `ContentView.swift`)
- **Offline Embedding**: You can also bundle the scene file locally for offline use

### The Spline Scene

The original `.spline` scene file is included in the `spline scene/` folder. You can:

- **Import it to Spline**: Sign up at [app.spline.design](https://app.spline.design) and import the `.spline` file to edit and customize the scene
- **Get a copy online**: Access the scene directly at [https://app.spline.design/file/704265f5-7a21-401d-bbd5-181b6c0c97af](https://app.spline.design/file/704265f5-7a21-401d-bbd5-181b6c0c97af)

## Features

- 🎮 Real-time gyroscope/accelerometer integration
- 🎨 Interactive 3D Spline scenes
- 📱 Smooth motion tracking with exponential smoothing
- 🖼️ Full-screen immersive experience

## Requirements

- iOS 14.0 or later
- Xcode 14.0 or later
- Swift 5.7 or later
- A physical iOS device (motion sensors don't work in the simulator)

## Getting Started

1. Open `gyrospline.xcodeproj` in Xcode
2. Install dependencies (SplineRuntime should be managed via Swift Package Manager)
3. Connect your iOS device and select it as the build target
4. Build and run the project (⌘R)

**Note:** You'll need a physical iOS device to test the motion sensors, as they don't work in the simulator.

## Usage

1. Launch the app on your iOS device
2. Hold your device and tilt it in different directions
3. Watch as the 3D scene responds to your device's orientation in real-time

## Project Structure

```
gyrospline/
├── gyrospline/
│   ├── ContentView.swift          # Main view with motion integration
│   ├── gyrosplineApp.swift        # App entry point
│   ├── Assets.xcassets/           # App icons and assets
│   └── spline scene/              # Spline scene files
└── gyrospline.xcodeproj/          # Xcode project file
```

## Demo Video

<!-- To embed an MP4 video, you have a few options:

Option 1: Upload to a video hosting service and embed
<video width="100%" controls>
  <source src="https://your-video-host.com/demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

Option 2: Use GitHub's video support (drag and drop the video file into GitHub)
![Demo Video](path/to/your/demo.mp4)

Option 3: Convert to GIF and embed
![Demo GIF](path/to/your/demo.gif)
-->

**Note:** To add your demo video:
1. Upload your MP4 file to the repository (e.g., in a `media/` folder)
2. Replace the placeholder above with:
   ```markdown
   <video width="100%" controls>
     <source src="media/demo.mp4" type="video/mp4">
     Your browser does not support the video tag.
   </video>
   ```
3. Or simply drag and drop the MP4 file into GitHub's web interface when editing the README

## Technologies

- **SwiftUI** - Modern UI framework
- **SplineRuntime** - Spline's native iOS runtime for 3D scene rendering
- **CoreMotion** - Motion sensor access
- **Combine** - Reactive programming

## Learn More

- [Spline Code API for SwiftUI Documentation](https://docs.spline.design/exporting-your-scene/apple-platform/code-api-for-swift-ui) - Official guide for integrating Spline scenes into SwiftUI apps

## License

[Add your license here]

## Author

Gábor Pribék

---

Made with ❤️ using SwiftUI and Spline

