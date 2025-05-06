/**
 * Represents a complex number with a real and an imaginary part.
 */
class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructs a new Complex number.
     *
     * @param real The real part of the complex number.
     * @param imaginary The imaginary part of the complex number.
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds another complex number to this complex number.
     *
     * @param other The complex number to add.
     * @return A new Complex object representing the sum.
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts another complex number from this complex number.
     *
     * @param other The complex number to subtract.
     * @return A new Complex object representing the difference.
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies this complex number by another complex number.
     *
     * @param other The complex number to multiply by.
     * @return A new Complex object representing the product.
     */
    public Complex multiply(Complex other) {
       double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
       double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
       return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides this complex number by another complex number.
     *
     * @param other The complex number to divide by.
     * @return A new Complex object representing the quotient.
     * @throws ArithmeticException if the denominator is zero.
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
     * Returns a string representation of the complex number in the form "real + imaginary i".
     *
     * @return A string representing the complex number.
     */
    @Override
    public String toString() {
        if (imaginary == 0) {
            return String.valueOf(real);
        } else if (real == 0) {
            return imaginary + "i";
        } else if (imaginary < 0) {
            return real + " - " + Math.abs(imaginary) + "i";
        } else {
            return real + " + " + imaginary + "i";
        }
    }
}