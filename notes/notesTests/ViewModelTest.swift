//
//  ViewModelTest.swift
//  notesTests
//
//  Created by Ruben on 3/7/24.
//

import XCTest

@testable import notes

var mockDatabase: [Note] = []

struct CreateNoteUsecaseMock: CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws {
        let note =  Note(title: "title", text: "text", createdAt: .now)
        mockDatabase.append(note)
    }
}

struct FetchAllNotesUsecaseMock: FetchAllNotesProtocol {
    func fetchAll() throws -> [notes.Note] {
        return mockDatabase
    }
    
    
}

final class ViewModelTest: XCTestCase {

    var viewModel: NoteViewModel!
    
    override func setUpWithError() throws {
        viewModel = NoteViewModel(createNoteUseCase: CreateNoteUsecaseMock(),
        fetchAllNotesUseCase: FetchAllNotesUsecaseMock())
    }

    override func tearDownWithError() throws {
        mockDatabase = []
    }
    
    func testCreateNote() {
        let title = "title"
        let text = "text"

        viewModel.createNoteWith(title: title, text: text)
        
        XCTAssertEqual(viewModel.notes.count, 1)
        XCTAssertEqual(viewModel.notes.first?.text, "text")
        XCTAssertEqual(viewModel.notes.first?.title, "title")
        
    }
   
    func testUpdateNote() {
        let title = "Test title"
        let text = "Test text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        let newTitle = "New title"
        let newText = "New text"
        
        if let identifier = viewModel.notes.first?.identifier {
            viewModel.updateNoteWith(identifier: identifier, newTitle: newTitle, newText: newText)
            XCTAssertEqual(viewModel.notes.first?.title, newTitle)
            XCTAssertEqual(viewModel.notes.first?.text, newText)
        } else {
            XCTFail("Error -> No note was created")
        }
        
    }
    
    func testRemoveNote() {
        let title = "Test title"
        let text = "Test text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        if let identifier = viewModel.notes.first?.identifier {
            viewModel.deleteNoteWith(identifier: identifier)
            XCTAssertTrue(viewModel.notes.isEmpty)
        } else {
            XCTFail("Error -> No note was created")
        }
        
    }

}
