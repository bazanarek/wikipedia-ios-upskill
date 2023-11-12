import XCTest

class OnboardingPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var skipButton = app.staticTexts["Skip"]
    
    // MARK: - Actions
    func tapSkipButton() {
        skipButton.waitAndTap()
    }
    
    // MARK: Helpers
    func skipOnboarding() {
        if skipButton.exists {
            tapSkipButton()
        }
    }
}
