class Employee:
    def __init__(self, name, hours, rate):  # Added commas between parameters
        self.name = name  # Replaced '==' with '=' for assignment
        self.hours = hours
        self.rate = rate  # Fixed typo: replaced ',' with '.' and '==' with '='

    def calculate_salary(self):  # Added missing colon
        if self.hours > 40:
            overtime = (self.hours - 40) * self.rate * 1.5
            salary = 40 * self.rate + overtime  # Fixed typo 'overtimee' to 'overtime'
        else:
            # Fixed division to multiplication and added 'self' to access attributes
            salary = self.hours * self.rate
        return salary

    def display(self):
        print("Employee: " + self.name)
        # Converted salary to string and fixed concatenation
        print(f"Total Salary: Rs.{self.calculate_salary()}")

# Corrected rate from string "300" to integer 300 and fixed variable name in loop
employees = [
    Employee("Alice", 45, 300),
    Employee("Bob", 38, 250),
    Employee("Charlie", 42, 280.5)
]

# Fixed misspelled variable name 'employeez' to 'employees'
for emp in employees:
    emp.display()