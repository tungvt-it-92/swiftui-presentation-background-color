//
//  SecondView.swift
//  SwiftUICustomPresentationBackgroundColor
//


import SwiftUI

struct SecondView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Group {
            VStack {
                Text("Hello from Second View!")
                
                Image(systemName: "figure.wave")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing, content: {
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .buttonStyle(.plain)
            .offset(x: -20, y: -10)
        })
        .background(Color.gray.opacity(0.5))
        .foregroundStyle(Color.black)
    }
}

#Preview {
    ZStack(alignment: .top) {
        Color.white
            .ignoresSafeArea()
        Text("Background View")
        
        SecondView(isPresented: .constant(true))
    }
}
