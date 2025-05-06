class Employee:
    # Fix 1: Add parenthesis and commas in the __init__ method definition.
    def __init__(self, name, hours, rate):
        # Fix 2: Use '=' for assignment instead of '=='.
        self.name = name
        self.hours = hours
        # Fix 3: Fix the typo 'self,rate' to 'self.rate' and use '=' for assignment.
        self.rate = rate

    # Fix 4: Add a colon at the end of the method definition.
    def calculate_salary(self):
        # Fix 5: Ensure rate is a number (int or float) before calculation.
        # It's better to handle type conversion during initialization if possible,
        # but for robustness, we can ensure it's a number here.
        try:
            rate_num = float(self.rate) # Convert rate to float
        except ValueError:
            print(f"Error: Invalid rate for {self.name}. Rate must be a number.")
            return 0 # Return 0 or raise an error for invalid rate

        if self.hours > 40:
            overtime = (self.hours - 40) * rate_num * 1.5
            # Fix 6: Fix the typo 'overtimee' to 'overtime'.
            salary = 40 * rate_num + overtime
        else:
            # Fix 7: Correct the salary calculation for no overtime.
            # It should be hours * rate, not hours / rate.
            # Also, use self.hours and rate_num (the converted rate).
            salary = self.hours * rate_num
        return salary

    def display(self):
        print("Employee: " + self.name)
        # Fix 8: Convert the numerical salary result to a string before concatenation.
        print("Total Salary: Rs." + str(self.calculate_salary()))

# Fix 9: Ensure the rate for Alice is a number (int or float).
employees = [
    Employee("Alice", 45, 300), # Changed "300" to 300 (integer)
    Employee("Bob", 38, 250),
    Employee("Charlie", 42, 280.5)
]

# Fix 10: Correct the loop variable name 'employeez' to 'employees'.
for emp in employees:
    emp.display()