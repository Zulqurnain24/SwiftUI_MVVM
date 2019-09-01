//
//  DeliveryDetailView.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import SwiftUI

struct DeliveryDetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
  var body: some View {
      VStack {
        MapView(location: viewModel.delivery.location)
              .edgesIgnoringSafeArea(.top)
              .frame(height: 300)

        Image("placeHolder")
         .frame(width: 100, height: 100)
         .aspectRatio(contentMode: .fit)
         .clipShape(Circle())
         .overlay(Circle().stroke(Color.gray, lineWidth: 1))

          VStack(alignment: .leading) {
            Text("Description")
              .font(.title)
            HStack(alignment: .top) {
            Text(viewModel.delivery.description)
                  .font(.subheadline)
            }
            Spacer()
            Text("Address")
            .font(.title)
            HStack(alignment: .top) {
              Text(viewModel.delivery.location.address)
                    .font(.subheadline)
              }
          }
          .padding()

          Spacer()
      }
  }
}

#if DEBUG
struct DeliveryDetailView_Previews : PreviewProvider {
    static var previews: some View {
         DeliveryDetailView(viewModel: .init(
            delivery:  Delivery(id: 0, description: "", imageUrl: (URL(string: "") ?? nil)!, location: DeliveryLocation(lat: 0.0, lng: 0.0, address: ""))
            )
        )
    }
}
#endif
