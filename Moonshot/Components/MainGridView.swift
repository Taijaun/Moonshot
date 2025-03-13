//
//  MainGridView.swift
//  Moonshot
//
//  Created by Taijaun Pitt on 13/03/2025.
//

import SwiftUI

struct MainGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    let columns: [GridItem]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius:10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MainGridView(missions: missions, astronauts: astronauts, columns: columns)
        .preferredColorScheme(.dark)
}
