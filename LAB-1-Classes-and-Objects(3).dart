class Car {
  String brand;
  String model;
  int year;
  Car(this.brand, this.model, this.year);
  void displayCarInfo() {
    print('Car Information:');
    print('Brand: $brand');
    print('Model: $model');
    print('Year: $year');
  }
  void makeSound() {
    print('Vroom Vroom');
  }
}
class ElectricCar extends Car {
  int batteryLife;
  ElectricCar(String brand, String model, int year, this.batteryLife)
      : super(brand, model, year);
  void displayElectricCarInfo() {
    super.displayCarInfo();
    print('Battery Life: $batteryLife kWh');
  }
}
void main() {
  ElectricCar myElectricCar = ElectricCar('Tesla', 'Model 3', 2023, 75);
  myElectricCar.displayElectricCarInfo();
  myElectricCar.makeSound();
}
