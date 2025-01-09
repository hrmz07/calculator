//
//  ContentView.swift
//  calculatır
//
//  Created by Hürmüs Sürücüoğlu on 6.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var islem: String = "0"
    @State private var sayi1  = [Double]()
    @State private var sonuc: Double = 0
    @State private var info:Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("bg"))
                        .frame(height: 80)
                        .cornerRadius(20)
                        
                    TextField("0", text: $islem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                        .padding(10)
                        .font(.largeTitle)
                }
                HStack{
                    Button {
                        if !islem.isEmpty {
                            let lastIndex = islem.index(before: islem.endIndex) // Son karakterin indeksi
                            islem.remove(at: lastIndex) // Son karakteri kaldır
                            
                        }
                        if islem == "0" {
                            sayi1 = []
                            sonuc = 0
                        }
                        if islem.isEmpty {
                            sayi1 = []
                            sonuc = 0
                        }
                        
                    } label: {
                        if (islem == "0") || (islem == ""){
                            TextViews(txt: "ac")
                        }
                        else {
                            TextViews(txt: "back")
                        }
                        
                    }
                    Button {
                    
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                    Button {
                        
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                    
                    Button {
                        
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                }
                HStack{
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "7" : islem + "7"

                    } label: {
                        TextViews(txt: "7")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "8" : islem + "8"

                    } label: {
                        TextViews(txt: "8")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "9" : islem + "9"

                    } label: {
                        TextViews(txt: "9")
                    }
                    Button {
                        
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                }
                HStack{
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "4" : islem + "4"

                    } label: {
                        TextViews(txt: "4")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "5" : islem + "5"

                    } label: {
                        TextViews(txt: "5")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "6" : islem + "6"

                    } label: {
                        TextViews(txt: "6")
                    }
                    Button {
                        
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                }
                HStack{
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "1" : islem + "1"

                    } label: {
                        TextViews(txt: "1")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "2" : islem + "2"
                    

                    } label: {
                        TextViews(txt: "2")
                    }
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "3" : islem + "3"

                    } label: {
                        TextViews(txt: "3")
                    }
                    Button {
                        
                        
                        if !(islem == "+") {
                            sayi1.append(Double(islem)!)
                            islem = "+"
                        }
                        
                    } label: {
                        TextViews(txt: "plus")
                    }
                }
                HStack{
                    Button {
                        
                    } label: {
                        TextViews(txt: "empty")
                    }.disabled(true)
                    Button {
                        islem = (islem == "0") || (islem == "+") ? "" : islem + "0"

                    } label: {
                        TextViews(txt: "0")
                    }
                    Button {
                        if !islem.contains(".") {
                            islem = (islem == "0") || (islem == "") ? "0." : islem + "."
                        }
                        

                    } label: {
                        TextViews(txt: "comma")
                    }
                    Button {
                        if !(islem == "+") {
                            sayi1.append(Double(islem)!)
                            for sayi in sayi1{
                                sonuc += sayi
                                
                            }
                            islem = String(sonuc)
                            print(sayi1)
                            sayi1 = []
                            sonuc = 0
                        }
                    } label: {
                        TextViews(txt: "equals")
                    }
                }
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        info = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.black)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $info) {
                InfoView()
            }
        }
    }
}

#Preview {
    ContentView()
}

//struct TextViews: View {
//    @State var txt: String = ""
//    var body: some View {
//        Text(txt)
//            .padding()
//            .font(.title2)
//            .foregroundStyle(.white)
//            .frame(width: 80)
//            .background(.black)
//            .cornerRadius(20)
//            
//    }
//}
struct TextViews: View {
    @State var txt: String = ""
    var body: some View {
        Image("no"+txt)
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            

    }
}
