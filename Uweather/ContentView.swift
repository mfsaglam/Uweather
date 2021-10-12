//
//  ContentView.swift
//  Uweather
//
//  Created by Fatih Sağlam on 12.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            WeatherView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ForecastSlot: View {
    let forecastSnowColor: LinearGradient = LinearGradient(
        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.4745098054409027, green: 0.5490196347236633, blue: 0.686274528503418, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.30588236451148987, green: 0.35686275362968445, blue: 0.48235294222831726, alpha: 1)), location: 1)]),
        startPoint: UnitPoint(x: -7.450580152834618e-9, y: 0.9999999925494198),
        endPoint: UnitPoint(x: 0.9999999925494198, y: -7.450580152834618e-9))
    let forecastStormColor: LinearGradient = LinearGradient(
        gradient: Gradient(stops: [
                            .init(color: Color(#colorLiteral(red: 0.43529412150382996, green: 0.5647059082984924, blue: 0.7254902124404907, alpha: 1)), location: 0),
                            .init(color: Color(#colorLiteral(red: 0.2862745225429535, green: 0.37254902720451355, blue: 0.5568627715110779, alpha: 1)), location: 1)]),
        startPoint: UnitPoint(x: -7.45, y: 1),
        endPoint: UnitPoint(x: 1, y: -7.45))
    var body: some View {
        VStack {
            Text("Sun")
                .colorInvert()
                .font(.footnote)
           
            Circle()
                .fill(forecastSnowColor)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "cloud.fill")
                        .colorInvert()
                )
            Text("29°")
                .colorInvert()
                .opacity(0.5)
        }
    }
}

struct WeatherView: View {
    var body: some View {
        ZStack {
            SnowBG()
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Miami, FL")
                        .font(.system(size: 20, weight: .regular))
                        .opacity(0.4)
                        .colorInvert()
                    Text("30°")
                        .font(.system(size: 40, weight: .heavy, design: .monospaced))
                        .colorInvert()
                }
                Image(systemName: "cloud.bolt.rain.fill")
                    .font(.system(size: 130))
                    .colorInvert()
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Image(systemName: "calendar")
                            .font(.footnote)
                            .colorInvert()
                        Text("Forecast")
                            .font(.footnote)
                            .colorInvert()
                        Spacer()
                    }
                    .padding()
                }
            }
            .shadow(color: .black.opacity(0.5), radius: 30, x: 0, y: 0)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(0 ..< 20) { slot in
                        ForecastSlot()
                    }
                }
            }
            .frame(height: 100)
            .zIndex(1)
            .offset(y: 250)
        }
    }
}

struct StormBG: View {
    var body: some View {
        RadialGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.3607843220233917, green: 0.4470588266849518, blue: 0.686274528503418, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.05882352963089943, green: 0.09019608050584793, blue: 0.1764705926179886, alpha: 1)), location: 1)]),
                    center: UnitPoint(x: 5.0306980803327406e-17, y: 0),
                    startRadius: 100,
                    endRadius: 500
                  )
    }
}

struct SnowBG: View {
    var body: some View {
        RadialGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0.3960784375667572, green: 0.47843137383461, blue: 0.6196078658103943, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0.08627451211214066, green: 0.12156862765550613, blue: 0.18431372940540314, alpha: 1)), location: 1)]),
                    center: UnitPoint(x: 0.9999999403953552, y: 5.960463766996454e-8),
                    startRadius: 100,
                    endRadius: 600
                  )
    }
}
