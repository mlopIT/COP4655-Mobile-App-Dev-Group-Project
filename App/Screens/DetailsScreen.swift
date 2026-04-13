import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: -32) {
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 650.67, height: 976)
            .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
            .offset(x: 10.33, y: 158.50)
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: 16) {
              HStack(alignment: .top, spacing: undefined) {
                Text("Classic Cinema")
                  .font(Font.custom("Inter", size: 14).weight(.bold))
                  .tracking(1.40)
                  .lineSpacing(20)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
              .background(Color(red: 0.17, green: 0.17, blue: 0.18).opacity(0.50))
              .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                Text("The\nGodfather")
                  .font(Font.custom("Inter", size: 60).weight(.black))
                  .lineSpacing(75)
                  .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("1972")
                  .font(Font.custom("Inter", size: 24).weight(.medium))
                  .lineSpacing(32)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .frame(maxWidth: 1280)
          }
          .padding(EdgeInsets(top: 0, leading: 32, bottom: 48, trailing: 32))
          .frame(width: 390)
          .offset(x: 0, y: 230.50)
        }
        .frame(height: 751)
        VStack(alignment: .top, spacing: undefined) {
          VStack(alignment: .leading, spacing: 48) {
            HStack(alignment: .top, spacing: 16) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Crime")
                  .font(Font.custom("Inter", size: 14).weight(.medium))
                  .tracking(0.35)
                  .lineSpacing(20)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Drama")
                  .font(Font.custom("Inter", size: 14).weight(.medium))
                  .tracking(0.35)
                  .lineSpacing(20)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                Text("2h 55m")
                  .font(Font.custom("Inter", size: 14).weight(.medium))
                  .tracking(0.35)
                  .lineSpacing(20)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(9999)
            }
            VStack(alignment: .leading, spacing: 16) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Synopsis")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .tracking(2.40)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("The aging patriarch of an\norganized crime dynasty transfers\ncontrol of his clandestine empire\nto his reluctant son. It's a story of\nfamily, loyalty, and the price of\npower in America's underbelly.")
                  .font(Font.custom("Inter", size: 20))
                  .lineSpacing(32.50)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            VStack(alignment: .leading, spacing: 24) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Cast")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .tracking(2.40)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              HStack(spacing: 24) {
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 178, height: 237)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 160, height: 224)
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  .offset(x: 0, y: -24)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Marlon Brando")
                      .font(Font.custom("Inter", size: 14).weight(.bold))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 110)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Vito Corleone")
                      .font(Font.custom("Inter", size: 12))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 128)
                }
                .frame(width: 160, height: 272)
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 160, height: 229)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 160, height: 224)
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  .offset(x: 0, y: -24)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Al Pacino")
                      .font(Font.custom("Inter", size: 14).weight(.bold))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 110)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Michael Corleone")
                      .font(Font.custom("Inter", size: 12))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 128)
                }
                .frame(width: 160, height: 272)
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 196, height: 232)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 160, height: 224)
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  .offset(x: 0, y: -24)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("James Caan")
                      .font(Font.custom("Inter", size: 14).weight(.bold))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 110)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Sonny Corleone")
                      .font(Font.custom("Inter", size: 12))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 128)
                }
                .frame(width: 160, height: 272)
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 228, height: 228)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 160, height: 224)
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  .offset(x: 0, y: -24)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Diane Keaton")
                      .font(Font.custom("Inter", size: 14).weight(.bold))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 110)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Kay Adams")
                      .font(Font.custom("Inter", size: 12))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 128)
                }
                .frame(width: 160, height: 272)
                ZStack() {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 189, height: 265)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 160, height: 224)
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  .offset(x: 0, y: -24)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Robert Duvall")
                      .font(Font.custom("Inter", size: 14).weight(.bold))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 110)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Tom Hagen")
                      .font(Font.custom("Inter", size: 12))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  .frame(width: 160)
                  .offset(x: 0, y: 128)
                }
                .frame(width: 160, height: 272)
              }
            }
            VStack(alignment: .leading, spacing: 32) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Community Reviews")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .tracking(2.40)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 326, height: 258)
                    .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                    .cornerRadius(32)
                    .offset(x: 0, y: 0)
                    .shadow(
                      color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
                    )
                  HStack(alignment: .top, spacing: 31.46) {
                    HStack(spacing: 16) {
                      HStack(spacing: undefined) {
                        Text("JD")
                          .font(Font.custom("Inter", size: 16).weight(.black))
                          .lineSpacing(24)
                          .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                      }
                      .frame(width: 48, height: 48)
                      .background(Color(red: 0.67, green: 0.78, blue: 1))
                      .cornerRadius(9999)
                      VStack(alignment: .leading, spacing: undefined) {
                        VStack(alignment: .leading, spacing: undefined) {
                          Text("julian_deniro")
                            .font(Font.custom("Inter", size: 16).weight(.bold))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                        }
                        VStack(alignment: .leading, spacing: undefined) {
                          Text("Rated Oct 14, 2023")
                            .font(Font.custom("Inter", size: 12))
                            .lineSpacing(16)
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                        }
                      }
                    }
                    VStack(alignment: .leading, spacing: undefined) {
                      Text("9.5")
                        .font(Font.custom("Inter", size: 16).weight(.black))
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                    }
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.20))
                    .cornerRadius(9999)
                  }
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Absolute masterpiece. The\npacing, the acting, the score...\neverything is perfect. I’ve watched\nthis at least 10 times and find\nsomething new every time.")
                      .font(Font.custom("Inter", size: 16))
                      .lineSpacing(26)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .padding(32)
                .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.60))
                .cornerRadius(32)
                VStack(alignment: .leading, spacing: 16) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 326, height: 258)
                    .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                    .cornerRadius(32)
                    .offset(x: 0, y: 0)
                    .shadow(
                      color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
                    )
                  HStack(alignment: .top, spacing: 31.19) {
                    HStack(spacing: 16) {
                      HStack(spacing: undefined) {
                        Text("SL")
                          .font(Font.custom("Inter", size: 16).weight(.black))
                          .lineSpacing(24)
                          .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                      }
                      .frame(width: 48, height: 48)
                      .background(Color(red: 0.97, green: 0.69, blue: 1))
                      .cornerRadius(9999)
                      VStack(alignment: .leading, spacing: undefined) {
                        VStack(alignment: .leading, spacing: undefined) {
                          Text("sarah_lights")
                            .font(Font.custom("Inter", size: 16).weight(.bold))
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                        }
                        VStack(alignment: .leading, spacing: undefined) {
                          Text("Rated Sept 28, 2023")
                            .font(Font.custom("Inter", size: 12))
                            .lineSpacing(16)
                            .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                        }
                      }
                    }
                    VStack(alignment: .leading, spacing: undefined) {
                      Text("10")
                        .font(Font.custom("Inter", size: 16).weight(.black))
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                    }
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.20))
                    .cornerRadius(9999)
                  }
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("It's a long watch but totally worth\nevery second. The transformation\nof Michael Corleone is the best\ncharacter development in cinema\nhistory.")
                      .font(Font.custom("Inter", size: 16))
                      .lineSpacing(26)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .padding(32)
                .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.60))
                .cornerRadius(32)
              }
            }
          }
          VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 32) {
              VStack(alignment: .leading, spacing: 8) {
                VStack(spacing: undefined) {
                  Text("Community Rating")
                    .font(Font.custom("Inter", size: 12).weight(.bold))
                    .tracking(2.40)
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                VStack(spacing: undefined) {
                  Text("9.2")
                    .font(Font.custom("Inter", size: 96).weight(.black))
                    .lineSpacing(96)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                HStack(spacing: 8) {
                  VStack(spacing: undefined) {

                  }
                  VStack(spacing: undefined) {
                    Text("14.2k ratings")
                      .font(Font.custom("Inter", size: 14).weight(.medium))
                      .lineSpacing(20)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                }
              }
              HStack(spacing: undefined) {
                Text("Rate This")
                  .font(Font.custom("Inter", size: 18).weight(.black))
                  .tracking(0.45)
                  .lineSpacing(28)
                  .foregroundColor(Color(red: 0, green: 0.13, blue: 0.30))
              }
              .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
              .background(Color(red: 0.67, green: 0.78, blue: 1))
              .cornerRadius(9999)
              VStack(alignment: .top, spacing: undefined) {
                VStack(alignment: .leading, spacing: 4) {
                  VStack(spacing: undefined) {
                    Text("Rank")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  VStack(spacing: undefined) {
                    Text("#1")
                      .font(Font.custom("Inter", size: 20).weight(.bold))
                      .lineSpacing(28)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .padding(16)
                .background(Color(red: 0.10, green: 0.10, blue: 0.11))
                .cornerRadius(32)
                VStack(alignment: .leading, spacing: 4) {
                  VStack(spacing: undefined) {
                    Text("Popularity")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                  }
                  VStack(spacing: undefined) {
                    Text("Top 10")
                      .font(Font.custom("Inter", size: 20).weight(.bold))
                      .lineSpacing(28)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .padding(16)
                .background(Color(red: 0.10, green: 0.10, blue: 0.11))
                .cornerRadius(32)
              }
            }
            .padding(32)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            .shadow(
              color: Color(red: 0, green: 0, blue: 0, opacity: 0.40), radius: 40, y: 20
            )
            VStack(alignment: .leading, spacing: 24) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Similar Titles")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .tracking(2.40)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
              VStack(alignment: .top, spacing: undefined) {
                VStack(alignment: .leading, spacing: 8) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(height: 232.50)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("The Godfather Part II")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .frame(height: 255)
                VStack(alignment: .leading, spacing: 8) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(height: 231)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Goodfellas")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                VStack(alignment: .leading, spacing: 8) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(height: 235)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Scarface")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
                .frame(height: 255)
                VStack(alignment: .leading, spacing: 8) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(height: 232)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .background(Color(red: 0.07, green: 0.07, blue: 0.08))
                  .cornerRadius(32)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("Casino")
                      .font(Font.custom("Inter", size: 12).weight(.bold))
                      .lineSpacing(16)
                      .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                  }
                }
              }
            }
            .frame(height: 569)
          }
        }
        .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
        .frame(maxWidth: 1280)
      }
      .padding(EdgeInsets(top: 0, leading: 0, bottom: 128, trailing: 0))
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
        VStack(spacing: undefined) {
          HStack(alignment: .top, spacing: undefined) {

          }
        }
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24.01))
      .frame(width: 390, height: 80)
      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
      .offset(x: 0, y: -1602)
      .shadow(
        color: Color(red: 1, green: 1, blue: 1, opacity: 0.05), radius: 0, y: 1
      )
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
      .offset(x: 0, y: 1597)
      .shadow(
        color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 40
      )
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 33, trailing: 0))
    .frame(width: 390)
    .frame(minHeight: 3284)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}