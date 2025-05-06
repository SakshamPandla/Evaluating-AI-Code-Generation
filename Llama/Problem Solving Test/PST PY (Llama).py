class Employee:
    def __init__(self, name, hours, rate):  # Added parentheses around parameters
        self.name = name  # Changed to assignment operator
        self.hours = hours  # Changed to assignment operator
        self.rate = rate  # Fixed typo

    def calculate_salary(self):  # Added colon at the end of method definition
        if self.hours > 40:
            overtime = (self.hours - 40) * self.rate * 1.5
            salary = 40 * self.rate + overtime  # Fixed typo
        else:
            salary = self.hours * self.rate  # Fixed calculation
        return salary

    def display(self):
        print("Employee: " + self.name)
        print("Total Salary: Rs." + str(self.calculate_salary()))  # Converted salary to string

employees = [
    Employee("Alice", 45, 300),  # Changed rate to number
    Employee("Bob", 38, 250),
    Employee("Charlie", 42, 280.5)
]

for emp in employees:  # Fixed typo
    emp.display()