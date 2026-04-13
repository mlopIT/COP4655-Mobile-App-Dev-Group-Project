import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: 48) {
        HStack(spacing: undefined) {
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 650.67, height: 976)
              .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
              .offset(x: 17.33, y: 111.50)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 342, height: 687)
              .background(Color(red: 0.05, green: 0.05, blue: 0.06))
              .offset(x: 0, y: 0)
            HStack(spacing: 12) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("TRENDING MOVIES")
                  .font(Font.custom("Inter", size: 10).weight(.bold))
                  .tracking(2)
                  .lineSpacing(15)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 6, height: 6)
                .background(Color(red: 0.67, green: 0.78, blue: 1))
                .cornerRadius(9999)
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.60))
            .cornerRadius(9999)
            .offset(x: -40.17, y: -292)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
            )
            VStack(alignment: .leading, spacing: 16) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("THE GODFATHER")
                  .font(Font.custom("Inter", size: 60).weight(.black))
                  .lineSpacing(60)
                  .foregroundColor(.white)
              }
              HStack(spacing: 24) {
                VStack(spacing: undefined) {
                  Text("SEE DETAILS")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .tracking(0.70)
                    .lineSpacing(20)
                    .foregroundColor(Color(red: 0, green: 0.13, blue: 0.30))
                }
                .padding(EdgeInsets(top: 16, leading: 40, bottom: 16, trailing: 40))
                .background(Color(red: 0.67, green: 0.78, blue: 1))
                .cornerRadius(9999)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
                )
              }
              .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: 653.28)
            .offset(x: 22, y: 171)
          }
          .frame(width: 342, height: 687)
          .cornerRadius(32)
        }
        .padding(EdgeInsets(top: 32, leading: 24, bottom: 32, trailing: 24))
        .frame(width: 390, height: 751)
        VStack(alignment: .leading, spacing: 32) {
          HStack(alignment: .bottom, spacing: undefined) {
            VStack(alignment: .leading, spacing: 4.50) {
              Text("Weekly Selection")
                .font(Font.custom("Inter", size: 10))
                .tracking(2)
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              Text("TRENDING TV SHOWS")
                .font(Font.custom("Inter", size: 36).weight(.black))
                .lineSpacing(40)
                .foregroundColor(.white)
            }
            VStack(spacing: undefined) {
              Text("VIEW\nALL")
                .font(Font.custom("Inter", size: 14).weight(.bold))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
            }
            .padding(EdgeInsets(top: 0, leading: 5.30, bottom: 0, trailing: 5.31))
          }
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
          VStack(alignment: .top, spacing: undefined) {
            VStack(alignment: .leading, spacing: 10) {
              HStack(spacing: 48) {
                ZStack() {
                  ZStack() {
                    VStack(alignment: .leading, spacing: undefined) {
                      ZStack() {
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 421.22, height: 623.73)
                          .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                          .offset(x: -15.64, y: 12.62)
                      }
                      .frame(height: 387.50)
                      VStack(alignment: .leading, spacing: undefined) {
                        Text("8.6")
                          .font(Font.custom("Inter", size: 12).weight(.bold))
                          .lineSpacing(16)
                          .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                      }
                      .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
                      .cornerRadius(9999)
                      .offset(x: 117.54, y: -165.75)
                    }
                    .frame(width: 310)
                    .cornerRadius(6)
                    .offset(x: 0, y: 0)
                  }
                  .frame(width: 310, height: 387.50)
                  .offset(x: 0, y: -35.50)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("SUPERHERO / cRIME / tHRILLER")
                      .font(Font.custom("Inter", size: 10))
                      .tracking(1)
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 189.75)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("DAREDEVIL: BORN AGAIN")
                      .font(Font.custom("Inter", size: 20).weight(.bold))
                      .lineSpacing(28)
                      .foregroundColor(.white)
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 215.25)
                }
                .frame(width: 342, height: 490.50)
                .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                .cornerRadius(32)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
                )
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    ZStack() {
                      Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 363, height: 551.67)
                        .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                        .offset(x: 0.50, y: -63.92)
                    }
                    .frame(height: 387.50)
                    VStack(alignment: .leading, spacing: undefined) {
                      Text("9.0")
                        .font(Font.custom("Inter", size: 12).weight(.bold))
                        .lineSpacing(16)
                        .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                    }
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                    .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
                    .cornerRadius(9999)
                    .offset(x: 117.21, y: -165.75)
                  }
                  .frame(width: 310)
                  .cornerRadius(6)
                  .offset(x: 0, y: -35.50)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("action / adventure")
                      .font(Font.custom("Inter", size: 10))
                      .tracking(1)
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 189.75)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("INVINCIBLE")
                      .font(Font.custom("Inter", size: 20).weight(.bold))
                      .lineSpacing(28)
                      .foregroundColor(.white)
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 215.25)
                }
                .frame(width: 342, height: 490.50)
                .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                .cornerRadius(32)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
                )
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    ZStack() {
                      Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 373, height: 559)
                        .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                        .offset(x: -0.50, y: 27.75)
                    }
                    .frame(height: 387.50)
                    VStack(alignment: .leading, spacing: undefined) {
                      Text("8.2")
                        .font(Font.custom("Inter", size: 12).weight(.bold))
                        .lineSpacing(16)
                        .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                    }
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                    .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
                    .cornerRadius(9999)
                    .offset(x: 117.49, y: -165.75)
                  }
                  .frame(width: 310)
                  .cornerRadius(6)
                  .offset(x: 0, y: -35.50)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("DRAMA / history")
                      .font(Font.custom("Inter", size: 10))
                      .tracking(1)
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 189.75)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("FOR ALL MANKIND")
                      .font(Font.custom("Inter", size: 20).weight(.bold))
                      .lineSpacing(28)
                      .foregroundColor(.white)
                  }
                  .frame(width: 310)
                  .offset(x: 0, y: 215.25)
                }
                .frame(width: 342, height: 490.50)
                .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                .cornerRadius(32)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
                )
              }
            }
            .frame(width: 342)
          }
          .frame(height: 1283)
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .frame(width: 390, height: 666)
        VStack(alignment: .leading, spacing: 32) {
          VStack(alignment: .leading, spacing: 4.50) {
            Text("WHAT ARE YOU INTO?")
              .font(Font.custom("Inter", size: 10))
              .tracking(2)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            VStack(alignment: .leading, spacing: undefined) {
              Text("EXPLORE GENRES")
                .font(Font.custom("Inter", size: 36).weight(.black))
                .lineSpacing(40)
                .foregroundColor(.white)
            }
          }
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
          VStack(alignment: .top, spacing: undefined) {
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 349.76, height: 194)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 34.60)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 342, height: 80.80)
                .background(Color(red: 0, green: 0, blue: 0).opacity(0.40))
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("THRILLER")
                  .font(Font.custom("Inter", size: 20).weight(.black))
                  .lineSpacing(28)
                  .foregroundColor(.white)
              }
              .offset(x: -105.50, y: 10.40)
            }
            .frame(width: 342, height: 80.80)
            .cornerRadius(32)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 624, height: 300)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 342, height: 80.80)
                .background(Color(red: 0, green: 0, blue: 0).opacity(0.40))
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("SCIFI")
                  .font(Font.custom("Inter", size: 20).weight(.black))
                  .lineSpacing(28)
                  .foregroundColor(.white)
              }
              .offset(x: -131.70, y: 10.40)
            }
            .cornerRadius(32)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 618, height: 203)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 342, height: 80.80)
                .background(Color(red: 0, green: 0, blue: 0).opacity(0.40))
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: undefined) {
                Text("CLASSIC")
                  .font(Font.custom("Inter", size: 20).weight(.black))
                  .lineSpacing(28)
                  .foregroundColor(.white)
              }
              .offset(x: -113.99, y: 10.40)
            }
            .cornerRadius(32)
            ZStack() {
              HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("DISCOVER MORE")
                      .font(Font.custom("Inter", size: 24).weight(.black))
                      .lineSpacing(32)
                      .foregroundColor(.white)
                  }
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Browse our entire subterranean\nvault")
                      .font(Font.custom("Inter", size: 14))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text("arrow_forward")
                    .font(Font.custom("Material Symbols Outlined", size: 24))
                    .lineSpacing(24)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                .frame(width: 56.02)
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                .cornerRadius(9999)
              }
              .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
              .frame(width: 342, height: 80.81)
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .offset(x: 0, y: 0.01)
            }
            .cornerRadius(32)
          }
          .frame(height: 500)
        }
        .padding(EdgeInsets(top: 48, leading: 24, bottom: 0, trailing: 24))
        .frame(height: 574)
      }
      .padding(EdgeInsets(top: 80, leading: 0, bottom: 176, trailing: 0))
      .frame(height: 2294)
      HStack(spacing: 6.40) {
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Home")
              .font(Font.custom("Inter", size: 12).weight(.medium))
              .tracking(1.20)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(12)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Search")
              .font(Font.custom("Inter", size: 12).weight(.medium))
              .tracking(1.20)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(12)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {

            }
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Activity")
              .font(Font.custom("Inter", size: 12).weight(.medium))
              .tracking(1.20)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(12)
        VStack(spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          VStack(alignment: .leading, spacing: undefined) {
            Text("Profile")
              .font(Font.custom("Inter", size: 12).weight(.medium))
              .tracking(1.20)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        .padding(12)
      }
      .padding(
        EdgeInsets(top: 0, leading: 27.17, bottom: 24, trailing: 27.23)
      )
      .frame(width: 390)
      .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.80))
      .cornerRadius(32)
      .offset(x: 0, y: 1155.50)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 40
      )
      HStack(spacing: 80.10) {
        VStack(alignment: .leading, spacing: undefined) {
          Text("CINERATE")
            .font(Font.custom("Inter", size: 20).weight(.black))
            .tracking(4)
            .lineSpacing(28)
            .foregroundColor(.white)
        }
        VStack(spacing: undefined) {
          HStack(alignment: .top, spacing: undefined) {

          }
        }
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24.01))
      .frame(width: 390, height: 80)
      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
      .offset(x: 0, y: -1160.50)
      .shadow(
        color: Color(red: 1, green: 1, blue: 1, opacity: 0.05), radius: 0, y: 1
      )
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 18.50, trailing: 0))
    .frame(width: 390, height: 2401)
    .frame(minWidth: 389.89)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}