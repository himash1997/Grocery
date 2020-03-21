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
        
        NavigationView{
         
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
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
    @State var show = false
    
    var body : some View{
        
        ZStack{
            
            NavigationLink(destination: Detail(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            VStack(spacing: 10){
                
                Image(data.image)
                Text(data.name)
                    .fontWeight(.semibold)
                Text(data.price)
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                
            }.onTapGesture {
                
                self.show.toggle()
            }
            
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

struct Detail : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    var body : some View{
        
        VStack(spacing: 0){
            Image("header")
            .resizable()
            .frame(height: UIScreen.main.bounds.height / 2.5)
            .edgesIgnoringSafeArea(.top)
                .overlay(
                    VStack{
                        HStack(spacing: 12){
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                Image("back")
                                    .renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Image("download")
                                    .renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                Image("Wishlist")
                                    .renderingMode(.original)
                            }
                        }
                        
                        Spacer()
                    }.padding()
            )
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading , spacing: 15){
                    Text("Sedless Lemon")
                        .font(.title)
                    Text("30.00 / kg")
                        .foregroundColor(.gray)
                    Divider()
                        .padding(.vertical, 15)
                    
                    HStack{
                        Image("rp1").renderingMode(.original)
                        Text("Diana Organic Farm")
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image("chat")
                                .renderingMode(.original)
                        }
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at dolor fringilla, pharetra urna non, porttitor lectus. Etiam erat turpis, finibus vel metus ac, fringilla lacinia sapien. Proin in enim mauris. Aenean dignissim laoreet risus tincidunt bibendum. Suspendisse orci elit, ornare et nisi eget, viverra pellentesque risus")
                        .foregroundColor(.gray)
                    
                    HStack{
                        Text("Reviews (50)")
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("More")
                        }.foregroundColor(Color("Color"))
                    }.padding(.vertical , 10)
                    
                    }
                }.padding()
                .overlay(
                        VStack{
                            HStack{
                                Spacer()
                                HStack{
                                    Text("4")
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }.padding()
                                    .background(Color.green)
                                .cornerRadius(12)
                            }
                            .padding(.top, -20)
                            .padding(.trailing)
                            
                            Spacer()
                        }
                    )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

        }
        
    }
}

struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
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
