import SwiftUI

struct ContentView: View {
    // usernames go here
    // load the names into an array like this
    let userNames = ["Kai", "Peter", "Victor","Frank"]

    var body: some View {
        VStack {
            //clock In and Clock Out Buttons
            //still open to changes
            HStack {
                VStack {
                    Image(systemName: "gamecontroller.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                    Text("clock in")
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                    Text("clock out")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.gray)
            
            Spacer()
            
            // user List
            HStack {
                          VStack {
                              Text("Friend List")
                                  .foregroundColor(.white)
                                  .font(.title)
                                  .padding()
                          }
                          Spacer()
                      }
                      .padding()
            // divider between two stacks
            Divider()
                        .background(Color.white)
                        .padding(.horizontal)
            
            VStack(spacing: 20) {
                //A for loop so any names added can be looped in
                ForEach(userNames, id: \.self) { userName in
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                        Text(userName)
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            // Bottom Navigation Bar
            HStack {
                Spacer()
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color.gray)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
