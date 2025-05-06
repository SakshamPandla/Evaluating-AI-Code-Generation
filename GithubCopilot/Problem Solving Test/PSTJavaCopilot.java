import java.util.Scanner;

public class PSTJavaCopilot {

    private double balance;

    // Constructor to initialize the balance
    public PSTJavaCopilot(double initBalance) {
        balance = initBalance;
    }

    // Fix: Changed the parameter type to double instead of String
    // Fix: Corrected the logic for depositing amount
    public void deposit(double amount) {     
        if (amount < 0) {
            System.out.println("Invalid deposit amount.");
        } else {
            balance += amount; // Fixed: Corrected from `=+` (which is incorrect) to `+=`
            System.out.println("Deposit successful.");
        }
    }

    // Fix: Added braces for the else block to ensure all statements are grouped together
    public void withdraw(double amount) {
        if (amount > balance || amount < 0) {
            System.out.println("Insufficient funds or invalid withdrawal amount.");
        } else {
            balance -= amount; // Deduct the amount from balance
            System.out.println("Withdrawal successful."); 
        }
    }

    // Method to display the current balance
    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    // Fix: Added the required parameter "String[] args" to the main method
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in); 

        // Initialize the account with a starting balance
        PSTJavaCopilot myAccount = new PSTJavaCopilot(1000.0);

        while (true) {
            System.out.println("1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            int choice = scanner.nextInt();

            switch(choice) {
                case 1: // Handle deposit
                    System.out.print("Enter amount to deposit: ");
                    double depAmount = scanner.nextDouble(); // Fix: Changed the type to double for consistency
                    myAccount.deposit(depAmount);
                    break;
                case 2: // Handle withdrawal
                    System.out.print("Enter amount to withdraw: ");
                    double withAmount = scanner.nextDouble();
                    myAccount.withdraw(withAmount);
                    break;
                case 3: // Handle balance display
                    myAccount.displayBalance();
                    break;
                case 4: // Exit the program
                    System.out.println("Exiting the program. Goodbye!");
                    scanner.close(); // Fix: Close the scanner to prevent resource leak
                    return; // Exit the loop and terminate the program
                default: // Fix: Added a colon to the `default` case
                    System.out.println("Invalid option."); 
            }
        }
    }
}