import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: 40) {
        VStack(alignment: .leading, spacing: 24) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("Your Stats This Week")
              .font(Font.custom("Inter", size: 14).weight(.medium))
              .tracking(0.35)
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          ZStack() {
            HStack(spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("12")
                  .font(Font.custom("Inter", size: 18).weight(.bold))
                  .lineSpacing(28)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Rated")
                  .font(Font.custom("Inter", size: 12).weight(.semibold))
                  .tracking(0.60)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .frame(height: 48)
            .background(Color(red: 0.12, green: 0.12, blue: 0.13))
            .cornerRadius(9999)
            .offset(x: -84.25, y: -29)
            HStack(spacing: 8.01) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("48")
                  .font(Font.custom("Inter", size: 18).weight(.bold))
                  .lineSpacing(28)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Hours")
                  .font(Font.custom("Inter", size: 12).weight(.semibold))
                  .tracking(0.60)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .frame(height: 48)
            .background(Color(red: 0.12, green: 0.12, blue: 0.13))
            .cornerRadius(9999)
            .offset(x: 41.25, y: -29)
            HStack(spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Top Genre:")
                  .font(Font.custom("Inter", size: 12).weight(.semibold))
                  .tracking(0.60)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Noir")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(24)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .frame(height: 46)
            .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
            .cornerRadius(9999)
            .overlay(
              RoundedRectangle(cornerRadius: 9999)
                .inset(by: 0.50)
                .stroke(
                  Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10), lineWidth: 0.50
                )
            )
            .offset(x: -58.66, y: 30)
          }
          .frame(height: 106)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 192, height: 192)
            .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.05))
            .cornerRadius(9999)
            .offset(x: 123, y: -59)
            .blur(radius: 80))
        }
        .padding(32)
        .background(Color(red: 0.07, green: 0.07, blue: 0.08))
        .cornerRadius(32)
        HStack(spacing: 12) {
          VStack(spacing: undefined) {
            Text("All")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0, green: 0.13, blue: 0.30))
          }
          .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
          .background(Color(red: 0.67, green: 0.78, blue: 1))
          .cornerRadius(9999)
          .shadow(
            color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.30), radius: 20
          )
          VStack(spacing: undefined) {
            Text("Reviews")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
          .background(Color(red: 0.12, green: 0.12, blue: 0.13))
          .cornerRadius(9999)
          VStack(spacing: undefined) {
            Text("Ratings")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
          .background(Color(red: 0.12, green: 0.12, blue: 0.13))
          .cornerRadius(9999)
          VStack(spacing: undefined) {
            Text("Watchlist")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
          .background(Color(red: 0.12, green: 0.12, blue: 0.13))
          .cornerRadius(9999)
          VStack(spacing: undefined) {
            Text("Following")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
          .background(Color(red: 0.12, green: 0.12, blue: 0.13))
          .cornerRadius(9999)
        }
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        VStack(alignment: .leading, spacing: 24) {
          HStack(spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Recent Actions")
                .font(Font.custom("Inter", size: 10).weight(.black))
                .tracking(2)
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
            }
          }
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
          HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 56, height: 56)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 1)
                    .stroke(Color(red: 0.12, green: 0.12, blue: 0.13), lineWidth: 1)
                )
              HStack(spacing: undefined) {

              }
              .padding(EdgeInsets(top: 2, leading: 0, bottom: 3, trailing: 0))
              .frame(width: 20, height: 20)
              .background(Color(red: 0.67, green: 0.78, blue: 1))
              .cornerRadius(9999)
              .offset(x: 22, y: 22)
            }
            VStack(alignment: .leading, spacing: 4) {
              ZStack() {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Marcus")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                .offset(x: -41.34, y: -13)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("rated")
                    .font(Font.custom("Inter", size: 14))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .offset(x: 7.48, y: -13)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Dune: Part Two")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .offset(x: -14.96, y: 13)
              }
              .frame(height: 46)
              HStack(spacing: 12) {
                HStack(spacing: undefined) {
                  Text("9.2 / 10")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                .background(Color(red: 0.15, green: 0.15, blue: 0.16))
                .cornerRadius(16)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("2h ago")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .tracking(1)
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 96)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(6)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 10, y: 8
                )
            }
          }
          .padding(24)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 56, height: 56)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 1)
                    .stroke(Color(red: 0.12, green: 0.12, blue: 0.13), lineWidth: 1)
                )
              HStack(spacing: undefined) {
                Text("+")
                  .font(Font.custom("Inter", size: 10).weight(.black))
                  .lineSpacing(15)
                  .foregroundColor(Color(red: 0.97, green: 0.97, blue: 1))
              }
              .padding(EdgeInsets(top: 2, leading: 0, bottom: 3, trailing: 0))
              .frame(width: 20, height: 20)
              .background(Color(red: 0.38, green: 0.62, blue: 1))
              .cornerRadius(9999)
              .offset(x: 22, y: 22)
            }
            VStack(alignment: .leading, spacing: 4) {
              ZStack() {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Elena")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                .offset(x: -48.26, y: -13)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("added")
                    .font(Font.custom("Inter", size: 14))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .offset(x: -2.65, y: -13)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Challengers")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .offset(x: -25.71, y: 13)
              }
              .frame(height: 46)
              HStack(spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("to watchlist • 5h\nago")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .tracking(1)
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18.33))
              }
            }
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 96)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(6)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 10, y: 8
                )
            }
          }
          .padding(24)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
        }
        VStack(alignment: .leading, spacing: undefined) {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 342, height: 1)
            .background(Color(red: 0.12, green: 0.12, blue: 0.13))
            .offset(x: 0, y: 0)
          HStack(alignment: .top, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("FROM THE COMMUNITY")
                .font(Font.custom("Inter", size: 10).weight(.black))
                .tracking(4)
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            .background(Color(red: 0.05, green: 0.05, blue: 0.06))
          }
        }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
        VStack(alignment: .leading, spacing: 32) {
          VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 32, height: 32)
                .frame(maxWidth: 274)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Julian Vance")
                    .font(Font.custom("Inter", size: 12).weight(.bold))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Reviewed Oppenheimer")
                    .font(Font.custom("Inter", size: 10))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              VStack(alignment: .trailing, spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("10 / 10")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                .cornerRadius(9999)
              }
              .padding(EdgeInsets(top: 0, leading: 50.72, bottom: 0, trailing: 0))
              .frame(minWidth: 54.73)
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text(""A haunting, masterful\nexamination of the weight of\ncreation. The sound design\nalone is worth the price of\nadmission. Nolan at his most\nfocused."")
                .font(Font.custom("Inter", size: 18).weight(.light))
                .lineSpacing(29.25)
                .italic()
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            HStack(spacing: 24) {
              HStack(spacing: 6) {
                VStack(alignment: .leading, spacing: undefined) {

                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("1.2k")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              HStack(spacing: 6) {
                VStack(alignment: .leading, spacing: undefined) {

                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("48")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
          }
          .padding(32)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 2)
              .stroke(
                Color(red: 0.67, green: 0.78, blue: 1).opacity(0.20), lineWidth: 2
              )
          )
          VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 32, height: 32)
                .frame(maxWidth: 274)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Sarah Chen")
                    .font(Font.custom("Inter", size: 12).weight(.bold))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Reviewed Past Lives")
                    .font(Font.custom("Inter", size: 10))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              VStack(alignment: .trailing, spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("8.5 / 10")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                .cornerRadius(9999)
              }
              .padding(EdgeInsets(top: 0, leading: 62.16, bottom: 0, trailing: 0))
              .frame(minWidth: 59.47)
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text(""Devastatingly beautiful. It\ncaptures the 'In-Yun' concept\nwith such delicate precision. My\nheart hasn't fully recovered."")
                .font(Font.custom("Inter", size: 18).weight(.light))
                .lineSpacing(29.25)
                .italic()
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            HStack(spacing: 24) {
              HStack(spacing: 6) {
                VStack(alignment: .leading, spacing: undefined) {

                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("856")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              HStack(spacing: 6) {
                VStack(alignment: .leading, spacing: undefined) {

                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("12")
                    .font(Font.custom("Inter", size: 10).weight(.bold))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
          }
          .padding(32)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 2)
              .stroke(
                Color(red: 0.38, green: 0.62, blue: 1).opacity(0.20), lineWidth: 2
              )
          )
        }
      }
      .padding(EdgeInsets(top: 112, leading: 24, bottom: 128, trailing: 24))
      .frame(maxWidth: 672)
      HStack(spacing: 210.22) {
        VStack(alignment: .leading, spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("YOUR FEED")
              .font(Font.custom("Inter", size: 10).weight(.bold))
              .tracking(2)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("Activity")
              .font(Font.custom("Inter", size: 24).weight(.bold))
              .lineSpacing(32)
              .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
          }
        }
        HStack(spacing: undefined) {
          VStack(spacing: undefined) {

          }
        }
        .frame(width: 48, height: 48)
        .background(Color(red: 0.12, green: 0.12, blue: 0.13))
        .cornerRadius(9999)
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
      .frame(width: 390, height: 80)
      .background(Color(red: 0.04, green: 0.04, blue: 0.04).opacity(0.80))
      .offset(x: 0, y: -830.50)
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
      .frame(width: 390, height: 99)
      .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.80))
      .cornerRadius(38.56)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 48.21
      )
    }
    .frame(width: 390)
    .frame(minHeight: 1741)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}