import XCTest

extension XCUIElement {
    
    func waitAndTap() {
        _ = self.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
        self.tap()
    }
}
