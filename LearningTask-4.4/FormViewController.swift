//
//  ViewController.swift
//  LearningTask-4.4
//
//  Created by rafael.rollo on 15/02/2022.
//

import UIKit

class FormViewController: UIViewController {
    
    typealias MensagemValidacao = String

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var areaAtuacaoTextField: UITextField!
    @IBOutlet weak var statusProfissionalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoSubmissaoPressionado(_ sender: UIButton) {
        
        switch formularioValido() {
        case (false, let mensagem):
            exibeAlerta(title: "Quase lá!", mensagem: mensagem)
        default:
            exibeAlerta(title: "Feito!", mensagem: "Verifique seu email e tenha acesso ao documento.")
        }
        
    }
    
    func formularioValido() -> (Bool, MensagemValidacao?) {
        
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false, "Nome não pode estar em branco.")
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            return (false, "Email não pode estar em branco")
        }
        
        guard emailValido(email) else {
            return (false, "O email informado é inválido.")
        }
        
        if let areaAtuacao = areaAtuacaoTextField.text, areaAtuacao.isEmpty {
            return (false, "Informe sua área de atuação.")
        }
        
        if let statusProfissional = statusProfissionalTextField.text, statusProfissional.isEmpty {
            return (false, "Informe seu status profissional.")
        }

        return (true, nil)
    }
    
    func emailValido(_ email: String) -> Bool {
        let padrao = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}"#
        return NSPredicate(format: "SELF MATCHES %@", padrao).evaluate(with: email)
    }
    
    func exibeAlerta(title: String?, mensagem mensagemValidacao: MensagemValidacao?) {
        let mensagem = mensagemValidacao ?? "Verifique os dados informados e tente novamente."
        
        let alerta = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alerta, animated: true)
    }


}

