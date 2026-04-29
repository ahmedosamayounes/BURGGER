# 🍔 Burgger App - Flutter Mobile Application



🍔 Burgger App
A high-performance E-commerce mobile application built with Flutter, designed with a focus on Scalability, Clean Code, and Modular Architecture. This project demonstrates professional-level software engineering practices suitable for production-grade applications.

🏗 Architectural Overview
The project is implemented using Feature-First Clean Architecture. This ensures a strict separation of concerns, making the codebase easy to test, maintain, and scale.

📂 Project Layers:
Core Layer: Contains global configurations including centralized theming, custom networking logic via Dio, and advanced routing management.

Features Layer: Each module (Login, Home, Cart, etc.) is fully encapsulated with its own:

Data: Handles API requests via Retrofit/WebServices and Data Models.

Logic: Manages state using the Bloc/Cubit pattern.

UI: Contains screens and atomic widgets designed for reusability.

🛠 Key Technical Features
1. Robust State Management
Utilizes Flutter Bloc (Cubit) for predictable state transitions.

Implemented BlocListener for handling UI side-effects like navigation and showing snackbars during the login process.

2. Advanced Networking & Data
Dio Factory: Optimized networking client with custom interceptors for logging and error handling.

Retrofit: Type-safe REST client for efficient API communication.

Error Handling: A centralized API error handler to manage different failure cases gracefully.

3. Modern UI/UX Implementation
Screen Utilization: Used flutter_screenutil to ensure a consistent look and feel across various device sizes (Design Size: 360x690).

Theming & Styling: A dedicated design system featuring custom AppColors and a comprehensive Styles helper for typography.

Dynamic Routing: Used a structured AppRouter with onGenerateRoute for cleaner navigation logic.

4. Code Generation & Efficiency
Leveraged Freezed and JsonSerializable to ensure data integrity and reduce boilerplate code in models and API results.

🧪 Dependencies & Tools
State: flutter_bloc

Navigation: go_router / Custom AppRouter

Networking: dio, retrofit

Dependency Injection: get_it

Utilities: gap, flutter_screenutil
---

## 📁 Project Structure
<img width="1024" height="768" alt="BURGGER App System Desgin" src="https://github.com/user-attachments/assets/6cc68b70-134d-4fc4-b3aa-919d560755c6" />

```text
lib/
├── core/               # Shared logic, networking, routing, and theming
│   ├── di/             # Dependency Injection setup
│   ├── networking/     # Dio factory, API Constants, Error Handling
│   ├── routing/        # App router and Route names
│   ├── shared/         # Reusable common widgets
│   └── theming/        # App colors and TextStyles
├── features/           # Independent features
│   ├── login/          # Login feature (Data, Logic, UI)
│   ├── home/           # Product listing and categories
│   ├── product_details/# Detailed product view
│   └── cart/           # Cart and checkout logic
└── main.dart           # App entry point

