import Foundation
import XCTest

class UpskillTests: BaseTestCase {
    
    lazy var homePage = HomePage(application: self.app)
    lazy var searchPage = SearchPage(application: self.app)
    lazy var articlePage = ArticlePage(application: self.app)
    lazy var settingsPage = SettingsPage(application: self.app)
    lazy var webViewPage = WebViewPage(application: self.app)
    
    func testSearchForTermAndDisplayArticle_TC1() {
        let searchQuery = "Tomato"
        
        homePage.tapSearchFiled()
        searchPage.typeIn(searchQuery: searchQuery)
        searchPage.tapFirstResult()
        
        XCTAssertTrue(articlePage.isTextOnPageDisplayed(text: searchQuery), "Article page for search query \(searchQuery) didn't open")
    }
    
    func testResultsNotFound_TC2() {
        let searchQueryWithNoResults = "sjnsdjfnfjfjf"
        
        homePage.tapSearchFiled()
        searchPage.typeIn(searchQuery: searchQueryWithNoResults)
        
       XCTAssertTrue(searchPage.getResultsCount() == 0, "Some results are returned")
       XCTAssertTrue(searchPage.isNoResultsFoundMessageDisplayed(), "No results message is not displayed when no results returned")
    }
    
    func testRecentSearches_TC3() {
        let searchQuery = "Tokio"
        
        homePage.tapSearchFiled()
        searchPage.typeIn(searchQuery: searchQuery)
        searchPage.tapFirstResult()
        articlePage.tapBackButton()
        searchPage.tapClearSearchText()
        
        XCTAssertTrue(searchPage.getRecentSearches().contains(searchQuery), "Recent search query - \(searchQuery) is not displayed in the recent searches list")
    }
    
    func testDisplayPrivacyPolicy_TC4() {
        homePage.tapSettings()
        settingsPage.tapOpenPrivacyPolicy()
        
        XCTAssertTrue(webViewPage.isPrivacyPolicyPageDisplayed(), "Privacy Policy page is not displayed")
    }
    
    func testDisplayTermsOfUse_TC5() {
        homePage.tapSettings()
        settingsPage.tapOpenTermsOfUse()
        
        XCTAssertTrue(webViewPage.isTermsOfUsePageDisplayed(), "Terms of use page is not displayed")
    }
}
