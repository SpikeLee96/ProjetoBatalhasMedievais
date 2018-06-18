//
//  Base.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 19/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation
import UIKit

struct Global {
    static var texto: String = ""
    static var input: String = ""
    static var padrePrimeiro: Bool = true
    static var jogador: Int = 0
    static var oponente: Int = 0
    static var HPP1: Int = 100
    static var HPP2: Int = 100
    static var mesmoJogador = false
    
    static var temaGlobal: Tema = Tema(corMenu: .black, corMenuTitulo: .white, corJogo: .white, corJogoTextView: .white, corJogoText: .black, corTema: .white, corRanks: .white, corRanksText: .black , corManual: .white, corManualText: .black, corManualTextTitle: .red)
    
    static var temaTrevas = Tema(corMenu: .lightGray, corMenuTitulo: .black, corJogo: .red, corJogoTextView: .darkGray, corJogoText: .black, corTema: .darkGray, corRanks: .darkGray, corRanksText: .black , corManual: .darkGray, corManualText: .black, corManualTextTitle: .lightGray)
    
    static var temaLuz = Tema(corMenu: .white, corMenuTitulo: .lightGray, corJogo: .black, corJogoTextView: .lightGray, corJogoText: .white, corTema: .lightGray, corRanks: .lightGray, corRanksText: .white , corManual: .lightGray, corManualText: .white, corManualTextTitle: .darkGray)
    
    static var temaEquilibrio = Tema(corMenu: .white, corMenuTitulo: .black, corJogo: .black, corJogoTextView: .white, corJogoText: .black, corTema: .white, corRanks: .white, corRanksText: .black , corManual: .white, corManualText: .black, corManualTextTitle: .gray)

    static var temaNebulosa = Tema(corMenu: .cyan, corMenuTitulo: .green, corJogo: .yellow, corJogoTextView: .yellow, corJogoText: .orange, corTema: .blue, corRanks: .green, corRanksText: .blue , corManual: .magenta, corManualText: .white, corManualTextTitle: .yellow)
    
    static var temaPadrao: Tema = Tema(corMenu: .black, corMenuTitulo: .red, corJogo: .white, corJogoTextView: .white, corJogoText: .black, corTema: .white, corRanks: .white, corRanksText: .black , corManual: .white, corManualText: .black, corManualTextTitle: .red)
    
    static func verificar(){
        if (input.caseInsensitiveCompare("") == ComparisonResult.orderedSame){
            sleep(1)
            verificar()
        }
    }
    
    static func verificarPlayer(){
        if(jogador == 0){
            sleep(1)
            verificarPlayer()
        }
    }
    
    static func verificarPlayer2(){
        if(oponente == 0){
            sleep(1)
            verificarPlayer2()
        }
    }
    
    static func limpar(){
        input = ""
    }
}

struct Tema{
    let corMenu: UIColor
    let corMenuTitulo: UIColor
    let corJogo: UIColor
    let corJogoTextView: UIColor
    let corJogoText: UIColor
    let corTema: UIColor
    let corRanks: UIColor
    let corRanksText: UIColor
    let corManual: UIColor
    let corManualText: UIColor
    let corManualTextTitle: UIColor
}

class Base {
    
    
    
    enum Exception: Error{
        typealias RawValue = String
        case SimplesmenteErro
    }
    
    var player1: Int = 100
    var player2: Int = 100
    var prays = 0, divina = 0, condenado = 0
    var defesa = false, morte = false, secondChance = false, antiReaper = false, acabou = false, turno = false
    var uni: Bool = true
    
    func j4(classe: String, nPlayer: Int){
        if(nPlayer == 1){
            self.player2 -= 4
            Global.texto.append("O "+classe+" perdeu 10 do HP.\n")
            Global.limpar()
        } else if(nPlayer == 2) {
            self.player1 -= 4
            Global.texto.append("O "+classe+" perdeu 10 do HP.\n")
            Global.limpar()
        }
    }
    
    func j10(classe: String, nPlayer: Int){
        if(nPlayer == 1){
            self.player2 -= 10
            Global.texto.append("O "+classe+" perdeu 10 do HP.\n")
            Global.limpar()
        } else if(nPlayer == 2) {
            self.player1 -= 10
            Global.texto.append("O "+classe+" perdeu 10 do HP.\n")
            Global.limpar()
        }
    }
    
    func j20(classe: String, nPlayer: Int){
        if(nPlayer == 1){
            self.player2 -= 20
            Global.texto.append("O "+classe+" perdeu 20 do HP.\n")
        } else if(nPlayer == 2) {
            self.player1 -= 20
            Global.texto.append("O "+classe+" perdeu 20 do HP.\n")
        }
    }
    
    func j30(classe: String, nPlayer: Int){
        if(nPlayer == 1){
            self.player2 -= 30
            Global.texto.append("O "+classe+" perdeu 30 do HP.\n\n")
        } else if(nPlayer == 2) {
            self.player1 -= 30
            Global.texto.append("O "+classe+" perdeu 30 do HP.\n\n")
        }
    }
    
    func j40(classe: String, nPlayer: Int){
        if(nPlayer == 1){
            self.player2 -= 40
            Global.texto.append("O "+classe+" perdeu 40 do HP.\n\n")
        } else if(nPlayer == 2) {
            self.player1 -= 40
            Global.texto.append("O "+classe+" perdeu 40 do HP.\n\n")
        }
    }
}
