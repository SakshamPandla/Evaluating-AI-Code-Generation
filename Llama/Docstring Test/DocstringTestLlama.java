/**
 * Represents a complex number with real and imaginary parts, providing methods for basic arithmetic operations.
 */
class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructs a complex number with the given real and imaginary parts.
     * 
     * @param real       the real part of the complex number
     * @param imaginary  the imaginary part of the complex number
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds this complex number to another.
     * 
     * @param other  the complex number to add
     * @return a new complex number representing the sum
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts another complex number from this one.
     * 
     * @param other  the complex number to subtract
     * @return a new complex number representing the difference
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies this complex number with another.
     * 
     * @param other  the complex number to multiply
     * @return a new complex number representing the product
     */
    public Complex multiply(Complex other) {
       double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
       double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides this complex number by another.
     * 
     * @param other  the complex number to divide by
     * @return a new complex number representing the quotient
     */
   public Complex divide(Complex other) {
        double denominator = Math.pow(other.real, 2) + Math.pow(other.imaginary, 2);
        double realPart = ((this.real * other.real) + (this.imaginary * other.imaginary)) / denominator;
        double imaginaryPart = ((this.imaginary * other.real) - (this.real * other.imaginary)) / denominator;
        return new Complex(realPart, imaginaryPart);
    }

    @Override
    /**
     * Returns a string representation of this complex number in the format "a + bi".
     */
    public String toString() {
        return real + " + " + imaginary + "i";
    }
}