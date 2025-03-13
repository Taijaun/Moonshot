//
//  RectangleDivider.swift
//  Moonshot
//
//  Created by Taijaun Pitt on 13/03/2025.
//

import SwiftUI

struct RectangleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectangleDivider()
}
