import SwiftUI
struct About: View {
  @State private var animate = false // <-- animation trigger
  var body: some View {
    NavigationStack {
      ZStack {
          Color(red: 1.0, green: 0.98, blue: 0.94)
          .ignoresSafeArea()
        VStack() {
          Text("About ThriveCheck")
            .padding()
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5, x: 2, y: 2)
            .font(.custom("Baby Doll", size: 40))
            .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color(hue: 1.0, saturation: 1.0, brightness: 0.001))
            .multilineTextAlignment(.leading)
            .opacity(animate ? 1 : 0)
            .offset(y: animate ? 0 : -30)
            .animation(.easeOut(duration: 1), value: animate)
          Image("logo_transparent")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .opacity(animate ? 1 : 0)
            .scaleEffect(animate ? 1 : 0.7)
            .animation(.spring(response: 0.8, dampingFraction: 0.6), value: animate)
          Text("Our Kode With Klossy capstone team felt implored to solve some of wellness’ most pressing issues, including poor nutrition, sleep habits, and social tendencies among all age groups.")
            .padding()
            .font(.custom("Baby Doll", size: 20))
            .opacity(animate ? 1 : 0)
            .offset(x: animate ? 0 : -50)
            .animation(.easeOut(duration: 1).delay(0.3), value: animate)
          Text("Meet the team")
            .font(.custom("Baby Doll", size: 40))
            .foregroundColor(Color(red: 0.286, green: 0.431, blue: 0.425))
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .opacity(animate ? 1 : 0)
            .offset(x: animate ? 0 : 50)
            .animation(.easeOut(duration: 1).delay(0.5), value: animate)
          ScrollView {
            VStack(alignment: .leading, spacing: 5) {
              Group {
                Text("Halle")
                  .font(.custom("Baby Doll", size: 30))
                  .fontWeight(.semibold)
                Text("Hi, I'm Halle, a rising freshman in college. This is my second camp at Kode with Klossy, and I am super excited to show you the app that my group and I have built. This is my first time using Swift; I previously used Python. and HTML for other projects. I enjoy walking, spending time with my dog, and playing mini golf.")
                  .font(.custom("Baby Doll", size: 20))
                  .fontWeight(.semibold)
                Text(" ")
                Text("Olivia")
                  .font(.custom("Baby Doll", size: 30))
                  .fontWeight(.semibold)
                Text("Hi, I'm Olivia and I'm going to be a sophomore in high school. I like drawing, playing tennis, and listening to music.")
                  .font(.custom("Baby Doll", size: 20))
                Text(" ")
                Text("Eva")
                  .font(.custom("Baby Doll", size: 30))
                  .fontWeight(.semibold)
                Text("Hey! My name is Eva, i am fourteen years old and i love animals, drawing and way more.")
                  .font(.custom("Baby Doll", size: 20))
                Text(" ")
                Text("Renee")
                  .font(.custom("Baby Doll", size: 30))
                  .fontWeight(.semibold)
                Text("Hi, i'm Renee! I am fourteen years old, and I like to do figure skating as a sport, play the piano, sing, code and this is my first time time doing Kode With Klossy.")
                  .font(.custom("Baby Doll", size: 20))
                Text(" ")
                Text("Joelle")
                  .font(.custom("Baby Doll", size: 30))
                  .fontWeight(.semibold)
                Text("Hi, I'm Joelle! I'm a rising junior in high school with a passion for computer science and tennis.")
                  .font(.custom("Baby Doll", size: 20))
                Text(" ")
              }
              .opacity(animate ? 1 : 0)
              .animation(.easeOut(duration: 1).delay(0.7), value: animate)
            }
            .padding(.horizontal)
          }
          .padding()
          .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.clear)
        .onAppear {
          animate = true
        }
      }
    }
  }
}
#Preview {
  About()
}
