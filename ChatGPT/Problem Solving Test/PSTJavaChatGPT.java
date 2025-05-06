//Works fine

import java.util.Scanner;

public class PSTJavaChatGPT {

    private double balance;

    // Constructor to initialize the balance
    public PSTJavaChatGPT(double initBalance) {
        balance = initBalance;
    }

    // Fixed deposit method to accept double, not String
    public void deposit(double amount) {
        if (amount < 0) {
            System.out.println("Invalid deposit amount.");
        } else {
            // Corrected from '=+' to '+=' and fixed type mismatch
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > balance || amount < 0) {
            System.out.println("Insufficient funds.");
        } else {
            balance = balance - amount;
            // Moved inside 'else' so it's only printed on successful withdrawal
            System.out.println("Withdrawal successful.");
        }
    }

    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    // main method should have 'String[] args' as parameter
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        PSTJavaChatGPT myAccount = new PSTJavaChatGPT(1000.0);

        while (true) {
            System.out.println("\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    // Fixed: scanner.nextDouble() returns double, not String
                    double depAmount = scanner.nextDouble();
                    myAccount.deposit(depAmount);
                    break;
                case 2:
                    System.out.print("Enter amount to withdraw: ");
                    double withAmount = scanner.nextDouble();
                    myAccount.withdraw(withAmount);
                    break;
                case 3:
                    myAccount.displayBalance();
                    break;
                case 4:
                    // Exit the loop on choosing option 4
                    System.out.println("Exiting. Thank you!");
                    scanner.close(); // Close scanner to prevent resource leak
                    return; // Exit from main method
                default:
                    // Missing ':' in default case and braces around println
                    System.out.println("Invalid option.");
            }
        }
    }
}
