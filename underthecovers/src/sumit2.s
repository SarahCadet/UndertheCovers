	.intel_syntax noprefix
	
	.section .text
	
	# tell linker that sumIt symbol can be referenced in other files	
	.global sumIt	      	      

	# code to sum data in array who's address is in rcx
	# we assume rbx has length  rbx -> len
	# and that we will leave final sum in rax
sumIt:	                         # label that marks where this code begins
	xor  rax, rax            # rax -> sum : sum = 0
	xor  rdi, rdi            # rdi -> i : i = 0

	# code to sum data at value in rcx
	# we assume rbx has length  rbx -> len
	# and that we will leave final sum in rax
loop_start:        
	cmp  rbx, rdi                       # rbx - rdi
	jz   loop_done                      # if above is zero (they are equal) jump
	add  rax, QWORD PTR [rcx + rdi * 8] # add the i'th value to the sum
	inc  rdi                            # i=i+1
	jmp   loop_start                    # go back to the start of the loop
loop_done:
	jmp RETURN_1                        # jump back to hard coded location

