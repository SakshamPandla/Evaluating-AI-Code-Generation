//works but crashes when float data is entered

import java.util.Scanner;

public class PSTJavaDeepSeek {

    private double balance;

    public PSTJavaDeepSeek(double initBalance) {
        balance = initBalance;
    }

    // Changed parameter type from String to double to handle numerical input
    public void deposit(double amount) {     
        if (amount < 0) {                      // Check for negative deposit amount
            System.out.println("Invalid deposit amount.");
        } else {
            balance += amount;                 // Fixed from =+ to += for correct addition
        }
    }

    public void withdraw(double amount) {
        if (amount < 0) {                     // Check for negative withdrawal first
            System.out.println("Invalid withdrawal amount.");
        } else if (amount > balance) {        // Then check for insufficient funds
            System.out.println("Insufficient funds.");
        } else {
            balance -= amount;
            System.out.println("Withdrawal successful."); // Moved inside else block
        }
    }

    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    // Added correct main method signature with String[] args parameter
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); 

        PSTJavaDeepSeek myAccount = new PSTJavaDeepSeek(1000.0);
        boolean running = true;  // Added loop control variable

        while (running) {
            System.out.println("1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            int choice = scanner.nextInt();

            switch(choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    double depAmount = scanner.nextDouble(); // Changed to double type
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
                    running = false; // Properly exits the loop
                    break;
                default:  // Added missing colon
                    System.out.println("Invalid option."); 
            }
        }
        scanner.close(); // Proper resource cleanup
        System.out.println("Thank you for using our service.");
    }
}