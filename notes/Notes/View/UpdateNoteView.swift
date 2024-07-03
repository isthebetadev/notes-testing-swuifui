//
//  UpdateNoteView.swift
//  notes
//
//  Created by Ruben on 2/7/24.
//

import SwiftUI

struct UpdateNoteView: View {
    
    var noteViewModel: NoteViewModel
    let identifier: UUID
    
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("Texto"), axis: .vertical)
                }
            }
            Button(action: {
                noteViewModel.deleteNoteWith(identifier: identifier)
                dismiss()
            }, label:{
                Text("Eliminar nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
        }
        .navigationTitle("Editar nota")
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            ToolbarItem() {
                Button(action: {
                    noteViewModel.updateNoteWith(identifier: identifier, newTitle: title, newText: text)
                    dismiss()
                }, label: {
                    Text("Actualizar")
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        UpdateNoteView(noteViewModel: .init(), identifier: .init(), title: "Titulo de prueba", text: "Esto es el texto de ejemplo de la nota.")
    }
}
