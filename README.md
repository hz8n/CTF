# Cyber Range Training Platform

Cyber Range Training Platform is a safe educational Ruby on Rails web application for CTF-style cybersecurity training. Students register, solve fake-data challenges, earn points, unlock badges, and track progress. Admin users manage challenges, users, attempts, reports, and statistics.

## Safety Note

This project is educational only. It does not include real hacking tools, real exploitation, malware, password cracking, external network scanning, or attacks against real systems. All challenges use fake training data stored inside the application.

## Main Features

1. Student registration and login using secure password hashing with bcrypt.
2. Role-based access control with student and admin roles.
3. Student dashboard with total points, level, solved challenges, recent attempts, and badges.
4. Challenge browser with category and difficulty filters.
5. Challenge details page with hint button and answer submission form.
6. Normalized answer checking by trimming spaces and ignoring case.
7. First correct solve awards points. Repeated correct solves do not award points again.
8. Automatic level updates:
   1. Beginner: 0-100 points
   2. Junior: 101-250 points
   3. Intermediate: 251-500 points
   4. Advanced: 501+ points
9. Automatic badges:
   1. First Solve
   2. Log Analyst
   3. Cyber Starter
10. Admin dashboard with users, challenges, attempts, solved count, most solved challenges, and hardest challenges.
11. Admin challenge management: create, edit, delete, and list challenges.
12. Reports page showing each student, attempts, solved challenges, success rate, and total points.
13. Dark responsive cybersecurity theme using Bootstrap and custom CSS.

## Tech Stack

1. Ruby on Rails 7.1
2. SQLite for development
3. bcrypt for secure password hashing
4. Bootstrap 5 for responsive UI
5. Rails MVC structure
6. CSRF protection enabled by Rails

## Installation

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```

Open the application at:

```bash
http://localhost:3000
```

## Test Accounts

Admin account:

```text
email: admin@cyberrange.test
password: Password123
```

Student account:

```text
email: student@cyberrange.test
password: Password123
```

## Example Safe Challenges Included

1. Suspicious Login Attempt
2. Fake Bank Email
3. Weak Password
4. Caesar Shift
5. Public Admin Panel
6. Security Awareness Quiz

## Screenshots Placeholders

Add screenshots here after running the project:

1. Landing page screenshot
2. Login page screenshot
3. Student dashboard screenshot
4. Challenges index screenshot
5. Challenge show page screenshot
6. Admin dashboard screenshot
7. Admin challenge management screenshot
8. Reports page screenshot

## Important Security Decisions

1. Student users cannot access admin routes.
2. Admin routes use before_action authorization filters.
3. Passwords are stored using password_digest through has_secure_password.
4. Empty answer submissions are rejected.
5. All important model fields include validations.
6. Challenge answers are only compared inside the app using safe fake data.
7. No external targets, scanning, exploitation, malware, or real attack scripts are included.
