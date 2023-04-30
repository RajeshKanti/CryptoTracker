//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by Rajesh Ghosh on 2023-02-20.
//

import SwiftUI

struct CircleButtonView: View {
    
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(
                color: .theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(imageName: "info")
            .previewLayout(.sizeThatFits)
            
            CircleButtonView(imageName: "plus")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
        }
    }
}
