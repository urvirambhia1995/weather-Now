# Weather Now 

A Flutter weather application that provides current weather information for different cities with a clean and simple user interface.

## Features

*  Search weather by city
*  Display current temperature
* ️ Weather condition and description
*  Humidity information
*  Wind speed
*  Sunrise and sunset information
*  Dynamic Day/Night UI
*  Refresh weather data
*  Responsive Flutter UI
* ️ Handles loading, errors and invalid city searches

## Tech Stack

* **Flutter**
* **Dart**

## Project Structure

```text
lib/
├── core/
├── data/
├── domain/
├── presentation/
└── main.dart
```

The project follows a layered architecture to keep UI, business logic and data handling separated.

## Getting Started

### Prerequisites

Make sure you have:

* Flutter SDK installed
* Android Studio / VS Code
* Android Emulator or physical Android device

### Installation

Clone the repository:

```bash
git clone https://github.com/urvirambhia1995/weather-Now.git
```

Navigate to the project:

```bash
cd weather-Now
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Build APK

To generate a release APK:

```bash
flutter build apk --release
```

The APK will be generated at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## API Configuration

The application uses a weather API to fetch real-time weather information.

Add your API key/configuration according to the project's environment configuration before running the application.

> **Note:** API keys and other sensitive credentials should not be committed to the repository.

## Screenshots

*Add screenshots of the application here.*

## Future Improvements

* 7-day weather forecast
* Hourly forecast
* Location-based weather
* Weather alerts
* Multiple saved cities
* Weather maps
* Improved offline support

## Author

**Urvi Rambhia**

Flutter / Mobile Application Developer

[GitHub](https://github.com/urvirambhia1995)
