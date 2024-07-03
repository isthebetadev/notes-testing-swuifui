//
//  notesTests.swift
//  notesTests
//
//  Created by Ruben on 3/7/24.
//

import XCTest
@testable import notes

final class noteTest: XCTestCase {

    func testNoteInit() {
        // Given
        let title = "Test title"
        let text = "Test text"
        let date = Date()
        
        // When
        let note: Note = .init(title: title, text: text, createdAt: date)
        
        // Then or Assert
        XCTAssertLessThanOrEqual(note.title, title)
        XCTAssertLessThanOrEqual(note.text!, text)
        XCTAssertLessThanOrEqual(note.createdAt, date)
    }
    
    func testNoteEmptyText() {
        let title = "Test title"
        let date = Date()
        
        let note: Note = .init(title: title, text: nil, createdAt: date)
        
        XCTAssertEqual(note.getText, "")
    }
   
}
