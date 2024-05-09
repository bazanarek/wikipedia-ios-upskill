import Foundation
import XCTest

class SearchPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var searchField = app.searchFields.firstMatch
    private lazy var resultItem = app.staticTexts.matching(identifier: "searchResult")
    private lazy var noResultsFoundMessage = app.staticTexts["No results found"].firstMatch
    private lazy var clearTextButton = app.buttons["Clear text"].firstMatch
    private lazy var recentSearchItem = app.collectionViews.cells.staticTexts
    
    // MARK: - Actions
    func typeIn(searchQuery: String) {
        searchField.typeText(searchQuery)
    }
    
    func tapFirstResult() {
        resultItem.firstMatch.tap()
    }
    
    func tapClearSearchText() {
        clearTextButton.tap()
    }
    
    // MARK: - Helpers
    func getFirstResultTitle() -> String {
        return resultItem.firstMatch.label
    }
    
    func getResultsCount() -> Int {
        return resultItem.allElementsBoundByIndex.count
    }
    
    func isNoResultsFoundMessageDisplayed() -> Bool {
        return noResultsFoundMessage.waitForExistence(timeout: TestTimeouts.generalUiElementTimeout)
    }
    
    func getRecentSearches() -> [String] {
        return recentSearchItem.allElementsBoundByIndex.map { $0.label }
    }
    
    func getSearchResults() -> [String] {
        return resultItem.allElementsBoundByIndex.map { $0.label }
    }
}
