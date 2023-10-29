import Foundation
import XCTest

class SearchPage: BaseAppPage {
    
    // MARK: - Elements
    private lazy var searchField = app.searchFields.firstMatch
    private lazy var resultItem = app.staticTexts.matching(identifier: "searchResult")
    private lazy var noResultsFoundMessage = app.staticTexts["No results found"].firstMatch
    private lazy var clearTextButton = app.buttons["Clear text"].firstMatch
    private lazy var recentSearchItem = app.collectionViews.cells.staticTexts
    private func recentSearch(index: Int) -> XCUIElement {
        recentSearchItem.element(boundBy: index).firstMatch
    }
    private func searchResult(index: Int) -> XCUIElement {
        resultItem.element(boundBy: index).firstMatch
    }
    
    
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
        var recentSearches = [String]()
        for index in 0..<recentSearchItem.count {
            recentSearches.append(recentSearch(index: index).label)
        }
        return recentSearches
    }
    
    func getSearchResults() -> [String] {
        var searchResults = [String]()
        for index in 0..<getResultsCount() {
            searchResults.append(searchResult(index: index).label)
        }
        return searchResults
    }

}
