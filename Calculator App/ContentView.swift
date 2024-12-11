//
//  ContentView.swift
//  Calculator App
//
//  Created by Red Whale inc. on 03/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number1: String = ""
    @State private var number2: String = ""
    @State private var result: String = ""
    @State private var selectedOperation: String = "+"
    
    var operations:[String] = ["+", "-", "x", "/"]
    
    var body: some View {
        VStack(spacing: 25) {
            Image("cal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(10)
            
            HStack{
                VStack{
                    HStack{
                        Text("Enter number #")
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                        
                        TextField("Enter number", text: $number1)
                            .keyboardType(.numberPad)
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                            .padding(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(.red), lineWidth: 1)
                            }
                    }
                    
                    HStack{
                        Text("Enter number #")
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                        
                        TextField("Enter number", text: $number2)
                            .keyboardType(.numberPad)
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                            .padding(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(.red), lineWidth: 1)
                            }
                    }
                }
                
                Text("\(selectedOperation)")
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .padding(5)
            }
            HStack{
                Text("Answer #")
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                
                Text("\(result)")
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .padding(10)
                    .frame(maxWidth: 300, maxHeight: 50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(.black), lineWidth: 3)
                    }
            }
            
            Picker("Select Operation", selection: $selectedOperation) {
                ForEach(operations, id: \.self) { operation in
                    Text(operation)
                        .font(.system(size: 22, weight: .semibold, design: .monospaced))
                        .foregroundColor(.black)
                        .padding()
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(5)
            
            .shadow(color:.gray, radius: 2, x: 2, y: 2)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.white), lineWidth: 2)
            }
            
            HStack{
                Button(action: {clearField()}){
                    Text("C")
                        .font(.system(size: 25, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color(.red))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(.white), lineWidth: 2)
                        }
                        .shadow(color:.gray, radius: 2, x: 2, y: 2)
                        
                }
                
                Button(action: {calculate()}){
                    Text("=")
                        .font(.system(size: 30, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color(.green))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(.white), lineWidth: 2)
                        }
                        .shadow(color:.gray, radius: 2, x: 2, y: 2)
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    func calculate() {
        guard let value1 = Double(number1),
              let value2 = Double(number2)
        else {
            result = "Invalid Input"
            return
        }
        
        switch selectedOperation {
        case "+":
            result = "\(value1 + value2)"
        case "-":
            result = "\(value1 - value2)"
        case "x":
            result = "\(value1 * value2)"
        case "/":
            if value2 != 0 {
                result = "\(value1 / value2)"
            } else {
                result = "Cannot divide by zero"
            }
        default:
            result = "Invalid Operation"
        }
    }
    
    func clearField(){
        number1 = ""
        number2 = ""
        result = ""
    }
}

#Preview {
    ContentView()
}
