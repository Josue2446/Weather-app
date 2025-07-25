import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    let weatherData = [
        WeatherDay(day: "Mon", imageName: "cloud.sun.rain.fill", temp: 65),
        WeatherDay(day: "Tue", imageName: "cloud.sun.rain.fill", temp: 68),
        WeatherDay(day: "Wed", imageName: "sun.haze.fill", temp: 75),
        WeatherDay(day: "Thu", imageName: "sun.haze.fill", temp: 72),
        WeatherDay(day: "Fri", imageName: "sun.dust.fill", temp: 70)
    ]
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityName(city: "Portland, OR")
                                
                MainWeather(isNight : $isNight)
                
                HStack(spacing: 18) {
                    ForEach(weatherData) { dayData in
                        WeatherDayView(dayOfWeek: dayData.day,
                                       imageName: dayData.imageName,
                                       temp: dayData.temp)
                    }
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
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black: .blue,
                                        isNight ? .gray : Color("lightblue")]),
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
    @Binding var isNight : Bool
    var body: some View {
        VStack (spacing: 9){
                   Image(systemName: isNight ? "moon.stars.fill" : "sun.haze.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        
                        Text("\(isNight ? 52 : 76)°")
                       .font(.system(size: 70, weight: .medium))
                       .foregroundColor(.white)
               }.padding(.bottom, 40)
    }
}

struct WeatherDay: Identifiable {
    let id = UUID()
    let day: String
    let imageName: String
    let temp: Int
}
