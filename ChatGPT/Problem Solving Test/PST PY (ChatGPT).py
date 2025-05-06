class Employee:
    def __init__(self, name, hours, rate):  # Fix: Missing comma between 'self' and other parameters
        self.name = name                   # Fix: Used '==' instead of '=' for assignment
        self.hours = hours                # Fix: Same here, use '=' not '=='
        self.rate = float(rate)           # Fix: Same here; also cast rate to float in case it's a string

    def calculate_salary(self):           # Fix: Missing colon at the end of method definition
        if self.hours > 40:
            overtime = (self.hours - 40) * self.rate * 1.5
            salary = 40 * self.rate + overtime  # Fix: Typo in variable name 'overtimee'
        else:
            salary = self.hours * self.rate     # Fix: 'hours / rate' was incorrect logic
        return salary

    def display(self):
        print("Employee: " + self.name)
        print("Total Salary: Rs." + str(self.calculate_salary()))  # Fix: Must convert float to string for concatenation

employees = [
    Employee("Alice", 45, "300"),    # Fix: This is okay, since we cast rate to float in __init__
    Employee("Bob", 38, 250),        # No change needed
    Employee("Charlie", 42, 280.5)   # No change needed
]

for emp in employees:               # Fix: 'employeez' is not defined; corrected to 'employees'
    emp.display()
