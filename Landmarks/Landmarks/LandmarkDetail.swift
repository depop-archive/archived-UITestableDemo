/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .accessibility(identifier: "landmark-detail.text.title")
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                                .accessibility(identifier: "landmark-detail.button.image.star-fill")
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                                .accessibility(identifier: "landmark-detail.button.image.star")
                        }
                    }
                    .accessibility(identifier: "landmark-detail.button.favorite")
                }
                
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                        .accessibility(identifier: "landmark-detail.text.park")
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                        .accessibility(identifier: "landmark-detail.text.state")
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}
