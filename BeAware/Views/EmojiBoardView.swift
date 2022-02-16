//
//  SpeechView.swift
//  BeAware
//
//  Created by Saamer Mansoor on 2/7/22.
//
import SwiftUI

struct EmojiBoardView : View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var uiImage: UIImage?
    @State private var image: Image?
    @State var data = ["✈️","🍽","🏥","⏰","☕️","🎵","💦","🧻","☀️","📷","🚌","☎️","🏠","🌙","🔋","💵"]
    @State var images: [AddedImage?] = []
    @State var imageHere: Image?
    let columns = [
        GridItem(.adaptive(minimum: 75))
    ]
    var body : some View {
        
        NavigationView{
            ZStack{
                Color("BrandColor")
                
                ScrollView{
                    VStack {
                        LazyVGrid(columns: columns, spacing: 25) {
                            ForEach(data, id: \.self) { item in
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color(hex: 0xb2ccde))
                                        .frame(width:70, height:70)
                                        .shadow(color: .black, radius: 2, x: 0, y: 4)
                                    Text(item).font(Font.custom("Avenir", size: 36))
                                }
                            }
                        }
                        .padding()
                        //                        Image(image!)
                        //                        if (uiImage != nil)
                        //                        {
                        //                            ZStack{
                        //                                Circle()
                        //                                    .foregroundColor(Color(hex: 0xb2ccde))
                        //                                    .frame(width:70, height:70)
                        //                                    .shadow(color: .black, radius: 2, x: 0, y: 4)
                        //                                Image(uiImage: uiImage!)
                        //                                    .frame(width:70, height:70)
                        //                            }
                        //                        }
                        LazyVGrid(columns: columns, spacing: 25) {
                            ForEach(images, id: \.self) { item in
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color(hex: 0xb2ccde))
                                        .frame(width:70, height:70)
                                        .shadow(color: .black, radius: 2, x: 0, y: 4)
                                    Image(uiImage: item!.image)
                                        .resizable()
                                        .frame(width:70.0, height:70)
                                        .cornerRadius(35)
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                        }
                        .padding()
                        Spacer ()
                        ZStack{
                            Circle()
                                .foregroundColor(Color(hex: 0xb2ccde))
                                .frame(width:70, height:70)
                                .shadow(color: .black, radius: 2, x: 0, y: 4)
                            Text("➕").font(Font.custom("Avenir", size: 36))
                                .onTapGesture {
                                    showingImagePicker = true
                                }
                        }
                    }
                    
                }
                .navigationTitle("Emoji Board")
                .navigationBarTitleTextColor(Color("BrandColor"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(
                            destination: SettingsView()
                        ) {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
        
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        print(inputImage)
        image = Image(uiImage: inputImage)
        uiImage = inputImage
        print(image)
        images.append(AddedImage(image: inputImage))
    }
}
struct EmojiBoardView_Previews : PreviewProvider {
    static var previews: some View {
        EmojiBoardView()
    }
}
