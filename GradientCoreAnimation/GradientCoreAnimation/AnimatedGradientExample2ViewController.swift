import UIKit

class AnimatedGradientExample2ViewController: UIViewController {
    
    let stackView = UIStackView()
    let gradientView = AnimatedGradientView()
    let button = makeButton(withText: "Animate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Make UIButton

func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 8
    return button
}

// MARK: - Style and layout methods

extension AnimatedGradientExample2ViewController {
    
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(gradientView)
        stackView.addArrangedSubview(button)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 300),
            gradientView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        gradientView.setNeedsLayout()
    }
}

// MARK: - Views

extension AnimatedGradientExample2ViewController {
    
    class AnimatedGradientView: UIView {
        
        let topColor: UIColor = UIColor.lightGray
        let bottomColor: UIColor = UIColor.purple
        
        let gradientLayer = CAGradientLayer()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func commonInit() {
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            layer.addSublayer(gradientLayer)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            if gradientLayer.frame != bounds {
                gradientLayer.frame = bounds
            }
            
            let newColors = [
                UIColor.purple.cgColor,
                UIColor.red.cgColor,
                UIColor.orange.cgColor
            ]
            
            gradientLayer.setColours(newColors,
                                     animated: true,
                                     withDuration: 2,
                                     timingFunctionName: .linear)
        }
    }
    
}

// MARK: - PreviewProvider

@available (iOS 17, *)

#Preview {
    AnimatedGradientExample2ViewController()
}
