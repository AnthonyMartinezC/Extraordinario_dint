
import SwiftUI

struct RecetaDetalleView: View {
    let recetas: DatosReceta
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string:recetas.image)) { image in
                        image.resizable()
                            .frame(width: 200, height: 200)
                            
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                    Text( recetas.name)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    
                    Text(( recetas.difficulty))
                        .padding(.horizontal)
                    Text(("\(recetas.prepTimeMinutes)"))
                        .padding(.horizontal)
                    Text(( recetas.cuisine))
                        .padding(.horizontal)
                    Text(( "\(recetas.cookTimeMinutes)"))
                        .padding(.horizontal)
                    
                    Text( "\(recetas.ingredients)")
                        .padding()
                    
                    Text( "\(recetas.instructions)")
                        .padding()
                   
                }
            }
            .navigationTitle(recetas.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

