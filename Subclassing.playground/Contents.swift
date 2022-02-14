import UIKit
//our vehicle class.  in this example our parent class.  the truck class will inherit from this class
class Vehicle {
    var currentSpeed: Double = 0
    var gasTankCapacity: Double
    var milesPerGallon:Double
    var currentGasInTank:Double
    var make: String
    var model: String
    init(gasTankCapacity:Double, milesPerGallon:Double, currentGasInTank:Double, make:String, model:String){
        self.gasTankCapacity = gasTankCapacity
        self.milesPerGallon = milesPerGallon
        self.currentGasInTank = currentGasInTank
        self.make = make
        self.model = model
    }
    func fillTheTank() {
        let gasToBuy = gasTankCapacity - currentGasInTank
        print("You added \(gasToBuy) to the gas tank")
    }
}

//instance of the parent class.  you don't have to create an instance of the parent class but I want to show you the difference between the parent and the sub in our examples
var myCar = Vehicle(gasTankCapacity: 18.0, milesPerGallon: 38.2, currentGasInTank: 4.5, make: "Chevy", model: "Volt")
myCar.fillTheTank()

//here is our Truck class.  Because we use : Vehicle, Swift knows that Truck inherits the properties and methods from Vehicle.  We get all the variables and functions right out of the gate.
class Truck : Vehicle {
    //we do not re-declare the variables from the parent class UNLESS we want them to behave differently
    //we declare two new variables
    var cargoCapacity:Double
    var currentCargo:Double
    init(gasTankCapacity:Double, milesPerGallon:Double, currentGasInTank:Double, make:String, model:String, cargoCapacity:Double, currentCargo:Double)
    {
        //notice we deal with our variables that are new to this class BEFORE we call super.init().  You'll get an error if you call super.init before you address new variables.
        self.cargoCapacity = cargoCapacity
        self.currentCargo = currentCargo
        //super init uses the initializer from the parent class so we don't have to rewrite that code. Neat!
        super.init(gasTankCapacity: gasTankCapacity, milesPerGallon: milesPerGallon, currentGasInTank: currentGasInTank, make: make, model: model)
    }
    //override allows me to change a property or method.  in this case we're changing the fillTheTank method to behave differently than the one in the parent class.
    override func fillTheTank() {
        let gasToBuy = gasTankCapacity - currentGasInTank
        print("You added \(gasToBuy) to the gas tank in your truck")
    }
    //the final keyword ensures that future subclasses that inherit this cannot make changes.  You can add final to properties, methods and classes themselves.  If I add final to Truck before the class keyword, then no one can create a subclass using Truck as the parent.  You get an error
    final func describeCar(){
        print("You are driving a \(make) \(model)")
    }
}

var myTruck = Truck(gasTankCapacity: 35.0, milesPerGallon: 12.7, currentGasInTank: 18, make: "Toyota", model: "Tundra", cargoCapacity: 35.2, currentCargo: 4.3)
myTruck.fillTheTank()
myTruck.describeCar()
//one last note.  Why use final?  The short answer is that it allows Xcode to optimize your code related to that class.  Its not required but it is a best practice to use final on a class when you intend to disallow future subclassing from it.
