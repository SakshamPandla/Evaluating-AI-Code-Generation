// Fix all the issues with the code given below, with explanations as comments:


import java.util.Scanner;

public class PSTJava {

    private double balance;

    public PSTJava(double initBalance) {
        balance = initBalance;
    }

    public void deposit(String amount) {     // ❌ Error 1: Should be double, not String
        if (amount < 0)                      // ❌ Error 2: Cannot compare String with number
            System.out.println("Invalid deposit amount.");
        else
            balance =+ amount;               // ❌ Error 3: Wrong operator (=+ instead of +=)
    }

    public void withdraw(double amount) {
        if (amount > balance || amount < 0)
            System.out.println("Insufficient funds.");
        else
            balance = balance - amount;
            System.out.println("Withdrawal successful."); // ❌ Error 4: This runs always due to missing braces
    }

    public void displayBalance() {
        System.out.println("Your balance is: Rs. " + balance);
    }

    public static void main() {
        Scanner scanner = new Scanner(System.in); // ❌ Error 5: main should accept String[] args

        PSTJava myAccount = new PSTJava(1000.0);

        while (true) {
            System.out.println("1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit");
            int choice = scanner.nextInt();

            switch(choice) {
                case 1:
                    System.out.print("Enter amount to deposit: ");
                    String depAmount = scanner.nextDouble(); // ❌ Error 6: Mismatched variable type
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
                    break;
                default
                    System.out.println("Invalid option."); // ❌ Error 7: Missing colon after 'default'
            }
        }
    }
}
