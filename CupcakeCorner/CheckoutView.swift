//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Radu Petrisel on 14.07.2023.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var orderWrapper: OrderWrapper
    
    @State private var confirmationMessage = ""
    @State private var isShowingConfirmation = false
    
    @State private var isShowingError = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(orderWrapper.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await sendOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $isShowingConfirmation) {
            Button("Ok") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Error placing order", isPresented: $isShowingError) {
            Button("Ok") { }
        }
    }
    
    private func sendOrder() async {
        guard let jsonData = try? JSONEncoder().encode(orderWrapper.order) else {
            print("Cannot encode data")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: jsonData)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is now on its way!"
            isShowingConfirmation = true
        } catch {
            isShowingError = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(orderWrapper: OrderWrapper())
    }
}
