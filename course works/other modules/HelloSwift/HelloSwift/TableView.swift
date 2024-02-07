//
//  TableView.swift
//  HelloSwift
//
//  Created by Игорь Крысин on 25.10.2023.
//

import SwiftUI

struct TableView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Button ("count++") {
                count += 1
            }
            Text("count: \(count)")
                .padding()
            
        }
    }
}


#Preview {
    TableView()
}
