//
//  CategoryRow.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 23/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var category: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .font(.headline)
                .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: -10) {
                    ForEach(self.category, id: \.self) { item in
                        FlowerGrouping(category: item)
                    }
                }
            }
        }
    }
}


struct FlowerGrouping: View {
    var category: String
    
    var body: some View {
        VStack {
            Text(self.category)
                .foregroundColor(Color.white)
                .font(.system(size: 20))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .frame(width: 250)
        }
        
        .background(self.randomColor())
        .cornerRadius(5)
        .padding([.leading, .trailing], 15)
    }
    
    //  This will triggered when scroll
    private func randomColor() -> Color {
        let randomRed = Double.random(in: 0..<1)
        let randomGreen = Double.random(in: 0..<1)
        let randomBlue = Double.random(in: 0..<1)
        return Color(red: randomRed, green: randomGreen, blue: randomBlue)
    }
}
