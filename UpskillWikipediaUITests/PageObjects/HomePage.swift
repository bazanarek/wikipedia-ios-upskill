import Foundation
import XCTest

class HomePage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var searchField = app.searchFields.firstMatch
    private lazy var settingsButton = app.buttons["Settings"].firstMatch
    
    // MARK: - Actions
    func tapSearchFiled() {
        searchField.tap()
    }
    
    func tapSettings() {
        settingsButton.tap()
    }
}
