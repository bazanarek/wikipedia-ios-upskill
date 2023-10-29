import Foundation

class SettingsPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var privacyPolicyButton = app.staticTexts["Privacy policy"].firstMatch
    private lazy var termsOfUseButton = app.staticTexts["Terms of Use"].firstMatch
    
    // MARK: - Actions
    
    func tapOpenPrivacyPolicy() {
        _ = privacyPolicyButton.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
        privacyPolicyButton.tap()
    }
    
    func tapOpenTermsOfUse() {
        _ = termsOfUseButton.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
        termsOfUseButton.tap()
    }
}
