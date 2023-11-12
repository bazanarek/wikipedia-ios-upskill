import XCTest

class BaseTestCase: XCTestCase {

    var app: XCUIApplication!
    lazy var onboardingPage = OnboardingPage(application: self.app)
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launchArguments += ["WMFDidShowOnboarding", "@YES"] // > not working
        setupRegionAndLocaleToUK()
        app.launch()
        onboardingPage.skipOnboarding()
    }
    
    override func tearDown() {
        super.tearDown()
        dumpViewHierarchy()
    }
    
    func setupRegionAndLocaleToUK() {
        app.launchArguments += ["-AppleLanguages", "(en)"]
    }
    
    func dumpViewHierarchy() {
        let viewHierarchyDump = XCTAttachment(string: XCUIApplication().debugDescription)
        add(viewHierarchyDump)
    }
}
