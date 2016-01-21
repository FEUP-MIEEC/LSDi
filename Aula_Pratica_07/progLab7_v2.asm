#---------------------------------------------------------------------
# LSDI 2015/16 - FEUP
# Lab 7 (Jan. 2016) - Preparado para a parte 2 (operações com 2 vetores)
# Ver. 2.2
#-----------------------------------------------------------------------

	.data
Nmax:	.word	100
N:      .word	10   
array1:	.word   0 : 100
array2:	.word   0 : 100
strSumV:.asciiz "Vetor soma = "
strPint:.asciiz "Produto interno = "
strMenM:.asciiz "Menor mínimo = "
strNigs:.asciiz "Número de elementos iguais = "
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
	jal fillV1
	jal printV1
	j   main

main2:  bne $v0, 3, main3
	jal fillV2
	jal printV2
	j   main

main3:  bne $v0, 4, main4
	jal printV1
	j   main

main4:  bne $v0, 5, main5
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array1
	la  $a2, array2

	jal sumV

	jal printV1

	j   main

main5:  bne $v0, 6, main6
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array1
	la  $a2, array2
	
	jal prodInt

	move $a0, $v0
	la  $v0, strPint
	jal result

	j   main

main6:  bne $v0, 7, main7
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array1
	la  $a2, array2

	jal menMin

	move $a0, $v0
	la  $v0, strMenM
	jal result

	j   main

main7:  bne $v0, 8, main9    # v2
	la  $a0, N
	lw  $a0, ($a0)
	la  $a1, array1
	la  $a2, array2

	jal com

	move $a0, $v0
	la  $v0, strNigs
	jal result
	
	j   main


main9:  beq $v0, 0, main10
	jal err
	j   main	

main10: li  $v0, 10
	syscall

#================================================================================================
	.data
menu0:	.asciiz	"------ MENU v2 ------------------------------------------------------------------\n"
menu1:	.asciiz	"      Vetor: 1-Dimensão    2-Preenche V1     3-Preenche V2     4-Imprimir V1\n"
menu2:	.asciiz	"  Operações: 5-Vetor soma  6-Produto interno 7-Menor mínimo    8-Elementos iguais\n"
menu3:	.asciiz	"                                                               0 - Terminar\n"
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
askN:	.asciiz	"Introduza o número de elementos dos vetores: "
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
strB1:	.asciiz "º elemento do vetor 1 = "
	.text
fillV1: la   $t2, array1
	la   $t0, N
	lw   $t0, ($t0)
	li   $t1, 0
fill2:  beq  $t0, $t1, fill1
	addi $t1, $t1, 1
	li   $v0, 1
	move $a0, $t1
	syscall

	li   $v0, 4
	la   $a0, strB1
	syscall

	li   $v0, 5
	syscall
	sw   $v0, ($t2)
		
	addi $t2, $t2, 4

	j    fill2

fill1:  jr   $ra

#---------------------------------------------------------------------
	.data
strB2:	.asciiz "º elemento do vetor 2 = "
	.text
fillV2: la   $t2, array2
	la   $t0, N
	lw   $t0, ($t0)
	li   $t1, 0
fill4:  beq  $t0, $t1, fill3
	addi $t1, $t1, 1
	li   $v0, 1
	move $a0, $t1
	syscall

	li   $v0, 4
	la   $a0, strB2
	syscall

	li   $v0, 5
	syscall
	sw   $v0, ($t2)
		
	addi $t2, $t2, 4

	j    fill4

fill3:  jr   $ra


#---------------------------------------------------------------------
	.data
strA1:	.asciiz "Vetor 1 = "
	.text
printV1:li  $v0, 4
	la  $a0, strA1
	syscall

	la  $t2, array1

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
strA2:	.asciiz "Vetor 2 = "
	.text
printV2:li  $v0, 4
	la  $a0, strA2
	syscall

	la  $t2, array2

	la  $t0, N
	lw  $t0, ($t0)
	li  $t1, 0
print4: beq $t0, $t1, print3
	li  $v0, 1
	lw  $a0, ($t2)
	syscall

	li  $v0, 4
	la  $a0, space
	syscall
		
	addi $t2, $t2, 4
	addi $t1, $t1, 1

	j    print4

print3: li  $v0, 4
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
# sumV - cálculo da soma de dois vetores
#
# Argumentos:
#	$a0 - dimensão dos vetores
#	$a1 - endereço base do vetor 1
#	$a2 - endereço base do vetor 2
# Valor retornado
#	nenhum: após a operação, $a1 tem o endereço base do vetor 
#               soma (o vetor 1 original é perdido)
#---------------------------------------------------------------------
#
# 	Created on: 14/01/2016
#      	Author: Daniel Silva
#
sumV:	# coloque o seu código a partir daqui...
	add $t0, $a0, $zero
	add $t1, $a1, $zero
	add $t2, $a2, $zero
sumC:	beq $t0, $zero, sumFim
	lw $t3, 0($t1)
	lw $t4, 0($t2)
	add $t3, $t3, $t4
	sw $t3, 0($t1)
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t0, $t0, -1
	j sumC
	
sumFim:	jr  $ra    # para retornar ao programa que chamou esta rotina


#---------------------------------------------------------------------
# prodInt - cálculo do produto interno de dois vetores
#
# Argumentos:
#	$a0 - dimensão dos vetores
#	$a1 - endereço base do vetor 1
#	$a2 - endereço base do vetor 2
# Valor retornado
#	$v0 - produto interno
#---------------------------------------------------------------------
#
# 	Created on: 14/01/2016
#      	Author: Daniel Silva
#
	
prodInt:	# coloque o seu código a partir daqui...
	add $t0, $a0, $zero
	add $t1, $a1, $zero
	add $t2, $a2, $zero
	add $v0, $zero, $zero
PIC:	beq $t0, $zero, PIFim
	lw $t3, 0($t1)
	lw $t4, 0($t2)
	mul $t3, $t3, $t4
	add $v0, $v0, $t3
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t0, $t0, -1
	j PIC
	
PIFim:	jr  $ra    # para retornar ao programa que chamou esta rotina


#---------------------------------------------------------------------
# menMin - determinação do menor dos mínimos dos vetores
#
# Argumentos:
#	$a0 - dimensão dos vetores
#	$a1 - endereço base do vetor 1
#	$a2 - endereço base do vetor 2
# Valor retornado
#	$v0 - valor do menor mínimo
#---------------------------------------------------------------------
#
# 	Created on: 14/01/2016
#      	Author: Daniel Silva
#
menMin:	# coloque o seu código a partir daqui...
	add $t0, $a0, $zero
	add $t1, $a1, $zero
	add $t2, $a2, $zero
	add $v0, $t1, $zero
MinC:	beq $t0, $zero, MinFim
	lw $t3, 0($t1)
	lw $t4, 0($t2)
	slt $t5, $t3, $v0
	bne $t5, $zero, up1min
co1min:	slt $t5, $t4, $v0
	bne $t5, $zero, up2min
co2min:	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t0, $t0, -1
	j MinC
	
MinFim:	jr  $ra    # para retornar ao programa que chamou esta rotina

up1min: addi $v0, $t3, 0
	j co1min
up2min: addi $v0, $t4, 0
	j co2min

#---------------------------------------------------------------------
# com - determinação do número de elementos comuns aos dois vetores
#
# Argumentos:
#	$a0 - dimensão dos vetores
#	$a1 - endereço base do vetor 1
#	$a2 - endereço base do vetor 2
# Valor retornado
#	$v0 - número de elementos
#---------------------------------------------------------------------
#
# 	Created on: 14/01/2016
#      	Author: Daniel Silva
#
com:	# coloque o seu código a partir daqui...
	add $t0, $a0, $zero
	add $t1, $a1, $zero
	add $v0, $zero, $zero
comC:	beq $t0, $zero, comFim
	lw  $t3, 0($t1)
	add $t7, $a0, $zero
	add $t2, $a2, $zero
com2:	lw  $t4, 0($t2)
	addi $t2, $t2, 4
	beq $t7, $zero, cntCom
	addi $t7, $t7, -1
	beq $t3, $t4, upd2c
com2ct:	j com2
cntCom: addi $t1, $t1, 4
	addi $t0, $t0, -1
	j comC
	
comFim:	jr  $ra    # para retornar ao programa que chamou esta rotina

upd2c: addi $v0, $v0, 1
	j cntCom

