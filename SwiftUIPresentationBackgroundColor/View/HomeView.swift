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
                .padding(10)
            
            Button("Present Second View") {
                var transaction = Transaction(animation: nil)
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    showFullScreenCover.toggle()
                }
            }
            .foregroundColor(Color.accentColor)
        }
        .padding()
        .fullScreenCover(isPresented: $showFullScreenCover) {
            SecondView(isPresented: $showFullScreenCover)
                .presentationWithBackgroundColor(color: Color.clear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
        .foregroundColor(Color(UIColor.label))
        .navigationTitle("HOME")
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
