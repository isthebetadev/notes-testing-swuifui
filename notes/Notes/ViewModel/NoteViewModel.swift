//
//  NoteViewModel.swift
//  notes
//
//  Created by Ruben on 2/7/24.
//

import Foundation
import Observation

@Observable
class NoteViewModel {
    
    var notes: [Note]
    
    var createNoteUseCase: CreateNoteUsecase
    var fetchAllNotesUseCase: FetchAllNotesUsecase
    
    init(notes: [Note] = [], createNoteUseCase:
         CreateNoteUsecase = CreateNoteUsecase(),
         fetchAllNotesUseCase: FetchAllNotesUsecase = FetchAllNotesUsecase()) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        fetchAllNotes()
    }
    
    func fetchAllNotes() {
        do {
            notes = try fetchAllNotesUseCase.fetchAll()
        } catch {
            print("❌ Error \(error.localizedDescription)")
        }
    }
    
    func createNoteWith(title: String, text: String) {
        do {
            try createNoteUseCase.createNoteWith(title: title, text: text)
            fetchAllNotes()
        } catch {
            print("❌ Error \(error.localizedDescription)")
        }
    }
    
    func updateNoteWith(identifier: UUID, newTitle: String, newText: String?) {
        if let index = notes.firstIndex(where: {$0.identifier == identifier}) {
            let updateNote = Note(identifier: identifier, title: newTitle, text: newText, createdAt: notes[index].createdAt)
            notes[index] = updateNote
        }
    }
    
    func deleteNoteWith(identifier: UUID) {
        notes.removeAll(where: {$0.identifier == identifier})
    }
    
}
