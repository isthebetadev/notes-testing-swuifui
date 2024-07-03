//
//  FetchAllNotesUsecase.swift
//  notes
//
//  Created by Ruben on 3/7/24.
//

import Foundation

struct FetchAllNotesUsecase {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll()
    }
    
}
