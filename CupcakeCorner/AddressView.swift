//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Radu Petrisel on 14.07.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderWrapper: OrderWrapper
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderWrapper.order.name)
                TextField("Street Address", text: $orderWrapper.order.streetAddress)
                TextField("City", text: $orderWrapper.order.city)
                TextField("Zip code", text: $orderWrapper.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderWrapper: orderWrapper)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!orderWrapper.order.isAddressValid)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderWrapper: OrderWrapper())
        }
    }
}
