//
//  MyDeveloperView.swift
//  NewBMICalculator
//
//  Created by Jay B on 30/3/2566 BE.
//

import SwiftUI

struct MyDeveloperView: View {
    var body: some View { // open view body
        VStack{
            MyImageView()
            Text("Benz (Kodchakan P.)").fontWeight(.bold).font(.custom("Sukhumvit Set", size: 25)).foregroundColor(.orange)
            Text("kodchakan.forwork@gmail.com").font(.custom("Sukhumvit Set", size: 18)).foregroundColor(.blue)
            Text("Faculty of Engineering").fontWeight(.bold).font(.custom("Sukhumvit Set", size: 25))
            HStack{
                Image("Apple").resizable().aspectRatio(contentMode: .fit).frame(width: 175)
                Image("KU logo").resizable().aspectRatio(contentMode: .fit)
            }
            Spacer()
        }// close VStack
        .navigationBarTitle("About Developer")
    }// close view body
}

struct MyDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeveloperView()
    }
}
