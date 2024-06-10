// The Swift Programming Language
// https://docs.swift.org/swift-book


struct AEWalletFramework{

    var provisioningCoordinator = AccessProvisioningCoordinator()
    var authToken: ProvisioningContext?
    func doSomeWork(){
        print("Doing some work..")
        provisioningCoordinator.addToWallet(authToken!)
    }
}
