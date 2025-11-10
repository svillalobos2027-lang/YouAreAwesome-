//
//  ContentView.swift
//  YouAreAwesome!
//
//  Created by SILVA, NICOLE on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    var body: some View {
        VStack {
            Spacer()
            
                .frame(width: 200, height: 200)
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
         
            Spacer()
            HStack {
                Button("Awesome!") {
                    message = "Awesome!"
                    
                }
               
                Button("Great!") {
                    message = "Great!"
                    
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
