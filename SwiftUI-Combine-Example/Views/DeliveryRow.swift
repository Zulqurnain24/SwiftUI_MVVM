//
//  DeliveryRow.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import SwiftUI

struct DeliveryRow: View {
    @EnvironmentObject var viewModel: DeliveryViewModel
    @State var delivery: Delivery

    var body: some View {
        HStack {
                self.viewModel.userImages[delivery].map { image in
                    Image(uiImage: image)
                        .frame(width: 44, height: 44)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
            
                Text(delivery.description)
                    .font(Font.system(size: 18).bold())
                NavigationLink("", destination: DeliveryDetailView(viewModel: DetailViewModel(delivery: delivery)))
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(height: 60)
            .onAppear { self.viewModel.getImage(for: self.delivery) }
    }
}
