//
//  ContentView.swift
//  Moonshot
//
//  Created by Taijaun Pitt on 11/03/2025.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var toggleList = false
    
    var body: some View {
        NavigationStack {
            
            Group {
                if toggleList {
                    MainListView(missions: missions, astronauts: astronauts)
                } else {
                    MainGridView(missions: missions, astronauts: astronauts, columns: columns)
                }
            }
            
            .navigationTitle("Moonshot")
            .toolbar {
                
                toggleList ?
                Button("Grid") {
                    toggleList.toggle()
                }
                :
                Button("List") {
                    toggleList.toggle()
                }
                
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        
        }
    }
}

#Preview {
    ContentView()
}
