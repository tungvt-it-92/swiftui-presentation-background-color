//
//  SecondView.swift
//  SwiftUICustomPresentationBackgroundColor
//


import SwiftUI

struct SecondView: View {
    @Binding var isPresented: Bool
    @State var animatingOnAppear: Bool = false
    
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
        .scaleEffect(animatingOnAppear ? 1 : 0.1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing, content: {
            Button {
                var transaction = Transaction(animation: .none)
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    isPresented.toggle()
                }
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
        .animation(.spring(duration: 0.25), value: animatingOnAppear)
        .onAppear {
            animatingOnAppear = true
        }
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
