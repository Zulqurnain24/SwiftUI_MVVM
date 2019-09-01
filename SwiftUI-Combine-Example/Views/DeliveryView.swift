//
//  DeliveryView.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import SwiftUI

struct DeliveryView: View {
    @EnvironmentObject var viewModel: DeliveryViewModel
    @State var text = ""

    var body: some View {
        NavigationView {
            VStack {
                
                List(viewModel.deliveries) { delivery in
                    DeliveryRow(delivery: delivery)
                }
                }
                .navigationBarTitle(Text("Deliveries"))
        }.onAppear(perform: { self.viewModel.fetch() })
    }
}
