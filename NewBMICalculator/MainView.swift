//
//  ContentView.swift
//  NewBMICalculator
//
//  Created by Jay B on 30/3/2566 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: MyBMICalculatorView()){
                    Image("BMI")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } // close NavigationLink
                Text("BMI Computing")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y: -75)
                    .padding(.bottom, -75)
                
                NavigationLink(destination: MyDeveloperView()){
                    Image("Developer")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Text("About Developer")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y: -75)
                    .padding(.bottom, -75)
            }// close VStack
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.large)
            
        } // close NavigationView
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
