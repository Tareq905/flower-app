//
//  FlowerItem.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 23/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI

struct FlowerItem: View {
    var flower: Flower
       
    var body: some View {
        ZStack {
            loadImageKF(url: "http://services.hanselandpetal.com/photos/\(flower.photo)")
                .resizable()
                .frame(height: 320)
                .cornerRadius(20)
               
           VStack(alignment: .leading) {
               TextTitle(title: self.flower.name.uppercased(), textSize: 24, textWeight: .heavy)
               TextTitle(title: self.flower.instructions, textSize: 20, textWeight: .thin)
            
           }.offset(y: 50)
            .padding(.leading, 12)
            
        }.padding([.top, .leading], 15)
    }
}

private struct TextTitle: View {
    var title: String
    var textSize: CGFloat
    var textWeight: Font.Weight
    
    var body: some View {
        Text(title)
            .foregroundColor(Color.white)
            .font(.system(size: textSize))
            .fontWeight(textWeight)
            .shadow(color: Color.black, radius: 5)
    }
}
