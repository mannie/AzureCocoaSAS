import XCTest
@testable import AzureCocoaSAS

final class AzureCocoaSASTests: XCTestCase {

    func testBasic() {
        let policy = AzureCocoaSAS.SharedAccessPolicy(name: "RootManagedSharedAccessKey", key: "Jp9cUB1iCF/MBLCa9A+wLB4DKBDewmkfAkEQ6X7NjP0=")
        let endpoint = "https://mynamespace.servicebus.windows.net/myhub"
        let token = try! AzureCocoaSAS.token(for: endpoint, using: policy, lifetime: 60 * 60 * 24 * 7)
        XCTAssertTrue(token.contains("SharedAccessSignature sr=https"))
        XCTAssertTrue(token.contains("&skn=RootManagedSharedAccessKey"))
    }
    
    static var allTests = [
        ("testBasic", testBasic),
    ]
}
