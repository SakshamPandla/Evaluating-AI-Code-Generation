//Works fine

import java.util.Scanner;

public class PSTJavaLlama {

    private double balance;

    // Constructor to initialize the balance
    public PSTJavaLlama(double initBalance) {
        balance = initBalance;
    }

    // Deposit method should take double instead of String for amount
    public void deposit(double amount) {     
        if (amount < 0)                      
            System.out.println("Invalid deposit amount.");
        else
            // =+ is not the correct operator for addition, += is
            balance += amount;               
    }

    public void withdraw(double amount) {
        if (amount > balance || amount < 0)
            System.out.println("Insufficient funds.");
        else {
            balance = balance - amount;
            // Move the success message inside the else block
            System.out.println("Withdrawal successful."); 
        }
    }

    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    public static void main(String[] args) {
        // main method should have String[] args parameter
        Scanner scanner = new Scanner(System.in); 

        PSTJavaLlama myAccount = new PSTJavaLlama(1000.0);

        while (true) {
            System.out.println("1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            int choice = scanner.nextInt();

            switch(choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    // Use nextDouble() to get double value, not String
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
                    // Exit the loop and program when user chooses 4
                    System.out.println("Exiting...");
                    return;
                default:
                    // Add colon after default
                    System.out.println("Invalid option."); 
            }
        }
    }
}