//
//  MyImageView.swift
//  NewBMICalculator
//
//  Created by Jay B on 31/3/2566 BE.
//

import SwiftUI

struct MyImageView: View {
    var body: some View {
        Image("MyImage").resizable().aspectRatio(contentMode: .fit).clipShape(Circle())
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView()
    }
}
