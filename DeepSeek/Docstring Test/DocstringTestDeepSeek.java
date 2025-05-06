/**
 * Represents a complex number with real and imaginary parts, and provides
 * methods for performing basic arithmetic operations with other complex numbers.
 */
class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructs a Complex number with the specified real and imaginary parts.
     *
     * @param real the real part of the complex number
     * @param imaginary the imaginary part of the complex number
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds the given complex number to this complex number and returns the result as a new Complex instance.
     *
     * @param other the complex number to add
     * @return a new Complex instance representing the sum
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts the given complex number from this complex number and returns the result as a new Complex instance.
     *
     * @param other the complex number to subtract
     * @return a new Complex instance representing the difference
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies this complex number by the given complex number and returns the result as a new Complex instance.
     * The multiplication follows the formula: (a + bi)(c + di) = (ac - bd) + (ad + bc)i.
     *
     * @param other the complex number to multiply by
     * @return a new Complex instance representing the product
     */
    public Complex multiply(Complex other) {
       double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
       double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides this complex number by the given complex number and returns the result as a new Complex instance.
     * The division is performed by multiplying numerator and denominator by the conjugate of the denominator
     * and simplifying to obtain the real and imaginary parts.
     *
     * @param other the complex number to divide by
     * @return a new Complex instance representing the quotient
     * @throws ArithmeticException if the denominator (other's magnitude squared) is zero
     */
    public Complex divide(Complex other) {
        double denominator = Math.pow(other.real, 2) + Math.pow(other.imaginary, 2);
        if (denominator == 0) {
            throw new ArithmeticException("Division by zero complex number");
        }
        double realPart = ((this.real * other.real) + (this.imaginary * other.imaginary)) / denominator;
        double imaginaryPart = ((this.imaginary * other.real) - (this.real * other.imaginary)) / denominator;
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Returns a string representation of this complex number in the form "a + bi".
     *
     * @return the string representation of the complex number
     */
    @Override
    public String toString() {
        return real + " + " + imaginary + "i";
    }
}