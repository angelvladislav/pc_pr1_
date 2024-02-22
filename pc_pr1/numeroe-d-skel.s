# PR1. PRINCIPIO DE COMPUTADORES.
# Autor: Ángel Vladislav Alonso Y.
# Fecha ultima modificacion: 22/02/24

	.data

titulo:		.asciiz "\nPR1: Principio de computadores.\n"
pet:		.asciiz "\nIntroduzca maximo error permitido: "
caderr:		.asciiz "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n"
cade:		.asciiz "\nNumero e: "
cadnt:		.asciiz "\nNumero de terminos: "
cadfin:		.asciiz "\nPR1: Fin del programa.\n"

	.text

main:

# int main(int argc, char *argv[])
# {
#     double error = 0;
#     double e = 1; // 1/0!
#     double fact = 1; // 0!
#     double numterminos = 1;
#     double ultimo_termino = 1; ; // 1/0!

#     std::cout << "\nPR1: Principio de computadores.\n";
	li $v0,4
	la $a0,titulo
	syscall
#     do {
	do:
#         std::cout << "\nIntroduzca maximo error permitido: ";
	li $v0,4
	la $a0,pet
	syscall
#         std::cin >> error;
	li $v0,7
	syscall
	mov.d $f20,$f0
#         if (!(error >= 0.00001 && error < 1))
	if:
	li.d $f2,0.00001
	li.d $f4,1.0
	c.le.d $f20,$f2
	bc1f findo
	c.lt.d $f20,$f4
	bc1t findo
#             std::cout << "\nError: el dato introducido debe cumplir 0.00001 <= dato < 1\n";
	li $v0,4
	la $a0,caderr
	syscall
#         else break;
	findo:
	j findo
#     } while (true);

#     while (ultimo_termino >= error) {
#         fact *= numterminos;
#         ultimo_termino = 1/fact;
#         e += ultimo_termino;
#         numterminos++;
#     }
#     std::cout <<  "\nNumero e: ";
#     std::cout << std::fixed << std::setprecision(17) << e;
#     std::cout << "\nNumero de terminos: " << int(numterminos);
#     std::cout << "\nPR1: Fin del programa.\n";
#     return 0;
# }