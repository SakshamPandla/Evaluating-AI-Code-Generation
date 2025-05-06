class Employee:
    # Fixed method name: __init__ with double underscores on both sides
    # Fixed missing comma in parameter list
    # Fixed assignment operator (= instead of ==)
    # Fixed comma typo in self.rate
    def __init__(self, name, hours, rate):
        self.name = name 
        self.hours = hours 
        self.rate = rate 
    
    # Added missing colon after method definition
    def calculate_salary(self):
        if self.hours > 40:
            overtime = (self.hours - 40) * self.rate * 1.5
            # Fixed variable name typo: overtime instead of overtimee
            salary = 40 * self.rate + overtime
        else:
            # Fixed incorrect formula (division to multiplication) and 
            # Fixed reference to instance variables with self
            salary = self.hours * self.rate 
        return salary
    
    def display(self):
        print("Employee: " + self.name)
        # Fixed: convert salary from number to string
        print("Total Salary: Rs." + str(self.calculate_salary()))

employees = [
    # Fixed: consistent data types for rate (string to float)
    Employee("Alice", 45, 300),
    Employee("Bob", 38, 250),
    Employee("Charlie", 42, 280.5)
]

# Fixed variable name: employeez to employees
for emp in employees:
    emp.display()