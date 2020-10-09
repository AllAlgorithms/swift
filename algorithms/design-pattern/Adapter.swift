/// Adapter Design Pattern
///
/// Intent: Convert the interface of a class into the interface clients expect.
/// Adapter lets classes work together that couldn't work otherwise because of
/// incompatible interfaces.

protocol AuthService {
    func presentAuthFlow()
}

class AuthServiceA: AuthService {
    func presentAuthFlow() {
        print("AuthServiceA has been shown.")
    }
}

class AuthServiceB: AuthService {
    func startAuthorizationServiceB() {
        print("AuthServiceB has been shown.")
    }
    
    func presentAuthFlow() {
        print("AuthService Adapter is called")
        self.startAuthorizationServiceB()
    }
}

class Client {
    func testAuthAdapter() {
        print("Starting an authorization via AuthServiceA")
        startAuthorization(with: AuthServiceA())

        print("Starting an authorization via AuthServiceB")
        startAuthorization(with: AuthServiceB())
    }

    func startAuthorization(with service: AuthService) {
        service.presentAuthFlow()
    }
}

let client = Client()
client.testAuthAdapter()
