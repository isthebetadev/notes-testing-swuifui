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
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func createNoteWith(title: String, text: String) {
        let note: Note = .init(title: title, text: text, createdAt: .now)
        notes.append(note)
    }
    
    func updateNoteWith(id: UUID, newTitle: String, newText: String?) {
        if let index = notes.firstIndex(where: {$0.id == id}) {
            let updateNote = Note(id: id, title: newTitle, text: newText, createdAt: notes[index].createdAt)
        }
    }
    
    func deleteNoteWith(id: UUID) {
        notes.removeAll(where: {$0.id == id})
    }
    
}
