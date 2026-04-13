import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: 40) {
        HStack(spacing: 22.07) {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 342, height: 163)
            .background(Color(red: 1, green: 1, blue: 1).opacity(0))
            .cornerRadius(32)
            .offset(x: 0, y: -0.14)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 6, y: 4
            )
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 85, height: 127)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
            }
            .frame(width: 80, height: 112)
            .background(Color(red: 1, green: 1, blue: 1).opacity(0))
            .cornerRadius(6)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
            )
          }
          .frame(height: 114.72)
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Now Reviewing")
                  .font(Font.custom("Inter", size: 12))
                  .tracking(2.40)
                  .lineSpacing(18)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            VStack(alignment: .leading, spacing: undefined) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("The Godfather")
                  .font(Font.custom("Inter", size: 30))
                  .lineSpacing(30)
                  .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
              }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            VStack(alignment: .leading, spacing: undefined) {
              Text("1972 • Directed by\nFrancis Ford Coppola")
                .font(Font.custom("Inter", size: 16).weight(.medium))
                .tracking(0.40)
                .lineSpacing(24)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
          }
        }
        .padding(
          EdgeInsets(top: 14.64, leading: 14.07, bottom: 14.64, trailing: 16)
        )
        .background(Color(red: 0.07, green: 0.07, blue: 0.08))
        .cornerRadius(32)
        VStack(spacing: undefined) {
          HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading, spacing: undefined) {

            }
            .shadow(
              color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.40), radius: 15
            )
            VStack(alignment: .leading, spacing: undefined) {

            }
            .shadow(
              color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.40), radius: 15
            )
            VStack(alignment: .leading, spacing: undefined) {

            }
            .shadow(
              color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.40), radius: 15
            )
            VStack(alignment: .leading, spacing: undefined) {

            }
            .shadow(
              color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.40), radius: 15
            )
            VStack(alignment: .leading, spacing: undefined) {

            }
          }
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: 4) {
              VStack(spacing: undefined) {
                Text("4 out of 5")
                  .font(Font.custom("Inter", size: 24).weight(.black))
                  .lineSpacing(32)
                  .foregroundColor(.white)
              }
              VStack(spacing: undefined) {
                Text(""An absolute masterpiece."")
                  .font(Font.custom("Inter", size: 16))
                  .tracking(1.60)
                  .lineSpacing(24)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
          }
          .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        }
        VStack(alignment: .trailing, spacing: 16) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("Your Critique")
              .font(Font.custom("Inter", size: 12))
              .tracking(1.20)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .frame(width: 334)
          VStack(alignment: .leading, spacing: undefined) {
            HStack(alignment: .top, spacing: undefined) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Share your thoughts...")
                  .font(Font.custom("Inter", size: 16))
                  .lineSpacing(24)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68).opacity(0.50))
              }
            }
            .padding(32)
            .frame(height: 256)
            .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.40))
            .cornerRadius(32)
          }
        }
        VStack(alignment: .leading, spacing: 24) {
          HStack(spacing: undefined) {
            Text("Post Review")
              .font(Font.custom("Inter", size: 18).weight(.black))
              .tracking(1.80)
              .lineSpacing(28)
              .foregroundColor(Color(red: 0.13, green: 0.25, blue: 0.44))
          }
          .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
          .background(Color(red: 0.67, green: 0.78, blue: 1))
          .cornerRadius(9999)
          .shadow(
            color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.20), radius: 30, y: 10
          )
          VStack(spacing: undefined) {
            Text("Your review will be shared with the\nCineRate community. Stay cinematic!")
              .font(Font.custom("Inter", size: 14))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
      }
      .padding(EdgeInsets(top: 112, leading: 24, bottom: 0, trailing: 24))
      .frame(maxWidth: 672)
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
      .frame(width: 390, height: 90)
      .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.80))
      .cornerRadius(38.56)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 48.21
      )
      HStack(spacing: 80.10) {
        HStack(spacing: 10) {
          HStack(spacing: 12) {
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 44, height: 44)
                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                .cornerRadius(296)
                .offset(x: 0, y: 0)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 40, y: 8
                )
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 44, height: 44)
                .background(Color(red: 0, green: 0, blue: 0).opacity(0))
                .cornerRadius(296)
                .offset(x: 0, y: 0)
            }
            .frame(width: 44, height: 44)
            .offset(x: 0, y: 0)
            HStack(spacing: 2) {
              Text("􀯶")
                .font(Font.custom("SF Pro", size: 17).weight())
                .foregroundColor(Color(red: 0.10, green: 0.10, blue: 0.10))
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .frame(height: 36)
            .frame(minWidth: 36)
            .cornerRadius(100)
          }
          .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
          .frame(height: 44)
          .frame(minWidth: 44)
          .background(.white)
          .cornerRadius(296)
        }
        VStack(alignment: .leading, spacing: undefined) {
          Text("CineRate")
            .font(Font.custom("Inter", size: 20).weight(.black))
            .tracking(4)
            .lineSpacing(28)
            .foregroundColor(.white)
        }
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
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24.01))
      .frame(width: 390, height: 80)
      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
      .offset(x: 0, y: -509.39)
      .shadow(
        color: Color(red: 1, green: 1, blue: 1, opacity: 0.05), radius: 0, y: 1
      )
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 134, trailing: 0))
    .frame(width: 390)
    .frame(minHeight: 1092);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}