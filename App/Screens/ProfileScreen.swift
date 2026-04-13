import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: undefined) {
      VStack(alignment: .leading, spacing: 48) {
        VStack(alignment: .leading, spacing: 24) {
          HStack(alignment: .top, spacing: 115.66) {
            VStack(alignment: .leading, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 112)
                .background(Color(red: 0.97, green: 0.69, blue: 1).opacity(0.20))
                .cornerRadius(9999)
                .offset(x: 0, y: 0)
                .blur(radius: 40))
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 112)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
                .overlay(
                  RoundedRectangle(cornerRadius: 9999)
                    .inset(by: 1)
                    .stroke(Color(red: 0.12, green: 0.12, blue: 0.13), lineWidth: 1)
                )
                .shadow(
                  color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 10, y: 8
                )
            }
            VStack(spacing: undefined) {
              Text("Edit Profile")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            .cornerRadius(9999)
            .overlay(
              RoundedRectangle(cornerRadius: 9999)
                .inset(by: 0.50)
                .stroke(
                  Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.30), lineWidth: 0.50
                )
            )
          }
          VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Julian Vance")
                .font(Font.custom("Inter", size: 36))
                .lineSpacing(40)
                .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("Obsessed with slow cinema and neo-noir")
                .font(Font.custom("Inter", size: 14))
                .lineSpacing(20)
                .italic()
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
          }
          ZStack() {
            HStack(spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("1,248")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(24)
                  .foregroundColor(.white)
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Rated")
                  .font(Font.custom("Inter", size: 12))
                  .tracking(1.20)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(height: 40)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: -107.04, y: -26)
            HStack(spacing: 8.01) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("412")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(24)
                  .foregroundColor(.white)
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Watchlist")
                  .font(Font.custom("Inter", size: 12))
                  .tracking(1.20)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(height: 40)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: 42.36, y: -26)
            HStack(spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("8.2k")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(24)
                  .foregroundColor(.white)
              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Followers")
                  .font(Font.custom("Inter", size: 12))
                  .tracking(1.20)
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(height: 40)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(9999)
            .offset(x: -91.63, y: 26)
          }
          .frame(height: 92)
        }
        VStack(alignment: .leading, spacing: 32) {
          VStack(alignment: .leading, spacing: 16.50) {
            Text("Cinematic Taste")
              .font(Font.custom("Inter", size: 12))
              .tracking(1.80)
              .lineSpacing(18)
              .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            HStack(alignment: .top, spacing: 8) {
              VStack(alignment: .leading, spacing: undefined) {
                Text("Neo-Noir")
                  .font(Font.custom("Inter", size: 12).weight(.medium))
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.15, green: 0.15, blue: 0.16).opacity(0.50))
              .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                Text("Sci-Fi")
                  .font(Font.custom("Inter", size: 12).weight(.medium))
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.15, green: 0.15, blue: 0.16).opacity(0.50))
              .cornerRadius(9999)
              VStack(alignment: .leading, spacing: undefined) {
                Text("French New Wave")
                  .font(Font.custom("Inter", size: 12).weight(.medium))
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.15, green: 0.15, blue: 0.16).opacity(0.50))
              .cornerRadius(9999)
            }
          }
          VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Favorite Directors")
                .font(Font.custom("Inter", size: 18))
                .lineSpacing(28)
                .foregroundColor(.white)
            }
            HStack(alignment: .top, spacing: 24) {
              VStack(spacing: 12) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 64, height: 64)
                  .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  .cornerRadius(9999)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Villeneuve")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              VStack(spacing: 12) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 64, height: 64)
                  .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  .cornerRadius(9999)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Nolan")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
              VStack(spacing: 12) {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 64, height: 64)
                  .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                  .cornerRadius(9999)
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Gerwig")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
          }
          VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Signature Films")
                .font(Font.custom("Inter", size: 18))
                .lineSpacing(28)
                .foregroundColor(.white)
            }
            HStack(spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 160)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(32)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 160)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(32)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 160)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(32)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 112, height: 160)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(32)
            }
          }
        }
        VStack(alignment: .leading, spacing: 24) {
          HStack(alignment: .bottom, spacing: 74.83) {
            VStack(alignment: .leading, spacing: 4.30) {
              Text("Average Score")
                .font(Font.custom("Inter", size: 11.20))
                .tracking(1.12)
                .lineSpacing(16.80)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("9.2")
                    .font(Font.custom("Inter", size: 36).weight(.black))
                    .lineSpacing(40)
                    .foregroundColor(.white)
                }
                VStack(alignment: .leading, spacing: undefined) {

                }
              }
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("Top 1% Reviewer")
                .font(Font.custom("Inter", size: 12))
                .lineSpacing(16)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
          }
          HStack(alignment: .bottom, spacing: undefined) {
            HStack(alignment: .top, spacing: undefined) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 23.16)
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.20))
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 23.16)
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.30))
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 23.16)
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.40))
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 46.33)
                .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.60))
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 115.83)
                .background(Color(red: 0.67, green: 0.78, blue: 1))
                .shadow(
                  color: Color(red: 0.67, green: 0.78, blue: 1, opacity: 0.40), radius: 15
                )
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 46.33)
                .background(Color(red: 0.52, green: 0.63, blue: 0.84))
            }
            .frame(height: 8)
            .background(Color(red: 0.12, green: 0.12, blue: 0.13))
            .cornerRadius(9999)
          }
          .frame(height: 40)
          HStack(alignment: .top, spacing: 73.30) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("1.0")
                .font(Font.custom("Inter", size: 10))
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("Distribution (1-10)")
                .font(Font.custom("Inter", size: 10))
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            VStack(alignment: .leading, spacing: undefined) {
              Text("10.0")
                .font(Font.custom("Inter", size: 10))
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
          }
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0.02))
        }
        .padding(32)
        .background(Color(red: 0.07, green: 0.07, blue: 0.08))
        .cornerRadius(32)
        VStack(alignment: .leading, spacing: 24) {
          HStack(spacing: undefined) {
            VStack(alignment: .leading, spacing: undefined) {
              Text("Recent Activity")
                .font(Font.custom("Inter", size: 24))
                .lineSpacing(32)
                .foregroundColor(.white)
            }
          }
          VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 64)
                .frame(maxWidth: 342)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(6)
              VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 91.83) {
                  Text("Oppenheimer")
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .lineSpacing(24)
                    .foregroundColor(.white)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("9.5")
                      .font(Font.custom("Inter", size: 10).weight(.bold))
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                  .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                  .cornerRadius(9999)
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text(""A terrifying, kinetic masterpiece of\nsound and light. Nolan at his most…")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .italic()
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(16)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            HStack(alignment: .top, spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 64)
                .frame(maxWidth: 342)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(6)
              VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 123.69) {
                  Text("Past Lives")
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .lineSpacing(24)
                    .foregroundColor(.white)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("10")
                      .font(Font.custom("Inter", size: 10).weight(.bold))
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                  .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                  .cornerRadius(9999)
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text(""Soul-crushing in the most beautiful\nway possible. The silence speaks…")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .italic()
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(16)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
            HStack(alignment: .top, spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 64)
                .frame(maxWidth: 342)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(6)
              VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 103.75) {
                  Text("Challengers")
                    .font(Font.custom("Inter", size: 16).weight(.bold))
                    .lineSpacing(24)
                    .foregroundColor(.white)
                  VStack(alignment: .leading, spacing: undefined) {
                    Text("8.8")
                      .font(Font.custom("Inter", size: 10).weight(.bold))
                      .lineSpacing(15)
                      .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                  }
                  .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                  .background(Color(red: 0.67, green: 0.78, blue: 1).opacity(0.10))
                  .cornerRadius(9999)
                }
                VStack(alignment: .leading, spacing: undefined) {
                  Text(""Electric pacing and a killer score.\nGuadagnino proves he can do…")
                    .font(Font.custom("Inter", size: 12))
                    .lineSpacing(16)
                    .italic()
                    .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
                }
              }
            }
            .padding(16)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08))
            .cornerRadius(32)
          }
          HStack(spacing: undefined) {
            Text("View All Activity")
              .font(Font.custom("Inter", size: 14).weight(.bold))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
          }
          .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
        }
        VStack(alignment: .leading, spacing: 24) {
          VStack(alignment: .leading, spacing: undefined) {
            Text("Lists")
              .font(Font.custom("Inter", size: 24))
              .lineSpacing(32)
              .foregroundColor(.white)
          }
          HStack(spacing: 16) {
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 192, height: 256)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 192, height: 256)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: -0.50) {
                Text("Curated Noirs")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(20)
                  .foregroundColor(.white)
                Text("24 Films")
                  .font(Font.custom("Inter", size: 10))
                  .lineSpacing(15)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .offset(x: -25.84, y: 94.75)
            }
            .frame(width: 192, height: 256)
            .cornerRadius(32)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 192, height: 256)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .offset(x: 0, y: 0)
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 192, height: 256)
                .background(.black)
                .offset(x: 0, y: 0)
              VStack(alignment: .leading, spacing: -0.50) {
                Text("2024 Must-Watch")
                  .font(Font.custom("Inter", size: 16).weight(.bold))
                  .lineSpacing(20)
                  .foregroundColor(.white)
                Text("15 Films")
                  .font(Font.custom("Inter", size: 10))
                  .lineSpacing(15)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
              .offset(x: -9.06, y: 94.75)
            }
            .frame(width: 192, height: 256)
            .cornerRadius(32)
            VStack(spacing: 12) {
              VStack(alignment: .leading, spacing: undefined) {

              }
              VStack(alignment: .leading, spacing: undefined) {
                Text("Create New List")
                  .font(Font.custom("Inter", size: 12).weight(.medium))
                  .lineSpacing(16)
                  .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
              }
            }
            .frame(width: 192, height: 256)
            .background(Color(red: 0.07, green: 0.07, blue: 0.08).opacity(0.30))
            .cornerRadius(32)
            .overlay(
              RoundedRectangle(cornerRadius: 32)
                .inset(by: 1)
                .stroke(
                  Color(red: 0.28, green: 0.28, blue: 0.29).opacity(0.30), lineWidth: 1
                )
            )
          }
        }
        VStack(alignment: .leading, spacing: 32) {
          HStack(alignment: .top, spacing: 32) {
            VStack(spacing: undefined) {
              Text("Following")
                .font(Font.custom("Inter", size: 14).weight(.bold))
                .lineSpacing(20)
                .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            .overlay(
              Rectangle()
                .inset(by: 1)
                .stroke(Color(red: 0.67, green: 0.78, blue: 1), lineWidth: 1)
            )
            VStack(spacing: undefined) {
              Text("Followers")
                .font(Font.custom("Inter", size: 14).weight(.bold))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.68))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            .overlay(
              Rectangle()
                .inset(by: 1)
                .stroke(Color(red: 0, green: 0, blue: 0).opacity(0), lineWidth: 1)
            )
          }
          VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 48, height: 48)
                .frame(maxWidth: 342)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
              VStack(alignment: .leading, spacing: -0.50) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Marcus Thorne")
                    .font(Font.custom("Inter", size: 14))
                    .lineSpacing(20)
                    .foregroundColor(.white)
                }
                HStack(spacing: 4) {
                  VStack(alignment: .leading, spacing: undefined) {

                  }
                  Text("Loves the same directors as you")
                    .font(Font.custom("Inter", size: 10))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
              }
              VStack(spacing: undefined) {
                Text("Following")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .lineSpacing(16)
                  .foregroundColor(.white)
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(9999)
            }
            HStack(spacing: 16) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 48, height: 48)
                .frame(maxWidth: 342)
                .background(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                .cornerRadius(9999)
              VStack(alignment: .leading, spacing: -0.50) {
                VStack(alignment: .leading, spacing: undefined) {
                  Text("Elena Rossi")
                    .font(Font.custom("Inter", size: 14))
                    .lineSpacing(20)
                    .foregroundColor(.white)
                }
                HStack(spacing: 4) {
                  VStack(alignment: .leading, spacing: undefined) {

                  }
                  Text("Mutual interest in French New\nWave")
                    .font(Font.custom("Inter", size: 10))
                    .lineSpacing(15)
                    .foregroundColor(Color(red: 0.67, green: 0.78, blue: 1))
                }
              }
              VStack(spacing: undefined) {
                Text("Following")
                  .font(Font.custom("Inter", size: 12).weight(.bold))
                  .lineSpacing(16)
                  .foregroundColor(.white)
              }
              .padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
              .background(Color(red: 0.12, green: 0.12, blue: 0.13))
              .cornerRadius(9999)
            }
          }
        }
      }
      .padding(EdgeInsets(top: 96, leading: 24, bottom: 128, trailing: 24))
      .frame(maxWidth: 672)
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
          .frame(width: 63)
        }
        .padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
        .frame(maxWidth: 1280)
      }
      .frame(width: 390)
      .background(Color(red: 1, green: 1, blue: 1).opacity(0))
      .offset(x: 0, y: -1187.50)
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
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 13.20, trailing: 0))
    .frame(width: 390)
    .frame(minHeight: 2459)
    .background(Color(red: 0.05, green: 0.05, blue: 0.06));
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}