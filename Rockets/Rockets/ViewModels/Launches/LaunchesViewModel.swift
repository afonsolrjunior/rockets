//
//  LaunchesViewModel.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 29/01/2023.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case loaded
    case error(message: String)
}

class ViewModel<Item> {
    let viewState: SimpleBind<ViewState> = .init(value: .idle)
    
    var items: [Item] = []
    
    func fetchData() {  }
}

final class LaunchesViewModel: ViewModel<LaunchViewModel> {
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    override func fetchData() {
        viewState.value = .loading
        Task {
            do {
                let items = try await self.apiService.loadItems()
                self.items = items
                viewState.value = .loaded
            } catch {
                viewState.value = .error(message: "\(error)")
            }
        }
    }
}
