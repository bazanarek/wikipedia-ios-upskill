import Foundation

class ArticlePage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var webViewText = app.webViews.staticTexts
    private lazy var navigationBar = app.navigationBars.firstMatch
    private lazy var backButton = app.buttons["Back"].firstMatch
    
    // MARK: Actions
    func tapBackButton() {
        _ = backButton.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
        backButton.tap()
    }
    
    // MARK: - Helpers
    func isTextOnPageDispplayed(text: String) -> Bool {
        _ = webViewText.element.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
        return webViewText.element(withLabel: text).firstMatch.exists
    }
}
