import XCTest

class BaseTestCase: XCTestCase {

    var app: XCUIApplication!
    private lazy var skipButton = app.staticTexts["Skip"]
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        setupRegionAndLocaleToUK()
        app.launch()
        skipOnboarding()
    }
    
    func setupRegionAndLocaleToUK() {
            app.launchArguments = ["-AppleLanguages", "(en)"]
    }
    
    func skipOnboarding() {
        if skipButton.exists {
            skipButton.tap()
        }
    }
    
    func dumpViewHierarchy() {
        let viewHierarchyDump = XCTAttachment(string: XCUIApplication().debugDescription)
        add(viewHierarchyDump)
    }
}
