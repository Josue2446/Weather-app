import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                            gradient: Gradient(colors: [.blue, Color("Lightblue")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Portland, OR")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 50)
               VStack (spacing: 9){
                   Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        
                        Text("76°F")
                       .font(.system(size: 70, weight: .medium))
                       .foregroundColor(.white)
               }.padding(.bottom, 40)
                
                
                
                HStack(spacing: 18){
                    WeatherDayView(dayOfWeek: "Mon", imageName: "cloud.sun.rain.fill", temp: 65)
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.rain.fill", temp: 68)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.haze.fill", temp: 75)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.haze.fill", temp: 72)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "sun.dust.fill", temp: 70)
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
