//
//  ContentView.swift
//  test
//
//  Created by Ayaz on 05/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(
                
                isNight: isNight
            )
            VStack(){
                CityTextView(
                cityName: "Karachi, Pakistan")
                MainWetherStatusView(
                    temp: "50°", imageName: 
                        isNight ? "moon.stars.fill" :
                        "cloud.sun.fill")
                HStack(
                    spacing:30){
                        WeatherDayView(
                        dayName: "MON", imgName: "sun.max.fill", temp:"50°"
                        )
                        WeatherDayView(
                            dayName: "TUE", imgName: "wind", temp:"50°")
                        WeatherDayView(
                            dayName: "WED", imgName: "cloud.hail.fill", temp:"50°")
                        WeatherDayView(
                            dayName: "THU", imgName: "sun.snow.fill", temp:"50°")
                        WeatherDayView(
                            dayName: "FRI", imgName: "cloud.sun.bolt.fill", temp:"50°")
                }
                Spacer()
                Button{
                    isNight.toggle()
                }
            label:{
                WeatherButton(
                    text :"Change Mode",
                    textColor: isNight ? .white : .black,
                    btnColor: !isNight ? .white : .black)
                
                
            }
                Spacer()
                
            }
        }

    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayName: String;
    var imgName: String;
    var temp: String;
    
    var body: some View {
        VStack(spacing:10){
            Text(dayName)
                .font(
                    .system(size:20,weight: .medium
                           )).foregroundColor(.white)
            Image(systemName:imgName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(
                    width: 30,
                    height:30)
            Text(temp)
                .font(
                    .system(size:20,weight: .medium
                           )).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
      var isNight:Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing  ).ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.gray.gradient : Color.blue.gradient).ignoresSafeArea()
    }
}

struct CityTextView: View {
        
    var cityName:String;
    
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white).padding()
    }
}

struct MainWetherStatusView: View {
    var temp:String;
    var imageName :String;
    var body: some View {
        VStack(spacing:8){
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(
                    width: 180,
                    height: 180)
            
            Text(temp)
                .font(
                    .system(size:70,weight: .medium
                           )).foregroundColor(.white)
            
        }.padding(.bottom,40)
    }
}

struct WeatherButton: View {
    var text: String;
    var textColor:Color;
    var btnColor:Color;
    var body: some View {
         
            Text(text)
                .frame(width: 280,height: 50)
                .background(btnColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size:20,weight:.bold,design:.default))
                .cornerRadius(10)
        
    }
}
