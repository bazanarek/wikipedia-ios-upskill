import Foundation

class WebViewPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var privacyPolicyPageTitle = app.staticTexts["Wikimedia Foundation Privacy Policy"].firstMatch
    private lazy var termsOfUsePageTitle = app.staticTexts["Wikimedia Foundation Privacy Policy"].firstMatch
    
    // MARK: - Helpers
    func isPrivacyPolicyPageDisplayed() -> Bool {
        return privacyPolicyPageTitle.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
    }
    
    func isTermsOfUsePageDisplayed() -> Bool {
        return termsOfUsePageTitle.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
    }
}
