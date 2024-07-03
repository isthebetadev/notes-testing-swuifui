//
//  ContentView.swift
//  notes
//
//  Created by Ruben on 2/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var noteViewModel: NoteViewModel = .init()
    
    @State var showCreateNote: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(noteViewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: { showCreateNote.toggle() }, label: {
                        Label("Crear nota", systemImage: "square.and.pencil")
                            .labelStyle(.titleAndIcon)
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Note.self, destination: { note in
                UpdateNoteView(noteViewModel: noteViewModel, identifier: note.identifier, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView(noteViewModel: noteViewModel)
            })
        }
    }

    
}

#Preview {
    ContentView(noteViewModel: .init(notes: [
        .init(title: "Rutina de yoga", text: "Una rutina de 10 min para hacer por la mañana.", createdAt: .now),
        .init(title: "Clases del máster IA", text: "Cada semana se publica el horario en el calendario de la web.", createdAt: .now),
        .init(title: "Libros pendientes 📚", text: "Listado de libros pendientes de leer...", createdAt: .now)
    ]))
}
