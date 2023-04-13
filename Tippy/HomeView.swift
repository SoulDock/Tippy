import SwiftUI

struct HomeView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 1
    @State private var percentage = 0
    @State private var currency = ""
    let TipsVariety = [0,5,10,15,20]
   

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(TipsVariety[percentage])
        let orderAmount  = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        
        VStack{
                Form{
                    Section(header: Text("Check amount and company size")
                        ){
                        TextField("Check amount", text: $checkAmount)
                        Picker("Persons:", selection: $numberOfPeople){
                            ForEach(1..<100){
                                Text("\($0)")
                            }
                        }
                    }
                    Section(header: Text("How much of a tip do you want to leave?")
                        ){
                        Picker("Select percent", selection: $percentage){
                            ForEach(0..<TipsVariety.count){
                                Text("\(self.TipsVariety[$0])%")
                                    .foregroundColor(Color.black)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section(header: Text("Total for each:")
                        ){
                        Text("\(totalPerPerson, specifier: "%.2f") $")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }.padding(.top, 100.0).scrollContentBackground(.hidden)
        }
        .frame(width: .infinity,height: .infinity)
        .background(
            Rectangle()
                .fill(Color("CustomColor"))
        ).edgesIgnoringSafeArea(.all)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


