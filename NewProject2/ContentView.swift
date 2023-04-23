//
//  ContentView.swift
//  NewProject2
//
//  Created by Indira on 13/4/23.
//

import SwiftUI

struct ContentView: View {
    var pics: [Image] = [
        Image("pic1"),
        Image("pic2"),
        Image("pic3"),
        Image("pic4"),
        Image(systemName: "heart"),
    ]
    var photos: [Image] = [
        Image("Rectangle 19"),
        Image("Rectangle 20"),
        Image("Rectangle 20")
        
    ]
    var titles: [String] = ["Tony Roma's", "Momo", "Foodie"]
    
    var titleForpics: [String] = ["Delivery", "Service", "Time", "Selection", "References"]
    
    @State var select: Int = 0
    
    @State var searchText: String = ""
    var tabbarItems: [String]
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            Color("gray1")
                .ignoresSafeArea(.all)
            
            VStack(spacing: 10) {
                NavigationBar()
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<pics.count) { item in
                            HorizontalScroll(
                                title: titleForpics[item],
                                image: pics[item],
                                isSelected: item == select)
                            .onTapGesture {
                                select = item
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                CustomText(title: "56 stores open",
                           color: .indigo,
                           weight: .semibold)
                .frame(width: 300, alignment: .leading)
                
                
                
                SearchView(text: $searchText)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0..<photos.count) { item in
                            ProductView(image: photos[item],
                                        title: titles[item])
                        }
                    }
                }
                VStack(spacing: -10){
                    HStack {
                        CustomText(title: "Paul",
                                   color: .indigo,
                                   weight: .heavy)
                        CustomText(title: "Ribs & Steaks\nDelivery: FREE • Minimum: $20",
                                   color: .black,
                                   weight: .light)
                        CustomImage(image: Image("Rectangle 22"))
                    }
                    HStack {
                        CustomImage(image: Image(systemName: "star.fill"), width: 10, height: 10)
                        CustomText(title: "4,5 *", color: .black, weight: .bold)
                        CustomImage(image: Image(systemName: "clock"), width: 10, height: 10)
                        CustomText(title: "35 min", weight: .bold)
                                }
                }
        ScrollViewReader { scrollView in
        ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(tabbarItems.indices, id: \.self) {index in
                 
                Text(tabbarItems[index])
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .foregroundColor(selectedIndex == index ? .white : .black)
                        .background(Capsule().foregroundColor(selectedIndex == index ? .indigo : .clear))
                        .onTapGesture {
                                withAnimation(.easeInOut) {
                            selectedIndex = index
                            }
                    }
                }
            }
    }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(25)
                 
        }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(tabbarItems: [ "Random", "Travel", "Wallpaper", "Food", "Interior Design" ]).previewDisplayName("TabBarView")
        }
    }
}

struct CustomButton: View {
    var image: Image
    var body: some View {
        Button{
            
        } label: {
            image
        }
    }
}

struct CustomText: View {
    var title: String
    var color: Color?
    var weight: Font.Weight?
    var body: some View {
        Text(title)
            .foregroundColor(color)
            .fontWeight(weight)
    }
}

struct CustomImage: View {
    var image: Image
    var width: CGFloat?
    var height: CGFloat?
    var body: some View {
        image
//            .resizable()
            .frame(width: width, height: height)
    }
}

struct NavigationBar: View {
    var body: some View {
        HStack {
            CustomButton(image: Image("Menu"))
            
            Spacer()
            
            HStack {
                VStack {
                    CustomText(
                        title: "Delivering to",
                        color: .black,
                        weight: .light)
                    
                    CustomText(title: "Manas Ave",
                               color: .indigo,
                               weight: .heavy)
                }
                
                CustomImage(
                    image: Image("Vector"),
                    width: 10,
                    height: 10)
                
            }
            
            Spacer()
            
            CustomButton(image: Image("Basket"))
            
        }
    }
}

struct HorizontalScroll: View {
    var title: String
    var image: Image
    var isSelected: Bool
    var body: some View {
        HStack {
            CustomImage(image: image)
                .foregroundColor(isSelected ? .white : .black)
            if isSelected {
                CustomText(title: title, color: .white)

            }
        }
        .padding(.all, 15)
        .background(isSelected ? .indigo : .clear)
        //.frame(width: 90, height: 50)
        .cornerRadius(20)
    }
}

struct SearchView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            HStack {
                CustomImage(image: Image("Search"))
                TextField("Find restaurant by name ",
                          text: $text)
            }
            .padding(.all, 20)
            .background(Color(.white))
            .cornerRadius(16)
            .shadow(color: Color(.black).opacity(0.2), radius: 12, x: 0, y: 2)
            
            CustomButton(image: Image("Group 7"))
                .padding()
        }
        .padding(.horizontal)
    }
}

struct ProductView: View {
    var image: Image
    var title: String
    var body: some View {
        VStack(alignment: .center) {
            CustomImage(image: image)
            CustomText(title: title,
                       color: .indigo,
                       weight: .heavy)
            CustomText(title: "Ribs & Steaks\nDelivery: FREE • Minimum: $20",
                       color: .black,
                       weight: .bold)
            .font(.custom("", size: 10))
            HStack {
                CustomImage(image: Image(systemName: "star.fill"), width: 10, height: 10)
                CustomText(title: "4,5 *", color: .black, weight: .bold)
                CustomImage(image: Image(systemName: "clock"), width: 10, height: 10)
                CustomText(title: "35 min", weight: .bold)
                        }
        }
        .padding(.all)
        .frame(width: 185)
        .cornerRadius(30)
        .background(.clear)
    }
}

