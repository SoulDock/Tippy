import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("home")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gearshape")
                    Text("settings")
                }
        }
        .accentColor(.indigo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

