package main;
import quizApp.User;
import quizApp.Quiz;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        User user = new User();
        Quiz quiz = new Quiz();
        System.out.println("Welcome to Deepali's Online Quiz System");
        System.out.print("Do you want to: (1) Login or (2) Register? ");
        int choice = Integer.parseInt(scanner.nextLine());
        String username, password;
        boolean loggedIn = false;
        if (choice == 1) {
            System.out.print("Enter your username: ");
            username = scanner.nextLine();
            System.out.print("Enter your password: ");
            password = scanner.nextLine();

            loggedIn = user.login(username, password);
            if (!loggedIn) {
                System.out.println("Login failed.");
                scanner.close();
                return;
            } else {
                System.out.println("Login successful.");
            }

        } else if (choice == 2) {
            System.out.print("Enter your username: ");
            username = scanner.nextLine();
            System.out.print("Enter your password: ");
            password = scanner.nextLine();

            boolean registered = user.register(username, password);
            if (registered) {
                System.out.println("Registration successful. Please login to continue.");
                scanner.close();
                return;
            } else {
                System.out.println("Registration failed.");
                scanner.close();
                return;
            }
        } else {
            System.out.println("Invalid option.");
            scanner.close();
            return;
        }
        int quizId;
        while (true) {
            System.out.println("Enter 1 : Technology");
            System.out.println("Enter 2 : Sports");
            System.out.println("Enter 3 : General Knowledge");
            System.out.print("Enter the quiz number to take: ");
            try {
                quizId = Integer.parseInt(scanner.nextLine());
                if (quiz.quizExists(quizId)) {
                    break;
                } else {
                    System.out.println("Invalid quiz ID. Please try again.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Please enter a valid number.");
            }
        }
        int userId = user.getUserId(username);
        quiz.takeQuiz(userId, quizId);

        scanner.close();
    }
}