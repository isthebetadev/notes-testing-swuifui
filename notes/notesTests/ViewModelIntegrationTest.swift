//
//  ViewModelIntegrationTest.swift
//  notesTests
//
//  Created by Ruben on 3/7/24.
//

import XCTest
@testable import notes

@MainActor
final class ViewModelIntegrationTest: XCTestCase {

    var sut: NoteViewModel!
    
    // Config for all test
    override func setUpWithError() throws {
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNoteUsecase(notesDatabase: database)
        let fetchNotesUseCase = FetchAllNotesUsecase(notesDatabase: database)
        
        sut = NoteViewModel(createNoteUseCase: createNoteUseCase, fetchAllNotesUseCase: fetchNotesUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateNote() {
        //given
        let title = "Any title"
        let text = "Any text"
        sut.createNoteWith(title: title, text: text)
        //when
        let note = sut.notes.first
        // then
        XCTAssertNotNil(note)
        XCTAssertEqual(sut.notes.count, 1)
        //XCTAssertLessThanOrEqual(note?.title, "Any title")
        //XCTAssertLessThanOrEqual(note?.text, "Any text")
    }
    
    func testFetchAllNotes() {
        sut.createNoteWith(title: "note1", text: "note1text")
        sut.fetchAllNotesUseCase
        let notes = sut.notes
        XCTAssertNotNil(notes)
    }
    

}
