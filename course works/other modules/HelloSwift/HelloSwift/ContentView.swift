//
//  ContentView.swift
//  HelloSwift
//
//  Created by Игорь Крысин on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    var body: some View {
      
        
        TabView {
            
            TableView()
                .tabItem {
                    Image(systemName: "timer")
                }.tag("Tab")
            SettingView()
                .tabItem {
                    Image(systemName: "timer")
                }.tag("Setting")
                
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
