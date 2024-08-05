
# Article App

## Description
Article App is a simple Flutter application that displays a list of articles from a mock API and allows users to view article details. The application uses the BLoC pattern for state management and follows hexagonal architecture to ensure a clean separation of concerns. It also includes a toggle switch to enable or disable dark mode.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Running the Application](#running-the-application)
- [Architectural Decisions](#architectural-decisions)
- [Challenges Faced](#challenges-faced)
- [Conclusion](#conclusion)

## Features
- Fetch and display a list of articles from a mock API.
- View details of a selected article.
- Toggle between light and dark modes.

## Requirements
- Flutter SDK
- Dart SDK

## Setup

### Clone the Repository
```bash
git clone https://github.com/yourusername/article_app.git
cd article_app
```

### Install Dependencies
```bash
flutter pub get
```

### Setup Dependency Injection
Ensure that the dependency injection is initialized in `main.dart`.

## Running the Application
To run the application on an emulator or a physical device, use the following command:

```bash
flutter run
```

## Architectural Decisions

### Hexagonal Architecture
The application follows the hexagonal architecture to separate the business logic from the external components such as API calls and UI. The architecture is divided into the following layers:

- **Domain**: Contains business logic and entities.
- **Data**: Handles data fetching and storage. This layer includes repositories and API clients.
- **Presentation**: Manages the UI and state of the application using BLoC.

### State Management
The BLoC (Business Logic Component) pattern is used for managing the state of the application. This ensures a clear separation between the UI and business logic, making the application more scalable and maintainable.

### Dependency Injection
The `get_it` package is used for dependency injection to manage and inject dependencies throughout the application. This helps in decoupling the classes and makes testing easier.

## Challenges Faced

### Type Issues with Mocking
During testing, there were issues with type compatibility while mocking classes. Ensuring correct types and properly mocking the dependencies resolved these issues.

### Rendering Issues with Custom Widgets
Implementing the card layout with the `Swiper` widget presented layout issues. Proper usage of `SizedBox` and ensuring finite sizes for the widgets resolved the rendering problems.

### Dark Mode Implementation
Implementing dark mode required careful handling of text and background colors to ensure readability and consistency across different themes.

## Conclusion
This project demonstrates the use of Flutter with BLoC for state management and hexagonal architecture for a clean separation of concerns. The implementation of dark mode and the use of custom widgets like `Swiper` add to the application's functionality and user experience.

For any issues or contributions, feel free to open a pull request or an issue on the repository. Happy coding!
