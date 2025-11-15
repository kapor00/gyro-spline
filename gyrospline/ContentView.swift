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
            motion.accelerometerUpdateInterval = 0.1 // Updates every 0.1 seconds
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
    @State
    private var smoothedRotationZ: Double = 0
    

    var body: some View {
      
        
        ZStack {
            
            let url = URL(string: "https://build.spline.design/GRQQcwUMVCb10ErKjdMt/scene.splineswift")!
            SplineView(sceneFileURL: url, controller: scene3D)
            .edgesIgnoringSafeArea(.all) // Extend under safe areas (like notch, home bar)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: motionManager.accelerometerData) {
                if let accelData = motionManager.accelerometerData {
                    // Accelerometer data is in g-forces (-1.0 to 1.0 typically)
                    // Convert acceleration to rotation angles (in degrees)
                    // Scale factor to convert g-force to rotation angle
                    let scaleFactor = 90.0 // Max rotation angle in degrees
                    
                    // Map acceleration to rotation (target values):
                    // X acceleration -> Y rotation (tilt left/right)
                    // Y acceleration -> X rotation (tilt forward/back)
                    // Z acceleration -> Z rotation (twist)
                    let targetRotationX = accelData.acceleration.y * scaleFactor + 45
                    let targetRotationY = accelData.acceleration.x * scaleFactor
                    let targetRotationZ = accelData.acceleration.z * scaleFactor
                    

                    
                    let subject = scene3D.findObject(name: "subject")
                    subject?.rotation.x = Float(targetRotationX)
                    subject?.rotation.y = Float(targetRotationY)
                    // subject?.rotation.z = Float(smoothedRotationZ)
                }
            }
            
            VStack(spacing:24) {
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
        }
    }
}

#Preview {
    ContentView()
}
