//
//  SwiftUIView.swift
//  Taskit
//
//  Created by Caleb Barranco on 12/15/22.
//

import SwiftUI
import Firebase
struct SwiftUIView: View {
    @State var namesSend = ""
    @State var namesArr : [String] = []
        var body:some View {
            VStack{
                HStack{
                    TextField("\t"+"Send something to the data base, text",text: $namesSend)
                    Button(action:{Send()}){
                        Text("Send"+"\t")
                        
                    }
                }.onAppear(perform:{
                    Retrieve()
                    
                })
                
            
            
                List(0..<namesArr.count,id: \.self) { i in Text(namesArr[i])
                   
                }

                
                
                
                
            }    }
        
        
        
        func Send(){
            
            let datab = Firestore.firestore()
            datab.collection("Names").document().setData(["names":namesSend])
            
        }
        func Retrieve(){
            
            let datab = Firestore.firestore()
            datab.collection("Names").addSnapshotListener{(snap,err) in
                 
                if err != nil{
                    
                    print("Opps")
                    return
                }
                for i in snap!.documentChanges{
                    _ = i.document.documentID
                    _ = i.document.get("names")
                    DispatchQueue.main.async {
                        namesArr.append(namesSend)
                    }
                }
                
                
            }
            
        }
    }
    


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
