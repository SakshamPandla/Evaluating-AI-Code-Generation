/**
 * A class representing a complex number and providing basic operations
 * such as addition, subtraction, multiplication, and division on complex numbers.
 */
class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructs a Complex object with the specified real and imaginary parts.
     *
     * @param real the real part of the complex number
     * @param imaginary the imaginary part of the complex number
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds this complex number to another complex number.
     *
     * @param other the complex number to add
     * @return a new Complex object representing the sum of the two complex numbers
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts another complex number from this complex number.
     *
     * @param other the complex number to subtract
     * @return a new Complex object representing the difference of the two complex numbers
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies this complex number with another complex number.
     *
     * @param other the complex number to multiply with
     * @return a new Complex object representing the product of the two complex numbers
     */
    public Complex multiply(Complex other) {
        double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
        double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides this complex number by another complex number.
     *
     * @param other the complex number to divide by
     * @return a new Complex object representing the quotient of the two complex numbers
     * @throws ArithmeticException if the denominator is zero
     */
    public Complex divide(Complex other) {
        double denominator = Math.pow(other.real, 2) + Math.pow(other.imaginary, 2);
        if (denominator == 0) {
            throw new ArithmeticException("Division by zero in complex division");
        }
        double realPart = ((this.real * other.real) + (this.imaginary * other.imaginary)) / denominator;
        double imaginaryPart = ((this.imaginary * other.real) - (this.real * other.imaginary)) / denominator;
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Returns a string representation of this complex number in the form "a + bi".
     *
     * @return a string representation of the complex number
     */
    @Override
    public String toString() {
        return real + " + " + imaginary + "i";
    }
}