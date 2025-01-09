//
//  InfoView.swift
//  calculatır
//
//  Created by Hürmüs Sürücüoğlu on 6.01.2025.
//

import SwiftUI

struct InfoView: View {
    @State var back:Bool = false
    var body: some View {
        VStack {
            Image("imza")
                .resizable()
                .frame(height: 120)
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $back, destination: {
                ContentView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        back = true
                    }) {
                        Image(systemName: "arrow.left")
                        
                    }
                }
            }
    }
}

#Preview {
    InfoView()
}
