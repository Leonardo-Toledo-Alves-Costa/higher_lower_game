# Higher or Lower - Followers Edition 📱

> A fast-paced guessing game where the goal is simple: figure out which celebrity or brand has more social media followers.

## 📖 About the Project

**Higher or Lower** is a mobile application that tests the user's pop culture knowledge and the popularity of public figures. Through an intuitive split-screen interface, the player compares two entities and decides whether the bottom option has more ("MORE") or fewer ("LESS") followers than the top option.

This project focuses heavily on application state management, dynamic UI updates, and providing a seamless navigation flow from the start of the game until the Game Over screen.

## ✨ Features

* **Split-Screen Interface:** Modern design using contrasting color blocks (Blue/Red) for easy and quick visual comparison.
* **Fluid Game Mechanics:** Direct action buttons that instantly validate the user's guess.
* **State Management:** Dynamic profile updates and continuous score tracking that increments with each correct answer.
* **Game Over Handling:** A "Game Over" modal that displays the final score and provides a clean restart option ("Play Again").
* **Mock Database:** Integration with a dataset of personalities (Name, Category/Profession, Country of Origin, and Follower Count).

## 📸 Screenshots

<div align="center">
  <img src="assets\start_screen.png" alt="Game Start Screen" width="250">
  <img src="assets\gameplay_screen_with_score.png" alt="Gameplay Screen with Score" width="250">
  <img src="assets\game_over_popup.png" alt="Game Over Modal" width="250">
</div>

## 🛠️ Technologies Used

* **[Dart/Flutter]:** 
* **[JavaScript API]:** 

## 🚀 How to Run the Project

1. Clone this repository:
   ```bash
   git clone (https://github.com/Leonardo-Toledo-Alves-Costa/higher_lower_game.git)

2. Navigate to the project directory:
    ```bash
    cd higher-or-lower

3. Install dependencies:
    ```bash
    flutter pub get/npm install

4. Run the application:
    ```bash
    node server.js/flutter run

🔮 Future Improvements:

- Add subtle animations for transitions between rounds.

- Integrate a real online API to fetch live follower counts.

- Implement a local high-score system using local storage.