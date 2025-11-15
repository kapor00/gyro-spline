//
//  ContentView.swift
//  gyrospline
//
//  Created by Gábor Pribék on 2025. 11. 15..
//
import SplineRuntime
import SwiftUI
import Combine
import CoreMotion // Allows access to device sensors

// MotionManager class to handle accelerometer and gyroscope updates
class MotionManager: ObservableObject {
    private let motion = CMMotionManager() // Core motion manager instance
    @Published var accelerometerData: CMAccelerometerData? // Published data for SwiftUI updates
    
    init() {
        startAcceleromoterUpdates() // Start accelerometer updates
    }

    // Function to start accelerometer updates
    func startAcceleromoterUpdates() {
        if motion.isAccelerometerAvailable {
            motion.accelerometerUpdateInterval = 1.0 / 100.0 // 100 FPS
            motion.startAccelerometerUpdates(to: .main) { [weak self] data, error in
                if let data = data {
                    self?.accelerometerData = data // Update accelerometer data
                }
            }
        }
    }
}

struct ContentView: View {
    private var scene3D = SplineController()
    
    @StateObject private var motionManager = MotionManager() // StateObject to manage motion updates

    // Smoothed rotation values (current displayed rotation)
    @State
    private var smoothedRotationX: Double = 0
    @State
    private var smoothedRotationY: Double = 0

    

    var body: some View {
      
        
        ZStack {
            
            let url = URL(string: "https://build.spline.design/9QGbx5zTdo-MmXfcQcWA/scene.splineswift")!
            SplineView(sceneFileURL: url, controller: scene3D)
            .edgesIgnoringSafeArea(.all) // Extend under safe areas (like notch, home bar)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: motionManager.accelerometerData) {
                if let accelData = motionManager.accelerometerData {
                    let scaleFactor = 90.0
                    let targetX = (accelData.acceleration.y * scaleFactor + 45) * -1
                    let targetY = accelData.acceleration.x * scaleFactor
                    
                    // Exponential smoothing (0.15 = smooth, 0.3 = responsive)
                    smoothedRotationX += (targetX - smoothedRotationX) * 0.1
                    smoothedRotationY += (targetY - smoothedRotationY) * 0.1
                    
                    let subject = scene3D.findObject(name: "subject")
                    subject?.rotation.x = Float(smoothedRotationX)
                    subject?.rotation.y = Float(smoothedRotationY)
                }
            }
            
            /*
            HStack(spacing:24) {
                // Display Accelerometer Data
                Text("Accelerometer Data")
                    .font(.headline)
                
                if let data = motionManager.accelerometerData {
                    Text("X: \(data.acceleration.x, specifier: "%.2f")")
                    Text("Y: \(data.acceleration.y, specifier: "%.2f")")
                    Text("Z: \(data.acceleration.z, specifier: "%.2f")")
                } else {
                    Text("No motion found")
                }
                
                Rectangle()
                    .frame(maxHeight: .infinity)
                    .opacity(0)
                    
            
            }
            .padding(.bottom, 24)
             */
        }
    }
}

#Preview {
    ContentView()
}
