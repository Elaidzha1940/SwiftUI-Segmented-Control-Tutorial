//
//  ContentView.swift
//  SwiftUI Segmented Control Tutorial
//
//  Created by Elaidzha Shchukin on 13.09.2022.
//

import SwiftUI

//15.09

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
    }
    
    @State private var selectedSide: SideOfTheForce = .dark
    
    var body: some View {
        NavigationView{
            VStack{
                
                Picker("Choose a side", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenPlayerView(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a side")
        }
    }
}

enum SideOfTheForce: String, CaseIterable {
    
    case light = "Light"
    case grey = "Grey"
    case dark = "Dark"
}


struct ChosenPlayerView: View {
    
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .light:
            PlayerImageView(playerName: "Kobe 1")
                .cornerRadius(10)
        case .grey:
            PlayerImageView(playerName: "Kobe 0")
                .cornerRadius(10)
        case .dark:
            PlayerImageView(playerName: "Kobe 2")
                .cornerRadius(10)
            
        }
    }
}

struct PlayerImageView: View {
    
    var playerName: String
    
    var body: some View {
        Image(playerName)
            .resizable()
            .frame(width: 310, height: 530)
            .shadow(color: .white, radius: 80)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
