import XCTest

class ArticlePage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var navigationBar = app.navigationBars.firstMatch
    private lazy var backButton = app.buttons["Back"].firstMatch
    private func staticTextInsideArticleView(expectedText: String) -> XCUIElement {
        return app.webViews.staticTexts.element(withLabel: expectedText).firstMatch
    }
    
    // MARK: Actions
    func tapBackButton() {
        backButton.waitAndTap()
    }
    
    // MARK: - Helpers
    func isTextOnPageDisplayed(text: String) -> Bool {
        return staticTextInsideArticleView(expectedText: text).waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
    }
}
