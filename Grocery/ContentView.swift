//
//  ContentView.swift
//  Grocery
//
//  Created by Himash Nadeeshan on 3/21/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = "Home"
    
    var body: some View {
        VStack{
            
            if self.selected == "Home"{
                Home()
            }else if self.selected == "Wishlist"{
                GeometryReader{_ in
                    Text("Wishlist")
                }
            }else{
               GeometryReader{_ in
                    Text("Cart")
                }
            }
            CustomTableView(selected: $selected)
        }
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
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(Capsule().fill(self.selected == i ? Color("Color") : Color.clear).frame(width: 55, height: 5))
                    
                    Button(action: {
                        self.selected = i
                    }) {
                        
                        VStack{
                            Image(i)
                                .renderingMode(.original)
                            Text(i)
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                }
            }
        }.padding(.horizontal)
    }
    
}

struct Home : View {
    
    @State var txt = ""
    
    var body : some View{
        
        VStack(spacing: 15){
            HStack(spacing: 12){
                Image("my")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .clipped()
                    .frame(width:25 , height:30)
                    
                
                Text("Hi, Himash")
                    .font(.body)
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image("filter")
                        .renderingMode(.original)
                        .frame(width:25 , height:25)
                }
                
            }
            
            ScrollView(.vertical, showsIndicators: false){
                

                HStack(spacing: 15){
                    
                    HStack{
                            Image(systemName: "magnifyingglass")
                                .font(.body)
                            TextField("Search", text: $txt)
                        }
                    .padding(10)
                    .background(Color("Color1"))
                    .cornerRadius(20)
                    
                    Button(action: {
                        
                    }) {
                        Image("mic")
                            .renderingMode(.original)
                    }
                    
                }
                
                Image("top")
                .resizable()
                .clipped()
                .overlay(
                    VStack{
                        Spacer()
                        HStack{
                            Text("GET 20% OFF")
                                .font(.title)
                                .foregroundColor(Color.white)
                            Spacer()
                        }.padding()
                    }
                )
                
                HStack{
                    Text("Categories")
                        .font(.title)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("More")
                    }.foregroundColor(Color("Color"))
                }.padding(.vertical, 15)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 15){
                        ForEach(categories, id: \.self){i in
                            VStack{
                                Image(i)
                                    .renderingMode(.original)
                                Text(i)
                            }
                        }
                    }
                }
                
                HomeBottomView()
            }
            
            
            Spacer()
            
        }.padding(.horizontal)
        
    }
}

struct HomeBottomView : View {
    var body : some View{
        
        VStack(spacing: 15){
            HStack{
                Text("Fresh New Items")
                    .font(.title)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(freshitems){i in
                        FreshCellView(data: i)
                    }
                }
            }
            
            
            HStack{
                Text("Recipe")
                    .font(.title)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(recipeitems){i in
                        RecipeCellView(data: i)
                    }
                }
            }
            
        }
        
    }
}

struct FreshCellView : View {
    
    var data : fresh
    
    var body : some View{
        VStack(spacing: 10){
            Image(data.image)
            Text(data.name)
                .fontWeight(.semibold)
            Text(data.price)
                .foregroundColor(.green)
                .fontWeight(.semibold)
        }
    }
}

struct RecipeCellView : View {
    
    var data : recipe
    
    var body : some View{
        VStack(spacing: 10){
            Image(data.image)
            HStack(spacing: 10){
                Image(data.authorpic)
                VStack(alignment: .leading, spacing: 6){
                    Text(data.name)
                        .fontWeight(.semibold)
                    Text(data.author)
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
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
