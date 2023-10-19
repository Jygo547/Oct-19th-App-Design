//
//  ContentView.swift
//  Oct 19th App Design
//
//  Created by ATLAS Checkout 6 Guest on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Stay Local"
    @State private var isLiked: Bool = UserDefaults.standard.bool(forKey: "isLiked")
    @State private var cardExpanded = false
    
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
                    
                    ForEach(["Stay Local", "Go Global"], id: \.self) {
                        tab in
                        Text(tab)
                            .padding()
                            .font(.caption)
                            .background(selectedTab == tab ? Color.red : Color.gray.opacity(0.2))
                            .onTapGesture {
                                withAnimation {
                                    self.selectedTab = tab
                            
                                }
                            }
                        if tab == "Stay Local" {
                            Spacer()
                                .frame(width: 35)
                        }
                        
                            
                    }
                    
                    .padding(.vertical)
                    
                    
                    Spacer()
                    
                    Image("ProfilePicture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("Rec")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                        Text("Experience")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                        Text("Class")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image("ProfilePicture")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .padding(.leading, -5)
                        Text("Jane Doe")
                            .bold()
                            .padding(.leading, 5)
                            
                        Spacer()
                            .frame(width: 100)
                        
                        Button(action: {
                            isLiked.toggle()
                            UserDefaults.standard.set(isLiked, forKey: "isLiked")
                        }) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                        }
                        Image(systemName: "bookmark")
                        Image(systemName: "message.badge")
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
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English...")
                        .font(.callout)
                        .lineLimit(cardExpanded ? nil : 3)
                        .padding()
                        .padding(.top, -15)
                }
                .background(Color.blue)
                .onTapGesture {
                    withAnimation {
                        cardExpanded.toggle()
                    }
                }
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            
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

        }
    }
}

#Preview {
    return ContentView()
}
