//
//  Padre.swift
//  BatalhasMedievais
//
//  Created by Spike Lee on 22/05/2018.
//  Copyright © 2018 Spike Lee. All rights reserved.
//

import Foundation

class Padre : Base {
    
    let classe = "Padre"
    let texto1 = "Escolha a oração\n"
    let texto2 = "'x' para as orações de condenação ,'o' para fazer oração sagrada ou 'z' para interferência divina: \n\n"
    var primeiroIF = false
    
    var orou = false
    
    func oracao(HP: Int) -> Int{
        var HPaux = HP
        if(prays != 2){
            if (HP == 100){
                Global.texto.append("O Padre já está na capacidade máxima de HP\n\n")
                return 0
            } else if (HP <= 70) {
                HPaux = 30
                Global.texto.append("O Padre ganhou 30 de HP.\n\n")
                prays += 1
            } else {
                HPaux = 100 - HP
                Global.texto.append("O Padre encheu o HP.\n\n")
                prays += 1
            }
        } else {
            Global.texto.append("Os deuses já não ouvem mais suas orações de cura ;-;\n\n")
        }
        orou = false
        return HPaux
    }
    
    func interferencia(classe: String, perda: Int){
        if(divina != 2) {
            player2 -= perda
            Global.texto.append("O " + classe + " perdeu " + String(perda) + " de HP.\n\n")
            divina += 1
        } else {
            Global.texto.append("Os deuses já não ouvem mais suas orações de inteferência ;-;\n\n")
        }
    }
    
    func interferencia(classe: String){
        Global.texto.append("O " + classe + " não perdeu nada de HP.\n\n")
        divina += 1
    }
    
    func jogo(player: String, nPlayer: Int, HP: Int){
            
            if (player == "Mago") {
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    orou = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    interferencia(classe: "Mago", perda: 32)
                }
            } else if (player == "Caçador") {
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j30(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    orou = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    interferencia(classe: "Caçador")
                }
            } else if (player == "Arqueiro") {
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    orou = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    interferencia(classe: "Arqueiro", perda: 22)
                }
            } else if (player == "Invocador") {
                Global.texto.append(texto1)
                Global.texto.append(texto2)
                Global.verificar()
                let input = Global.input
                Global.limpar()
                if (input.caseInsensitiveCompare("x") == ComparisonResult.orderedSame){
                    j20(classe: player, nPlayer: nPlayer)
                } else if (input.caseInsensitiveCompare("o") == ComparisonResult.orderedSame){
                    orou = true
                } else if (input.caseInsensitiveCompare("z") == ComparisonResult.orderedSame){
                    if (Global.padrePrimeiro && divina != 2){
                        antiReaper = true
                        Global.texto.append("A interferência divina agora lhe protege da morte.\n\n")
                        divina += 1
                        primeiroIF = true
                    } else if (divina != 2 && !primeiroIF){
                        antiReaper = true
                        Global.texto.append("Os deuses baniram o Reaper por 1 turno.\n\n")
                        divina += 1
                    } else {
                        if(primeiroIF){
                            Global.texto.append("A interferência divina agora lhe protege da morte.\n\n")
                        } else {
                            Global.texto.append("Os deuses já não ouvem mais suas orações de inteferência ;-;\n\n")
                        }
                        
                    }
                }
            }
    }
}

