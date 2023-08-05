//
//  ContentView.swift
//  FlowerSwiftUI
//
//  Created by Nizzammuddin on 21/10/2019.
//  Copyright © 2019 buckner. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: FlowerListRepository
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual one:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                CategoryRow(category: self.viewModel.category)
                    .listRowInsets(EdgeInsets())
                
                ForEach(self.viewModel.flowers) { item in
                    NavigationLink(destination: FlowerDetailView(flower: item)) {
                        FlowerItem(flower: item)
                    }.isDetailLink(true)
                }.listRowInsets(EdgeInsets())
                
            }.navigationBarTitle(Text("Flower"))
            
        }.onAppear {
            self.viewModel.fetchFlowers()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
