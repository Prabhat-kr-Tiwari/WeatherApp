
---

# 🌦️ Flutter Weather App

A simple and elegant **Flutter Weather Application** that displays the current weather, hourly forecast, and additional weather details using the **OpenWeatherMap API**. The app uses a dark theme with Material 3 design and demonstrates API integration, asynchronous data handling, and clean UI components.

---

## 📱 Features

* 🌡️ **Current Weather**

    * Temperature (in Kelvin)
    * Weather condition (Clouds, Rain, Clear, etc.)
    * Dynamic weather icon

* ⏰ **Hourly Forecast**

    * Displays weather for the next few hours
    * Scrollable horizontal list
    * Time formatted using `intl`

* 📊 **Additional Information**

    * Humidity
    * Wind Speed
    * Pressure

* 🔄 **Refresh Button**

    * Reloads weather data instantly

* 🌙 **Dark Theme**

    * Uses Material 3 dark theme for a modern UI

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **OpenWeatherMap API**
* **HTTP package**
* **Intl package**

---

## 📦 Dependencies

Add the following dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  intl: ^0.19.0
```

---

## 🔐 API Key Setup

1. Create an account at [OpenWeatherMap](https://openweathermap.org/)
2. Generate your API key
3. Create a file named `secrets.dart` inside `lib/`

```dart
const String openWeatherAPIKey = "YOUR_API_KEY_HERE";
```


---

## 🏗️ Project Structure

```
lib/
│── main.dart
│── weather_page.dart
│── hourly_forecast_item.dart
│── additional_info.dart
│── secrets.dart
```

---

## 🚀 How to Run the App

1. Clone the repository

   ```bash
   git clone https://github.com/Prabhat-kr-Tiwari/WeatherApp
   ```

2. Navigate to the project directory

   ```bash
   cd weatherapp
   ```

3. Install dependencies

   ```bash
   flutter pub get
   ```

4. Run the app

   ```bash
   flutter run
   ```

---

## 🌍 API Used

* **Endpoint:**

  ```
  https://api.openweathermap.org/data/2.5/forecast
  ```

* **City:** London (can be changed in code)

* **Response Type:** 5-day / 3-hour forecast

---

## ✨ Customization Ideas

* Convert temperature from **Kelvin to Celsius/Fahrenheit**
* Add city search functionality
* Add weather animations
* Store last fetched weather locally
* Improve error handling UI

---

## 📄 License

This project is open-source and free to use for learning and personal projects.

---

## 🙌 Acknowledgements

* [Flutter](https://flutter.dev/)
* [OpenWeatherMap API](https://openweathermap.org/api)

---

**Future Work**
* Add city search
* Improve UI animations
* Prepare this for Play Store release 🚀
