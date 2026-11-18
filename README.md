# Number Guessing Game

An interactive command-line number guessing game built with **Bash** and **PostgreSQL**. The game generates a random secret number between `1` and `1000`, validates user input, provides higher/lower hints, and tracks historical player statistics across sessions. Developed as the final project for the **freeCodeCamp Relational Database Certification**.

## Database Schema & Features

- **Normalized PostgreSQL Schema (`number_guess`):**
  - `players`: Stores unique player profiles (`player_id`, `username` up to 22 characters).
  - `games`: Logs every completed game session (`game_id`, `player_id`, `tries`) linked via foreign key.
- **Persistent Player Stats:** Automatically greets returning players with their total games played (`COUNT`) and personal best record (`MIN(tries)`).
- **Input Validation:** Ensures guesses are valid integers before evaluating hints or incrementing attempt counters.

## Project Files

- `number_guess.sql`: Full PostgreSQL database dump (schema and data).
- `number_guess.sh`: Executable Bash script containing the game loop and database queries.

## Usage

1. **Restore the database:**
   ```bash
   psql -U postgres < number_guess.sql
   ```

2. **Grant execution permissions and start playing:**
   ```bash
   chmod +x number_guess.sh
   ./number_guess.sh
   ```
