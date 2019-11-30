import Kitura
import SwiftyRequest
import XCTest
@testable import Fcats

/**
 An example test case.
 
 Unfortunately, Kitura's routers aren't really unit testable.
 This means you'll need to use end-to-end testing instead.
 Fortunately, XCTest and SwiftyRequest make this fairly easy.
 
 You'll need to import the included database dump for these tests to pass.
 */
class RESTRoutesTests: XCTestCase {
    
    func testGetRace() throws {
        let router = Router()
        try Routes(persistence: Persistence()).configureRESTRoutes(using: router.route("api"))
        Kitura.addHTTPServer(onPort: 8090, with: router)
        Kitura.start()
        
        let responseReceived = expectation(description: "responseReceived")
        let request = RestRequest(url: "http://localhost:8090/api/races/1")
        request.responseObject { (result: Result<RestResponse<Race>, RestError>) in
            switch result {
            case .success(let response):
                XCTAssert(response.body.name == "European Shorthair")
            case .failure:
                XCTFail()
            }
            responseReceived.fulfill()
        }
        
        waitForExpectations(timeout: 5) {
            error in
            Kitura.stop()
            XCTAssertNil(error)
        }
    }
    
    func testGetAllRaces() throws {
        let router = Router()
        try Routes(persistence: Persistence()).configureRESTRoutes(using: router.route("api"))
        Kitura.addHTTPServer(onPort: 8090, with: router)
        Kitura.start()

        let responseReceived = expectation(description: "responseReceived")
        let request = RestRequest(url: "http://localhost:8090/api/races")
        request.responseObject { (result: Result<RestResponse<[Race]>, RestError>) in
            switch result {
            case .success(let response):
                let races = response.body
                XCTAssert(races.count == 2)
                XCTAssert(races[0].name == "European Shorthair")
                XCTAssert(races[1].name == "Maine Coon")
            case .failure:
                XCTFail()
            }
            responseReceived.fulfill()
        }

        waitForExpectations(timeout: 5) {
            error in
            Kitura.stop()
            XCTAssertNil(error)
        }
    }
}
