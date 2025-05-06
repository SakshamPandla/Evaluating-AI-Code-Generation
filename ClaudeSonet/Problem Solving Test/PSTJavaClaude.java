//Works fine

import java.util.Scanner;
public class PSTJavaClaude {
    private double balance;
    
    public PSTJavaClaude(double initBalance) {
        balance = initBalance;
    }
    
    // FIXED: Changed parameter type from String to double to match with numeric operations
    // FIXED: Fixed comparison operator (cannot compare double with int)
    public void deposit(double amount) {    
        if (amount < 0)                      
            System.out.println("Invalid deposit amount.");
        else
            // FIXED: Changed =+ (which is actually += in reverse) to += or balance = balance + amount
            balance = balance + amount;  // Fixed from "balance =+ amount" which was incorrect assignment
            // FIXED: Added missing print statement to confirm deposit success
            System.out.println("Deposit successful.");
    }
    
    public void withdraw(double amount) {
        if (amount > balance || amount < 0)
            System.out.println("Insufficient funds.");
        else {
            // FIXED: Added curly braces to properly enclose the else block
            // Without braces, only the first statement was part of the else block
            balance = balance - amount;
            System.out.println("Withdrawal successful.");
        }
    }
    
    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }
    
    // FIXED: Added String[] args parameter to main method
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        PSTJavaClaude myAccount = new PSTJavaClaude(1000.0);
        
        while (true) {
            System.out.println("1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            int choice = scanner.nextInt();
            
            switch(choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    // FIXED: Changed to nextDouble() to match the parameter type
                    // and changed variable type to double
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
                    // FIXED: Added system exit to actually terminate the program
                    System.out.println("Thank you for using our services!");
                    scanner.close();  // Close scanner to prevent resource leak
                    System.exit(0);
                    break;
                // FIXED: Added missing colon after default
                default:
                    System.out.println("Invalid option.");
            }
        }
    }
}