import SwiftUI
struct ContentView: View {
  var body: some View {
    NavigationStack {
    ZStack
    {
      Color(red: 1.0, green: 0.98, blue: 0.94)
        .ignoresSafeArea()
      VStack {
        Text("ThriveCheck")
          .font(.custom("Baby Doll", size: 45))
          .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
          .offset(x: 0, y: 29)
          .padding(.top,70)
        Image("logo_transparent")
          .resizable()
          .frame(width: 230, height: 230)
          .padding(.leading, 0)
          .offset(x: 0, y: 30)
//        Text("Your wellness is our happiness")
//          .font(.custom("Baby Doll", size: 25))
//          .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
//          .padding(.top, 10)
        HStack(spacing: -2) {
          Text("Y").rotationEffect(.degrees(7))
            .offset(x: -10, y:52)
          Text("o").rotationEffect(.degrees(10))
            .offset(x: -7, y: 52)
          Text("u").rotationEffect(.degrees(1))
            .offset(x: -5, y: 52)
          Text("r").rotationEffect(.degrees(10))
            .offset(x: -3, y: 49)
          Text(" ").rotationEffect(.degrees(-3))
            .offset(x: 0, y: -25)
          Text("w").rotationEffect(.degrees(7))
            .offset(x: 1, y: 46)
          Text("e").rotationEffect(.degrees(14))
            .offset(x: 2, y: 42)
          Text("l").rotationEffect(.degrees(7))
            .offset(x: 2, y: 41)
          Text("l").rotationEffect(.degrees(9))
            .offset(x: 2, y: 41)
          Text("n").rotationEffect(.degrees(9))
            .offset(x: 2, y: 41)
          Text("e").rotationEffect(.degrees(19))
            .offset(x: 2, y: 41)
          Text("s").rotationEffect(.degrees(15))
            .offset(x: 2, y: 43)
          Text("s").rotationEffect(.degrees(15))
            .offset(x: 2, y: 43)
          Text(" ").rotationEffect(.degrees(15))
            .offset(x: 8, y: 55)
          Text("i").rotationEffect(.degrees(15))
            .offset(x: 6, y: 45)
          Text("s").rotationEffect(.degrees(15))
            .offset(x: 7, y: 45)
          Text(" ").rotationEffect(.degrees(15))
            .offset(x: 10, y: 45)
          Text("o").rotationEffect(.degrees(15))
            .offset(x: 10, y: 48)
          Text("u").rotationEffect(.degrees(9))
            .offset(x:10, y: 48)
          Text("r").rotationEffect(.degrees(9))
            .offset(x: 11, y: 52)
          Text(" ").rotationEffect(.degrees(15))
            .offset(x: 0, y: 45)
          Text("h").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 53)
          Text("a").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 49)
          Text("p").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 49)
          Text("p").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 46)
          Text("i").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 46)
          Text("n").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 43)
          Text("e").rotationEffect(.degrees(-2))
            .offset(x: 13, y: 40)
          Text("s").rotationEffect(.degrees(-2))
             .offset(x: 12, y: 37)
          Text("s").rotationEffect(.degrees(-2))
            .offset(x: 12, y: 37)
        }
        .font(.custom("Baby Doll", size: 28))
        .foregroundColor(Color(hue: 0.085, saturation: 0.592, brightness: 0.509))
          NavigationLink(destination: About()) {
            Image("About")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(15)
              .frame(width: 220,height:150)
              .offset(x: 0, y: 45)
          }
          NavigationLink(destination: InitialQuiz()) {
            Image("Initial")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(15)
              .frame(width: 220,height:150)
              .offset(x: 0, y: -16)
          }
        HStack {
          NavigationLink(destination: Nutrition()) {
            Image("Nutrition")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(15)
              .frame(width: 125,height:200)
              .offset(x: 0, y: -67)
          }
            NavigationLink(destination: Sleep()) {
              Image("Sleep")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(width: 125,height:200)
                .offset(x: 0, y: -67)
            }
            NavigationLink(destination: Social()) {
              Image("Social")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .frame(width: 125,height:200)
                .offset(x: 0, y: -67)
            }
          }
        }
      }
      .padding()
    }
  }
}
#Preview {
  ContentView()
}
