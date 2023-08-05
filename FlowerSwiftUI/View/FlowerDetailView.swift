//
//  FlowerDetailView.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 23/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI

struct FlowerDetailView: View {
    var flower: Flower
    @State var flowerStore = FlowerStore.default
    
    var body: some View {
        VStack {
            HeaderDetail(flower: flower)
                .edgesIgnoringSafeArea(.top)
            
            Text(flower.name)
                .font(.system(size: 28))
                .bold()
                .fontWeight(.heavy)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Interest")
                    .bold()
                
                Picker("Your Interest", selection: self.$flowerStore.interestLevel) {
                    ForEach(FlowerStore.Interest.allCases, id: \.self) { interest in
                        Text(interest.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer().frame(height: 10)
                
                Text("Description")
                    .bold()
                
                Text(flower.instructions)
                    .fontWeight(.regular)
                    .font(.system(size: 14))
            }
            .padding([.leading, .trailing], 20)
            
            Spacer()
        }
    }
}


struct HeaderDetail: View {
    var flower: Flower
    
    var body: some View {
        loadImageKF(url: "http://services.hanselandpetal.com/photos/\(self.flower.photo)")
            .resizable()
    }
}
