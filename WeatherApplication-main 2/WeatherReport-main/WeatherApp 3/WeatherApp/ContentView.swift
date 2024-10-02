//
//  ContentView.swift
//  WeatherApp
//
//  Created by Venuka Valiveti on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            WeatherView(viewModel: WeatherViewModel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
