//
//  ContentView.swift
//  Grocery
//
//  Created by Himash Nadeeshan on 3/21/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTableView : View {
    
    @Binding var selected : String
    
    var body: some View{
        HStack{
            
            ForEach(tabs, id: \.self){i in
                VStack(spacing: 10){
                    Capsule()
                        .fill(self.selected == i ? Color("Color") : Color.clear)
                        .frame(height: 5)
                }
            }
            
        }
    }
    
}


// sample datas...

var tabs = ["Home","Wishlist","Cart"]

var categories = ["Fruits","Vegetables","Beverages","Fish","Breads"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
fresh(id: 0, name: "Frozen Fish", price: "20.00 / pcs",image: "f1"),
fresh(id: 1, name: "Seedless Lemon", price: "30.00 / kg",image: "f2"),
fresh(id: 2, name: "Coffee Bread", price: "15.00 / pack",image: "f3")
]

var recipeitems = [
recipe(id: 0, name: "Basil Pasta", author: "Karlien Nijhuis",image: "r1",authorpic: "rp1"),
recipe(id: 1, name: "Banana Rice", author: "Harmen Porter",image: "r2",authorpic: "rp2"),
recipe(id: 2, name: "Ramen", author: "Marama Peter",image: "r3",authorpic: "rp3")
]
