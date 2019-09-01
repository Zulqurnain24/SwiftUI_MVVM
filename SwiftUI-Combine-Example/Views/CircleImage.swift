//
//  CircleImage.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var imageURLString: String
    var body: some View {
        Image(imageURLString)
        
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(imageURLString: "placeHolder")
    }
}
