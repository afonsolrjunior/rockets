//
//  LaunchesViewController.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 28/01/2023.
//

import UIKit

class LaunchesViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self))
        return collectionView
    }()
    
    private let viewModel: ViewModel<LaunchViewModel>
    
    init(viewModel: ViewModel<LaunchViewModel>) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        bindViewModel()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }
    
    private func bindViewModel() {
        viewModel.viewState.listen { state in
            DispatchQueue.main.async {
                switch state {
                    case .idle:
                        self.view.backgroundColor = .magenta
                    case .loading:
                        self.view.backgroundColor = .systemCyan
                    case .loaded:
                        self.view.backgroundColor = .systemGreen
                        self.collectionView.reloadData()
                    case .error(let message):
                        self.view.backgroundColor = .systemRed
                }
            }
        }
        
        viewModel.fetchData()
    }

}

extension LaunchesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewCell.self),
                                                      for: indexPath)
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = viewModel.items[indexPath.row].missionName
        configuration.secondaryText = viewModel.items[indexPath.row].missionDate
        cell.contentConfiguration = configuration
        
        return cell
    }
    
}

