import Foundation
import XCTest

extension XCUIElementQuery {
    
    func element(withLabel: String) -> XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS %@", withLabel)
        return element(matching: predicate)
    }
    
}
