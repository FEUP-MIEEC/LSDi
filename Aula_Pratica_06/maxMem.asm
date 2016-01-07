	.data
dim:	.word	7                    		# Número de elementos do vetor
V:	.word	3, -5, 21, 2, -10, 50, 9	# Vetor

	.text
	la	$s0, V			# Inicializa registos para
	lw	$t0, dim		# percorrer vetor
	lw	$t1, 0($s0)		# Maximo inicial
ciclo:	addi	$t0, $t0, -1		# Atualiza número de elementos a percorrer
	beq	$t0, $zero, escreve	# Se percorreu todos, escreve e termina
	addi	$s0, $s0, 4		# Atualiza endereço para ler próximo elemento
	lw	$t2, 0($s0)		# Elemento atual
	slt	$t3, $t1, $t2	        # $t3=1 indica que foi encontrado novo máximo
	beq	$t3, $zero, salta
	add	$t1, $t2, $zero         # Atualiza máximo
salta:	j	ciclo
escreve:add	$a0, $t1, $zero		# Passa para $a0 o inteiro a escrever
	addi	$v0, $zero, 1		# Identifica a operação 'print_int'
	syscall				# Chamada ao sistema (executa ’print integer’)
	addi	$v0, $zero, 10		# Termina
	syscall

		
 
