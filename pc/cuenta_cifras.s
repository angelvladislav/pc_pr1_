# /*
# Enunciado:
# Realizar un programa que haga lo siguiente:
# 1) Pedir al usuario que introduzca por teclado dos números enteros x y c.
# 2) comprobar que x es mayor o igual que cero, y que c es mayor o igual que cero y menor o igual que nueve.
# 3) Si se cumple la condición descrita en el punto 2, el programa debe contar el número de veces que 
#    aparece la cifra c, en el número x, mostrar el resultado por pantalla y volver al punto 1.
# 4) Si no se cumple la condición descrita en el punto 2, el programa debe finalizar.

# Por ejemplo si el usuario introduce como x el valor 12242 y como c el valor 2, 
# debe imprimir por la pantalla el número 3 (que es las veces que aparece 2 en 12242).
# */

    .data
titulo: .asciiz "Este programa cuenta el numero de veces que aparece una cifra en un numero entero positivo.\n"
pet1:   .asciiz "Introduzca un numero entero positivo (introduzca negativo para finalizar el programa): "
pet2:   .asciiz "Introduzca la cifra (0-9, introduzca otra cosa para finalizar el programa): "
result: .asciiz "El numero de veces que aparece la cifra en el numero es: "
fin:    .asciiz "Fin del programa.\n"
    .text
main:   




# #include <iostream>
# int main() {
#     int x, c;
#     int cuenta = 0;
# CORRESPONDENCIA ENTRE VARIABLES Y REGISTROS
# x -> $s0
# c -> $s1
# cuenta -> $s2
# resto -> $t0

#     while (true) {
    while:
#         std::cout << "Este programa cuenta el numero de veces que aparece una cifra en un numero entero positivo.\n";
#         std::cout << "Introduzca un numero entero positivo (introduzca negativo para finalizar el programa): ";
        li $v0,4
        la $a0,titulo
        syscall
        li $v0,4
        la $a0,pet1
        syscall
#         std::cin >> x;
        li $v0,5
        syscall
        move $s0,$v0
#         if (x < 0) break;
        blt $s0,$zero,fin_while
#         std::cout << "Introduzca la cifra (0-9, introduzca otra cosa para finalizar el programa): ";
        li $v0,4
        la $a0,pet2
        syscall
#         std::cin >> c;
        li $v0,5
        syscall
        move $s1,$v0
#         if ((c < 0) || (c > 9)) break;
        blt $s1,$zero,fin_while
        bgt $s1,9,fin_while
#         cuenta = 0;
        li $s2,0
#         int resto;
#         while ( x != 0 ) {
        while2:
        beq $s0,$zero,fin_while2
#             resto = x % 10;
#             x /= 10;
        li $t1, 10
        div $s0,$t1
        mfhi $t0
        mflo $s0
#             if ( resto == c ) cuenta++;
        beq $t0,$s1,if 
        j finif
        if:
            addi $s2,1
        finif:

#         }
        j while2
        fin_while2:
#         std::cout << "El numero de veces que aparece la cifra en el numero es: " << cuenta << std::endl;
        li $v0,4
        la $a0, result
        syscall
        li $v0,1
        move $a0,$s2
        syscall
        li $v0,11
        li $a0,10
        syscall
#     }
    j while
    fin_while:
#     std::cout << "Fin del programa.\n";
#     return 0;
    li $v0,4
    la $a0,fin
    syscall
    li $v0,10
    syscall
# }