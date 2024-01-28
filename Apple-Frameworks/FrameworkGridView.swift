//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Dongtaes on 20.01.2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FramworkGridViewModel()
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MockData.frameworks){ framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }.navigationTitle("Apple Frameworks")
                    .sheet(isPresented: $viewModel.isShowingDetailView) {
                        FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                            isShowingDetailView: $viewModel.isShowingDetailView)
                    }
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

struct FrameworkTitleView :View {
    
    let framework: Framework
    
    var body: some View{
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 100)
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
            
        }
    }
}
