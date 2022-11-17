package fa.training.exercise3;

public class Sedan extends Car{
    private int length;

    public Sedan(int speed, double regularPrice, String color, int length) {
        super(speed, regularPrice, color);
        this.length = length;
    }

    public double getSalePrice() {
        int discount;

        if (this.length > 20) {
            discount = 5;
        } else {
            discount = 10;
        }

        return super.getSalePrice() * (100 - discount) / 100;
    }
}
