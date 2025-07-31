//
// Social.swift
// GithubCollaboration
//
// Created by Scholar on 7/29/25.
//
import Foundation
import SwiftUI
struct Social: View {
  @State private var age: Int?
  @State private var adviceText = ""
  func getResult(age: Int) -> String {
    switch age {
    case 0..<6:
      return "Bring a toy to daycare or hangout at the playground."
    case 6..<13:
      return "Try connecting through games, clubs, or school events!"
    case 13..<18:
      return "Explore social opportunities at school, sports, or volunteer programs."
    case 18..<30:
      return "Look into college events, online communities, and networking meetups."
    case 30..<60:
      return "Join local groups, community centers, or hobby clubs."
    case 60...:
      return "Senior centers, lifelong learning classes, and family gatherings can help!"
    default:
      return "Please enter a valid age."
    }
  }
  var body: some View {
    ZStack {
      Color(red: 1.0, green: 0.98, blue: 0.94)
        .ignoresSafeArea()
      VStack {
        Image("SocialPic2")
          .resizable()
          .frame(width: 550, height: 200)
        Text("Social Advice")
          .font(.custom("Baby Doll", size: 50))
          .foregroundColor(Color(red: 0.38, green: 0.858, blue: 0.757))
          .offset(x: 0, y: 25)
        Text("Don't feel fulfilled in your social life? ThriveCheck has got you! Based on your age group, we will provide relevant ways for you to connect with your peers!")
          .foregroundColor(Color(hue: 0.107, saturation: 0.735, brightness: 0.803))
          .font(.custom("Baby Doll", size: 20))
          .multilineTextAlignment(.center)
          .frame(maxWidth: 380)
          .padding(.top, 20)
          .font(.custom("Quicksand_Book_Oblique", size: 20))
          .padding()
        TextField("Enter your age", value: $age, formatter: NumberFormatter())
          .keyboardType(.numberPad)
          .font(.custom("Baby Doll", size: 19))
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color(red: 254/255, green: 175/255, blue: 176/255), lineWidth: 2)
          )
          .frame(maxWidth: 200)
          .onSubmit {
            if let age = age {
              adviceText = getResult(age: age)
            } else {
              adviceText = "Please enter a valid age."
            }
          }
        Text(adviceText)
          .font(.custom("Baby Doll", size: 25))
          .foregroundColor(Color(red: 0.38, green: 0.858, blue: 0.757))
          .offset(x: 0, y: 25)
          .multilineTextAlignment(.center)
          .padding()
          .frame(maxWidth: 350)
      }
    }
  }
}
#Preview {
  Social()
}


