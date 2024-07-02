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
        }
    }

    
}

#Preview {
    ContentView(noteViewModel: NoteViewModel())
}
