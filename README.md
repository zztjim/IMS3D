## Overview

**IMS3D** is a cross-platform inspection and maintenance prototype built using **visionOS**, **iOS**, and **SwiftUI**.
The project demonstrates how 3D visualization and AI-assisted maintenance analysis can be integrated into a unified system for industrial applications such as underground mine inspection or equipment monitoring.

The system currently includes:

* 3D model rendering on visionOS
* Predictive maintenance analysis (prototype) on both visionOS and iOS
* Shared logic architecture supporting multi-platform build targets

---

## Features

### **1. visionOS Features**

* 3D equipment visualization using **RealityKit / RealityView**
* Spatial UI for displaying inspection content
* Dedicated window for running AI maintenance checks

### **2. iOS Features**

* Lightweight interface for predictive maintenance
* Reuses the same shared ViewModel and models as visionOS
* Demonstrates code portability and platform scalability

### **3. Shared Logic**

All business logic lives inside the `Shared/` directory:

* Equipment data model
* AI prediction logic (`AIPredictViewModel`)
* Cross-platform SwiftUI views (`AIPredictView`)

This design ensures both targets share the same core functionality.

---

## AI Predictive Maintenance (Prototype)

The system includes a predictive maintenance module that:

* Evaluates equipment conditions
* Generates a failure likelihood score
* Offers actionable maintenance recommendations
* Provides consistent output across platforms

This module is structured so future versions can seamlessly connect to:

* Real IoT sensor streams
* On-device Core ML models
* Cloud-based AI analysis services

---

## Architecture

```
IMS3D/
 ├── Shared/
 │    ├── Models/
 │    ├── ViewModels/
 │    └── Views/
 ├── visionOS/
 │    ├── App entry (IMS3DApp)
 │    └── 3D RealityKit views
 └── iOS/
      └── App entry (IMS3D_iOSApp)
```

---

## Tech Stack

* **Swift / SwiftUI**
* **visionOS SDK, RealityKit, RealityView**
* **Cross-platform code sharing using Target Membership**
* **MVVM architecture**
* Optional future integration with:

  * **Core ML**
  * **IoT sensor streaming**

---

## Running the Project

### **Requirements**

* Xcode 15.2 or later
* visionOS SDK installed
* iOS 17+
* macOS Sonoma or later

---

### **Run on visionOS Simulator**

1. Open the project in Xcode
2. Select **IMS3D (visionOS)** target
3. Choose "Apple Vision Pro" simulator
4. Run (`⌘ + R`)

---

### **Run on iOS Simulator**

1. Select **IMS3D_iOS** target
2. Choose an iPhone device
3. Run (`⌘ + R`)

---

