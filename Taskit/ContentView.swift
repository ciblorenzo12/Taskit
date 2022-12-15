//
//  ContentView.swift
//  Taskit
//
//  Created by Caleb Barranco on 12/12/22.
//
import Firebase
import SwiftUI
import CoreData

struct ContentView: View {
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
                let doctid = i.document.documentID
                let names = i.document.get("names")
                DispatchQueue.main.async {
                    namesArr.append(namesSend)
                }
            }
            
            
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
