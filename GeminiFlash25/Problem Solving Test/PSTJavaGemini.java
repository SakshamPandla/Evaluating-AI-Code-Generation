//Works fine

import java.util.Scanner;

public class PSTJavaGemini {

    private double balance;

    public PSTJavaGemini(double initBalance) {
        // Issue 5: Constructor is fine, initializes balance.
        balance = initBalance;
    }

    // Issue 1: The deposit method should accept a numeric type (like double) for the amount,
    // not a String, so that arithmetic operations can be performed.
    public void deposit(double amount) {
        // Issue 2: Comparison with 0 should be done on a numeric type.
        if (amount < 0) {
            System.out.println("Invalid deposit amount. Amount must be positive.");
        } else {
            // Issue 3: Incorrect assignment operator. Should be `+=` for adding to balance.
            balance += amount;
            System.out.println("Deposit successful. New balance: Rs. " + balance); // Added success message
        }
    }

    public void withdraw(double amount) {
        // Issue 4: The success message "Withdrawal successful." was outside the else block,
        // meaning it would print even on failed withdrawals. It should only print
        // when the withdrawal is actually successful.
        if (amount > balance || amount < 0) { // Added check for negative withdrawal amount
            System.out.println("Withdrawal failed. Insufficient funds or invalid amount."); // More specific message
        } else {
            balance = balance - amount;
            System.out.println("Withdrawal successful. Remaining balance: Rs. " + balance); // Now correctly inside the else block
        }
    }

    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    // Issue 5: The main method signature was missing the String[] args parameter.
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        PSTJavaGemini myAccount = new PSTJavaGemini(1000.0);
        boolean running = true; // Issue 8: Add a flag to control the loop

        // Issue 8: Changed from while(true) to use the running flag
        while (running) {
            System.out.println("\nBanking Menu:"); // Added newline for better formatting
            System.out.println("1. Deposit");
            System.out.println("2. Withdraw");
            System.out.println("3. Check Balance");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");

            // Added error handling for non-integer input
            int choice;
            if (scanner.hasNextInt()) {
                choice = scanner.nextInt();
            } else {
                System.out.println("Invalid input. Please enter a number.");
                scanner.next(); // Consume the invalid input to prevent infinite loop
                continue; // Skip the rest of the loop and show the menu again
            }

            // Consume the newline character left by scanner.nextInt()
            scanner.nextLine();

            // Issue 7: The default case in the switch statement was missing the colon.
            switch(choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    // Issue 6: Input should be read as a double, not assigned to a String.
                    // Also, pass the double value to the deposit method which now accepts double.
                    if (scanner.hasNextDouble()) {
                        double depAmount = scanner.nextDouble();
                        myAccount.deposit(depAmount);
                    } else {
                        System.out.println("Invalid input. Please enter a numeric amount.");
                        scanner.next(); // Consume the invalid input
                    }
                    break;
                case 2:
                    System.out.print("Enter amount to withdraw: ");
                    // Read the amount as a double.
                     if (scanner.hasNextDouble()) {
                        double withAmount = scanner.nextDouble();
                        myAccount.withdraw(withAmount);
                    } else {
                        System.out.println("Invalid input. Please enter a numeric amount.");
                        scanner.next(); // Consume the invalid input
                    }
                    break;
                case 3:
                    myAccount.displayBalance();
                    break;
                case 4:
                    System.out.println("Exiting. Thank you!");
                    running = false; // Issue 8: Set flag to false to exit the while loop
                    break; // Break from the switch
                default: // Issue 7: Added the missing colon
                    System.out.println("Invalid option. Please try again.");
            }
        }

        // Issue 9: Close the scanner to release system resources.
        scanner.close();
    }
}