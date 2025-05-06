package ChatGPT;

class Complex {
    private double real;
    private double imaginary;

    /**
     * Constructor to initialize the real and imaginary parts of the complex number.
     * 
     * @param real The real part of the complex number.
     * @param imaginary The imaginary part of the complex number.
     */
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
     * Adds two complex numbers and returns the result.
     * 
     * @param other The complex number to be added to the current instance.
     * @return A new Complex object representing the sum of the two complex numbers.
     */
    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imaginary + other.imaginary);
    }

    /**
     * Subtracts the given complex number from the current instance and returns the result.
     * 
     * @param other The complex number to be subtracted from the current instance.
     * @return A new Complex object representing the difference of the two complex numbers.
     */
    public Complex subtract(Complex other) {
        return new Complex(this.real - other.real, this.imaginary - other.imaginary);
    }

    /**
     * Multiplies two complex numbers and returns the result.
     * 
     * @param other The complex number to be multiplied with the current instance.
     * @return A new Complex object representing the product of the two complex numbers.
     */
    public Complex multiply(Complex other) {
       double realPart = (this.real * other.real) - (this.imaginary * other.imaginary);
       double imaginaryPart = (this.real * other.imaginary) + (this.imaginary * other.real);
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Divides the current complex number by another complex number and returns the result.
     * 
     * @param other The complex number to divide the current instance by.
     * @return A new Complex object representing the quotient of the two complex numbers.
     */
    public Complex divide(Complex other) {
        double denominator = Math.pow(other.real, 2) + Math.pow(other.imaginary, 2);
        double realPart = ((this.real * other.real) + (this.imaginary * other.imaginary)) / denominator;
        double imaginaryPart = ((this.imaginary * other.real) - (this.real * other.imaginary)) / denominator;
        return new Complex(realPart, imaginaryPart);
    }

    /**
     * Returns a string representation of the complex number in the form "real + imaginary i".
     * 
     * @return A string representation of the complex number.
     */
    @Override
    public String toString() {
        return real + " + " + imaginary + "i";
    }
}
