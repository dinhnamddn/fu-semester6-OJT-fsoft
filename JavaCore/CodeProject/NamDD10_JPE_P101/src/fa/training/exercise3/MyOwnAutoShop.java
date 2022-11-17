package fa.training.exercise3;

public class MyOwnAutoShop {
    public static void main(String[] args) {
        Sedan sedan = new Sedan(200, 1234,"red", 21);

        Ford ford1 = new Ford(100, 1000,"white", 2019, 70);
        Ford ford2 = new Ford(100, 1000,"white", 2019, 90);

        Car car = new Car(299, 1234,"black");

        System.out.println("The sale prices: ");
        System.out.println("Sedan: " + sedan.getSalePrice());
        System.out.println("Ford 1: " + ford1.getSalePrice());
        System.out.println("Ford 2: " + ford2.getSalePrice());
        System.out.println("Car: " + car.getSalePrice());
    }
}
