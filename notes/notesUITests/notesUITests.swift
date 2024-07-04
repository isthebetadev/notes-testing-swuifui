//
//  notesUITests.swift
//  notesUITests
//
//  Created by Ruben on 4/7/24.
//

import XCTest

final class notesUITests: XCTestCase {

    func testCreateNote() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        
        let collectionViewsQuery2 = collectionViewsQuery
        collectionViewsQuery2/*@START_MENU_TOKEN@*/.textViews["Título"]/*[[".cells.textViews[\"Título\"]",".textViews[\"Título\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.textViews["Título"]/*[[".cells.textViews[\"Título\"]",".textViews[\"Título\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("Test UI")
        
        let textoTextView = collectionViewsQuery2/*@START_MENU_TOKEN@*/.textViews["Texto"]/*[[".cells.textViews[\"Texto\"]",".textViews[\"Texto\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        textoTextView.tap()
        collectionViewsQuery2/*@START_MENU_TOKEN@*/.textViews["Texto"]/*[[".cells.textViews[\"Texto\"]",".textViews[\"Texto\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("Texto del test UI")
        app.navigationBars["Nueva nota"]/*@START_MENU_TOKEN@*/.buttons["Crear nota"]/*[[".otherElements[\"Crear nota\"].buttons[\"Crear nota\"]",".buttons[\"Crear nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }

}
