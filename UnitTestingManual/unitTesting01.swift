//  unitTesting01.swift
//  unitTesting01
//  Created by brian devalda on 12/07/23.

import XCTest

//@NSCopying
//class var `default`: XCTMeasureOptions {

//init(application: XCUIApplication)
//static var manuallyStart: XCTMeasureOptions.InvocationOptions { get }

//}



@testable import brianApps

final class unitTesting01: XCTestCase {
    
    var sut:LoginViewController!
    
    func testAssertSameCondition(){
        
        sut = LoginViewController()
        let enteredAmount = 100.0
        let tipSlider = 25.0
        
        let tip = sut.TestassertEqual(of: enteredAmount, with: tipSlider)
        
        XCTAssertEqual(tip, 25)
    }
    
    func testGuardNull(){
        sut = LoginViewController()
        let enteredAmount = -50.0
        let tipSlider = 25.0
        
        let tip = sut.TestassertEqual(of: enteredAmount, with: tipSlider)
        
        XCTAssertNil(tip)
        
    }
    
    func testDownloadWebDataWithConcurrency() async throws {
        let url = URL(string: "https://devmob.1-saku.com/Index.aspx")!
        
        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url, delegate: nil)
        
        // Assert that the actual response matches the expected response.
        let httpResponse = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expected an HTTPURLResponse.")
        XCTAssertEqual(httpResponse.statusCode, 200, "Expected a 200 OK response.")
    }
    
    
    func XCTAssertThrowsError<T>(
        _ expression: @autoclosure () throws -> T,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #filePath,
        line: UInt = #line,
        _ errorHandler: (_ error: Error) -> Void = { _ in }
    ){
//
    }
    
//    fileManager.openFileAsync(with: "exampleFilename") { file, error in
//
//
//        // Assert that the asynchronous task worked.
//        XCTAssertNotNil(file, "Expected to load a file.")
//
//
//        // Assert that no errors occurred opening the file asynchronously.
//        XCTAssertNil(error, "Expected no errors loading a file.")
//
//        // Fulfill the expectation.
//        expectation.fulfill()
//    }
    
    func testAsyncCall(){
        
        let expectation = XCTestExpectation(description: "Call Network")
        sut.isSuccessfullGetPost = true
        sut.time = 3
//        sut.getAsyncData(resultss, in XCTAssertTrue(resultss))
//        sut.getAsyncData( result in expectation.fulfill()
//                          XCTAssertTrue(result))
        wait(for: [expectation] , timeout: 5.0)
            
    }
    

    
    


}
