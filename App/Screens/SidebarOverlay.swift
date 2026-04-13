import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      VStack(alignment: .leading, spacing: undefined) {
        VStack(alignment: .leading, spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 64, height: 64)
              .background(Color(red: 1, green: 1, blue: 1).opacity(0))
              .cornerRadius(9999)
              .offset(x: 0, y: 0)
              .shadow(
                color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 6, y: 4
              )
            Rectangle()
              .foregroundColor(.clear)
              .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
              .cornerRadius(9999)
          }
          .padding(4)
          .frame(width: 64, height: 64)
          .background(Color(red: 0.12, green: 0.12, blue: 0.13))
          .cornerRadius(9999)
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("John Doe")
                .font(Font.custom("Inter", size: 20))
                .lineSpacing(28)
                .foregroundColor(Color(red: 0, green: 0.44, blue: 0.89))
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("4 Ratings")
                .font(Font.custom("Inter", size: 14))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
          }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
      }
      .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
      VStack(alignment: .leading, spacing: 8) {
        HStack(spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("Log In / Sign Up")
              .font(Font.custom("Inter", size: 16))
              .lineSpacing(24)
              .foregroundColor(Color(red: 0, green: 0.44, blue: 0.89))
          }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        .background(Color(red: 0, green: 0.44, blue: 0.89).opacity(0.05))
        .cornerRadius(32)
        .overlay(
          RoundedRectangle(cornerRadius: 32)
            .inset(by: 2)
            .stroke(Color(red: 0, green: 0.44, blue: 0.89), lineWidth: 2)
        )
        HStack(spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("Log Out")
              .font(Font.custom("Inter", size: 16))
              .lineSpacing(24)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        .cornerRadius(32)
        HStack(spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("My Ratings")
              .font(Font.custom("Inter", size: 16))
              .lineSpacing(24)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        .cornerRadius(32)
        HStack(spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("Settings")
              .font(Font.custom("Inter", size: 16))
              .lineSpacing(24)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
        .cornerRadius(32)
      }
      VStack(alignment: .leading, spacing: undefined) {
        VStack(alignment: .leading, spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("v1.0.4")
              .font(Font.custom("Liberation Mono", size: 12))
              .tracking(1.20)
              .lineSpacing(16)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68).opacity(0.30))
          }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
      }
      .padding(EdgeInsets(top: 286, leading: 0, bottom: 0, trailing: 0))
      .frame(minHeight: 16)
    }
    .padding(EdgeInsets(top: 48, leading: 24, bottom: 48, trailing: 24))
    .frame(width: 320, height: 1268)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.95))
    .overlay(
      Rectangle()
        .inset(by: 0.50)
        .stroke(
          Color(red: 1, green: 1, blue: 1).opacity(0.05), lineWidth: 0.50
        )
    )
    .shadow(
      color: Color(red: 0, green: 0, blue: 0, opacity: 0.80), radius: 80, x: 40
    );
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}