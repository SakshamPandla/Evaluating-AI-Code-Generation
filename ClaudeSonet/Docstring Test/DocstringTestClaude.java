/**
 * Represents a complex number with real and imaginary parts.
 * Provides basic arithmetic operations for complex numbers.
 */
class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructs a complex number with the specified real and imaginary parts.
     * 
     * @param real The real part of the complex number
     * @param imaginary The imaginary part of the complex number
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds another complex number to this complex number.
     * 
     * @param other The complex number to add to this one
     * @return A new Complex object representing the sum
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts another complex number from this complex number.
     * 
     * @param other The complex number to subtract from this one
     * @return A new Complex object representing the difference
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies this complex number by another complex number.
     * Uses the formula (a + bi) * (c + di) = (ac - bd) + (ad + bc)i
     * 
     * @param other The complex number to multiply by
     * @return A new Complex object representing the product
     */
    public Complex multiply(Complex other) {
       double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
       double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides this complex number by another complex number.
     * Uses the formula (a + bi) / (c + di) = ((ac + bd) / (c² + d²)) + ((bc - ad) / (c² + d²))i
     * 
     * @param other The complex number to divide by
     * @return A new Complex object representing the quotient
     * @throws ArithmeticException if the denominator is zero (division by zero)
     */
    public Complex divide(Complex other) {
        double denominator = Math.pow(other.real, 2) + Math.pow(other.imaginary, 2);
        double realPart = ((this.real * other.real) + (this.imaginary * other.imaginary)) / denominator;
        double imaginaryPart = ((this.imaginary * other.real) - (this.real * other.imaginary)) / denominator;
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Returns a string representation of this complex number in the form "a + bi".
     * 
     * @return String representation of the complex number
     */
    @Override
    public String toString() {
        return real + " + " + imaginary + "i";
    }
}