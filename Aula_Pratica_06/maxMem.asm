	.data
dim:	.word	7                    		# N�mero de elementos do vetor
V:	.word	3, -5, 21, 2, -10, 50, 9	# Vetor

	.text
	la	$s0, V			# Inicializa registos para
	lw	$t0, dim		# percorrer vetor
	lw	$t1, 0($s0)		# Maximo inicial
ciclo:	addi	$t0, $t0, -1		# Atualiza n�mero de elementos a percorrer
	beq	$t0, $zero, escreve	# Se percorreu todos, escreve e termina
	addi	$s0, $s0, 4		# Atualiza endere�o para ler pr�ximo elemento
	lw	$t2, 0($s0)		# Elemento atual
	slt	$t3, $t1, $t2	        # $t3=1 indica que foi encontrado novo m�ximo
	beq	$t3, $zero, salta
	add	$t1, $t2, $zero         # Atualiza m�ximo
salta:	j	ciclo
escreve:add	$a0, $t1, $zero		# Passa para $a0 o inteiro a escrever
	addi	$v0, $zero, 1		# Identifica a opera��o 'print_int'
	syscall				# Chamada ao sistema (executa �print integer�)
	addi	$v0, $zero, 10		# Termina
	syscall

		
 
