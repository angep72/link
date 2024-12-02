# Weather App

## Project Overview

The Weather App is a Flutter-based mobile application that uses the **OpenWeatherMap API** to fetch real-time weather conditions for cities around the world. The app has three main screens:

1. **Search Screen**: Allows users to search for a city's weather by entering a city name.
2. **Current Weather Screen**: Displays the current weather conditions for the selected city.
3. **Settings Screen**: Provides users with options to configure app settings, such as temperature units.

## Features

### 1. Search Functionality
- Users can search for the weather information of any city globally by entering the city name.
- The app fetches weather data from the OpenWeatherMap API based on the city name entered by the user.

### 2. Current Weather Display
- Once a city is selected, the app displays key weather data such as:
  - **Temperature** (in the chosen unit)
  - **Weather Description** (e.g., sunny, rainy)
  - **Humidity**
  - **Wind Speed**
- The UI dynamically updates to reflect the latest weather information.

### 3. Settings Screen
- Users can adjust application settings, such as toggling between Celsius and Fahrenheit temperature units.
- The settings are managed globally, ensuring that changes are reflected across the entire app immediately.

## Challenges Faced

### 1. Video Recording for App Demonstration
- **Challenge**: Creating a video demonstration of the app's functionality.
- **Solution**: To overcome this challenge, the recording process was divided into smaller parts. Real-time app usage was recorded using **OBS Studio**, and video editing software like **Adobe Premiere** or **iMovie** was used to combine and edit the footage.

### 2. State Management
- **Challenge**: Effectively managing state while handling dynamic API responses and UI updates.
- **Solution**: Initially using the basic `setState()` method, the app's complexity grew as it required handling multiple states (e.g., weather data, settings). The solution was to use **setStae** for state management, ensuring a more scalable and efficient approach to handling app state.

## State Management

### **seState** for State Management

setState was used to centralize the app's state and pass it down to the relevant widgets.

#### 1. Weather Data State
- A class extending **ChangeNotifier** is used to manage and store the weather data.
- The **ChangeNotifier** ensures that when the weather data is updated, the UI rebuilds automatically to reflect the changes.

#### 2. Settings State
- User settings, such as the temperature unit (Celsius/Fahrenheit), are managed globally using **SettingsProvider**.
- Changes in the settings are reflected immediately across the app.

## App Screens

### 1. **Search Screen**
- Allows users to input a city name.
- Fetches weather data from the OpenWeatherMap API and navigates to the Current Weather Screen.

### 2. **Current Weather Screen**
- Displays weather data fetched from the API, including temperature, description, humidity, and wind speed.
- The UI is updated dynamically based on the weather data.

### 3. **Settings Screen**
- Allows users to toggle between Celsius and Fahrenheit temperature units.
- Changes in settings are applied globally across the app.

## Conclusion

This Weather App successfully integrates real-time weather information using the OpenWeatherMap API. By leveraging **Flutter** and **SetState** for state management, the app provides a responsive and scalable solution for fetching and displaying weather data. The app is designed to be easily maintainable and extensible, allowing for future feature additions or enhancements.

## Links
- **Demo Video**: [Watch the demo video](https://www.loom.com/share/b2ea9eabc1ae4a7785d3a22ff10dce49)
- **GitHub Repository**: [Access the source code](https://github.com/angep72/link.git)

## Installation

To run the app locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/angep72/link.git
