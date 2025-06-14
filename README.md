# 📊 Percent Calculator

**Percent Calculator** is a simple and intuitive Flutter app that helps users quickly calculate percentages and keep a history of their calculations.

---

## ✨ Features

- 🧮 Calculate percentage values instantly
- 💾 Save and view a **local history** of calculations
- 🗑️ Delete individual history entries
- 🌓 **Light / Dark** theme toggle
- 🌍 **Localization support** for English and Russian
- 🧠 Smart result formatting: `120.00 → 120`, `87.50 → 87.5`

---

## 🛠️ Tech Stack

- **Flutter** – UI framework
- **flutter_bloc** – state management
- **Hive** – local storage
- **intl / flutter_localizations** – i18n support
- **flutter_gen** – localization code generation

---

## ⚙️ State Management

This project uses **BLoC (Business Logic Component)** for state management.  
The choice of `flutter_bloc` was made based on the following rationale:

- 🔄 **Separation of concerns**: BLoC allows for a clear division between UI and business logic.
- 🧪 **Testable**: Events and states can be easily unit tested.
- 🔌 **Scalable**: Suitable for both small and larger apps with more complex flows.
- 🧰 **Mature ecosystem**: `flutter_bloc` has a well-established API and active community support.

> Alternatives like **Provider** or **Riverpod** were considered, but BLoC was chosen for its structure, robustness, and familiarity in managing UI-driven workflows such as form validation, localization, and theme switching.

---

## 📸 Screenshots


<p align="center">
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/Screenshot_1749888796.png" width="250" alt="accessibility text">  
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/Screenshot_1749888802.png" width="250" alt="accessibility text">
    <img src="https://raw.githubusercontent.com/Liyafar27/my_storage/refs/heads/master/untitled.gif" width="250" alt="accessibility text">

</p>
---

## 🧪 Testing

We wrote comprehensive tests to ensure the reliability of our app, covering business logic, UI rendering, and utility functions.

---

### ✅ Types of Tests

| Type           | Purpose                                                                 |
|----------------|-------------------------------------------------------------------------|
| **Unit Tests**   | Verify pure functions like percentage calculation with edge cases       |
| **Bloc Tests**   | Test BLoC behavior: calculations, errors, and state resets              |
| **Widget Tests** | Ensure the UI builds correctly with mocked dependencies (e.g. Hive)     |

---

### 📌 Unit Test Example

We test `calculatePercent()` to ensure it:

- ✅ Computes percentage correctly  
- ❌ Throws errors on invalid input (zero or negative values)  
- 💯 Handles decimal numbers precisely

```dart
test('correctly calculates 25% of 10 to 100%', () {
  final result = calculatePercent(10, 25);
  expect(result, closeTo(40.0, 0.001));
});
```
### 📌 How to Run Tests
To run all tests, simply use:
```dart
flutter test
```
Make sure all dependencies are installed first:
```dart
flutter pub get
```

All tests are located in the test/ directory.


## 🚀 Getting Started

```bash
git clone https://github.com/Liyafar27/percent_calc.git
cd percent_calc
flutter pub get
flutter run
```

