//
//  NotesDatabase.swift
//  notes
//
//  Created by Ruben on 3/7/24.
//

import Foundation
import SwiftData

enum DatabaseError: Error {
    case errorInsert, errorFetch, errorUpdate, errorRemove
}

protocol NotesDatabaseProtocol {
    func insert(note: Note) throws
    func fetchAll() throws -> [Note]
}

class NotesDatabase: NotesDatabaseProtocol {
    static let shared: NotesDatabase = NotesDatabase()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() { }
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(for: Note.self,
                                                configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            print("Error \(error.localizedDescription)")
            fatalError("Database can't be created")
        }
    }
    
    @MainActor
    func insert(note: Note) throws {
        container.mainContext.insert(note)
        
        do {
            try container.mainContext.save()
        } catch {
            print("Error -> \(error.localizedDescription)")
            throw DatabaseError.errorInsert
        }
    }
    
    @MainActor
    func fetchAll() throws -> [Note] {
        let fetchDescriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor<Note>(\.createdAt)])
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            print("Error -> \(error.localizedDescription)")
            throw DatabaseError.errorFetch
        }
    }
    
    
    
    
    
}
