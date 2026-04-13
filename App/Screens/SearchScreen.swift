import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: 48) {
        HStack(spacing: undefined) {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 422, height: 72)
            .background(Color(red: 1, green: 1, blue: 1).opacity(0))
            .cornerRadius(32)
            .offset(x: 0, y: 0)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
          HStack(spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {

            }
          }
          .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 16))
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Search movies, actors, or genres...")
                .font(Font.custom("Inter", size: 20).weight(.medium))
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68).opacity(0.50))
            }
          }
          .padding(EdgeInsets(top: 18, leading: 12, bottom: 18, trailing: 12))
        }
        .padding(6)
        .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.60))
        .cornerRadius(32)
        VStack(alignment: .leading, spacing: 24) {
          HStack(spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Trending Searches")
                .font(Font.custom("Inter", size: 12).weight(.bold))
                .tracking(1.20)
                .lineSpacing(18)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10))
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            .frame(height: 1)
          }
          ZStack() {
            VStack(spacing: undefined) {
              Text("Christopher Nolan")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .tracking(0.35)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: -123.14, y: -56)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 2, y: 1
            )
            VStack(spacing: undefined) {
              Text("Neon Noir Aesthetics")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .tracking(0.35)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: 75.25, y: -56)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 2, y: 1
            )
            VStack(spacing: undefined) {
              Text("Oscar Winners 2024")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .tracking(0.35)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: -114.77, y: 0)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 2, y: 1
            )
            VStack(spacing: undefined) {
              Text("Cyberpunk Classics")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .tracking(0.35)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: 87.58, y: 0)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 2, y: 1
            )
            VStack(spacing: undefined) {
              Text("Animation Masters")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .tracking(0.35)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: -121.41, y: 56)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 2, y: 1
            )
          }
          .frame(height: 156)
        }
        VStack(alignment: .leading, spacing: 24) {
          HStack(spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Browse Categories")
                .font(Font.custom("Inter", size: 12).weight(.bold))
                .tracking(1.20)
                .lineSpacing(18)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(height: 1)
                .background(Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10))
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            .frame(height: 1)
          }
          VStack(alignment: .top, spacing: undefined) {
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Action")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: -19.76, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Drama")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: -20.19, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Sci-Fi")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: -34.18, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Horror")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: -15.43, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Documentary")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: 37.82, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 199, height: 199)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Indie")
                  .font(Font.custom("Inter", size: 30).weight(.black))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .offset(x: -38.94, y: 57.50)
            }
            .frame(height: 199)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
          }
        }
      }
      .padding(EdgeInsets(top: 128, leading: 24, bottom: 128, trailing: 24))
      .frame(maxWidth: 1280)
      VStack(alignment: .leading, spacing: undefined) {
        HStack(spacing: 185.25) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("CineRate")
              .font(Font.custom("Inter", size: 30).weight(.black))
              .lineSpacing(36)
              .foregroundColor(Color(red: 0.95, green: 0.96, blue: 0.98))
          }
          VStack(spacing: undefined) {
            HStack(alignment: .top, spacing: undefined) {

            }
          }
        }
        .padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
        .frame(maxWidth: 1280)
      }
      .frame(width: 470)
      .background(Color(red: 1, green: 1, blue: 1).opacity(0))
      .offset(x: 0, y: -757.50)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
      )
      HStack(spacing: 7.71) {
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4.82, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Home")
              .font(Font.custom("Inter", size: 14.46).weight(.medium))
              .tracking(1.45)
              .lineSpacing(21.69)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(14.46)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4.82, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Search")
              .font(Font.custom("Inter", size: 14.46).weight(.medium))
              .tracking(1.45)
              .lineSpacing(21.69)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(14.46)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {

            }
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4.82, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Activity")
              .font(Font.custom("Inter", size: 14.46).weight(.medium))
              .tracking(1.45)
              .lineSpacing(21.69)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(14.46)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4.82, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Profile")
              .font(Font.custom("Inter", size: 14.46).weight(.medium))
              .tracking(1.45)
              .lineSpacing(21.69)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(14.46)
      }
      .padding(
        EdgeInsets(top: 0, leading: 32.74, bottom: 28.92, trailing: 32.82)
      )
      .frame(width: 470)
      .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.80))
      .cornerRadius(38.56)
      .offset(x: 0, y: 746.50)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 48.21
      )
    }
    .frame(width: 470)
    .frame(minHeight: 1599)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}