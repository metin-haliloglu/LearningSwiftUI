//
//  Sheet_2.swift
//  LearningSwiftUI
//
//  Created by Metin HALILOGLU on 5/3/21.
//

import SwiftUI

struct DetayVeriler : Identifiable {
    var id =  UUID()
    let image : Image
    let mesaj : String
}

struct Sheet_2: View {
    @State private var detaylar : DetayVeriler? = nil
    
    @State private var txtMesaj = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Sheet Örnek - 2").font(.largeTitle)
            
            HStack{
                Text("Mesajınız : ")
                TextField("mesajınız....",text:  $txtMesaj)
            }
            Button("Gönder") {
                // buton action kısmı
                self.detaylar  = DetayVeriler(image: Image("swiftui"), mesaj: self.txtMesaj)
            }.sheet(item: $detaylar) { detay in
                DetaylarEkrani(detaylar: detay)
            }
            
        }.padding()
    }
}

struct DetaylarEkrani : View {
    
    @Environment(\.presentationMode) var presentation
    let detaylar : DetayVeriler
    
    var body : some View {
        VStack(spacing: 20) {
            
            Text("Gönderilen Mesajı : ") + Text("\(detaylar.mesaj)").bold().foregroundColor(.red)
            detaylar.image
            Spacer()
            
            Button("Geri Dön") { self.presentation.wrappedValue.dismiss()}.accentColor(.purple)
        }.padding(40)
        
    }
    
}

struct Sheet_2_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_2()
    }
}
