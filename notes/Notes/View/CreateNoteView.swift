//
//  CreateNoteView.swift
//  notes
//
//  Created by Ruben on 2/7/24.
//

import SwiftUI

struct CreateNoteView: View {
    
    var noteViewModel: NoteViewModel
    
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("Título"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("Texto"), axis: .vertical)
                } footer: {
                    Text("* El título es obligatorio")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }, label: {
                        Text("Cerrar")
                    })
                }
                ToolbarItem() {
                    Button(action: {
                        noteViewModel.createNoteWith(title: title, text: text)
                        dismiss()
                    }, label: {
                        Text("Crear nota")
                    })
                }
            }
            .navigationTitle("Nueva nota")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNoteView(noteViewModel: NoteViewModel())
}
