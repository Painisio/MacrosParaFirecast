--[[
Macro para calculo de Critico e Dano Critico para Tormenta RPG.
Escrita em Lua, para o Firecast 8.1b.
]]--

D20 = rolar("1d20") -- rolagem pura
Dano_base = rolar("2d4") -- dano da arma puro
Bba = 0 -- bonus base de ataque
Mod_hab = 7 -- mod habilidae
Talento_1 = -2 -- bonus/penalidade de talento
Crit_marg = 18 -- magem de critico da arma
Crit_mult = 4 -- multiplicador de critico da arma
Bonus_magico = 1 -- bonus magico se houver
Nome_arma = "Gadanho Negro" -- nome da arma


if D20 > Crit_marg then -- checagem se a arma critou...
    Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico -- calculo da margem de acerto
    Dano_final = ( Dano_base + Bonus_magico + Mod_hab ) * Crit_mult -- calculo do dano da arma
    --prints
    send("Ataque CRITICO do(a) " ..Nome_arma)
    send("Obtendo rolagem de ataque: "..Ataque)
    send("O dano foi de: "..Dano_final)
    else do
    Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico -- calculo damargem da arma
    Dano_final = Dano_base + Bonus_magico + Mod_hab -- calculo do dano da arma
    -- prints
    send("Ataque do(a) "..Nome_arma)
    send("Obtendo rolagem de ataque: "..Ataque)
    send("O dano foi de: "..Dano_final)
    end
end
