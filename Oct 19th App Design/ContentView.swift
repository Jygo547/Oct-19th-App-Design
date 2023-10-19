//
//  ContentView.swift
//  Oct 19th App Design
//
//  Created by ATLAS Checkout 6 Guest on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Stay Local"
    @State private var isLiked1: Bool = UserDefaults.standard.bool(forKey: "isLiked1")
    @State private var isLiked2: Bool = UserDefaults.standard.bool(forKey: "isLiked2")
    @State private var isLiked3: Bool = UserDefaults.standard.bool(forKey: "isLiked3")
    @State private var cardExpanded1 = false
    @State private var cardExpanded2 = false
    @State private var cardExpanded3 = false
    
    func toggleLike1() {
        
        isLiked1.toggle()
        UserDefaults.standard.set(isLiked1, forKey: "isLiked1")

    }
    
    func toggleLike2() {
        
        isLiked2.toggle()
        UserDefaults.standard.set(isLiked2, forKey: "isLiked2")
        
    }
    
    func toggleLike3() {
        
        isLiked3.toggle()
        UserDefaults.standard.set(isLiked3, forKey: "isLiked3")
        
    }
    
    private var tabWidth: CGFloat = 100

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                            .frame(width: 10)
                        
                        ForEach(["Stay Local", "Go Global"], id: \.self) {
                            tab in
                            Text(tab)
                                .padding()
                                .font(.caption)
                                .bold()
                                .cornerRadius(5)
                                
                                .onTapGesture {
                                    withAnimation {
                                        self.selectedTab = tab
                                    }
                                }
                        }
                        .padding(.vertical)
                        
                        Spacer()
                            .frame(width: 10)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(red: 0.79, green: 0.64, blue: 0.58))
                            .frame(height: 60)
                            .overlay(
                                Capsule()
                                    .fill(Color(red: 0.87, green: 0.78, blue: 0.75))
                                    .frame(width: selectedTab == "Stay Local" ? 90 : 90, height: 40)
                                    .offset(x: selectedTab == "Stay Local" ? -49 : 50)
                            )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    Spacer()
                    
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .shadow(radius: 5)
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    //Post 1
                    VStack(alignment: .leading) {
                                HStack {
                                    Text("Rec")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.98, green: 0.63, blue: 0.61))
                                        .cornerRadius(15)
                                    Text("Experience")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                    Text("Class")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                }
                                .lineLimit(1)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("ProfilePicture")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .padding(.leading, -5)
                                    Text("Jaden Smith")
                                        .bold()
                                        
                                    Spacer()
                                    
                                    Button(action: toggleLike1) {
                                        Image(systemName: isLiked1 ? "heart.fill" : "heart")
                                            .resizable()
                                            .frame(width: 30, height: 25)
                                            .foregroundColor(isLiked1 ? .red : .primary)
                                            
                                    }
                                    .padding(.trailing, 5)
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .frame(width: 17, height: 25)
                                        .padding(.trailing, 5)
                                    
                                    Image(systemName: "message.badge")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("2")
                                        .font(.callout)
                                        .padding(.leading, -5)
                                        .padding(.bottom, -25)
                                }
                                .padding()
                                
                                Text("12 October 2023")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                Text("La Cuisine Paris: Dessert cooking class")
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English where you can immerse yourself in the art of French pastry. Whether you're a beginner or an experienced chef, their expert instructors will guide you through every step, ensuring you leave with both newfound skills and delicious creations. Dive into the rich culinary traditions of Paris and transform your baking game!")
                                    .font(.caption)
                                    .lineLimit(cardExpanded1 ? nil : 2)
                                    .padding()
                                    .padding(.top, -15)
                            }
                            .background(Color(red: 0.98, green: 0.97, blue: 0.96).opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .onTapGesture {
                                withAnimation {
                                    cardExpanded1.toggle()
                                }
                            }
                            
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .frame(height: 550)
                        .background(
                            Image("Post1")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        )
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    
                    //Post 2
                    VStack(alignment: .leading) {
                                HStack {
                                    Text("Rec")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.98, green: 0.63, blue: 0.61))
                                        .cornerRadius(15)
                                    Text("Restaurant")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                    Text("Italian")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                }
                                .lineLimit(1)
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("ProfilePicture")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .padding(.leading, -5)
                                    Text("Jaden Smith")
                                        .bold()
                                        
                                    Spacer()
                                    
                                    Button(action: toggleLike2) {
                                        Image(systemName: isLiked2 ? "heart.fill" : "heart")
                                            .resizable()
                                            .frame(width: 30, height: 25)
                                            .foregroundColor(isLiked2 ? .red : .primary)
                                            
                                    }
                                    .padding(.trailing, 5)
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .frame(width: 17, height: 25)
                                        .padding(.trailing, 5)
                                    
                                    Image(systemName: "message.badge")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("2")
                                        .font(.callout)
                                        .padding(.leading, -5)
                                        .padding(.bottom, -25)
                                }
                                .padding()
                                
                                Text("12 October 2023")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                Text("Cute New Italian Trattoria In The 6eme")
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Text("They had great seafood dishes including pasta alle vongole! The seafood at this restaurant was absolutely divine. Each bite was a burst of ocean-fresh flavors, perfectly compemented bythe delicate balance of garlic, white wine, and fresh clams.")
                                    .font(.footnote)
                                    .lineLimit(cardExpanded2 ? nil : 2)
                                    .padding()
                                    .padding(.top, -15)
                            }
                            .background(Color(red: 0.98, green: 0.97, blue: 0.96).opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .onTapGesture {
                                withAnimation {
                                    cardExpanded2.toggle()
                                }
                            }
                            
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .frame(height: 550)
                        .background(
                            Image("Post2")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        )
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    
                    //Post 3
                    VStack(alignment: .leading) {
                                HStack {
                                    Text("Iteneary")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .foregroundColor(.white)
                                        .bold()
                                        .background(Color(red: 0.36, green: 0.49, blue: 0.45))
                                        .cornerRadius(15)
                                    Text("Restaurant")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                    Text("Italian")
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                        .bold()
                                        .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                                        .cornerRadius(15)
                                }
                                .lineLimit(1)
                                
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("ProfilePicture")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                        .padding(.leading, -5)
                                    Text("Jaden Smith")
                                        .bold()
                                        
                                    Spacer()
                                    
                                    Button(action: toggleLike3) {
                                        Image(systemName: isLiked3 ? "heart.fill" : "heart")
                                            .resizable()
                                            .frame(width: 30, height: 25)
                                            .foregroundColor(isLiked3 ? .red : .primary)
                                            
                                    }
                                    .padding(.trailing, 5)
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .frame(width: 17, height: 25)
                                        .padding(.trailing, 5)
                                    
                                    Image(systemName: "message.badge")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("2")
                                        .font(.callout)
                                        .padding(.leading, -5)
                                        .padding(.bottom, -25)
                                }
                                .padding()
                                
                                Text("12 October 2023")
                                    .font(.footnote)
                                    .padding(.horizontal)
                                Text("A Sweet Lover’s Weekend in Paris")
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                                Text("Indulge in the romantic allure of Paris with our delectable treats! This place your passport tot a world of mouthwatering desserts that will transport you to the heart of the City of Love. Let your taste buds savor the sweetness of this enchanting escape.")
                                    .font(.caption)
                                    .lineLimit(cardExpanded3 ? nil : 2)
                                    .padding()
                                    .padding(.top, -15)
                            }
                            .background(Color(red: 0.98, green: 0.97, blue: 0.96).opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .onTapGesture {
                                withAnimation {
                                    cardExpanded3.toggle()
                                }
                            }
                            
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 10)
                        .frame(height: 550)
                        .background(
                            Image("Post3")
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                        )
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                }
                .padding(.top, 5)
                
            }
            .background(Color(red: 0.98, green: 0.97, blue: 0.96))
            
            
            Spacer()
            
            HStack {
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "plus.circle.fill")
                Spacer()
                Image(systemName: "ticket")
            }
            .font(.title2)
            .padding(.horizontal, 80)
            .padding(.top, 20)

        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
