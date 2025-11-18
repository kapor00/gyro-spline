# Portal – Spline SwiftUI Gyro playground
<img width="256" height="256" alt="spline-gyro-app-icon" src="https://github.com/user-attachments/assets/3471db4f-26cd-481e-b7e5-2746c1e450ae" />

A playground project exploring how to embed Spline 3D scenes into SwiftUI applications using Spline's native runtime. This demo combines device motion sensors with interactive 3D scenes for a fun, immersive experience.

## Overview

![portal loop v3 compressed](https://github.com/user-attachments/assets/70882780-12ef-4b7e-9f9b-92091a09ec21)


This is an experimental project that demonstrates integrating Spline's native iOS runtime with SwiftUI. The app uses CoreMotion to track your device's accelerometer data and translates it into real-time 3D object rotations in a Spline scene. Tilt your device to control the 3D scene interactively!

**Want to learn more about Spline's Code API for SwiftUI?** Check out the [official documentation](https://docs.spline.design/exporting-your-scene/apple-platform/code-api-for-swift-ui).

## Embedding Spline Scenes

This project demonstrates two ways to embed Spline scenes in your SwiftUI app:

- **Cloud Embedding**: The app currently loads the scene from Spline's cloud service (see `ContentView.swift`)
- **Offline Embedding**: You can also bundle the scene file locally for offline use

### The Spline Scene

The original `.spline` scene file is included in the `spline scene/` folder. You can:

- **Import it to Spline**: Sign up at [app.spline.design](https://app.spline.design) and import the `.spline` file to edit and customize the scene
- **Get a copy online**: [Access the scene here](https://community.spline.design/file/1ffa9c2c-534a-4eb0-8ff8-7a2d5be03225)

## Features

- 🎮 Real-time gyroscope/accelerometer integration
- 🎨 Interactive 3D Spline scenes
- 📱 Smooth motion tracking with exponential smoothing
- 🖼️ Full-screen immersive experience

## Requirements

- iOS 26.0 or later (didn't test on older devices)
- Xcode 26.0 or later
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


## Technologies

- **SwiftUI** - Modern UI framework
- **SplineRuntime** - Spline's native iOS runtime for 3D scene rendering
- **CoreMotion** - Motion sensor access
- **Combine** - Reactive programming

## Learn More

- [Spline Code API for SwiftUI Documentation](https://docs.spline.design/exporting-your-scene/apple-platform/code-api-for-swift-ui) - Official guide for integrating Spline scenes into SwiftUI apps

## License

This project is licensed under the MIT License.

## Author

Gábor Pribék

---

Made with ❤️ using SwiftUI and Spline

