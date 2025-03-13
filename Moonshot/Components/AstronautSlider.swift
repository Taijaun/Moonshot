//
//  AstronautSlider.swift
//  Moonshot
//
//  Created by Taijaun Pitt on 13/03/2025.
//

import SwiftUI

struct AstronautSlider: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        HStack {
            ForEach(crew, id: \.role) { crewMember in
                NavigationLink {
                    AstronautView(astronaut: crewMember.astronaut)
                } label: {
                    HStack {
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(.capsule)
                            .overlay(
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            
                            Text(crewMember.role)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

//#Preview {
//    AstronautSlider()
//}
