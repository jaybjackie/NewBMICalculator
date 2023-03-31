//
//  MyBMICalculatorView.swift
//  NewBMICalculator
//
//  Created by Jay B on 30/3/2566 BE.
//

import SwiftUI

struct MyBMICalculatorView: View {
    // for getting input weight and height
    // for bmi result
    @State var myWeight : String = ""
    @State var myHeight : String = ""
    @State var myBMIResult : String = ""
    
    @State var showAlert : Bool = false
    
    private func hideKeyboard() {
        let myScenes = UIApplication.shared.connectedScenes
        let windowScene = myScenes.first as? UIWindowScene
        windowScene?.windows.forEach({$0.endEditing(true)})
    }
    
    private func checkInput() {
        if ((Double(self.myWeight) != nil) && (Double(self.myHeight) != nil)){
            self.bmiCalculationMethod()
        } else{
            self.showAlert = true
        }
    }
    
    private func bmiCalculationMethod() {
        let myWeight = Double(self.myWeight)!
        let myHeight = Double(self.myHeight)! / 100.0
        let myBMIResult = myWeight / (myHeight * myHeight)
        self.myBMIResult = self.bmiInterpretation(bmiValue: myBMIResult)
    }
    
    private func bmiInterpretation(bmiValue : Double) -> String {
        var result : String = "BMI result = \(bmiValue) \n"
        if (bmiValue >= 40) {
            result += "Obese III"
        } else if (bmiValue >= 35){
            result += "Obese II"
        } else if (bmiValue >= 30){
            result += "Obese I"
        } else if (bmiValue >= 25){
            result += "Overweight"
        } else if (bmiValue >= 18.5){
            result += "Normal"
        } else {
            result += "Underweight"
        }
        return result
    }
    
    var body: some View {
        ZStack{
            Color.init(red: 239.0/255.0, green: 244.0/255.0, blue: 244.0/255.0)
            VStack {
                TextField("Weight (kg)", text: $myWeight)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.white)
                    .offset(y: 20)
                    .keyboardType(.decimalPad)
                TextField("Height (cm)", text: $myHeight)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.white)
                    .offset(y: 25)
                    .keyboardType(.decimalPad)
            HStack{
                Button(action: {
                    self.checkInput()
                    self.hideKeyboard()
                } )
                {
                Text("Compute BMI")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                }
                .alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("BMICalculator"), message: Text("Fill the fields"), primaryButton: .cancel(Text("Close")), secondaryButton: .default(Text("Clear data"), action: {
                        self.myWeight = ""
                        self.myHeight = ""
                        self.myBMIResult = ""}))
                }
                Button(action: {
                    self.myWeight = ""
                    self.myHeight = ""
                    self.myBMIResult = ""
                } )
                {
                Text("Clear the fields")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                }
            } // close HStack
            .offset(y: 35)
            Text("\(myBMIResult)")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity)
                .offset(y:50)
            Spacer()
            } // close VStack
            .padding(.horizontal, 15)
            .navigationBarTitle("BMI Calculation")
        } // close ZStack
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct MyBMICalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MyBMICalculatorView()
    }
}
