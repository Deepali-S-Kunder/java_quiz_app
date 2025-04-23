# java_quiz_app
A simple yet engaging Java-based Online Quiz Application where users can test their knowledge in three exciting categories: Technology, Sports, and Current Affairs. Designed for both casual users and quiz enthusiasts!

Categories

Technology
From programming to gadgets, test your tech-savviness.

Sports
Covers rules, records, and legendary moments from global sports.

 Current Affairs
Stay sharp with questions on recent news and world events.

 Features
User Authentication

New user registration

Secure login system

Basic user validation

Category-Based Quiz

Choose between Technology, Sports, and Current Affairs

Randomized question sets

Multiple-choice format

Scoring System

Real-time feedback

Final score displayed at the end of each quiz

Optional score saving

compile: javac -cp "library/mysql-connector-j-9.3.0.jar" -d out target\source\main\Main.java target\source\quizApp\Quiz.java target\source\quizApp\User.java target\source\tools\DB.java

run:java -cp "out;library/mysql-connector-j-9.3.0.jar" main.Main
