import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(
                topColor: isNight ? .black : .blue,
                bottomColor: isNight ? .gray : .lightblue
            )
            
            VStack{
                CityName(city: "Portland, OR")
                                
                MainWeather(weatherName: isNight ? "moon.stars.fill" : "sun.haze.fill",
                            temp: isNight ? 52 : 76)
                
                HStack(spacing: 18){
                    WeatherDayView(dayOfWeek: "Mon",
                                    imageName: "cloud.sun.rain.fill",
                                    temp: 65)
                    WeatherDayView(dayOfWeek: "Tue",
                                    imageName: "cloud.sun.rain.fill",
                                    temp: 68)
                    WeatherDayView(dayOfWeek: "Wed",
                                    imageName: "sun.haze.fill",
                                    temp: 75)
                    WeatherDayView(dayOfWeek: "Thu",
                                    imageName: "sun.haze.fill",
                                    temp: 72)
                    WeatherDayView(dayOfWeek: "Fri",
                                    imageName: "sun.dust.fill",
                                    temp: 70)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        buttonText: "Click me",
                        backgroundColor: isNight ? .black : .white,
                        textColor: isNight ? .white : .blue
                    )
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
    var dayOfWeek: String
    var imageName: String
    var temp: Int

    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 50)
    }
}

struct MainWeather: View {
    var weatherName: String
    var temp: Int
    var body: some View {
        VStack (spacing: 9){
                   Image(systemName: weatherName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        
                        Text("\(temp)°")
                       .font(.system(size: 70, weight: .medium))
                       .foregroundColor(.white)
               }.padding(.bottom, 40)
    }
}

