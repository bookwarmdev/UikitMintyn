//
//  LoginViewControllerUITests.swift
//  Mintyn
//
//  Created by Faruk Amoo on 10/03/2025.
//


import XCTest

class LoginViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testLoginSuccess() {
        let phoneTextField = app.textFields["phoneTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]
        
        XCTAssertTrue(phoneTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        XCTAssertTrue(loginButton.exists)
        
        phoneTextField.tap()
        phoneTextField.typeText("8110203040")
        
        passwordTextField.tap()
        passwordTextField.typeText("Test@123")
        
        // Scroll to the login button if necessary
        app.scrollToElement(element: loginButton, maxSwipes: 15)
        
        // Ensure the button is hittable before tapping
        if loginButton.isHittable {
            loginButton.tap()
        } else {
            XCTFail("Login button is not hittable")
        }
        
        // Verify successful login by checking the existence of an element in HomeViewController
        let homeScreenElement = app.otherElements["HomeView"]
        XCTAssertTrue(homeScreenElement.waitForExistence(timeout: 10))
    }
    
    func testLoginFailure() {
        let phoneTextField = app.textFields["phoneTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]
        
        XCTAssertTrue(phoneTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
        XCTAssertTrue(loginButton.exists)
        
        phoneTextField.tap()
        phoneTextField.typeText("1234567890")
        
        passwordTextField.tap()
        passwordTextField.typeText("WrongPass")
        
        // Scroll to the login button if necessary
        app.scrollToElement(element: loginButton, maxSwipes: 15)
        
        // Ensure the button is hittable before tapping
        if loginButton.isHittable {
            loginButton.tap()
        } else {
            XCTFail("Login button is not hittable")
        }
        
        // Verify error alert is displayed
        let errorAlert = app.alerts["Error"]
        XCTAssertTrue(errorAlert.waitForExistence(timeout: 5))
    }
}

extension XCUIApplication {
    func scrollToElement(element: XCUIElement, maxSwipes: Int = 10) {
        var swipes = 0
        while !element.isHittable && swipes < maxSwipes {
            let start = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
            let end = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
            start.press(forDuration: 0.1, thenDragTo: end)
            swipes += 1
        }
    }
}
