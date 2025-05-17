//
//  ContentView.swift
//  SwiftUICustomPresentationBackgroundColor
//

import SwiftUI

struct HomeView: View {
    @State private var showFullScreenCover: Bool = false
    
    var body: some View {
        VStack {
            Text("Presentation with transparent background example")
                .multilineTextAlignment(.center)
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(10)
            
            Button("Present Second View") {
                showFullScreenCover.toggle()
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showFullScreenCover) {
            SecondView(isPresented: $showFullScreenCover)
                .presentationWithBackgroundColor(color: Color.clear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("HOME")
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
