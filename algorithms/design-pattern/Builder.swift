/// Builder Design Pattern
///
/// Intent: Lets you construct complex objects step by step. The pattern allows
/// you to produce different types and representations of an object using the
/// same construction code.

protocol Builder {
    func producePartA()
    func producePartB()
    func producePartC()
}

class ConcreteBuilder: Builder {
    private var product = Product()

    func reset() {
        product = Product()
    }
    
    func producePartA() {
        product.add(part: "PartA")
    }

    func producePartB() {
        product.add(part: "PartB")
    }

    func producePartC() {
        product.add(part: "PartC")
    }
    
    func retrieveProduct() -> Product {
        let result = self.product
        reset()
        return result
    }
}

class Director {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func buildMinimalViableProduct() {
        builder?.producePartA()
    }

    func buildFullFeaturedProduct() {
        builder?.producePartA()
        builder?.producePartB()
        builder?.producePartC()
    }
}

class Product {
    private var parts = [String]()

    func add(part: String) {
        self.parts.append(part)
    }

    func listParts() -> String {
        return "Product parts: " + parts.joined(separator: ", ") + "\n"
    }
}

class Client {
    static func builder(director: Director) {
        let builder = ConcreteBuilder()
        director.update(builder: builder)
        
        print("Standard basic product:")
        director.buildMinimalViableProduct()
        print(builder.retrieveProduct().listParts())

        print("Standard full featured product:")
        director.buildFullFeaturedProduct()
        print(builder.retrieveProduct().listParts())
        
        print("Custom product:")
        builder.producePartA()
        builder.producePartC()
        print(builder.retrieveProduct().listParts())
    }
}

var director = Director();
Client.builder(director: director)

