import Foundation

class SettingsPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var privacyPolicyButton = app.staticTexts["Privacy policy"].firstMatch
    private lazy var termsOfUseButton = app.staticTexts["Terms of Use"].firstMatch
    
    // MARK: - Actions
    
    func tapOpenPrivacyPolicy() {
        privacyPolicyButton.waitAndTap()
    }
    
    func tapOpenTermsOfUse() {
        termsOfUseButton.waitAndTap()
    }
}
