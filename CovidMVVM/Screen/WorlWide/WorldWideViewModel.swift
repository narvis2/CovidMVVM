//
//  WorldWideViewModel.swift
//  CovidMVVM
//
//  Created by choi young jun on 2022/12/10.
//

import Foundation
import Combine

class WorldWideViewModel : ObservableObject {
    @Published private(set) var state = PageState.idle
    
    enum PageState {
        case idle
        case loading
        case failed(NetworkError)
        case loaded(Worldwide)
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let networkManager: CovidApiProtocol
    
    init(networkManager: CovidApiProtocol) {
        self.networkManager = networkManager
    }
    
    
}
