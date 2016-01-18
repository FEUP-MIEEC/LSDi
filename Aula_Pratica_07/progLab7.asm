#---------------------------------------------------------------------
# LSDI 2015/16 - FEUP
# Lab 7 (Jan. 2016)
# Ver. 2.2
#---------------------------------------------------------------------

	.data
Nmax:	.word	100
N:      .word	10   
array:	.word   0 : 100
strSum: .asciiz "Somatório = "
strAvg: .asciiz "Média = "
strMin: .asciiz "Mínimo = "
strSeq: .asciiz "Dim. maior subsequência crescente = "
space:	.asciiz " "
crlf:	.asciiz "\n"

	.text
main:   li  $v0, 40	# set seed
	li  $a0, 0
	syscall

loop:   jal menu
	bne $v0, 1, main1
	jal readN
	j   loop

main1:  bne $v0, 2, main2
	jal fill
	jal print
	j   main

main2:  bne $v0, 3, main3
	jal rnd
	jal print
	j   main

main3:  bne $v0, 4, main4
	jal print
	j   main

main4:  bne $v0, 5, main5
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array

	jal sum

	move $a0, $v0
	la  $v0, strSum
	jal result

	j   main

main5:  bne $v0, 6, main6
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array

	jal avg

	move $a0, $v0
	la  $v0, strAvg
	jal result

	j   main

main6:  bne $v0, 7, main7
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array

	jal min

	move $a0, $v0
	la  $v0, strMin
	jal result

	j   main

main7:  bne $v0, 8, main8
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array

	jal inv    # Não imprime resultado

	j   main

main8:  bne $v0, 9, main9
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array

	jal dimS

	move $a0, $v0
	la  $v0, strSeq
	jal result

	j   main

main9:  beq $v0, 0, main10
	jal err
	j   main	

main10:  li  $v0, 10
	syscall

#================================================================================================
	.data
menu0:	.asciiz	"------ MENU -------------------------------------------------------------------\n"
menu1:	.asciiz	"      Vetor: 1 - Dimensão   2 - Preencher  3 - Aleatório     4 - Imprimir\n"
menu2:	.asciiz	"  Operações: 5 - Somatório  6 - Média      7 - Valor mínimo  8 - Inverte\n"
menu3:	.asciiz	"             9 - Maior subsequência crescente                0 - Terminar\n"
menu4:	.asciiz	"Introduza a sua opção: "
#================================================================================================

	.text
menu:   li  $v0, 4
	la  $a0, menu0
	syscall
	la  $a0, menu1
	syscall
	la  $a0, menu2
	syscall
	la  $a0, menu3
	syscall
	la  $a0, menu4
	syscall

	li  $v0, 5
	syscall

	jr  $ra

#---------------------------------------------------------------------
	.data
askN:	.asciiz	"Introduza o número de elementos do vetor: "
	.text
readN:  li  $v0, 4
	la  $a0, askN
	syscall

	li  $v0, 5
	syscall
	sw  $v0, N

	jr  $ra

#---------------------------------------------------------------------

result: move $t0, $a0
	move $a0, $v0
	li   $v0, 4
	syscall

	li   $v0, 1
	move $a0, $t0
	syscall

	li   $v0, 4
	la   $a0, crlf
	syscall

	jr   $ra

#---------------------------------------------------------------------
	.data
strB:	.asciiz "º elemento do vetor = "
	.text
fill:   la   $t2, array
	la   $t0, N
	lw   $t0, ($t0)
	li   $t1, 0
fill2:  beq  $t0, $t1, fill1
	addi $t1, $t1, 1
	li   $v0, 1
	move $a0, $t1
	syscall

	li   $v0, 4
	la   $a0, strB
	syscall

	li   $v0, 5
	syscall
	sw   $v0, ($t2)
		
	addi $t2, $t2, 4

	j    fill2

fill1:  jr   $ra

#---------------------------------------------------------------------

rnd:    la  $t2, array
	la  $t0, N
	lw  $t0, ($t0)
	li  $t1, 0

rnd2:   beq $t0, $t1, rnd1
	li  $v0, 42
	li  $a0, 0
	li  $a1, 100
	syscall

	sw  $a0, ($t2)
		
	addi $t2, $t2, 4
	addi $t1, $t1, 1

	j    rnd2

rnd1:   jr   $ra

#---------------------------------------------------------------------
	.data
strA:	.asciiz "Vetor = "
	.text
print:  li  $v0, 4
	la  $a0, strA
	syscall

	la  $t2, array

	la  $t0, N
	lw  $t0, ($t0)
	li  $t1, 0
print2: beq $t0, $t1, print1
	li  $v0, 1
	lw  $a0, ($t2)
	syscall

	li  $v0, 4
	la  $a0, space
	syscall
		
	addi $t2, $t2, 4
	addi $t1, $t1, 1

	j    print2

print1: li  $v0, 4
	la  $a0, crlf
	syscall

	jr  $ra

#---------------------------------------------------------------------

	.data
errStr:	.asciiz "Opção inválida!\n"
	.text
err:    li  $v0, 4
	la  $a0, errStr
	syscall

	jr  $ra

#---------------------------------------------------------------------
# sum - cálculo do somatório dos elementos de um vetor
#
# Argumentos:
#	$a0 - dimensão do vetor
#	$a1 - endereço base do vetor
# Valor retornado
#	$v0 - somatório
# Variáveis Utilizadas nesta sub-rotina:
#	$t0 - contador do programa
#	$t1 - registo onde se guardam os números a somar
#	$t2 - apontador para o elemento seguinte do vetor
#---------------------------------------------------------------------

sum:	# coloque o seu código a partir daqui...
	addi $v0, $zero, 0
	addi $t2, $a1, 0
	addi $t0, $zero, 0
gosum:	lw $t1, 0($t2)
	add $v0, $v0, $t1
	addi $t0, $t0, 1
	addi $t2, $t2, 4
	bne $t0, $a0, gosum
	jr  $ra    # para retornar ao programa que chamou esta rotina
	

#---------------------------------------------------------------------
# avg - cálculo da média aritmética dos elementos de um vetor
#
# Argumentos:
#	$a0 - dimensão do vetor
#	$a1 - endereço base do vetor
# Valor retornado
#	$v0 - média
# Nota: A média deverá ser arredondada para o inteiro mais próximo
#---------------------------------------------------------------------

avg:	# coloque o seu código a partir daqui...
	addi $t0, $zero, 0
	add $t7, $zero, $ra
	jal sum
	add $ra, $zero, $t7
	div $v0, $a0
	mfhi $t6 		# Resto
	mflo $t5 		# Quociente
	abs $t6, $t6
	add $t6, $t6, $t6
	sle $t7, $a0, $t6
	beq $t7, $zero, avgcnt
	sle $t7, $zero, $v0
	beq $t7, $zero, avg2
	addi $t5, $t5, 1
	j avgcnt
avg2:	addi $t5, $t5, -1
avgcnt: addi $v0, $t5, 0
	jr $ra    # para retornar ao programa que chamou esta rotina


#---------------------------------------------------------------------
# min - determinação do valor mínimo dos elementos de um vetor
#
# Argumentos:
#	$a0 - dimensão do vetor
#	$a1 - endereço base do vetor
# Valor retornado
#	$v0 - valor mínimo
#---------------------------------------------------------------------

min:	# coloque o seu código a partir daqui...
	
	lw $t1, 0($a1)
	addi $v0, $t1, 0
	addi $t3, $a1, 0
	addi $t0, $zero, 0
gomin:	lw $t1, 0($t3)
	slt $t4, $t1, $v0
	bne $t4, $zero, updmin
conmin:	addi $t0, $t0, 1
	addi $t3, $t3, 4
	bne $t0, $a0, gomin
	jr  $ra    # para retornar ao programa que chamou esta rotina
	
updmin: addi $v0, $t1, 0
	j conmin

#---------------------------------------------------------------------
# inv - inverte a ordem dos elementos de um vetor
#
# Argumentos:
#	$a0 - dimensão do vetor
#	$a1 - endereço base do vetor
# Valor retornado
#	nenhum (após a operação, $a1 tem o endereço base do vetor modificado)
#---------------------------------------------------------------------
inv:	
	#apontador para o primeiro elemento de $a1
	add $s0, $a1, $zero #OK
	
	#apontador para o último elemento de $a1 
	sll $t0, $a0, 2 #cálculo quantidade de memória ocupada pelo vetor 
	add $s1, $t0, $a1 
	addi $s1, $s1, -4 #acerto para apontar para o último elemento do vetor
	
	#vars auxiliares para índices de posição atual do vetor
	addi $t0, $zero, 0
	addi $t1, $a0, 0 
	
	#ciclo
InvLoop:
	slt $t2, $t0, $t1
	beq $t2, $zero, InvEnd #fim
	
	#Nota: O valor em $t2 e $t3 pode ser sobrescrito...
	lw $t2, 0($s0)
	lw $t3, 0($s1)
	sw $t2, 0($s1)
	sw $t3, 0($s0)
	
	#atualizar endereços
	addi $s0, $s0, 4
	addi $s1, $s1, -4
	
	#atualizar índices
	addi $t0, $t0, 1
	addi $t1, $t1, -1
	j InvLoop
	
InvEnd:
	jr  $ra


#---------------------------------------------------------------------
# dimS - determinação da dimensão da maior subsequência crescente de elementos de um vetor
#
# Argumentos:
#	$a0 - dimensão do vetor
#	$a1 - endereço base do vetor
# Valor retornado
#	$v0 - dimensão da subsequência
#---------------------------------------------------------------------

# coloque o seu código a partir daqui...

dimS:	addi $s4, $a1, 0
	addi $s2, $a0, 0
	addi $v0, $zero, 0
	addi $s1, $zero, 1
	addi $s0, $zero, 1
	lw $s6, 0($s4)
ciclo:	addi $s2, $s2, -1
	beq  $s2, $zero, termina
	add $s7, $s6, $zero
	addi $s4, $s4, 4
	lw $s6, 0($s4)
	slt $t0, $s7, $s6
	beq $t0, $zero, false1
	addi $s1, $s1, 1
	j ciclo
false1:	slt $t0, $v0, $s1
	beq $t0, $zero, false2
	add $v0, $s1, $zero
false2:	addi $s1, $zero, 1
	j ciclo
termina:slt $t0, $v0, $s1
	bne $t0, $zero, false3
	j fim
false3: add $v0, $s1, $zero
	j fim
fim:	jr $ra

	jr $ra    # para retornar ao programa que chamou esta rotina
	

#---------------------------------------------------------------------
