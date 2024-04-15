# WeatherForecastApp

This app was implemented using `WeatherAPI.com`. This API offers only 2day's forecast (today, tomorrow).

## Technologies used
- SwiftUI for UI development
- SPM for third-party libraries
- XCTest for Unit testing

## Assumptions made:
- Used `WeatherAPI.com` API's instead of OpenWeatherMap and Weatherstack due to the below reason
  - There are no specific APIs to fetch weather info based on location name in free tier.
- Used `Cities.Json` as data for a city search.

## Instructions on how to build and run the project if required 
- Clone repo
- open `WeatherForecastApp.xcodeproj`
- Run

### Architecture:
- MVVM:
  - Following is how I implemented MVVM in the project by taking one of the feature - `WeatherDashboard`
    - In this feature `WeatherDashboardView` is the view, `WeatherDashboardViewModel` is the ViewModel it holds the service protocol. We can inject different service objects based on the requirements like mock services for 
      Unit testing and live service objects for releases.
    - I created a folder named `Model` to define the Network responses
  
### Libraries:
- Alamofire: Used Alamofire for network handling.
- Kingfisher: Used Kingfisher for Async image downloading and image caching.

### Implemented the design using SwiftUI, unit tests for your business logic, a basic caching mechanism to store the last fetched results and display them when offline.

### AppFlow:
#### Step-1: Upon App first launch user will be shown a screen with the search location.
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 33 49](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/1adfc20d-97c0-4ec1-8fc9-2ca34d11f228)
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 37 06](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/005eba2f-4223-41ac-8b5a-ca48fe751cdb)

#### Step-2: Once user searches and selects a city, weather info of that particular city is shown to the user.
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 31 23](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/2041f6cd-1896-4864-82ae-bebd983407ea)

#### Step-3: To see tomorrow's forecast user can swipe to right 
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 31 23](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/1b70ed8b-bc47-4a7d-afc1-83188ffd8f94)

#### Step-4: To change the location user can search for a new city or the user can pick from recent searches.
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 31 30](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/84774908-45f4-4777-b15a-02f856c6df13)
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 31 36](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/c67397c6-0580-4a80-9475-306ce735da0e)
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 19 31 45](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/503a108a-776e-48a2-9c37-a3f24d022bb2)

#### Step-5: Handled API errors and displayed the error messages in banners.
![Simulator Screenshot - iPhone 15 Pro - 2024-04-15 at 20 37 59](https://github.com/guruvu1/WeatherForecastApp/assets/21189537/638c0305-17c0-4a3c-9c9e-87329b204d3b)
