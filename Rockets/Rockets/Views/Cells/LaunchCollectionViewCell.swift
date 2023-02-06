//
//  LaunchCollectionViewCell.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 06/02/2023.
//

import UIKit

/*
 
 let missionName: String
 let missionDate: String
 let missionDetails: String
 let success: Bool
 let missionPatchLink: String
 
*/

final class LaunchCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: LaunchCollectionViewCell.self)
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var missionNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var missionDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        imageView.image = nil
        missionNameLabel.text = nil
        missionDateLabel.text = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubviews(imageView,
                                missionNameLabel,
                                missionDateLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            missionNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            missionNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: 12),
            missionNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                       constant: -12),
            
            missionDateLabel.topAnchor.constraint(equalTo: missionNameLabel.bottomAnchor,
                                                            constant: 4),
            missionDateLabel.leadingAnchor.constraint(equalTo: missionNameLabel.leadingAnchor),
            missionDateLabel.trailingAnchor.constraint(equalTo: missionNameLabel.trailingAnchor),
            missionDateLabel.bottomAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor)

        ])
        
    }
    
    func setup(using launchViewModel: LaunchViewModel) {
        missionNameLabel.text = launchViewModel.formattedMissionName()
        missionDateLabel.text = launchViewModel.formattedMissionDate()
        contentView.backgroundColor = launchViewModel.success ? .systemCyan : .systemRed
    }
    
}
