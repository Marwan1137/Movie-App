<h1 align="center" style="font-weight: bold;">Mvoie App 💱</h1><p align="center">A modern, cross-platform movie browsing application built with Flutter. Explore the latest movies, manage your watchlist, and enjoy a seamless user experience with clean architecture.</p><p align="center"> </p>


💻 Technologies
```bash
- **Flutter**: Cross-platform framework.
- **Dart**: Programming language.
- **Clean Architecture**: Clean separation of concerns.
- **Cubit**: State management.
- **Get It**: Dependency injection.
- **Dio**: HTTP client for API requests.
```


🚀 Getting Started
Prerequisites
1. Flutter SDK (version 3.13.0 or later):

  -Download from Flutter's official website.

  -Add Flutter to your PATH:
  ```bash
    export PATH="$PATH:[PATH_TO_FLUTTER]/flutter/bin"
  ```
-Verify installation
  ```bash
      flutter --version
  ```

 2. IDE:

    -  VS Code: Install Flutter and Dart extensions.

    -  Android Studio: Install Flutter and Dart plugins.
   
3. Firebase Setup:

    - Create a Firebase project at Firebase Console.

    - Add Android, iOS, and web apps to your Firebase project.

    - Download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) files and place them in the     
      appropriate directories.


 4. Installation:
      - Clone the repository:
        ```bash
              git clone https://github.com/Marwan1137/hawely.git
            
      - Navigate to the project:
        ```bash
              cd hawely
            

      - Install dependencies:
        ```bash
              flutter pub get
            
      - Run the app:
         ```bash
              flutter run
           

🏗 Project Structure

```bash           
lib/
├── core/                  
│   ├── API/         
│   ├── DI/           
│   └── constants/
│    └── error/
│    └── services/
│    └── utils/  
├── Movie Module/              
│   ├── data/              
│   │   ├── datasource/        
│   │   ├── datasourceimpl/    
│   │   └── repoimpl/
│        └── Model/        
│    ├── Domain/             
│   │   ├── repocontract/        
│   │   ├── usecases/    
│   │   └── enitities/  
│   ├── presentation/         
│   │   ├── viemodel/       
│   │   ├── screens/    
│   │   └── widgets/        
│          
├── main.dart             
 ```


✨ Key Features
1. Movie Browsing:

```bash
- Fetch up-to-date movie information using a reliable API.
- Browse and search for movies effortlessly.
```

2. Watchlist Management:

```bash
- Add movies to your watchlist.
- Access your watchlist across devices.
```


3. Clean Architecture

```bash
- Separation of concerns for better maintainability.
- Scalable and testable codebase.
```

4. State Management with Cubit:
```bash
- Efficient state updates and UI rendering.
```

5. Dependency Injection with Get It:
```bash
- Simplified dependency management.
```

🛠 Support
```bash
- For issues or questions:
  - Email: marwan.hakil79@gmail.com
  - GitHub Issues: [Open an Issue](https://github.com/Marwan1137/hawely/issues)
```

📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.



  
