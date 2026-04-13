import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      ZStack() {
        VStack(alignment: .leading, spacing: undefined) {
          VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("CINERATE")
                .font(Font.custom("Inter", size: 14).weight(.black))
                .tracking(4.20)
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
            }
            .opacity(0.40)
            HStack(alignment: .top, spacing: 40) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("ABOUT")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("COMMUNITY")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("SUPPORT")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("PRIVACY")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("© 2024 ARCHIVE FOUNDATION")
                .font(Font.custom("Inter", size: 10.40))
                .tracking(1.04)
                .lineSpacing(15.60)
                .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.47))
            }
          }
          .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
          .frame(maxWidth: 1280)
        }
        .padding(EdgeInsets(top: 64, leading: 0, bottom: 80, trailing: 0))
        .frame(width: 390)
        .overlay(
          Rectangle()
            .inset(by: 0.50)
            .stroke(
              Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
            )
        )
        .offset(x: 0, y: 1755.55)
        HStack(spacing: undefined) {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 409.50, height: 798.61)
            .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
            .offset(x: 0, y: 0)
            .opacity(0.40)
            .blur(radius: 4))
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 390, height: 760.58)
            .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.20))
            .offset(x: 0, y: 0)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 390, height: 760.58)
            .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
            .offset(x: 0, y: 0)
            .opacity(0.15)
          VStack(alignment: .top, spacing: undefined) {
            VStack(spacing: 32) {
              HStack(alignment: .top, spacing: undefined) {
                Text("SIGN UP NOW")
                  .font(Font.custom("Inter", size: 10.40))
                  .tracking(3.12)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.15, green: 0.15, blue: 0.16).opacity(0.50))
              .cornerRadius(9999)
              .overlay(
                RoundedRectangle(cornerRadius: 9999)
                  .inset(by: 0.50)
                  .stroke(
                    Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.20), lineWidth: 0.50
                  )
              )
              VStack(spacing: -0.52) {
                Text("Your one-way\nticket to the\nGreatest")
                  .font(Font.custom("Inter", size: 48).weight(.black))
                  .lineSpacing(45.60)
                  .foregroundColor(.white)
                Text("Stories Ever\nTold.")
                  .font(Font.custom("Inter", size: 48).weight(.black))
                  .lineSpacing(45.60)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  ..shadow(color: Color(red: 0.67, green: 0.78, blue: 1.00, opacity: 0.40), radius: 20, x: 0, y: 0)()
              }
              VStack(spacing: undefined) {
                Text("Step into the inner circle of cinema. Access community reviews, and more—designed for true film lovers.")
                  .font(Font.custom("Inter", size: 18))
                  .lineSpacing(29.25)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .frame(maxWidth: 448)
              VStack(alignment: .leading, spacing: 16) {
                VStack(spacing: undefined) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 342, height: 64)
                    .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                    .cornerRadius(9999)
                    .offset(x: 0, y: 0)
                    .shadow(
                      color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.30), radius: 50
                    )
                  Text("Sign Up Now")
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .lineSpacing(24)
                    .foregroundColor(Color(red: 0.13, green: 0.25, blue: 0.44))
                }
                .padding(
                  EdgeInsets(top: 20, leading: 123.38, bottom: 20, trailing: 123.37)
                )
                .background(Color(red: 0.67, green: 0.78, blue: 1))
                .cornerRadius(9999)
                VStack(spacing: undefined) {
                  Text("Join the Club")
                    .font(Font.custom("Inter", size: 16).weight(.semibold))
                    .lineSpacing(24)
                    .foregroundColor(Color(red: 0.96, green: 0.95, blue: 0.96))
                }
                .padding(
                  EdgeInsets(top: 20, leading: 119.13, bottom: 20, trailing: 119.12)
                )
                .background(Color(red: 0.12, green: 0.12, blue: 0.13).opacity(0.60))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 0.50)
                    .stroke(
                      Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
                    )
                )
              }
              .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
          }
          .frame(height: 632.58)
          .frame(maxWidth: 1152)
        }
        .padding(EdgeInsets(top: 48, leading: 24, bottom: 80, trailing: 24))
        .frame(width: 390)
        .frame(minHeight: 600)
        .offset(x: 0, y: -1526.71)
        VStack(alignment: .leading, spacing: 48) {
          VStack(alignment: .leading, spacing: 16) {
            VStack(spacing: undefined) {
              Text("Create Your\nAccount")
                .font(Font.custom("Inter", size: 36))
                .lineSpacing(40)
                .foregroundColor(.white)
            }
            VStack(spacing: undefined) {
              Text("reviewing SINCE 2026")
                .font(Font.custom("Inter", size: 12))
                .tracking(2.40)
                .lineSpacing(16)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
          }
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 390, height: 1)
            .background(Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0))
            .offset(x: 0, y: -527.50)
          VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .top, spacing: undefined) {
              VStack(alignment: .trailing, spacing: 8) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("NAME")
                    .font(Font.custom("Inter", size: 10.40).weight(.bold))
                    .tracking(1.04)
                    .lineSpacing(15.60)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .frame(width: 244)
                HStack(alignment: .top, spacing: undefined) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("ALFRED HITCHCOCK")
                      .font(Font.custom("Inter", size: 16))
                      .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.29))
                  }
                }
                .padding(EdgeInsets(top: 18, leading: 24, bottom: 18, trailing: 24))
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(32)
              }
              VStack(alignment: .trailing, spacing: 8) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("EMAIL")
                    .font(Font.custom("Inter", size: 10.40).weight(.bold))
                    .tracking(1.04)
                    .lineSpacing(15.60)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
                .frame(width: 244)
                HStack(alignment: .top, spacing: undefined) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("MAESTRO@THEARCHIVE.COM")
                      .font(Font.custom("Inter", size: 16))
                      .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.29))
                  }
                }
                .padding(EdgeInsets(top: 18, leading: 24, bottom: 18, trailing: 24))
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(32)
              }
            }
            VStack(alignment: .trailing, spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("PASSWORD")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .frame(width: 244)
              HStack(alignment: .top, spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("YOUR PASSWORD HERE")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.29))
                }
              }
              .padding(EdgeInsets(top: 18, leading: 24, bottom: 18, trailing: 24))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(32)
            }
            VStack(alignment: .trailing, spacing: 16) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("CINEMATIC TASTE")
                  .font(Font.custom("Inter", size: 10.40).weight(.bold))
                  .tracking(1.04)
                  .lineSpacing(15.60)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .frame(width: 244)
              ZStack() {
                VStack(spacing: undefined) {
                  Text("NOIR CLASSICS")
                    .font(Font.custom("Inter", size: 9.60).weight(.bold))
                    .lineSpacing(14.40)
                    .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 7, leading: 16, bottom: 8.39, trailing: 16))
                .background(Color(red: 0.17, green: 0.17, blue: 0.18))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 0.50)
                    .stroke(
                      Color(red: 0.67, green: 0.78, blue: 1).opacity(0.20), lineWidth: 0.50
                    )
                )
                .offset(x: -75.92, y: -19.20)
                VStack(spacing: undefined) {
                  Text("AVANT-GARDE")
                    .font(Font.custom("Inter", size: 9.60).weight(.bold))
                    .lineSpacing(14.40)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 9.39, trailing: 16))
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(9999)
                .offset(x: 37.56, y: -19.20)
                VStack(spacing: undefined) {
                  Text("SOVIET MONTAGE")
                    .font(Font.custom("Inter", size: 9.60).weight(.bold))
                    .lineSpacing(14.40)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .padding(EdgeInsets(top: 7, leading: 16, bottom: 8.39, trailing: 16))
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(9999)
                .offset(x: -70.68, y: 20.20)
                VStack(spacing: undefined) {
                  Text("NEW WAVE")
                    .font(Font.custom("Inter", size: 9.60).weight(.bold))
                    .lineSpacing(14.40)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
                .padding(EdgeInsets(top: 7, leading: 16, bottom: 8.39, trailing: 16))
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(9999)
                .offset(x: 39.66, y: 20.20)
              }
              .frame(height: 70.78)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            HStack(spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 260, height: 64)
                .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                .cornerRadius(9999)
                .offset(x: 0, y: 0)
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 50, y: 25
                )
              Text("CREATE ACCOUNT")
                .font(Font.custom("Inter", size: 16).weight(.black))
                .tracking(1.60)
                .lineSpacing(24)
                .foregroundColor(Color(red: 0.13, green: 0.25, blue: 0.44))
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            .background(Color(red: 0.67, green: 0.78, blue: 1))
            .cornerRadius(9999)
            VStack(spacing: undefined) {
              Text("By creating an account, \nyou agree to CineRate’s Terms and Conditions \nand Privacy Policy.")
                .font(Font.custom("Inter", size: 10))
                .tracking(1)
                .lineSpacing(16.25)
                .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.47))
            }
          }
          .padding(40)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.40))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 0.50)
              .stroke(
                Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.05), lineWidth: 0.50
              )
          )
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 96, trailing: 24))
        .frame(width: 390)
        .frame(maxWidth: 896)
        .offset(x: 0, y: 1144.58)
        VStack(alignment: .leading, spacing: undefined) {
          HStack(spacing: undefined) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(height: 1)
              .background(Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0))
          }
          .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
          .frame(maxWidth: 1280)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 390, height: 128)
            .offset(x: 0, y: 0)
            .opacity(0.30)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 390, height: 128)
            .background(Color(red: 0.05, green: 0.05, blue: 0.06))
            .offset(x: 0, y: 0)
        }
        .frame(width: 390, height: 128)
        .offset(x: 0, y: -1082.42)
        VStack(alignment: .top, spacing: undefined) {
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
            }
            .frame(width: 170, height: 378)
            .background(.white)
            .offset(x: 85, y: 0)
            .opacity(0.30)
            VStack(alignment: .leading, spacing: 16) {
              HStack(spacing: undefined) {
                VStack(alignment: .leading, spacing: undefined) {

                }
              }
              .frame(width: 48, height: 48)
              .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
              .cornerRadius(16)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Movie\nRecommendations")
                  .font(Font.custom("Inter", size: 30))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
              VStack(alignment: .leading, spacing: undefined) {
                Text("Never waste a Friday night browsing again. Find movies tailored to your evolving taste.")
                  .font(Font.custom("Inter", size: 16))
                  .lineSpacing(26)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .frame(maxWidth: 448)
          }
          .padding(40)
          .frame(minHeight: 380)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 0.50)
              .stroke(
                Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
              )
          )
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              VStack(alignment: .leading, spacing: undefined) {
                HStack(alignment: .bottom, spacing: undefined) {
                  HStack(alignment: .bottom, spacing: 4) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 4, height: 32)
                      .background(Color(red: 0.67, green: 0.78, blue: 1))
                      .cornerRadius(9999)
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 4, height: 48)
                      .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.60))
                      .cornerRadius(9999)
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 4, height: 24)
                      .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.30))
                      .cornerRadius(9999)
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 4, height: 64)
                      .background(Color(red: 0.67, green: 0.78, blue: 1))
                      .cornerRadius(9999)
                  }
                }
                .padding(24)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 260, height: 128)
                  .background(Color(red: 0.38, green: 0.62, blue: 1).opacity(0.20))
                  .offset(x: 0, y: 0)
              }
              .frame(height: 128)
              .background(Color(red: 0.15, green: 0.15, blue: 0.16).opacity(0.50))
              .cornerRadius(48)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
            .frame(height: 160)
            VStack(alignment: .leading, spacing: 15.13) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Discover Hidden Gems")
                  .font(Font.custom("Inter", size: 24))
                  .lineSpacing(32)
                  .foregroundColor(.white)
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Discover underrated movies and shows through searching specific genres.")
                  .font(Font.custom("Inter", size: 14))
                  .lineSpacing(22.75)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0.88, trailing: 0))
            }
          }
          .padding(40)
          .frame(minHeight: 380)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 0.50)
              .stroke(
                Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
              )
          )
          VStack(alignment: .leading, spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              VStack(alignment: .leading, spacing: 14.80) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Exclusive Community")
                    .font(Font.custom("Inter", size: 24))
                    .lineSpacing(32)
                    .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 1.20, leading: 0, bottom: 0, trailing: 0))
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Join the conversation with fans who get it. Get ready for deep dives and respectful critique.")
                    .font(Font.custom("Inter", size: 14))
                    .lineSpacing(22.75)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: 0))
            VStack(alignment: .leading, spacing: undefined) {
              HStack(alignment: .top, spacing: -16) {
                VStack(alignment: .leading, spacing: undefined) {
                  Rectangle()
                    .foregroundColor(.clear)
                    .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                }
                .frame(width: 48, height: 48)
                .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 2)
                    .stroke(Color(red: 0.05, green: 0.05, blue: 0.06), lineWidth: 2)
                )
                VStack(alignment: .leading, spacing: undefined) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 48, height: 48)
                  .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                  .cornerRadius(9999)
                  .overlay(
                    RoundedRectangle(cornerRadius: 9999)
                      .inset(by: 2)
                      .stroke(Color(red: 0.05, green: 0.05, blue: 0.06), lineWidth: 2)
                  )
                }
                .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: undefined) {
                  VStack(alignment: .leading, spacing: undefined) {
                    Rectangle()
                      .foregroundColor(.clear)
                      .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  }
                  .frame(width: 48, height: 48)
                  .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                  .cornerRadius(9999)
                  .overlay(
                    RoundedRectangle(cornerRadius: 9999)
                      .inset(by: 2)
                      .stroke(Color(red: 0.05, green: 0.05, blue: 0.06), lineWidth: 2)
                  )
                }
                .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: undefined) {
                  HStack(spacing: undefined) {
                    Text("+4k")
                      .font(Font.custom("Inter", size: 10).weight(.bold))
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .padding(EdgeInsets(top: 12, leading: 0, bottom: 13, trailing: 0))
                  .frame(width: 48, height: 48)
                  .background(Color(red: 0.12, green: 0.12, blue: 0.13))
                  .cornerRadius(9999)
                  .overlay(
                    RoundedRectangle(cornerRadius: 9999)
                      .inset(by: 2)
                      .stroke(Color(red: 0.05, green: 0.05, blue: 0.06), lineWidth: 2)
                  )
                }
                .frame(width: 48, height: 48)
              }
            }
            .padding(EdgeInsets(top: 29.75, leading: 0, bottom: 0, trailing: 0))
            .frame(height: 77.75)
            .frame(minHeight: 48)
          }
          .padding(40)
          .frame(minHeight: 380)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 0.50)
              .stroke(
                Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
              )
          )
          VStack(spacing: undefined) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 340, height: 409)
              .offset(x: 0, y: 0)
              .opacity(0.10)
            VStack(spacing: 24) {
              VStack(spacing: undefined) {
                Text("Preserve Your\nHistory")
                  .font(Font.custom("Inter", size: 30).weight(.bold))
                  .lineSpacing(36)
                  .foregroundColor(.white)
              }
              VStack(spacing: undefined) {
                Text("Your ratings, your reviews, your cinematic legacy. A permanent digital home for your film journey.")
                  .font(Font.custom("Inter", size: 16))
                  .lineSpacing(26)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .frame(maxWidth: 384)
            }
          }
          .padding(40)
          .frame(minHeight: 380)
          .background(Color(red: 0.07, green: 0.07, blue: 0.08))
          .cornerRadius(32)
          .overlay(
            RoundedRectangle(cornerRadius: 32)
              .inset(by: 0.50)
              .stroke(
                Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
              )
          )
        }
        .frame(width: 342)
        .offset(x: 0, y: -224.92)
      }
      .frame(height: 3974)
      .frame(minHeight: 3974)
      HStack(spacing: 98.37) {
        VStack(alignment: .leading, spacing: undefined) {
          Text("CINERATE")
            .font(Font.custom("Inter", size: 20).weight(.black))
            .tracking(4)
            .lineSpacing(28)
            .foregroundColor(.white)
        }
        HStack(spacing: 24) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("close")
              .font(Font.custom("Inter", size: 14))
              .tracking(1.40)
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
          VStack(alignment: .leading, spacing: undefined) {

          }
        }
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
      .frame(width: 390, height: 80)
      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.80))
      .offset(x: 0, y: -1947)
      .shadow(
        color: Color(red: 1, green: 1, blue: 1, opacity: 0.05), radius: 0, y: 1
      )
      HStack(spacing: 38.90) {
        VStack(spacing: 4) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("HOME")
              .font(Font.custom("Inter", size: 10))
              .tracking(1)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        VStack(spacing: 4) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("SEARCH")
              .font(Font.custom("Inter", size: 10).weight(.bold))
              .tracking(1)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        VStack(spacing: 4) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("ACTIVITY")
              .font(Font.custom("Inter", size: 10).weight(.bold))
              .tracking(1)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
        VStack(spacing: 4) {
          VStack(alignment: .leading, spacing: undefined) {

          }
          VStack(alignment: .leading, spacing: undefined) {
            Text("PROFILE")
              .font(Font.custom("Inter", size: 10).weight(.bold))
              .tracking(1)
              .lineSpacing(15)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
          }
        }
      }
      .padding(
        EdgeInsets(top: 0, leading: 43.42, bottom: 0, trailing: 43.44)
      )
      .frame(width: 390, height: 80)
      .background(Color(red: 0.05, green: 0.05, blue: 0.06).opacity(0.90))
      .overlay(
        Rectangle()
          .inset(by: 0.50)
          .stroke(
            Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.10), lineWidth: 0.50
          )
      )
      .offset(x: 0, y: 1947)
    }
    .frame(width: 390)
    .frame(minHeight: 3974)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}