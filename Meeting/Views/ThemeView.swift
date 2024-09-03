//
//  ThemeView.swift
//  Meeting
//
//  Created by Artem on 9/2/24.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: 200)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ThemeView(theme: Theme.buttercup)
}
