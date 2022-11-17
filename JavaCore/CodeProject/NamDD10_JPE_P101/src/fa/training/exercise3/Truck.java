package fa.training.exercise3;

public class Truck extends Car{
    private int weight;

    public Truck(int speed, double regularPrice, String color, int weight) {
        super(speed, regularPrice, color);
        this.weight = weight;
    }

    public double getSalePrice() {
        int discount;

        if (this.weight > 2000) {
            discount = 10;
        } else {
            discount = 20;
        }

        return super.getSalePrice() * (100 - discount) / 100;
    }
}
