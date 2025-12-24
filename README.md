🌦️ Flutter Weather App

A simple and elegant Flutter Weather Application that displays the current weather, hourly forecast, and additional weather details using the OpenWeatherMap API. The app uses a dark theme with Material 3 design and demonstrates API integration, asynchronous data handling, and clean UI components.

📱 Features

🌡️ Current Weather

Temperature (in Kelvin)

Weather condition (Clouds, Rain, Clear, etc.)

Dynamic weather icon

⏰ Hourly Forecast

Displays weather for the next few hours

Scrollable horizontal list

Time formatted using intl

📊 Additional Information

Humidity

Wind Speed

Pressure

🔄 Refresh Button

Reloads weather data instantly

🌙 Dark Theme

Uses Material 3 dark theme for a modern UI

🛠️ Tech Stack

Flutter

Dart

OpenWeatherMap API

HTTP package

Intl package

📦 Dependencies

Add the following dependencies in your pubspec.yaml file:

dependencies:
flutter:
sdk: flutter
http: ^1.2.0
intl: ^0.19.0

🔐 API Key Setup

Create an account at OpenWeatherMap

Generate your API key

Create a file named secrets.dart inside lib/

const String openWeatherAPIKey = "YOUR_API_KEY_HERE";



🏗️ Project Structure
lib/
│── main.dart
│── weather_page.dart
│── hourly_forecast_item.dart
│── additional_info.dart
│── secrets.dart

🚀 How to Run the App

Clone the repository

git clone https://github.com/Prabhat-kr-Tiwari/WeatherApp


Navigate to the project directory

cd weatherapp
``