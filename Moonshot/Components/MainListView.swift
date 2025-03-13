//
//  MainListView.swift
//  Moonshot
//
//  Created by Taijaun Pitt on 13/03/2025.
//

import SwiftUI

struct MainListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    
    var body: some View {
        List {
            ForEach(missions, id: \.id){ mission in
                VStack {
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    } label:{
                        HStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            Text(mission.formattedLaunchDate)
                                .padding(.leading, 20)
                        }
                        .padding()
                    }
                    
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MainListView(missions: missions, astronauts: astronauts)
}
