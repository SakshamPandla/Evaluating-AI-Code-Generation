class Employee:
    # Fixed the __init__ method to use ":" instead of ",", corrected "==" to "=", and fixed the parameter list
    def __init__(self, name, hours, rate):
        self.name = name  # Assigning the name to the instance variable
        self.hours = hours  # Assigning the hours to the instance variable
        self.rate = rate  # Assigning the rate to the instance variable

    # Fixed the missing colon ":" at the end of the method definition
    def calculate_salary(self):
        # Corrected the variable name "overtimee" to "overtime"
        if self.hours > 40:
            overtime = (self.hours - 40) * self.rate * 1.5  # Calculating overtime pay
            salary = 40 * self.rate + overtime  # Calculating total salary
        else:
            # Corrected the logic to multiply hours and rate instead of dividing them
            salary = self.hours * self.rate
        return salary  # Return the calculated salary

    def display(self):
        # Fixed concatenation error by converting salary to string
        print("Employee: " + self.name)
        print("Total Salary: Rs." + str(self.calculate_salary()))

# Fixed type error for "rate" in Alice's data (string to int) and corrected other minor issues
employees = [
    Employee("Alice", 45, 300),  # Fixed rate from string to int
    Employee("Bob", 38, 250),
    Employee("Charlie", 42, 280.5)
]

# Fixed typo in "employeez" to "employees"
for emp in employees:
    emp.display()