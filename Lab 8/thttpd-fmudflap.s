	.file	"thttpd.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"thttpd.c:2112:21 (wakeup_connection)"
	.align 8
.LC1:
	.string	"thttpd.c:2113:11 (wakeup_connection)"
	.align 8
.LC2:
	.string	"thttpd.c:2115:16 (wakeup_connection)"
	.align 8
.LC3:
	.string	"thttpd.c:2116:19 (wakeup_connection)"
	.align 8
.LC4:
	.string	"thttpd.c:2116:16 (wakeup_connection)"
	.text
	.p2align 4,,15
	.type	wakeup_connection, @function
wakeup_connection:
.LFB99:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rsi
	leaq	103(%rdi), %rdx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	shrq	%cl, %rsi
	andq	%rax, %rsi
	salq	$4, %rsi
	cmpq	%rdi, __mf_lookup_cache(%rsi)
	ja	.L13
	cmpq	__mf_lookup_cache+8(%rsi), %rdx
	ja	.L13
.L2:
	movq	%rbx, %rdx
	movq	$0, 96(%rbx)
	leaq	3(%rbx), %rbp
	shrq	%cl, %rdx
	andq	%rax, %rdx
	salq	$4, %rdx
	cmpq	%rbx, __mf_lookup_cache(%rdx)
	ja	.L14
	cmpq	__mf_lookup_cache+8(%rdx), %rbp
	ja	.L14
.L4:
	cmpl	$3, (%rbx)
	je	.L19
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	movq	%rbx, %rdx
	shrq	%cl, %rdx
	andq	%rax, %rdx
	salq	$4, %rdx
	cmpq	%rbx, __mf_lookup_cache(%rdx)
	ja	.L15
	cmpq	__mf_lookup_cache+8(%rdx), %rbp
	ja	.L15
.L7:
	movq	%rbx, %rsi
	movl	$2, (%rbx)
	leaq	15(%rbx), %rdx
	shrq	%cl, %rsi
	andq	%rax, %rsi
	salq	$4, %rsi
	cmpq	%rbx, __mf_lookup_cache(%rsi)
	ja	.L16
	cmpq	__mf_lookup_cache+8(%rsi), %rdx
	ja	.L16
.L9:
	movq	8(%rbx), %rbp
	movq	%rbp, %rsi
	leaq	707(%rbp), %rdx
	shrq	%cl, %rsi
	movq	%rsi, %rcx
	andq	%rax, %rcx
	salq	$4, %rcx
	cmpq	__mf_lookup_cache(%rcx), %rbp
	jb	.L17
	cmpq	__mf_lookup_cache+8(%rcx), %rdx
	ja	.L17
.L11:
	movl	704(%rbp), %edi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	movl	$1, %edx
	jmp	fdwatch_add_fd
.L15:
	.cfi_restore_state
	movl	$.LC2, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L7
.L14:
	movl	$.LC1, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L4
.L13:
	movl	$.LC0, %ecx
	movl	$1, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L2
.L17:
	movl	$.LC4, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%rbp, %rdi
	call	__mf_check
	jmp	.L11
.L16:
	movl	$.LC3, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L9
	.cfi_endproc
.LFE99:
	.size	wakeup_connection, .-wakeup_connection
	.p2align 4,,15
	.type	handle_hup, @function
handle_hup:
.LFB73:
	.cfi_startproc
	movl	$1, got_hup(%rip)
	ret
	.cfi_endproc
.LFE73:
	.size	handle_hup, .-handle_hup
	.section	.rodata
	.align 8
.LC5:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.section	.text.unlikely,"ax",@progbits
	.type	usage, @function
usage:
.LFB80:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	movl	$.LC5, %edx
	movq	argv0(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE80:
	.size	usage, .-usage
	.section	.rodata
	.align 8
.LC6:
	.string	"thttpd.c:2052:21 (really_clear_connection)"
	.align 8
.LC7:
	.string	"thttpd.c:2052:25 (really_clear_connection)"
	.align 8
.LC8:
	.string	"thttpd.c:2053:11 (really_clear_connection)"
	.align 8
.LC9:
	.string	"thttpd.c:2054:16 (really_clear_connection)"
	.align 8
.LC10:
	.string	"thttpd.c (really_clear_connection)"
	.align 8
.LC11:
	.string	"thttpd.c:1929:29 (really_clear_connection)"
	.align 8
.LC12:
	.string	"thttpd.c:1930:22 (really_clear_connection)"
	.align 8
.LC13:
	.string	"thttpd.c:1930:29 (really_clear_connection)"
	.align 8
.LC14:
	.string	"thttpd.c:1930:2 (really_clear_connection)"
	.align 8
.LC15:
	.string	"thttpd.c:2057:11 (really_clear_connection)"
	.align 8
.LC16:
	.string	"thttpd.c:2060:18 (really_clear_connection)"
	.align 8
.LC17:
	.string	"thttpd.c:2062:19 (really_clear_connection)"
	.align 8
.LC18:
	.string	"thttpd.c:2063:26 (really_clear_connection)"
	.text
	.p2align 4,,15
	.type	really_clear_connection, @function
really_clear_connection:
.LFB97:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	15(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rdi
	jb	.L53
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L53
.L23:
	movq	8(%r12), %rbx
	movq	%rbx, %rsi
	leaq	207(%rbx), %rax
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L54
	cmpq	__mf_lookup_cache+8(%rsi), %rax
	ja	.L54
.L25:
	movq	200(%rbx), %rax
	addq	%rax, stats_bytes(%rip)
	leaq	3(%r12), %rax
	movq	%rax, 24(%rsp)
	movq	%r12, %rax
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	leaq	__mf_lookup_cache(%rax), %rsi
	jb	.L55
	movq	24(%rsp), %rax
	cmpq	8(%rsi), %rax
	ja	.L55
.L27:
	cmpl	$3, (%r12)
	je	.L29
	movq	%rbx, %rsi
	leaq	707(%rbx), %rax
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L56
	cmpq	__mf_lookup_cache+8(%rsi), %rax
	ja	.L56
.L30:
	movl	704(%rbx), %edi
	movq	%rdx, 8(%rsp)
	movb	%cl, 16(%rsp)
	call	fdwatch_del_fd
	movzbl	16(%rsp), %ecx
	movq	8(%rsp), %rdx
	movq	%r12, %rax
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L57
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L57
.L32:
	movq	8(%r12), %rbx
.L29:
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rdx, 8(%rsp)
	movb	%cl, 16(%rsp)
	call	httpd_close_conn
	movzbl	16(%rsp), %ecx
	movq	8(%rsp), %rdx
	movq	%r12, %rsi
	leaq	59(%r12), %rax
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %r12
	jb	.L58
	cmpq	__mf_lookup_cache+8(%rsi), %rax
	ja	.L58
.L34:
	movl	56(%r12), %r15d
	testl	%r15d, %r15d
	jle	.L36
	movq	throttles(%rip), %rax
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	16(%r12,%rbp,4), %rdi
	leaq	19(%r12,%rbp,4), %rsi
	movq	%rdi, %r8
	shrq	%cl, %r8
	andq	%rdx, %r8
	salq	$4, %r8
	cmpq	%rdi, __mf_lookup_cache(%r8)
	ja	.L59
	cmpq	%rsi, __mf_lookup_cache+8(%r8)
	jb	.L59
.L37:
	movslq	16(%r12,%rbp,4), %rsi
	leaq	(%rsi,%rsi,2), %rbx
	salq	$4, %rbx
	addq	%rax, %rbx
	movq	%rbx, %rsi
	leaq	43(%rbx), %r13
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L60
	cmpq	__mf_lookup_cache+8(%rsi), %r13
	ja	.L60
.L39:
	movq	%rbx, %rsi
	movl	40(%rbx), %r14d
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	subl	$1, %r14d
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L61
	cmpq	__mf_lookup_cache+8(%rsi), %r13
	ja	.L61
.L41:
	addq	$1, %rbp
	movl	%r14d, 40(%rbx)
	cmpl	%ebp, %r15d
	jg	.L43
.L36:
	movq	%r12, %rax
	leaq	111(%r12), %rbx
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L62
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L62
.L44:
	movq	104(%r12), %rdi
	testq	%rdi, %rdi
	je	.L46
	movq	%rdx, 8(%rsp)
	movb	%cl, 16(%rsp)
	call	tmr_cancel
	movzbl	16(%rsp), %ecx
	movq	8(%rsp), %rdx
	movq	%r12, %rax
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L63
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L63
.L47:
	movq	$0, 104(%r12)
.L46:
	movq	%r12, %rax
	shrq	%cl, %rax
	andq	%rdx, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	leaq	__mf_lookup_cache(%rax), %rsi
	jb	.L64
	movq	24(%rsp), %rax
	cmpq	8(%rsi), %rax
	ja	.L64
.L49:
	movq	%r12, %rsi
	movl	$0, (%r12)
	movl	first_free_connect(%rip), %ebx
	shrq	%cl, %rsi
	leaq	7(%r12), %rax
	movq	%rsi, %rcx
	andq	%rdx, %rcx
	salq	$4, %rcx
	cmpq	__mf_lookup_cache(%rcx), %r12
	jb	.L65
	cmpq	__mf_lookup_cache+8(%rcx), %rax
	ja	.L65
.L51:
	movl	%ebx, 4(%r12)
	subq	connects(%rip), %r12
	movabsq	$-8198552921648689607, %rax
	subl	$1, num_connects(%rip)
	sarq	$4, %r12
	imulq	%rax, %r12
	movl	%r12d, first_free_connect(%rip)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L53:
	.cfi_restore_state
	movl	$.LC6, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L23
.L65:
	movl	$.LC18, %ecx
	movl	$1, %edx
	movl	$8, %esi
	movq	%r12, %rdi
	call	__mf_check
	jmp	.L51
.L64:
	movl	$.LC17, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L49
.L63:
	movl	$.LC16, %ecx
	movl	$1, %edx
	movl	$112, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L47
.L62:
	movl	$.LC15, %ecx
	xorl	%edx, %edx
	movl	$112, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L44
.L61:
	movl	$.LC14, %ecx
	movl	$1, %edx
	movl	$44, %esi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	16(%rsp), %rax
	jmp	.L41
.L60:
	movl	$.LC13, %ecx
	xorl	%edx, %edx
	movl	$44, %esi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	16(%rsp), %rax
	jmp	.L39
.L59:
	subq	%rdi, %rsi
	movl	$.LC12, %ecx
	xorl	%edx, %edx
	addq	$1, %rsi
	movq	%rax, 16(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	16(%rsp), %rax
	jmp	.L37
.L58:
	movl	$.LC11, %ecx
	xorl	%edx, %edx
	movl	$60, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L34
.L57:
	movl	$.LC10, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L32
.L56:
	subq	%rbx, %rax
	movl	$.LC9, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L30
.L55:
	movl	$.LC8, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L27
.L54:
	subq	%rbx, %rax
	movl	$.LC7, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	jmp	.L25
	.cfi_endproc
.LFE97:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
	.align 8
.LC19:
	.string	"thttpd.c:2126:21 (linger_clear_connection)"
	.text
	.p2align 4,,15
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB100:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	%rdi, %rdx
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	leaq	111(%rdi), %rax
	shrq	%cl, %rdx
	andq	__mf_lc_mask(%rip), %rdx
	salq	$4, %rdx
	cmpq	%rdi, __mf_lookup_cache(%rdx)
	ja	.L70
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L70
.L68:
	movq	$0, 104(%rbx)
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	16(%rsp), %rbp
	movq	8(%rsp), %rbx
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	really_clear_connection
.L70:
	.cfi_restore_state
	movl	$.LC19, %ecx
	movl	$1, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	call	__mf_check
	jmp	.L68
	.cfi_endproc
.LFE100:
	.size	linger_clear_connection, .-linger_clear_connection
	.section	.rodata
	.align 8
.LC20:
	.string	"thttpd.c:1947:46 (update_throttles)"
	.align 8
.LC21:
	.string	"thttpd.c:1947:69 (update_throttles)"
	.align 8
.LC22:
	.string	"thttpd.c:1947:23 (update_throttles)"
	.align 8
.LC23:
	.string	"thttpd.c:1948:34 (update_throttles)"
	.align 8
.LC24:
	.string	"thttpd.c:1950:45 (update_throttles)"
	.align 8
.LC25:
	.string	"thttpd.c:1950:74 (update_throttles)"
	.align 8
.LC26:
	.string	"thttpd.c:1953:9 (update_throttles)"
	.align 8
.LC27:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
.LC28:
	.string	"thttpd.c (update_throttles)"
	.align 8
.LC29:
	.string	"thttpd.c:1955:9 (update_throttles)"
	.align 8
.LC30:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 8
.LC31:
	.string	"thttpd.c:1957:45 (update_throttles)"
	.align 8
.LC32:
	.string	"thttpd.c:1957:74 (update_throttles)"
	.align 8
.LC33:
	.string	"thttpd.c:1959:12 (update_throttles)"
	.align 8
.LC34:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.align 8
.LC35:
	.string	"thttpd.c:1969:8 (update_throttles)"
	.align 8
.LC36:
	.string	"thttpd.c:1971:19 (update_throttles)"
	.align 8
.LC37:
	.string	"thttpd.c:1972:30 (update_throttles)"
	.align 8
.LC38:
	.string	"thttpd.c:1974:8 (update_throttles)"
	.align 8
.LC39:
	.string	"thttpd.c:1975:22 (update_throttles)"
	.align 8
.LC40:
	.string	"thttpd.c:1975:50 (update_throttles)"
	.align 8
.LC41:
	.string	"thttpd.c:1977:20 (update_throttles)"
	.align 8
.LC42:
	.string	"thttpd.c:1979:20 (update_throttles)"
	.text
	.p2align 4,,15
	.type	update_throttles, @function
update_throttles:
.LFB94:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	numthrottles(%rip), %edx
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	testl	%edx, %edx
	jle	.L72
	xorl	%r10d, %r10d
	xorl	%r15d, %r15d
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L97:
	addl	$1, %r15d
	addq	$48, %r10
	cmpl	%r15d, numthrottles(%rip)
	jle	.L72
.L102:
	movq	%r10, %r12
	addq	throttles(%rip), %r12
	movl	%ebx, %ecx
	movq	%r12, %rax
	leaq	31(%r12), %r13
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L127
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L127
.L73:
	movq	%r12, %rdx
	movl	%ebx, %ecx
	movq	24(%r12), %rax
	shrq	%cl, %rdx
	leaq	39(%r12), %r14
	andq	%rbp, %rdx
	salq	$4, %rdx
	addq	%rax, %rax
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L128
	cmpq	__mf_lookup_cache+8(%rdx), %r14
	ja	.L128
.L75:
	movq	32(%r12), %rdx
	movq	%rdx, %rcx
	shrq	$63, %rcx
	addq	%rdx, %rcx
	sarq	%rcx
	addq	%rax, %rcx
	movabsq	$6148914691236517206, %rax
	imulq	%rcx
	sarq	$63, %rcx
	movq	%r12, %rax
	movq	%rdx, %r9
	subq	%rcx, %r9
	movl	%ebx, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L129
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L129
.L77:
	movq	%r12, %rax
	movl	%ebx, %ecx
	movq	%r9, 24(%r12)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r12
	jb	.L130
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L130
.L79:
	movq	%r12, %rdx
	movl	%ebx, %ecx
	movq	$0, 32(%r12)
	shrq	%cl, %rdx
	leaq	15(%r12), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L131
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L131
.L81:
	movq	8(%r12), %r13
	cmpq	%r13, %r9
	jle	.L83
	movq	%r12, %rdx
	movl	%ebx, %ecx
	leaq	43(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L132
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L132
.L84:
	movl	40(%r12), %r14d
	testl	%r14d, %r14d
	je	.L83
	leaq	(%r13,%r13), %rax
	movq	%r12, %rdx
	movl	%ebx, %ecx
	cmpq	%rax, %r9
	leaq	7(%r12), %rax
	jle	.L86
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L133
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L133
.L87:
	movl	%r14d, 8(%rsp)
	movq	%r13, (%rsp)
	movl	%r15d, %ecx
	movq	(%r12), %r8
	movl	$.LC27, %edx
	movl	$1, %esi
	movl	$5, %edi
.L155:
	xorl	%eax, %eax
	movq	%r10, 24(%rsp)
	call	__syslog_chk
	movq	24(%rsp), %r10
	movl	%ebx, %ecx
	movq	%r10, %r12
	addq	throttles(%rip), %r12
	movq	%r12, %rdx
	leaq	31(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L136
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L136
.L93:
	movq	24(%r12), %r9
.L83:
	movq	%r12, %rdx
	movl	%ebx, %ecx
	leaq	23(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L137
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L137
.L95:
	movq	16(%r12), %r13
	cmpq	%r13, %r9
	jge	.L97
	movq	%r12, %rdx
	movl	%ebx, %ecx
	leaq	43(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L138
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L138
.L98:
	movl	40(%r12), %r14d
	testl	%r14d, %r14d
	je	.L97
	movq	%r12, %rdx
	movl	%ebx, %ecx
	leaq	7(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L139
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L139
.L100:
	movl	%r14d, 8(%rsp)
	movq	%r13, (%rsp)
	movl	%r15d, %ecx
	movq	(%r12), %r8
	movl	$.LC34, %edx
	movl	$1, %esi
	movl	$5, %edi
	xorl	%eax, %eax
	movq	%r10, 24(%rsp)
	call	__syslog_chk
	movq	24(%rsp), %r10
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L86:
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L135
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L135
.L91:
	movl	%r14d, 8(%rsp)
	movq	%r13, (%rsp)
	movl	%r15d, %ecx
	movq	(%r12), %r8
	movl	$.LC30, %edx
	movl	$1, %esi
	movl	$6, %edi
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L72:
	movl	max_connects(%rip), %eax
	testl	%eax, %eax
	movl	%eax, 68(%rsp)
	jle	.L71
	movq	throttles(%rip), %r11
	movq	connects(%rip), %r13
	xorl	%r10d, %r10d
	movl	%ebx, %ecx
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L106:
	addl	$1, %r10d
	addq	$144, %r13
	cmpl	%r10d, 68(%rsp)
	jle	.L71
.L126:
	movq	%r13, %rdx
	leaq	3(%r13), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	%r13, __mf_lookup_cache(%rdx)
	ja	.L140
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L140
.L104:
	movl	0(%r13), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L106
	leaq	64(%r13), %r14
	leaq	71(%r13), %rbx
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L141
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L141
.L107:
	leaq	56(%r13), %rdi
	movq	$-1, 64(%r13)
	leaq	59(%r13), %rax
	movq	%rdi, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L142
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L142
.L109:
	movl	56(%r13), %eax
	testl	%eax, %eax
	jle	.L106
	subl	$1, %eax
	movq	%r13, %r12
	movq	$-1, %r15
	leaq	4(%r13,%rax,4), %r9
	movq	%rbx, %rax
	subq	%r14, %rax
	addq	$1, %rax
	movq	%rax, 72(%rsp)
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L117:
	cmpq	%rax, %r15
	movq	%r14, %rdx
	cmovle	%r15, %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L147
	cmpq	__mf_lookup_cache+8(%rdx), %rbx
	ja	.L147
.L121:
	addq	$4, %r12
	movq	%rax, 64(%r13)
	cmpq	%r9, %r12
	je	.L106
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L148
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L148
.L123:
	movq	64(%r13), %r15
.L125:
	leaq	16(%r12), %rdi
	leaq	19(%r12), %rax
	movq	%rdi, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L143
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L143
.L111:
	movslq	16(%r12), %rax
	leaq	(%rax,%rax,2), %r8
	salq	$4, %r8
	addq	%r11, %r8
	movq	%r8, %rdx
	leaq	15(%r8), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r8
	jb	.L144
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L144
.L113:
	movq	%r8, %rsi
	movq	8(%r8), %rax
	leaq	43(%r8), %rdx
	shrq	%cl, %rsi
	andq	%rbp, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %r8
	jb	.L145
	cmpq	__mf_lookup_cache+8(%rsi), %rdx
	ja	.L145
.L115:
	movslq	40(%r8), %rsi
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	%rsi
	cmpq	$-1, %r15
	jne	.L117
	movq	%r14, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L146
	cmpq	__mf_lookup_cache+8(%rdx), %rbx
	jbe	.L121
.L146:
	movl	$.LC41, %ecx
.L153:
	movq	72(%rsp), %rsi
	movl	$1, %edx
	movq	%r14, %rdi
	movq	%rax, 48(%rsp)
	movq	%r9, 32(%rsp)
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	movq	32(%rsp), %r9
	movq	48(%rsp), %rax
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L71:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L127:
	.cfi_restore_state
	movq	%r13, %rsi
	movl	$.LC20, %ecx
	xorl	%edx, %edx
	subq	%r12, %rsi
	movq	%r12, %rdi
	movq	%r10, 24(%rsp)
	addq	$1, %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	jmp	.L73
.L148:
	movq	72(%rsp), %rsi
	movl	$.LC28, %ecx
	xorl	%edx, %edx
	movq	%r14, %rdi
	movq	%r9, 32(%rsp)
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	movq	32(%rsp), %r9
	jmp	.L123
.L147:
	movl	$.LC42, %ecx
	jmp	.L153
.L145:
	movl	$.LC40, %ecx
	movq	%r8, %rdi
	xorl	%edx, %edx
	movl	$44, %esi
	movq	%rax, 48(%rsp)
	movq	%r8, 56(%rsp)
	movq	%r9, 32(%rsp)
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	movq	32(%rsp), %r9
	movq	56(%rsp), %r8
	movq	48(%rsp), %rax
	jmp	.L115
.L144:
	movl	$.LC39, %ecx
	movq	%r8, %rdi
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r8, 56(%rsp)
	movq	%r9, 32(%rsp)
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	movq	32(%rsp), %r9
	movq	56(%rsp), %r8
	jmp	.L113
.L143:
	subq	%rdi, %rax
	movl	$.LC38, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r9, 32(%rsp)
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	movq	32(%rsp), %r9
	jmp	.L111
.L142:
	subq	%rdi, %rax
	movl	$.LC37, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	jmp	.L109
.L141:
	movq	%rbx, %rsi
	movl	$.LC36, %ecx
	movl	$1, %edx
	subq	%r14, %rsi
	movq	%r14, %rdi
	movl	%r10d, 24(%rsp)
	addq	$1, %rsi
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	jmp	.L107
.L140:
	subq	%r13, %rax
	movl	$.LC35, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r13, %rdi
	movl	%r10d, 24(%rsp)
	movq	%r11, 40(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movq	40(%rsp), %r11
	movl	24(%rsp), %r10d
	jmp	.L104
.L135:
	subq	%r12, %rax
	movl	$.LC29, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L91
.L139:
	subq	%r12, %rax
	movl	$.LC33, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L100
.L138:
	subq	%r12, %rax
	movl	$.LC32, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L98
.L137:
	subq	%r12, %rax
	movl	$.LC31, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L95
.L136:
	subq	%r12, %rax
	movl	$.LC28, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	jmp	.L93
.L133:
	subq	%r12, %rax
	movl	$.LC26, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L87
.L132:
	subq	%r12, %rax
	movl	$.LC25, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L84
.L131:
	subq	%r12, %rax
	movl	$.LC24, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L81
.L130:
	movq	%r14, %rsi
	movl	$.LC23, %ecx
	movl	$1, %edx
	subq	%r12, %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	addq	$1, %rsi
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L79
.L129:
	movq	%r13, %rsi
	movl	$.LC22, %ecx
	movl	$1, %edx
	subq	%r12, %rsi
	movq	%r12, %rdi
	movq	%r9, 32(%rsp)
	addq	$1, %rsi
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	jmp	.L77
.L128:
	movq	%r14, %rsi
	movl	$.LC21, %ecx
	xorl	%edx, %edx
	subq	%r12, %rsi
	movq	%r12, %rdi
	movq	%rax, 48(%rsp)
	addq	$1, %rsi
	movq	%r10, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebx
	movq	__mf_lc_mask(%rip), %rbp
	movq	24(%rsp), %r10
	movq	48(%rsp), %rax
	jmp	.L75
	.cfi_endproc
.LFE94:
	.size	update_throttles, .-update_throttles
	.section	.rodata
.LC43:
	.string	"too many connections!"
	.align 8
.LC44:
	.string	"thttpd.c:1528:63 (handle_newconnect)"
	.align 8
.LC45:
	.string	"the connects free list is messed up"
	.align 8
.LC46:
	.string	"thttpd.c:1535:8 (handle_newconnect)"
	.align 8
.LC47:
	.string	"thttpd.c:1537:12 (handle_newconnect)"
	.align 8
.LC48:
	.string	"out of memory allocating an httpd_conn"
	.align 8
.LC49:
	.string	"thttpd.c:1543:25 (handle_newconnect)"
	.align 8
.LC50:
	.string	"thttpd.c:1561:16 (handle_newconnect)"
	.align 8
.LC51:
	.string	"thttpd.c:1563:24 (handle_newconnect)"
	.align 8
.LC52:
	.string	"thttpd.c:1564:23 (handle_newconnect)"
	.align 8
.LC53:
	.string	"thttpd.c:1567:20 (handle_newconnect)"
	.align 8
.LC54:
	.string	"thttpd.c:1567:15 (handle_newconnect)"
	.align 8
.LC55:
	.string	"thttpd.c:1568:18 (handle_newconnect)"
	.align 8
.LC56:
	.string	"thttpd.c:1569:18 (handle_newconnect)"
	.align 8
.LC57:
	.string	"thttpd.c:1570:21 (handle_newconnect)"
	.align 8
.LC58:
	.string	"thttpd.c:1571:14 (handle_newconnect)"
	.align 8
.LC59:
	.string	"thttpd.c:1574:21 (handle_newconnect)"
	.align 8
.LC60:
	.string	"thttpd.c:1574:18 (handle_newconnect)"
	.align 8
.LC61:
	.string	"thttpd.c:1576:19 (handle_newconnect)"
	.align 8
.LC62:
	.string	"thttpd.c:1576:16 (handle_newconnect)"
	.text
	.p2align 4,,15
	.type	handle_newconnect, @function
handle_newconnect:
.LFB88:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	7(%rdi), %rdx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	movl	num_connects(%rip), %eax
	movl	%esi, 20(%rsp)
	movq	%rdx, 24(%rsp)
.L221:
	cmpl	%eax, max_connects(%rip)
	jle	.L223
	movl	first_free_connect(%rip), %eax
	cmpl	$-1, %eax
	je	.L159
	cltq
	movl	%r15d, %ecx
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
	movq	%rbx, %rax
	leaq	3(%rbx), %r14
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L202
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L202
.L160:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L159
	movq	%rbx, %rax
	movl	%r15d, %ecx
	leaq	15(%rbx), %r12
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L203
	cmpq	__mf_lookup_cache+8(%rax), %r12
	ja	.L203
.L163:
	movq	8(%rbx), %rax
	testq	%rax, %rax
	je	.L224
.L165:
	movl	20(%rsp), %esi
	movq	hs(%rip), %rdi
	movq	%rax, %rdx
	call	httpd_get_conn
	testl	%eax, %eax
	jne	.L225
	movq	%r13, %rdi
	call	tmr_run
	xorl	%eax, %eax
.L158:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L225:
	.cfi_restore_state
	cmpl	$2, %eax
	je	.L226
	movq	%rbx, %rax
	movl	%r15d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L206
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L206
.L173:
	movq	%rbx, %rax
	movl	%r15d, %ecx
	movl	$1, (%rbx)
	shrq	%cl, %rax
	leaq	7(%rbx), %r14
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L207
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L207
.L175:
	movl	4(%rbx), %eax
	movl	%r15d, %ecx
	movl	%eax, first_free_connect(%rip)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L208
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L208
.L177:
	movq	%r13, %rax
	movl	%r15d, %ecx
	addl	$1, num_connects(%rip)
	shrq	%cl, %rax
	movl	$-1, 4(%rbx)
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r13
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L209
	movq	24(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L209
.L179:
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	movq	0(%r13), %r14
	shrq	%cl, %rdx
	leaq	95(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L210
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L210
.L181:
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	movq	%r14, 88(%rbx)
	shrq	%cl, %rdx
	leaq	103(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L211
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L211
.L183:
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	movq	$0, 96(%rbx)
	shrq	%cl, %rdx
	leaq	111(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L212
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L212
.L185:
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	movq	$0, 104(%rbx)
	shrq	%cl, %rdx
	leaq	143(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L213
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L213
.L187:
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	movq	$0, 136(%rbx)
	shrq	%cl, %rdx
	leaq	59(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L214
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L214
.L189:
	movq	%rbx, %rax
	movl	%r15d, %ecx
	movl	$0, 56(%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L215
	cmpq	__mf_lookup_cache+8(%rax), %r12
	ja	.L215
.L191:
	movq	8(%rbx), %r14
	movl	%r15d, %ecx
	movq	%r14, %rdx
	leaq	707(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L216
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L216
.L193:
	movl	704(%r14), %edi
	call	httpd_set_ndelay
	movq	%rbx, %rax
	movl	%r15d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L217
	cmpq	__mf_lookup_cache+8(%rax), %r12
	ja	.L217
.L195:
	movq	8(%rbx), %r12
	movl	%r15d, %ecx
	movq	%r12, %rdx
	leaq	707(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L218
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L218
.L197:
	movl	704(%r12), %edi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	call	fdwatch_add_fd
	addq	$1, stats_connections(%rip)
	movl	num_connects(%rip), %eax
	cmpl	stats_simultaneous(%rip), %eax
	jle	.L221
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L226:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L224:
	.cfi_restore_state
	movl	$720, %edi
	call	malloc
	movq	%rbx, %rdx
	movl	%r15d, %ecx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L204
	cmpq	__mf_lookup_cache+8(%rdx), %r12
	ja	.L204
.L166:
	testq	%rax, %rax
	movq	%rax, 8(%rbx)
	je	.L227
	movq	%rax, %rdi
	movl	%r15d, %ecx
	leaq	3(%rax), %rdx
	shrq	%cl, %rdi
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %rax
	jb	.L205
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L205
.L169:
	movl	$0, (%rax)
	addl	$1, httpd_conn_count(%rip)
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L223:
	xorl	%eax, %eax
	movl	$.LC43, %edx
	movl	$1, %esi
	movl	$4, %edi
	call	__syslog_chk
	movq	%r13, %rdi
	call	tmr_run
	xorl	%eax, %eax
	jmp	.L158
.L159:
	movl	$2, %edi
	movl	$.LC45, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L227:
	movl	$2, %edi
	movl	$.LC48, %edx
	movl	$1, %esi
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L207:
	movl	$.LC51, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L175
.L208:
	movl	$.LC52, %ecx
	movl	$1, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L177
.L209:
	movl	$.LC53, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%r13, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L179
.L205:
	subq	%rax, %rdx
	movq	%rax, %rdi
	movl	$.LC49, %ecx
	leaq	1(%rdx), %rsi
	movl	$1, %edx
	movq	%rax, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	movq	8(%rsp), %rax
	jmp	.L169
.L204:
	movl	$.LC47, %ecx
	movl	$1, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	movq	8(%rsp), %rax
	jmp	.L166
.L218:
	movl	$.LC62, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L197
.L203:
	movl	$.LC46, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L163
.L202:
	movl	$.LC44, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L160
.L206:
	movl	$.LC50, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L173
.L210:
	movl	$.LC54, %ecx
	movl	$1, %edx
	movl	$96, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L181
.L211:
	movl	$.LC55, %ecx
	movl	$1, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L183
.L212:
	movl	$.LC56, %ecx
	movl	$1, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L185
.L213:
	movl	$.LC57, %ecx
	movl	$1, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L187
.L214:
	movl	$.LC58, %ecx
	movl	$1, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L189
.L215:
	movl	$.LC59, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L191
.L216:
	movl	$.LC60, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L193
.L217:
	movl	$.LC61, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r15d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L195
	.cfi_endproc
.LFE88:
	.size	handle_newconnect, .-handle_newconnect
	.section	.rodata
	.align 8
.LC63:
	.string	"thttpd.c:2002:11 (clear_connection)"
	.align 8
.LC64:
	.string	"thttpd.c:2005:18 (clear_connection)"
	.align 8
.LC65:
	.string	"thttpd.c:2019:11 (clear_connection)"
.LC66:
	.string	"thttpd.c (clear_connection)"
	.align 8
.LC67:
	.string	"thttpd.c:2022:12 (clear_connection)"
	.align 8
.LC68:
	.string	"thttpd.c:2023:18 (clear_connection)"
	.align 8
.LC69:
	.string	"thttpd.c:2024:3 (clear_connection)"
	.align 8
.LC70:
	.string	"thttpd.c:2024:23 (clear_connection)"
	.align 8
.LC71:
	.string	"thttpd.c:2029:20 (clear_connection)"
	.align 8
.LC72:
	.string	"thttpd.c:2030:16 (clear_connection)"
	.align 8
.LC73:
	.string	"thttpd.c:2031:13 (clear_connection)"
	.align 8
.LC74:
	.string	"thttpd.c:2031:10 (clear_connection)"
	.align 8
.LC75:
	.string	"thttpd.c:2032:19 (clear_connection)"
	.align 8
.LC76:
	.string	"thttpd.c:2032:16 (clear_connection)"
	.align 8
.LC77:
	.string	"thttpd.c:2034:8 (clear_connection)"
	.align 8
.LC78:
	.string	"replacing non-null linger_timer!"
	.align 8
.LC79:
	.string	"thttpd.c:2036:18 (clear_connection)"
	.align 8
.LC80:
	.string	"tmr_create(linger_clear_connection) failed"
	.text
	.p2align 4,,15
	.type	clear_connection, @function
clear_connection:
.LFB96:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	103(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	%rsi, 8(%rsp)
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rdi
	jb	.L270
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L270
.L229:
	movq	96(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L231
	call	tmr_cancel
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L271
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L271
.L232:
	movq	$0, 96(%rbx)
.L231:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	3(%rbx), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L272
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L272
.L234:
	movl	(%rbx), %eax
	cmpl	$4, %eax
	je	.L236
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	15(%rbx), %r13
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L273
	cmpq	__mf_lookup_cache+8(%rdx), %r13
	ja	.L273
.L237:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rdi
	leaq	559(%r14), %rdx
	shrq	%cl, %rdi
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L274
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L274
.L239:
	movl	556(%r14), %esi
	testl	%esi, %esi
	je	.L242
	cmpl	$3, %eax
	je	.L251
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	707(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L279
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L279
.L252:
	movl	704(%r14), %edi
	call	fdwatch_del_fd
.L251:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L280
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L280
.L254:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	movl	$4, (%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L281
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L281
.L256:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rdx
	leaq	707(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L282
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L282
.L258:
	movl	704(%r14), %edi
	movl	$1, %esi
	call	shutdown
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L283
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L283
.L260:
	movq	8(%rbx), %r13
	movl	%r12d, %ecx
	movq	%r13, %rdx
	leaq	707(%r13), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r13
	jb	.L284
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L284
.L262:
	movl	704(%r13), %edi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	leaq	111(%rbx), %r13
	call	fdwatch_add_fd
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L285
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L285
.L264:
	cmpq	$0, 104(%rbx)
	je	.L266
	movl	$.LC78, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L266:
	movq	8(%rsp), %rdi
	xorl	%r8d, %r8d
	movl	$500, %ecx
	movq	%rbx, %rdx
	movl	$linger_clear_connection, %esi
	call	tmr_create
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L286
	cmpq	__mf_lookup_cache+8(%rdx), %r13
	ja	.L286
.L267:
	testq	%rax, %rax
	movq	%rax, 104(%rbx)
	je	.L287
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L236:
	.cfi_restore_state
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	111(%rbx), %r13
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L275
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L275
.L243:
	movq	104(%rbx), %rdi
	call	tmr_cancel
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L276
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L276
.L245:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movq	$0, 104(%rbx)
	shrq	%cl, %rdx
	leaq	15(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L277
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L277
.L247:
	movq	8(%rbx), %r13
	movl	%r12d, %ecx
	movq	%r13, %rdx
	leaq	559(%r13), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r13
	jb	.L278
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L278
.L249:
	movl	$0, 556(%r13)
.L242:
	movq	8(%rsp), %rsi
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	really_clear_connection
.L287:
	.cfi_restore_state
	movl	$2, %edi
	movl	$.LC80, %edx
	movl	$1, %esi
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L278:
	movl	$.LC70, %ecx
	movl	$1, %edx
	movl	$560, %esi
	movq	%r13, %rdi
	call	__mf_check
	jmp	.L249
.L277:
	movl	$.LC69, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L247
.L276:
	movl	$.LC68, %ecx
	movl	$1, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L245
.L275:
	movl	$.LC67, %ecx
	xorl	%edx, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L243
.L282:
	movl	$.LC74, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L258
.L272:
	movl	$.LC65, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L234
.L286:
	movl	$.LC79, %ecx
	movl	$1, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	movq	%rax, (%rsp)
	call	__mf_check
	movq	(%rsp), %rax
	jmp	.L267
.L271:
	movl	$.LC64, %ecx
	movl	$1, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L232
.L284:
	movl	$.LC76, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r13, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L262
.L283:
	movl	$.LC75, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L260
.L273:
	movl	$.LC66, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movl	%eax, (%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	(%rsp), %eax
	jmp	.L237
.L279:
	movl	$.LC71, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L252
.L270:
	movl	$.LC63, %ecx
	xorl	%edx, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L229
.L281:
	movl	$.LC73, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L256
.L280:
	movl	$.LC72, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L254
.L274:
	movl	$.LC66, %ecx
	xorl	%edx, %edx
	movl	$560, %esi
	movq	%r14, %rdi
	movl	%eax, (%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	(%rsp), %eax
	jmp	.L239
.L285:
	movl	$.LC77, %ecx
	xorl	%edx, %edx
	movl	$112, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L264
	.cfi_endproc
.LFE96:
	.size	clear_connection, .-clear_connection
	.section	.rodata
	.align 8
.LC81:
	.string	"thttpd.c:1990:25 (finish_connection)"
	.text
	.p2align 4,,15
	.type	finish_connection, @function
finish_connection:
.LFB95:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	%rdi, %rdx
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	leaq	15(%rdi), %rax
	shrq	%cl, %rdx
	andq	__mf_lc_mask(%rip), %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L291
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L291
.L289:
	movq	8(%rbx), %rdi
	call	httpd_write_response
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	16(%rsp), %rbp
	movq	8(%rsp), %rbx
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	clear_connection
.L291:
	.cfi_restore_state
	movl	$.LC81, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	jmp	.L289
	.cfi_endproc
.LFE95:
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 8
.LC82:
	.string	"thttpd.c:2153:20 (logstats) tv"
.LC83:
	.string	"thttpd.c:2162:9 (logstats)"
	.align 8
.LC84:
	.string	"up %ld seconds, stats for %ld seconds:"
	.align 8
.LC85:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.text
	.p2align 4,,15
	.type	logstats, @function
logstats:
.LFB103:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	movl	$.LC82, %ecx
	movl	$3, %edx
	movl	$16, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	leaq	16(%rsp), %rdi
	call	__mf_register
	testq	%r12, %r12
	je	.L300
.L293:
	movq	%r12, %rdx
	movl	%ebp, %ecx
	leaq	7(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L299
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L299
.L294:
	movq	(%r12), %rax
	movq	%rax, %rcx
	movq	%rax, %rbx
	subq	start_time(%rip), %rcx
	subq	stats_time(%rip), %rbx
	movq	%rax, stats_time(%rip)
	je	.L296
	xorl	%eax, %eax
	movq	%rbx, %r8
	movl	$.LC84, %edx
	movl	$1, %esi
	movl	$6, %edi
	call	__syslog_chk
	testq	%rbx, %rbx
	jg	.L298
.L297:
	movq	%rbx, %rdi
	movq	$0, stats_connections(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	call	httpd_logstats
	movq	%rbx, %rdi
	call	mmc_logstats
	movq	%rbx, %rdi
	call	fdwatch_logstats
	movq	%rbx, %rdi
	call	tmr_logstats
	leaq	16(%rsp), %rdi
	movl	$3, %edx
	movl	$16, %esi
	call	__mf_unregister
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L296:
	.cfi_restore_state
	movl	$1, %r8d
	movl	$.LC84, %edx
	movl	$1, %esi
	movl	$6, %edi
	xorl	%eax, %eax
	movl	$1, %ebx
	call	__syslog_chk
.L298:
	movq	stats_bytes(%rip), %r9
	movq	stats_connections(%rip), %rcx
	movl	$.LC85, %edx
	cvtsi2ssq	%rbx, %xmm2
	movl	httpd_conn_count(%rip), %eax
	movl	stats_simultaneous(%rip), %r8d
	movl	$1, %esi
	movl	$6, %edi
	cvtsi2ssq	%r9, %xmm1
	cvtsi2ssq	%rcx, %xmm0
	movl	%eax, (%rsp)
	movl	$2, %eax
	divss	%xmm2, %xmm1
	divss	%xmm2, %xmm0
	unpcklps	%xmm1, %xmm1
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm1, %xmm1
	cvtps2pd	%xmm0, %xmm0
	call	__syslog_chk
	jmp	.L297
	.p2align 4,,10
	.p2align 3
.L300:
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	leaq	16(%rsp), %r12
	call	gettimeofday
	jmp	.L293
.L299:
	subq	%r12, %rax
	movl	$.LC83, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	call	__mf_check
	jmp	.L294
	.cfi_endproc
.LFE103:
	.size	logstats, .-logstats
	.section	.rodata
	.align 8
.LC86:
	.string	"thttpd.c:1470:20 (shut_down) tv"
.LC87:
	.string	"thttpd.c:1476:21 (shut_down)"
.LC88:
	.string	"thttpd.c:1477:22 (shut_down)"
.LC89:
	.string	"thttpd.c:1478:21 (shut_down)"
.LC90:
	.string	"thttpd.c:1481:34 (shut_down)"
.LC91:
	.string	"thttpd.c:1483:24 (shut_down)"
.LC92:
	.string	"thttpd.c:1490:10 (shut_down)"
.LC93:
	.string	"thttpd.c:1492:10 (shut_down)"
	.text
	.p2align 4,,15
	.type	shut_down, @function
shut_down:
.LFB87:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC86, %ecx
	movl	$3, %edx
	movl	$16, %esi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	movq	%rsp, %rdi
	call	__mf_register
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	gettimeofday
	movq	%rsp, %rdi
	call	logstats
	movl	max_connects(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L302
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	jmp	.L315
	.p2align 4,,10
	.p2align 3
.L305:
	movq	%r12, %rdx
	movl	%ebp, %ecx
	leaq	15(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L326
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L326
.L308:
	movq	8(%r12), %rdi
	testq	%rdi, %rdi
	je	.L310
	call	httpd_destroy_conn
	movq	%r13, %r12
	addq	connects(%rip), %r12
	movl	%ebp, %ecx
	movq	%r12, %rdx
	leaq	15(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L327
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L327
.L311:
	movq	8(%r12), %rdi
	movq	%r13, %r12
	call	free
	addq	connects(%rip), %r12
	movl	%ebp, %ecx
	subl	$1, httpd_conn_count(%rip)
	movq	%r12, %rdx
	leaq	15(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L328
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L328
.L313:
	movq	$0, 8(%r12)
.L310:
	addl	$1, %r14d
	addq	$144, %r13
	cmpl	%r14d, max_connects(%rip)
	jle	.L302
.L315:
	movq	%r13, %r12
	addq	connects(%rip), %r12
	movl	%ebp, %ecx
	movq	%r12, %rdx
	leaq	3(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L324
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L324
.L303:
	movl	(%r12), %edi
	testl	%edi, %edi
	je	.L305
	movq	%r12, %rdx
	movl	%ebp, %ecx
	leaq	15(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L325
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L325
.L306:
	movq	8(%r12), %rdi
	movq	%rsp, %rsi
	movq	%r13, %r12
	call	httpd_close_conn
	addq	connects(%rip), %r12
	jmp	.L305
	.p2align 4,,10
	.p2align 3
.L302:
	movq	hs(%rip), %r12
	testq	%r12, %r12
	je	.L316
	movq	%r12, %rdx
	movl	%ebp, %ecx
	movq	$0, hs(%rip)
	shrq	%cl, %rdx
	leaq	75(%r12), %rax
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L329
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L329
.L317:
	movl	72(%r12), %edi
	cmpl	$-1, %edi
	je	.L319
	call	fdwatch_del_fd
.L319:
	movq	%r12, %rdx
	movl	%ebp, %ecx
	leaq	79(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbx, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L330
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L330
.L320:
	movl	76(%r12), %edi
	cmpl	$-1, %edi
	je	.L322
	call	fdwatch_del_fd
.L322:
	movq	%r12, %rdi
	call	httpd_terminate
.L316:
	call	mmc_destroy
	call	tmr_destroy
	movq	connects(%rip), %rdi
	call	free
	movq	throttles(%rip), %rdi
	testq	%rdi, %rdi
	je	.L323
	call	free
.L323:
	movq	%rsp, %rdi
	movl	$3, %edx
	movl	$16, %esi
	call	__mf_unregister
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L330:
	.cfi_restore_state
	movl	$.LC93, %ecx
	xorl	%edx, %edx
	movl	$80, %esi
	movq	%r12, %rdi
	call	__mf_check
	jmp	.L320
.L329:
	movl	$.LC92, %ecx
	xorl	%edx, %edx
	movl	$76, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L317
.L325:
	subq	%r12, %rax
	movl	$.LC88, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L306
.L328:
	movl	$.LC91, %ecx
	movl	$1, %edx
	movl	$16, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L313
.L327:
	movl	$.LC90, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L311
.L326:
	subq	%r12, %rax
	movl	$.LC89, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L308
.L324:
	subq	%r12, %rax
	movl	$.LC87, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ebp
	movq	__mf_lc_mask(%rip), %rbx
	jmp	.L303
	.cfi_endproc
.LFE87:
	.size	shut_down, .-shut_down
	.p2align 4,,15
	.type	show_stats, @function
show_stats:
.LFB102:
	.cfi_startproc
	movq	%rsi, %rdi
	jmp	logstats
	.cfi_endproc
.LFE102:
	.size	show_stats, .-show_stats
	.section	.rodata
.LC94:
	.string	"thttpd.c:288:15 (handle_usr2)"
.LC95:
	.string	"thttpd.c:298:11 (handle_usr2)"
	.text
	.p2align 4,,15
	.type	handle_usr2, @function
handle_usr2:
.LFB75:
	.cfi_startproc
	movq	%rbx, -40(%rsp)
	movq	%rbp, -32(%rsp)
	movq	%r13, -16(%rsp)
	movq	%r14, -8(%rsp)
	movq	%r12, -24(%rsp)
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -32
	.cfi_offset 14, -16
	.cfi_offset 13, -24
	.cfi_offset 6, -40
	.cfi_offset 3, -48
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r13
	call	__errno_location
	movq	%rax, %rbx
	leaq	3(%rax), %rbp
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r13, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L338
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L338
.L334:
	xorl	%edi, %edi
	movl	(%rbx), %r12d
	call	logstats
	movq	%rbx, %rax
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r13, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L339
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L339
.L336:
	movl	%r12d, (%rbx)
	movq	8(%rsp), %rbp
	movq	(%rsp), %rbx
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L338:
	.cfi_restore_state
	movl	$.LC94, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r13
	jmp	.L334
.L339:
	movl	$.LC95, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	jmp	.L336
	.cfi_endproc
.LFE75:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
.LC96:
	.string	"exiting due to signal %d"
	.text
	.p2align 4,,15
	.type	handle_term, @function
handle_term:
.LFB71:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	shut_down
	movl	$5, %edi
	movl	%ebx, %ecx
	movl	$.LC96, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE71:
	.size	handle_term, .-handle_term
	.section	.rodata
.LC97:
	.string	"thttpd.c:2078:12 (idle)"
.LC98:
	.string	"thttpd.c:2081:15 (idle)"
.LC99:
	.string	"thttpd.c:2081:27 (idle)"
.LC100:
	.string	"thttpd.c:2085:21 (idle)"
	.align 8
.LC101:
	.string	"%.80s connection timed out reading"
.LC102:
	.string	"thttpd.c:2086:17 (idle)"
.LC103:
	.string	""
.LC104:
	.string	"thttpd.c:2093:15 (idle)"
.LC105:
	.string	"thttpd.c:2093:27 (idle)"
.LC106:
	.string	"thttpd.c:2097:21 (idle)"
	.align 8
.LC107:
	.string	"%.80s connection timed out sending"
	.text
	.p2align 4,,15
	.type	idle, @function
idle:
.LFB98:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	max_connects(%rip), %r9d
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	testl	%r9d, %r9d
	jle	.L341
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	leaq	7(%rsi), %r10
	jmp	.L362
	.p2align 4,,10
	.p2align 3
.L374:
	jl	.L345
	cmpl	$3, %eax
	jg	.L345
	movq	%r13, %rax
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r15, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r13
	jb	.L368
	cmpq	__mf_lookup_cache+8(%rax), %r10
	ja	.L368
.L356:
	movq	%rbx, %rdi
	movl	%r14d, %ecx
	movq	0(%r13), %rax
	shrq	%cl, %rdi
	leaq	95(%rbx), %rdx
	andq	%r15, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %rbx
	jb	.L369
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L369
.L358:
	subq	88(%rbx), %rax
	cmpq	$299, %rax
	jg	.L373
.L345:
	addl	$1, %r12d
	addq	$144, %rbp
	cmpl	%r12d, max_connects(%rip)
	jle	.L341
.L362:
	movq	%rbp, %rbx
	addq	connects(%rip), %rbx
	movl	%r14d, %ecx
	movq	%rbx, %rdx
	leaq	3(%rbx), %rax
	shrq	%cl, %rdx
	andq	%r15, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L363
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L363
.L343:
	movl	(%rbx), %eax
	cmpl	$1, %eax
	jne	.L374
	movq	%r13, %rax
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r15, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r13
	jb	.L364
	cmpq	__mf_lookup_cache+8(%rax), %r10
	ja	.L364
.L348:
	movq	%rbx, %rdi
	movl	%r14d, %ecx
	movq	0(%r13), %rax
	shrq	%cl, %rdi
	leaq	95(%rbx), %rdx
	andq	%r15, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %rbx
	jb	.L365
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L365
.L350:
	subq	88(%rbx), %rax
	cmpq	$59, %rax
	jle	.L345
	movq	%rbx, %rax
	movl	%r14d, %ecx
	leaq	15(%rbx), %r8
	shrq	%cl, %rax
	andq	%r15, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L366
	cmpq	__mf_lookup_cache+8(%rax), %r8
	ja	.L366
.L352:
	movq	8(%rbx), %rdi
	movq	%r8, 24(%rsp)
	movq	%r10, 8(%rsp)
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC101, %edx
	movq	%rax, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$6, %edi
	call	__syslog_chk
	movq	%rbx, %rdx
	movl	%r14d, %ecx
	movq	httpd_err408form(%rip), %rax
	shrq	%cl, %rdx
	movq	httpd_err408title(%rip), %r11
	movq	24(%rsp), %r8
	andq	%r15, %rdx
	movq	8(%rsp), %r10
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L367
	cmpq	__mf_lookup_cache+8(%rdx), %r8
	ja	.L367
.L354:
	movq	8(%rbx), %rdi
	movl	$.LC103, %r9d
	movq	%rax, %r8
	movq	%r9, %rcx
	movq	%r11, %rdx
	movl	$408, %esi
	movq	%r10, 8(%rsp)
	call	httpd_send_err
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	finish_connection
	movq	8(%rsp), %r10
	jmp	.L345
	.p2align 4,,10
	.p2align 3
.L341:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L373:
	.cfi_restore_state
	movq	%rbx, %rdx
	movl	%r14d, %ecx
	leaq	15(%rbx), %rax
	shrq	%cl, %rdx
	andq	%r15, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L370
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L370
.L360:
	movq	8(%rbx), %rdi
	movq	%r10, 8(%rsp)
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC107, %edx
	movq	%rax, %rcx
	movl	$1, %esi
	movl	$6, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	clear_connection
	movq	8(%rsp), %r10
	jmp	.L345
.L363:
	movl	$.LC97, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	jmp	.L343
.L370:
	movl	$.LC106, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	jmp	.L360
.L367:
	movl	$.LC102, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	movq	%r10, 8(%rsp)
	movq	%r11, 24(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	24(%rsp), %r11
	movq	8(%rsp), %r10
	movq	16(%rsp), %rax
	jmp	.L354
.L366:
	movl	$.LC100, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movq	%r8, 24(%rsp)
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	movq	24(%rsp), %r8
	jmp	.L352
.L365:
	movl	$.LC99, %ecx
	xorl	%edx, %edx
	movl	$96, %esi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	movq	16(%rsp), %rax
	jmp	.L350
.L364:
	movl	$.LC98, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	jmp	.L348
.L369:
	movl	$.LC105, %ecx
	xorl	%edx, %edx
	movl	$96, %esi
	movq	%rbx, %rdi
	movq	%rax, 16(%rsp)
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	movq	16(%rsp), %rax
	jmp	.L358
.L368:
	movl	$.LC104, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%r10, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r15
	movq	8(%rsp), %r10
	jmp	.L356
	.cfi_endproc
.LFE98:
	.size	idle, .-idle
	.p2align 4,,15
	.type	occasional, @function
occasional:
.LFB101:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdi
	call	mmc_cleanup
	call	tmr_cleanup
	movl	$1, watchdog_flag(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE101:
	.size	occasional, .-occasional
	.section	.rodata
	.align 8
.LC108:
	.string	"thttpd.c:193:9 (handle_chld) status"
.LC109:
	.string	"thttpd.c:191:15 (handle_chld)"
.LC110:
	.string	"thttpd.c:212:11 (handle_chld)"
.LC111:
	.string	"child wait - %m"
.LC112:
	.string	"thttpd.c:229:10 (handle_chld)"
.LC113:
	.string	"thttpd.c:229:6 (handle_chld)"
.LC114:
	.string	"thttpd.c:231:17 (handle_chld)"
.LC115:
	.string	"thttpd.c:236:11 (handle_chld)"
	.text
	.p2align 4,,15
	.type	handle_chld, @function
handle_chld:
.LFB72:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC108, %ecx
	movl	$3, %edx
	movl	$4, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	leaq	28(%rsp), %rdi
	call	__mf_register
	call	__errno_location
	movl	%r12d, %ecx
	movq	%rax, %rbx
	leaq	3(%rax), %r13
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L393
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L393
.L377:
	movl	(%rbx), %eax
	movl	%eax, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L401:
	leaq	28(%rsp), %rsi
	movl	$1, %edx
	movl	$-1, %edi
	call	__mfwrap_waitpid
	cmpl	$0, %eax
	je	.L380
	jl	.L402
	movq	hs(%rip), %r14
	testq	%r14, %r14
	je	.L401
	movq	%r14, %rax
	movl	%r12d, %ecx
	leaq	39(%r14), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L395
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L395
.L385:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movl	36(%r14), %eax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	subl	$1, %eax
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L396
	cmpq	__mf_lookup_cache+8(%rdx), %r15
	ja	.L396
.L387:
	testl	%eax, %eax
	movl	%eax, 36(%r14)
	jns	.L401
	movq	%r14, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L397
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L397
.L389:
	movl	$0, 36(%r14)
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L402:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L394
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L394
.L382:
	movl	(%rbx), %eax
	cmpl	$11, %eax
	je	.L401
	cmpl	$4, %eax
	je	.L401
	cmpl	$10, %eax
	je	.L380
	movl	$.LC111, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L380:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L398
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L398
.L391:
	movl	12(%rsp), %eax
	leaq	28(%rsp), %rdi
	movl	$3, %edx
	movl	$4, %esi
	movl	%eax, (%rbx)
	call	__mf_unregister
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L394:
	.cfi_restore_state
	movl	$.LC110, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L382
.L397:
	movl	$.LC114, %ecx
	movl	$1, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L389
.L396:
	movl	$.LC113, %ecx
	movl	$1, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	movl	%eax, (%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	(%rsp), %eax
	jmp	.L387
.L395:
	movl	$.LC112, %ecx
	xorl	%edx, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L385
.L393:
	movl	$.LC109, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L377
.L398:
	movl	$.LC115, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	jmp	.L391
	.cfi_endproc
.LFE72:
	.size	handle_chld, .-handle_chld
	.section	.rodata
	.align 8
.LC116:
	.string	"%s: no value required for %s option\n"
	.text
	.p2align 4,,15
	.type	no_value_required, @function
no_value_required:
.LFB83:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rsi, %rsi
	jne	.L405
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L405:
	.cfi_restore_state
	movq	%rdi, %r8
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC116, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE83:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 8
.LC117:
	.string	"%s: value required for %s option\n"
	.text
	.p2align 4,,15
	.type	value_required, @function
value_required:
.LFB82:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rsi, %rsi
	je	.L408
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L408:
	.cfi_restore_state
	movq	%rdi, %r8
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC117, %edx
	movb	$1, %sil
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE82:
	.size	value_required, .-value_required
	.section	.rodata
	.align 8
.LC118:
	.string	"out of memory copying a string"
	.align 8
.LC119:
	.string	"%s: out of memory copying a string\n"
	.text
	.p2align 4,,15
	.type	e_strdup, @function
e_strdup:
.LFB84:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__mfwrap_strdup
	testq	%rax, %rax
	je	.L411
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L411:
	.cfi_restore_state
	movl	$.LC118, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rcx
	movl	$.LC119, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE84:
	.size	e_strdup, .-e_strdup
	.section	.rodata
	.align 8
.LC120:
	.string	"thttpd.c:1003:10 (read_config) line"
.LC121:
	.string	"r"
	.align 8
.LC122:
	.string	"thttpd.c:1020:10 (read_config)"
.LC123:
	.string	" \t\n\r"
	.align 8
.LC124:
	.string	"thttpd.c:1027:14 (read_config)"
	.align 8
.LC125:
	.string	"thttpd.c:1033:10 (read_config)"
	.align 8
.LC126:
	.string	"thttpd.c:1032:14 (read_config)"
	.align 8
.LC127:
	.string	"thttpd.c:1038:12 (read_config)"
.LC128:
	.string	"debug"
.LC129:
	.string	"port"
.LC130:
	.string	"dir"
.LC131:
	.string	"chroot"
.LC132:
	.string	"nochroot"
.LC133:
	.string	"data_dir"
.LC134:
	.string	"symlink"
.LC135:
	.string	"nosymlink"
.LC136:
	.string	"symlinks"
.LC137:
	.string	"nosymlinks"
.LC138:
	.string	"user"
.LC139:
	.string	"cgipat"
.LC140:
	.string	"cgilimit"
.LC141:
	.string	"urlpat"
.LC142:
	.string	"noemptyreferers"
.LC143:
	.string	"localpat"
.LC144:
	.string	"throttles"
.LC145:
	.string	"host"
.LC146:
	.string	"logfile"
.LC147:
	.string	"vhost"
.LC148:
	.string	"novhost"
.LC149:
	.string	"globalpasswd"
.LC150:
	.string	"noglobalpasswd"
.LC151:
	.string	"pidfile"
.LC152:
	.string	"charset"
.LC153:
	.string	"p3p"
.LC154:
	.string	"max_age"
	.align 8
.LC155:
	.string	"%s: unknown config option '%s'\n"
	.text
	.p2align 4,,15
	.type	read_config, @function
read_config:
.LFB81:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC120, %ecx
	movl	$3, %edx
	movl	$10000, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$10024, %rsp
	.cfi_def_cfa_offset 10080
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	leaq	16(%rsp), %rdi
	call	__mf_register
	movl	$.LC121, %esi
	movq	%rbx, %rdi
	call	__mfwrap_fopen
	testq	%rax, %rax
	movq	%rax, %r15
	je	.L478
	.p2align 4,,10
	.p2align 3
.L472:
	leaq	16(%rsp), %rdi
	movq	%r15, %rdx
	movl	$10000, %esi
	call	fgets
	testq	%rax, %rax
	je	.L479
	leaq	16(%rsp), %rdi
	movl	$35, %esi
	call	__mfwrap_strchr
	testq	%rax, %rax
	je	.L415
	movq	%rax, %rdx
	movl	%r12d, %ecx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rax
	jb	.L462
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L462
.L416:
	movb	$0, (%rax)
.L415:
	leaq	16(%rsp), %rdi
	leaq	16(%rsp), %r13
	movl	$.LC123, %esi
	call	strspn
	addq	%rax, %r13
.L477:
	movq	%r13, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r13
	jb	.L463
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L463
.L418:
	cmpb	$0, 0(%r13)
	je	.L472
	movl	$.LC123, %esi
	movq	%r13, %rdi
	call	strcspn
	leaq	0(%r13,%rax), %rbx
	jmp	.L421
	.p2align 4,,10
	.p2align 3
.L426:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L464
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L464
.L422:
	movb	$0, (%rbx)
	addq	$1, %rbx
.L421:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L465
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L465
.L424:
	movzbl	(%rbx), %eax
	cmpb	$9, %al
	je	.L426
	cmpb	$32, %al
	je	.L426
	cmpb	$10, %al
	.p2align 4,,2
	je	.L426
	cmpb	$13, %al
	.p2align 4,,5
	je	.L426
	movl	$61, %esi
	movq	%r13, %rdi
	call	__mfwrap_strchr
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L427
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L466
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L466
.L428:
	movb	$0, (%r14)
	addq	$1, %r14
.L427:
	movl	$.LC128, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L480
	movl	$.LC129, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L481
	movl	$.LC130, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L482
	movl	$.LC131, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L483
	movl	$.LC132, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L484
	movl	$.LC133, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L485
	movl	$.LC134, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L473
	movl	$.LC135, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L474
	movl	$.LC136, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L473
	movl	$.LC137, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L474
	movl	$.LC138, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L486
	movl	$.LC139, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L487
	movl	$.LC140, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L488
	movl	$.LC141, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L489
	movl	$.LC142, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L490
	movl	$.LC143, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L491
	movl	$.LC144, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L492
	movl	$.LC145, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L493
	movl	$.LC146, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L494
	movl	$.LC147, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L495
	movl	$.LC148, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L496
	movl	$.LC149, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L497
	movl	$.LC150, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L498
	movl	$.LC151, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L499
	movl	$.LC152, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L500
	movl	$.LC153, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	je	.L501
	movl	$.LC154, %esi
	movq	%r13, %rdi
	call	__mfwrap_strcasecmp
	testl	%eax, %eax
	jne	.L457
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	strtol
	movl	%eax, max_age(%rip)
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L479:
	movq	%r15, %rdi
	call	__mfwrap_fclose
	leaq	16(%rsp), %rdi
	movl	$3, %edx
	movl	$10000, %esi
	call	__mf_unregister
	addq	$10024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L480:
	.cfi_restore_state
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, debug(%rip)
.L431:
	movl	$.LC123, %esi
	movq	%rbx, %rdi
	call	strspn
	leaq	(%rbx,%rax), %r13
	jmp	.L477
.L481:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	strtol
	movw	%ax, port(%rip)
	jmp	.L431
.L482:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, dir(%rip)
	jmp	.L431
.L473:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L431
.L483:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L431
.L484:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L431
.L485:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, data_dir(%rip)
	jmp	.L431
.L474:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L431
.L489:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, url_pattern(%rip)
	jmp	.L431
.L486:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, user(%rip)
	jmp	.L431
.L487:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, cgi_pattern(%rip)
	jmp	.L431
.L488:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	strtol
	movl	%eax, cgi_limit(%rip)
	jmp	.L431
.L491:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, local_pattern(%rip)
	jmp	.L431
.L490:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, no_empty_referers(%rip)
	jmp	.L431
.L457:
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rcx
	movq	%r13, %r8
	movl	$.LC155, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L466:
	movl	$.LC127, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L428
.L464:
	movl	$.LC125, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L422
.L493:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, hostname(%rip)
	jmp	.L431
.L492:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, throttlefile(%rip)
	jmp	.L431
.L497:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_global_passwd(%rip)
	jmp	.L431
.L496:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_vhost(%rip)
	jmp	.L431
.L495:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_vhost(%rip)
	jmp	.L431
.L494:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, logfile(%rip)
	jmp	.L431
.L501:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, p3p(%rip)
	jmp	.L431
.L500:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, charset(%rip)
	jmp	.L431
.L499:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r14, %rdi
	call	e_strdup
	movq	%rax, pidfile(%rip)
	jmp	.L431
.L498:
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_global_passwd(%rip)
	jmp	.L431
.L465:
	movl	$.LC126, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L424
.L463:
	movl	$.LC124, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L418
.L462:
	movq	%rax, %rdi
	movl	$.LC122, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, 8(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	8(%rsp), %rax
	jmp	.L416
.L478:
	movq	%rbx, %rdi
	call	perror
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE81:
	.size	read_config, .-read_config
	.section	.rodata
.LC156:
	.string	"exiting"
	.text
	.p2align 4,,15
	.type	handle_usr1, @function
handle_usr1:
.LFB74:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	num_connects(%rip), %r10d
	testl	%r10d, %r10d
	je	.L504
	movl	$1, got_usr1(%rip)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L504:
	.cfi_restore_state
	call	shut_down
	movl	$5, %edi
	movl	$.LC156, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE74:
	.size	handle_usr1, .-handle_usr1
	.section	.rodata
.LC157:
	.string	"thttpd.c:306:15 (handle_alrm)"
.LC158:
	.string	"/tmp"
.LC159:
	.string	"thttpd.c:326:11 (handle_alrm)"
	.text
	.p2align 4,,15
	.type	handle_alrm, @function
handle_alrm:
.LFB76:
	.cfi_startproc
	movq	%rbx, -40(%rsp)
	movq	%rbp, -32(%rsp)
	movq	%r13, -16(%rsp)
	movq	%r14, -8(%rsp)
	movq	%r12, -24(%rsp)
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -32
	.cfi_offset 14, -16
	.cfi_offset 13, -24
	.cfi_offset 6, -40
	.cfi_offset 3, -48
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r13
	call	__errno_location
	movq	%rax, %rbx
	leaq	3(%rax), %rbp
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r13, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L511
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L511
.L506:
	movl	watchdog_flag(%rip), %eax
	movl	(%rbx), %r12d
	testl	%eax, %eax
	je	.L513
	movl	$360, %edi
	movl	$0, watchdog_flag(%rip)
	call	alarm
	movq	%rbx, %rax
	movl	%r14d, %ecx
	shrq	%cl, %rax
	andq	%r13, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L512
	cmpq	__mf_lookup_cache+8(%rax), %rbp
	ja	.L512
.L509:
	movl	%r12d, (%rbx)
	movq	8(%rsp), %rbp
	movq	(%rsp), %rbx
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L513:
	.cfi_restore_state
	movl	$.LC158, %edi
	call	chdir
	call	abort
.L511:
	movl	$.LC157, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r14d
	movq	__mf_lc_mask(%rip), %r13
	jmp	.L506
.L512:
	movl	$.LC159, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	jmp	.L509
	.cfi_endproc
.LFE76:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
.LC160:
	.string	"thttpd.c:361:10 (main) cwd"
.LC161:
	.string	"thttpd.c:367:20 (main) sa4"
.LC162:
	.string	"thttpd.c:368:20 (main) sa6"
.LC163:
	.string	"thttpd.c:369:9 (main) gotv4"
.LC164:
	.string	"thttpd.c:369:16 (main) gotv6"
.LC165:
	.string	"thttpd.c:370:20 (main) tv"
.LC166:
	.string	"thttpd.c:372:17 (main)"
.LC167:
	.string	"nobody"
.LC168:
	.string	"iso-8859-1"
.LC169:
	.string	"thttpd.c:884:32 (main)"
.LC170:
	.string	"thttpd.c:884:42 (main)"
.LC171:
	.string	"-V"
.LC172:
	.string	"thttpd/2.25b 29dec2003"
.LC173:
	.string	"%s\n"
.LC174:
	.string	"-C"
.LC175:
	.string	"thttpd.c:894:17 (main)"
.LC176:
	.string	"-p"
.LC177:
	.string	"thttpd.c:899:34 (main)"
.LC178:
	.string	"-d"
.LC179:
	.string	"thttpd.c:904:16 (main)"
.LC180:
	.string	"-r"
.LC181:
	.string	"-nor"
.LC182:
	.string	"-dd"
.LC183:
	.string	"thttpd.c:919:21 (main)"
.LC184:
	.string	"-s"
.LC185:
	.string	"-nos"
.LC186:
	.string	"-u"
.LC187:
	.string	"thttpd.c:928:17 (main)"
.LC188:
	.string	"-c"
.LC189:
	.string	"thttpd.c:933:24 (main)"
.LC190:
	.string	"-t"
.LC191:
	.string	"thttpd.c:938:25 (main)"
.LC192:
	.string	"-h"
.LC193:
	.string	"thttpd.c:943:21 (main)"
.LC194:
	.string	"-l"
.LC195:
	.string	"thttpd.c:948:20 (main)"
.LC196:
	.string	"-v"
.LC197:
	.string	"-nov"
.LC198:
	.string	"-g"
.LC199:
	.string	"-nog"
.LC200:
	.string	"-i"
.LC201:
	.string	"thttpd.c:961:20 (main)"
.LC202:
	.string	"-T"
.LC203:
	.string	"thttpd.c:966:20 (main)"
.LC204:
	.string	"-P"
.LC205:
	.string	"thttpd.c:971:16 (main)"
.LC206:
	.string	"-M"
.LC207:
	.string	"thttpd.c:976:20 (main)"
.LC208:
	.string	"-D"
	.align 8
.LC209:
	.string	"thttpd.c:1240:21 (lookup_hostname) hints"
	.align 8
.LC210:
	.string	"thttpd.c:1241:10 (lookup_hostname) portstr"
	.align 8
.LC211:
	.string	"thttpd.c:1243:22 (lookup_hostname) ai"
.LC212:
	.string	"%d"
.LC213:
	.string	"getaddrinfo %.80s - %.80s"
.LC214:
	.string	"%s: getaddrinfo %s - %s\n"
.LC215:
	.string	"thttpd.c:1269:14 (main)"
.LC216:
	.string	"thttpd.c:1267:54 (main)"
.LC217:
	.string	"thttpd.c:1286:21 (main)"
	.align 8
.LC218:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
.LC219:
	.string	"thttpd.c:1295:43 (main)"
.LC220:
	.string	"thttpd.c:1295:28 (main)"
.LC221:
	.string	"thttpd.c:1303:21 (main)"
.LC222:
	.string	"thttpd.c:1312:43 (main)"
.LC223:
	.string	"thttpd.c:1312:28 (main)"
.LC224:
	.string	"can't find any valid address"
	.align 8
.LC225:
	.string	"%s: can't find any valid address\n"
	.align 8
.LC226:
	.string	"thttpd.c:1373:10 (read_throttlefile) buf"
	.align 8
.LC227:
	.string	"thttpd.c:1376:10 (read_throttlefile) pattern"
	.align 8
.LC228:
	.string	"thttpd.c:1377:10 (read_throttlefile) max_limit"
	.align 8
.LC229:
	.string	"thttpd.c:1377:21 (read_throttlefile) min_limit"
	.align 8
.LC230:
	.string	"thttpd.c:1378:20 (read_throttlefile) tv"
.LC231:
	.string	"%.80s - %m"
.LC232:
	.string	"thttpd.c:1395:10 (main)"
.LC233:
	.string	"thttpd.c:1402:17 (main)"
.LC234:
	.string	"thttpd.c:1400:8 (main)"
.LC235:
	.string	" %4900[^ \t] %ld-%ld"
.LC236:
	.string	" %4900[^ \t] %ld"
	.align 8
.LC237:
	.string	"unparsable line in %.80s - %.80s"
	.align 8
.LC238:
	.string	"%s: unparsable line in %.80s - %.80s\n"
.LC239:
	.string	"thttpd.c:1424:14 (main)"
.LC240:
	.string	"|/"
	.align 8
.LC241:
	.string	"out of memory allocating a throttletab"
	.align 8
.LC242:
	.string	"%s: out of memory allocating a throttletab\n"
.LC243:
	.string	"thttpd.c:1453:34 (main)"
.LC244:
	.string	"thttpd.c:1454:36 (main)"
.LC245:
	.string	"thttpd.c:1455:36 (main)"
.LC246:
	.string	"thttpd.c:1456:31 (main)"
.LC247:
	.string	"thttpd.c:1457:42 (main)"
.LC248:
	.string	"thttpd.c:1458:38 (main)"
.LC249:
	.string	"unknown user - '%.80s'"
.LC250:
	.string	"%s: unknown user - '%s'\n"
.LC251:
	.string	"thttpd.c:415:6 (main)"
.LC252:
	.string	"thttpd.c:416:6 (main)"
.LC253:
	.string	"/dev/null"
.LC254:
	.string	"-"
.LC255:
	.string	"a"
.LC256:
	.string	"thttpd.c:438:22 (main)"
	.align 8
.LC257:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 8
.LC258:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
.LC259:
	.string	"fchown logfile - %m"
.LC260:
	.string	"fchown logfile"
.LC261:
	.string	"chdir - %m"
.LC262:
	.string	"chdir"
.LC263:
	.string	"thttpd.c:488:13 (main)"
.LC264:
	.string	"/"
.LC265:
	.string	"daemon - %m"
.LC266:
	.string	"w"
.LC267:
	.string	"%d\n"
	.align 8
.LC268:
	.string	"fdwatch initialization failure"
.LC269:
	.string	"chroot - %m"
	.align 8
.LC270:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 8
.LC271:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
.LC272:
	.string	"chroot chdir - %m"
.LC273:
	.string	"chroot chdir"
.LC274:
	.string	"data_dir chdir - %m"
.LC275:
	.string	"data_dir chdir"
.LC276:
	.string	"tmr_create(occasional) failed"
.LC277:
	.string	"tmr_create(idle) failed"
	.align 8
.LC278:
	.string	"tmr_create(update_throttles) failed"
.LC279:
	.string	"tmr_create(show_stats) failed"
.LC280:
	.string	"setgroups - %m"
.LC281:
	.string	"setgid - %m"
.LC282:
	.string	"initgroups - %m"
.LC283:
	.string	"setuid - %m"
	.align 8
.LC284:
	.string	"started as root without requesting chroot(), warning only"
	.align 8
.LC285:
	.string	"out of memory allocating a connecttab"
.LC286:
	.string	"thttpd.c:727:28 (main)"
.LC287:
	.string	"thttpd.c:728:35 (main)"
.LC288:
	.string	"thttpd.c:729:20 (main)"
.LC289:
	.string	"thttpd.c:731:50 (main)"
.LC290:
	.string	"thttpd.c:738:9 (main)"
.LC291:
	.string	"thttpd.c:740:9 (main)"
.LC292:
	.string	"re-opening logfile"
.LC293:
	.string	"re-opening %.80s - %m"
.LC294:
	.string	"thttpd.c:759:11 (main)"
.LC295:
	.string	"fdwatch - %m"
.LC296:
	.string	"thttpd.c:774:36 (main)"
.LC297:
	.string	"thttpd.c:777:28 (main)"
.LC298:
	.string	"thttpd.c:784:36 (main)"
.LC299:
	.string	"thttpd.c:787:28 (main)"
.LC300:
	.string	"thttpd.c:800:9 (main)"
.LC301:
	.string	"thttpd.c:801:29 (main)"
.LC302:
	.string	"thttpd.c:805:13 (main)"
	.align 8
.LC303:
	.string	"thttpd.c:1591:10 (handle_read) readbuf"
.LC304:
	.string	"thttpd.c:1590:17 (main)"
.LC305:
	.string	"thttpd.c:1594:12 (main)"
.LC306:
	.string	"thttpd.c:1594:28 (main)"
.LC307:
	.string	"thttpd.c:1609:4 (main)"
.LC308:
	.string	"thttpd.c:1609:20 (main)"
.LC309:
	.string	"thttpd.c:1607:14 (main)"
.LC310:
	.string	"thttpd.c:1623:7 (main)"
.LC311:
	.string	"thttpd.c:1630:17 (main)"
.LC312:
	.string	"thttpd.c:1630:27 (main)"
.LC313:
	.string	"thttpd.c:1631:18 (main)"
.LC314:
	.string	"thttpd.c:1632:18 (main)"
.LC315:
	.string	"thttpd.c:1890:17 (main)"
.LC316:
	.string	"thttpd.c:1891:33 (main)"
.LC317:
	.string	"thttpd.c:1891:18 (main)"
.LC318:
	.string	"thttpd.c:1894:40 (main)"
.LC319:
	.string	"thttpd.c:1894:44 (main)"
.LC320:
	.string	"thttpd.c:1894:29 (main)"
.LC321:
	.string	"thttpd.c:1897:26 (main)"
.LC322:
	.string	"thttpd.c:1897:49 (main)"
.LC323:
	.string	"thttpd.c:1900:49 (main)"
.LC324:
	.string	"thttpd.c:1902:26 (main)"
	.align 8
.LC325:
	.string	"throttle sending count was negative - shouldn't happen!"
.LC326:
	.string	"thttpd.c:1905:31 (main)"
.LC327:
	.string	"thttpd.c:1907:16 (main)"
.LC328:
	.string	"thttpd.c:1907:30 (main)"
.LC329:
	.string	"thttpd.c:1907:26 (main)"
.LC330:
	.string	"thttpd.c:1908:23 (main)"
.LC331:
	.string	"thttpd.c:1908:6 (main)"
.LC332:
	.string	"thttpd.c:1909:25 (main)"
.LC333:
	.string	"thttpd.c:1910:12 (main)"
.LC334:
	.string	"thttpd.c:1911:16 (main)"
.LC335:
	.string	"thttpd.c:1913:16 (main)"
.LC336:
	.string	"thttpd.c:1914:8 (main)"
.LC337:
	.string	"thttpd.c:1915:12 (main)"
.LC338:
	.string	"thttpd.c:1916:16 (main)"
.LC339:
	.string	"thttpd.c:1918:16 (main)"
.LC340:
	.string	"thttpd.c:1892:45 (main)"
.LC341:
	.string	"thttpd.c:1655:16 (main)"
.LC342:
	.string	"thttpd.c:1670:12 (main)"
.LC343:
	.string	"thttpd.c:1672:25 (main)"
.LC344:
	.string	"thttpd.c:1672:21 (main)"
.LC345:
	.string	"thttpd.c:1673:24 (main)"
.LC346:
	.string	"thttpd.c:1673:20 (main)"
.LC347:
	.string	"thttpd.c:1675:17 (main)"
.LC348:
	.string	"thttpd.c:1676:20 (main)"
.LC349:
	.string	"thttpd.c:1678:20 (main)"
.LC350:
	.string	"thttpd.c:1681:12 (main)"
.LC351:
	.string	"thttpd.c:1685:26 (main)"
.LC352:
	.string	"thttpd.c:1686:24 (main)"
.LC353:
	.string	"thttpd.c:1686:48 (main)"
.LC354:
	.string	"thttpd.c:1686:53 (main)"
.LC355:
	.string	"thttpd.c:1687:25 (main)"
.LC356:
	.string	"thttpd.c:1687:21 (main)"
.LC357:
	.string	"thttpd.c:1691:11 (main)"
.LC358:
	.string	"thttpd.c:1691:33 (main)"
.LC359:
	.string	"thttpd.c:1699:19 (main)"
.LC360:
	.string	"thttpd.c:1700:19 (main)"
.LC361:
	.string	"thttpd.c:1701:25 (main)"
.LC362:
	.string	"thttpd.c:1704:19 (main)"
.LC363:
	.string	"thttpd.c:1705:19 (main)"
.LC364:
	.string	"thttpd.c:1716:17 (main)"
.LC365:
	.string	"thttpd.c:1719:11 (main)"
.LC366:
	.string	"thttpd.c:1725:12 (main)"
.LC367:
	.string	"thttpd.c:1730:6 (main)"
.LC368:
	.string	"thttpd.c:1729:23 (main)"
.LC369:
	.string	"thttpd.c:1728:12 (main)"
	.align 8
.LC370:
	.string	"thttpd.c:1737:15 (handle_send) iv"
.LC371:
	.string	"thttpd.c:1739:21 (main)"
.LC372:
	.string	"thttpd.c:1739:17 (main)"
.LC373:
	.string	"thttpd.c:1740:20 (main)"
.LC374:
	.string	"thttpd.c:1740:16 (main)"
.LC375:
	.string	"thttpd.c:1741:23 (main)"
.LC376:
	.string	"thttpd.c:1741:39 (main)"
.LC377:
	.string	"thttpd.c:1741:17 (main)"
.LC378:
	.string	"thttpd.c:1742:18 (main)"
.LC379:
	.string	"thttpd.c:1742:16 (main)"
.LC380:
	.string	"thttpd.c:1743:13 (main)"
.LC381:
	.string	"thttpd.c:1746:20 (main)"
.LC382:
	.string	"thttpd.c:1762:22 (main)"
.LC383:
	.string	"thttpd.c:1763:16 (main)"
.LC384:
	.string	"thttpd.c:1764:16 (main)"
.LC385:
	.string	"thttpd.c:1766:8 (main)"
	.align 8
.LC386:
	.string	"replacing non-null wakeup_timer!"
.LC387:
	.string	"thttpd.c:1768:30 (main)"
.LC388:
	.string	"thttpd.c:1768:18 (main)"
	.align 8
.LC389:
	.string	"tmr_create(wakeup_connection) failed"
.LC390:
	.string	"thttpd.c:1792:12 (main)"
.LC391:
	.string	"write - %m sending %.80s"
.LC392:
	.string	"thttpd.c:1798:18 (main)"
.LC393:
	.string	"thttpd.c:1800:12 (main)"
.LC394:
	.string	"thttpd.c:1807:40 (main)"
.LC395:
	.string	"thttpd.c:1808:22 (main)"
.LC396:
	.string	"thttpd.c:1815:22 (main)"
.LC397:
	.string	"thttpd.c:1819:24 (main)"
.LC398:
	.string	"thttpd.c:1820:6 (main)"
.LC399:
	.string	"thttpd.c:1820:23 (main)"
.LC400:
	.string	"thttpd.c:1821:29 (main)"
.LC401:
	.string	"thttpd.c:1822:20 (main)"
.LC402:
	.string	"thttpd.c:1822:44 (main)"
.LC403:
	.string	"thttpd.c:1825:33 (main)"
.LC404:
	.string	"thttpd.c:1833:11 (main)"
.LC405:
	.string	"thttpd.c:1834:22 (main)"
.LC406:
	.string	"thttpd.c:1837:11 (main)"
.LC407:
	.string	"thttpd.c:1839:27 (main)"
.LC408:
	.string	"thttpd.c:1844:20 (main)"
.LC409:
	.string	"thttpd.c:1845:20 (main)"
.LC410:
	.string	"thttpd.c:1849:15 (main)"
.LC411:
	.string	"thttpd.c:1849:19 (main)"
.LC412:
	.string	"thttpd.c:1849:35 (main)"
.LC413:
	.string	"thttpd.c:1851:12 (main)"
.LC414:
	.string	"thttpd.c:1853:22 (main)"
	.align 8
.LC415:
	.string	"thttpd.c:1870:10 (handle_linger) buf"
.LC416:
	.string	"thttpd.c:1876:16 (main)"
.LC417:
	.string	"thttpd.c:1876:13 (main)"
.LC418:
	.string	"thttpd.c:1877:21 (main)"
.LC419:
	.string	"thttpd.c:819:10 (main)"
.LC420:
	.string	"thttpd.c:821:10 (main)"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB78:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC160, %ecx
	movq	%rsi, %r15
	movl	$3, %edx
	movl	$4097, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$14680, %rsp
	.cfi_def_cfa_offset 14736
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	leaq	10240(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 144(%rsp)
	call	__mf_register
	leaq	14352(%rsp), %rdx
	leaq	14352(%rsp), %rdi
	movl	$.LC161, %ecx
	movl	$128, %esi
	movq	%rdx, 136(%rsp)
	movl	$3, %edx
	call	__mf_register
	leaq	14480(%rsp), %rcx
	leaq	14480(%rsp), %rdi
	movl	$3, %edx
	movl	$128, %esi
	movq	%rcx, 160(%rsp)
	movl	$.LC162, %ecx
	call	__mf_register
	leaq	14664(%rsp), %rdi
	movl	$.LC163, %ecx
	movl	$3, %edx
	movl	$4, %esi
	call	__mf_register
	leaq	14668(%rsp), %rdi
	movl	$.LC164, %ecx
	movl	$3, %edx
	movl	$4, %esi
	call	__mf_register
	leaq	14608(%rsp), %rdi
	movl	$.LC165, %ecx
	movl	$3, %edx
	movl	$16, %esi
	call	__mf_register
	movq	%r15, %rdx
	movl	%r12d, %ecx
	leaq	7(%r15), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1046
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1046
.L515:
	movq	(%r15), %rbx
	movl	$47, %esi
	movq	%rbx, %rdi
	movq	%rbx, argv0(%rip)
	call	__mfwrap_strrchr
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	movl	$9, %esi
	cmovne	%rdx, %rbx
	movl	$24, %edx
	movq	%rbx, %rdi
	call	openlog
	cmpl	$1, %r14d
	movl	$0, debug(%rip)
	movw	$80, port(%rip)
	movq	$0, dir(%rip)
	movq	$0, data_dir(%rip)
	movl	$0, do_chroot(%rip)
	movl	$0, no_log(%rip)
	movl	$0, no_symlink_check(%rip)
	movl	$0, do_vhost(%rip)
	movl	$0, do_global_passwd(%rip)
	movq	$0, cgi_pattern(%rip)
	movl	$0, cgi_limit(%rip)
	movq	$0, url_pattern(%rip)
	movl	$0, no_empty_referers(%rip)
	movq	$0, local_pattern(%rip)
	movq	$0, throttlefile(%rip)
	movq	$0, hostname(%rip)
	movq	$0, logfile(%rip)
	movq	$0, pidfile(%rip)
	movq	$.LC167, user(%rip)
	movq	$.LC168, charset(%rip)
	movq	$.LC103, p3p(%rip)
	movl	$-1, max_age(%rip)
	jle	.L1036
	leaq	8(%r15), %rdi
	movl	%r12d, %ecx
	leaq	15(%r15), %rax
	movq	%rdi, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L1047
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1047
.L519:
	movq	8(%r15), %rbx
	movl	%r12d, %ecx
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1048
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L1048
.L521:
	cmpb	$45, (%rbx)
	jne	.L1032
	movl	$1, %r13d
	movb	%r12b, 128(%rsp)
	jmp	.L578
	.p2align 4,,10
	.p2align 3
.L1272:
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L532
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1051
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1051
.L533:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, dir(%rip)
.L528:
	addl	$1, %r13d
	cmpl	%r13d, %r14d
	jle	.L1241
.L1273:
	movslq	%r13d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1062
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1062
.L574:
	movq	(%rbx), %rbx
	movzbl	128(%rsp), %ecx
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1063
	cmpq	__mf_lookup_cache+8(%rax), %rbx
	ja	.L1063
.L576:
	cmpb	$45, (%rbx)
	jne	.L1032
.L578:
	movl	$.LC171, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L1269
	movl	$.LC174, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L525
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jg	.L1270
.L525:
	movl	$.LC176, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L529
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jg	.L1271
.L529:
	movl	$.LC178, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L1272
.L532:
	movl	$.LC180, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L535
	addl	$1, %r13d
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	cmpl	%r13d, %r14d
	jg	.L1273
.L1241:
	movzbl	128(%rsp), %r12d
.L518:
	cmpl	%r13d, %r14d
	jne	.L1032
	leaq	5232(%rsp), %r13
	call	tzset
	movl	$.LC209, %ecx
	movl	$3, %edx
	movl	$48, %esi
	movq	%r13, %rdi
	call	__mf_register
	leaq	14624(%rsp), %rdi
	movl	$.LC210, %ecx
	movl	$3, %edx
	movl	$10, %esi
	call	__mf_register
	leaq	14640(%rsp), %rdi
	movl	$.LC211, %ecx
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_register
	xorl	%eax, %eax
	movl	$6, %ecx
	movq	%r13, %rdi
	rep stosq
	movzwl	port(%rip), %r9d
	leaq	14624(%rsp), %rdi
	movl	$.LC212, %r8d
	movl	$1, %edx
	movl	$10, %esi
	movl	$1, 5232(%rsp)
	movl	$1, 5240(%rsp)
	movb	$10, %cl
	call	__snprintf_chk
	movq	hostname(%rip), %rdi
	leaq	14640(%rsp), %rcx
	leaq	14624(%rsp), %rsi
	movq	%r13, %rdx
	call	getaddrinfo
	testl	%eax, %eax
	movl	%eax, %ebx
	jne	.L1274
	movq	14640(%rsp), %r15
	testq	%r15, %r15
	je	.L581
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	movl	%r12d, %ecx
	jmp	.L589
	.p2align 4,,10
	.p2align 3
.L1276:
	cmpl	$10, %eax
	jne	.L584
	testq	%r14, %r14
	cmove	%r15, %r14
.L584:
	movq	%r15, %rdx
	leaq	47(%r15), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1065
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1065
.L587:
	movq	40(%r15), %r15
	testq	%r15, %r15
	je	.L1275
.L589:
	movq	%r15, %rdx
	leaq	7(%r15), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1064
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1064
.L582:
	movl	4(%r15), %eax
	cmpl	$2, %eax
	jne	.L1276
	testq	%rbx, %rbx
	cmove	%r15, %rbx
	jmp	.L584
	.p2align 4,,10
	.p2align 3
.L535:
	movl	$.LC181, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L536
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L1270:
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1049
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1049
.L526:
	movq	(%rbx), %rdi
	movl	%r12d, %r13d
	call	read_config
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L536:
	movl	$.LC182, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L537
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L537
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1052
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1052
.L538:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, data_dir(%rip)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L1271:
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1050
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1050
.L530:
	movq	(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%r12d, %r13d
	call	strtol
	movw	%ax, port(%rip)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L537:
	movl	$.LC184, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L540
	movl	$0, no_symlink_check(%rip)
	jmp	.L528
.L540:
	movl	$.LC185, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L541
	movl	$1, no_symlink_check(%rip)
	jmp	.L528
.L541:
	movl	$.LC186, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L1277
.L542:
	movl	$.LC188, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L545
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L545
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1054
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1054
.L546:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, cgi_pattern(%rip)
	jmp	.L528
.L1277:
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L542
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1053
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1053
.L543:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, user(%rip)
	jmp	.L528
.L545:
	movl	$.LC190, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L548
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L548
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1055
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1055
.L549:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, throttlefile(%rip)
	jmp	.L528
.L548:
	movl	$.LC192, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L1278
.L551:
	movl	$.LC194, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L554
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L554
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1057
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1057
.L555:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, logfile(%rip)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L1275:
	testq	%r14, %r14
	movl	%ecx, %r12d
	je	.L1279
	movq	%r14, %rax
	leaq	19(%r14), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1066
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1066
.L592:
	mov	16(%r14), %r9d
	cmpl	$128, %r9d
	ja	.L1256
	movq	160(%rsp), %rdi
	xorl	%eax, %eax
	movl	$16, %ecx
	rep stosq
	movq	%r14, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1067
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1067
.L595:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	mov	16(%r14), %r15d
	shrq	%cl, %rdx
	leaq	31(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1068
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1068
.L597:
	movq	24(%r14), %rsi
	leaq	14480(%rsp), %rdi
	movl	$128, %ecx
	movq	%r15, %rdx
	call	__memmove_chk
	movl	$1, 14668(%rsp)
.L591:
	testq	%rbx, %rbx
	je	.L1280
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	19(%rbx), %r14
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1069
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1069
.L601:
	mov	16(%rbx), %r9d
	cmpl	$128, %r9d
	ja	.L1256
	movq	136(%rsp), %rdi
	xorl	%eax, %eax
	movl	$16, %ecx
	rep stosq
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1070
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1070
.L604:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	mov	16(%rbx), %r14d
	shrq	%cl, %rdx
	leaq	31(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1071
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1071
.L606:
	movq	24(%rbx), %rsi
	leaq	14352(%rsp), %rdi
	movl	$128, %ecx
	movq	%r14, %rdx
	call	__memmove_chk
	movl	$1, 14664(%rsp)
.L600:
	movq	14640(%rsp), %rdi
	call	freeaddrinfo
	movl	$3, %edx
	movl	$48, %esi
	movq	%r13, %rdi
	call	__mf_unregister
	leaq	14624(%rsp), %rdi
	movl	$3, %edx
	movl	$10, %esi
	call	__mf_unregister
	leaq	14640(%rsp), %rdi
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_unregister
	movl	14664(%rsp), %r15d
	testl	%r15d, %r15d
	jne	.L608
	cmpl	$0, 14668(%rsp)
	je	.L1281
.L608:
	movq	throttlefile(%rip), %rsi
	movl	$0, numthrottles(%rip)
	movl	$0, maxthrottles(%rip)
	movq	$0, throttles(%rip)
	testq	%rsi, %rsi
	movq	%rsi, 128(%rsp)
	je	.L609
	leaq	224(%rsp), %rbx
	movl	$.LC226, %ecx
	movl	$3, %edx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	__mf_register
	movl	$.LC227, %ecx
	movl	$3, %edx
	movl	$5000, %esi
	movq	%r13, %rdi
	call	__mf_register
	leaq	14648(%rsp), %rdi
	movl	$.LC228, %ecx
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_register
	leaq	14656(%rsp), %rdi
	movl	$.LC229, %ecx
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_register
	leaq	14624(%rsp), %rdi
	movl	$.LC230, %ecx
	movl	$3, %edx
	movl	$16, %esi
	call	__mf_register
	movq	128(%rsp), %rdi
	movl	$.LC121, %esi
	call	__mfwrap_fopen
	testq	%rax, %rax
	movq	%rax, %r15
	je	.L1282
	leaq	14624(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	leaq	1(%r13), %rax
	movq	%rax, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L1233:
	movq	%r15, %rdx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L1283
	movl	$35, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strchr
	testq	%rax, %rax
	je	.L612
	movq	%rax, %rdx
	movl	%r12d, %ecx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rax
	jb	.L1072
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1072
.L613:
	movb	$0, (%rax)
.L612:
	movq	%rbx, %rdi
	call	__mfwrap_strlen
	cmpl	$0, %eax
	movl	%r12d, %ecx
	jle	.L1284
	.p2align 4,,10
	.p2align 3
.L1223:
	movq	%rbx, %rsi
	subl	$1, %eax
	shrq	%cl, %rsi
	movslq	%eax, %r14
	andq	%rbp, %rsi
	leaq	(%rbx,%r14), %rdx
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L1074
	cmpq	%rdx, __mf_lookup_cache+8(%rsi)
	jb	.L1074
.L621:
	movzbl	224(%rsp,%r14), %edx
	cmpb	$9, %dl
	je	.L623
	cmpb	$32, %dl
	je	.L623
	cmpb	$10, %dl
	je	.L623
	cmpb	$13, %dl
	.p2align 4,,2
	jne	.L1285
.L623:
	movq	%rbx, %rsi
	leaq	(%rbx,%r14), %rdx
	shrq	%cl, %rsi
	andq	%rbp, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %rbx
	jb	.L1073
	cmpq	%rdx, __mf_lookup_cache+8(%rsi)
	jb	.L1073
.L617:
	testl	%eax, %eax
	movb	$0, 224(%rsp,%r14)
	jne	.L1223
	movl	%ecx, %r12d
	jmp	.L1233
	.p2align 4,,10
	.p2align 3
.L1285:
	movl	%ecx, %r12d
.L624:
	leaq	14648(%rsp), %r8
	leaq	14656(%rsp), %rcx
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC235, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L625
	leaq	14648(%rsp), %rcx
	xorl	%eax, %eax
	movq	%r13, %rdx
	movl	$.LC236, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L626
	movq	$0, 14656(%rsp)
.L625:
	movq	%r13, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r13
	jb	.L1075
	cmpq	__mf_lookup_cache+8(%rax), %r13
	ja	.L1075
.L628:
	cmpb	$47, 5232(%rsp)
	jne	.L1230
	jmp	.L1319
	.p2align 4,,10
	.p2align 3
.L632:
	leaq	2(%rax), %rsi
	leaq	1(%rax), %rdi
	call	strcpy
.L1230:
	movl	$.LC240, %esi
	movq	%r13, %rdi
	call	__mfwrap_strstr
	testq	%rax, %rax
	jne	.L632
	movl	numthrottles(%rip), %edx
	movl	maxthrottles(%rip), %eax
	cmpl	%eax, %edx
	jl	.L633
	testl	%eax, %eax
	jne	.L634
	movl	$4800, %edi
	movl	$100, maxthrottles(%rip)
	call	malloc
	movq	%rax, throttles(%rip)
.L635:
	testq	%rax, %rax
	je	.L636
	movl	numthrottles(%rip), %edx
.L637:
	movslq	%edx, %rdx
	movq	%r13, %rdi
	leaq	(%rdx,%rdx,2), %rdx
	salq	$4, %rdx
	leaq	(%rax,%rdx), %r14
	call	e_strdup
	movq	%r14, %rdi
	movl	%r12d, %ecx
	leaq	7(%r14), %rdx
	shrq	%cl, %rdi
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1076
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1076
.L638:
	movq	%rax, (%r14)
	movl	numthrottles(%rip), %eax
	movl	%r12d, %ecx
	movq	14648(%rsp), %r8
	movslq	%eax, %rdx
	leaq	(%rdx,%rdx,2), %r14
	salq	$4, %r14
	addq	throttles(%rip), %r14
	movq	%r14, %rdi
	leaq	15(%r14), %rdx
	shrq	%cl, %rdi
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1077
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1077
.L640:
	movq	%r14, %rdi
	movl	%r12d, %ecx
	movq	%r8, 8(%r14)
	shrq	%cl, %rdi
	movq	14656(%rsp), %r8
	leaq	23(%r14), %rdx
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1078
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1078
.L642:
	movq	%r14, %rdi
	movl	%r12d, %ecx
	movq	%r8, 16(%r14)
	shrq	%cl, %rdi
	leaq	31(%r14), %rdx
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1079
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1079
.L644:
	movq	%r14, %rdi
	movl	%r12d, %ecx
	movq	$0, 24(%r14)
	shrq	%cl, %rdi
	leaq	39(%r14), %rdx
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1080
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1080
.L646:
	movq	%r14, %rdi
	movl	%r12d, %ecx
	movq	$0, 32(%r14)
	shrq	%cl, %rdi
	leaq	43(%r14), %rdx
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	jb	.L1081
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1081
.L648:
	addl	$1, %eax
	movl	$0, 40(%r14)
	movl	%eax, numthrottles(%rip)
	jmp	.L1233
.L626:
	movq	128(%rsp), %rcx
	movq	%rbx, %r8
	xorl	%eax, %eax
	movl	$.LC237, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	movq	128(%rsp), %r8
	movq	argv0(%rip), %rcx
	movq	%rbx, %r9
	movq	stderr(%rip), %rdi
	movl	$.LC238, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	jmp	.L1233
.L634:
	addl	%eax, %eax
	movq	throttles(%rip), %rdi
	movl	%eax, maxthrottles(%rip)
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %rsi
	call	realloc
	movq	%rax, throttles(%rip)
	jmp	.L635
.L1283:
	movq	%r15, %rdi
	call	__mfwrap_fclose
	movl	$3, %edx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	__mf_unregister
	movl	$3, %edx
	movl	$5000, %esi
	movq	%r13, %rdi
	call	__mf_unregister
	leaq	14648(%rsp), %rdi
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_unregister
	leaq	14656(%rsp), %rdi
	movl	$3, %edx
	movl	$8, %esi
	call	__mf_unregister
	leaq	14624(%rsp), %rdi
	movl	$3, %edx
	movl	$16, %esi
	call	__mf_unregister
.L609:
	call	getuid
	testl	%eax, %eax
	movl	$32767, %r15d
	movl	$32767, 128(%rsp)
	je	.L1287
.L652:
	movq	logfile(%rip), %rbx
	testq	%rbx, %rbx
	je	.L1040
	movl	$.LC253, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L659
	movl	$1, no_log(%rip)
	xorl	%ebx, %ebx
.L658:
	movq	dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L665
	call	chdir
	testl	%eax, %eax
	js	.L1288
.L665:
	leaq	10240(%rsp), %rdi
	movl	$4096, %esi
	call	getcwd
	leaq	10240(%rsp), %rdi
	call	__mfwrap_strlen
	movq	144(%rsp), %rdx
	movl	%r12d, %ecx
	leaq	-1(%rax), %r14
	leaq	10240(%rsp), %rax
	movq	144(%rsp), %rsi
	shrq	%cl, %rdx
	addq	%r14, %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rsi
	jb	.L1085
	cmpq	%rax, __mf_lookup_cache+8(%rdx)
	jb	.L1085
.L666:
	cmpb	$47, 10240(%rsp,%r14)
	je	.L668
	leaq	10240(%rsp), %rdi
	movl	$4097, %edx
	movl	$.LC264, %esi
	call	__strcat_chk
.L668:
	movl	debug(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L669
	movq	stdin(%rip), %rdi
	call	__mfwrap_fclose
	movq	stdout(%rip), %rdi
	cmpq	%rdi, %rbx
	je	.L670
	call	__mfwrap_fclose
.L670:
	movq	stderr(%rip), %rdi
	call	__mfwrap_fclose
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
	testl	%eax, %eax
	movl	$.LC265, %edx
	js	.L1259
.L671:
	movq	pidfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L672
	movl	$.LC266, %esi
	call	__mfwrap_fopen
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L1289
	call	getpid
	movq	%r14, %rdi
	movl	%eax, %ecx
	movl	$.LC267, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movq	%r14, %rdi
	call	__mfwrap_fclose
.L672:
	call	fdwatch_get_nfiles
	testl	%eax, %eax
	movl	%eax, max_connects(%rip)
	movl	$.LC268, %edx
	js	.L1259
	subl	$10, %eax
	cmpl	$0, do_chroot(%rip)
	movl	%eax, max_connects(%rip)
	jne	.L1290
.L675:
	movq	data_dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L679
	call	chdir
	testl	%eax, %eax
	js	.L1291
.L679:
	movl	$handle_term, %esi
	movl	$15, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_term, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_chld, %esi
	movl	$17, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$1, %esi
	movl	$13, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_hup, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_usr1, %esi
	movl	$10, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_usr2, %esi
	movl	$12, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$handle_alrm, %esi
	movl	$14, %edi
	xorl	%eax, %eax
	call	sigset
	movl	$360, %edi
	movl	$0, got_hup(%rip)
	movl	$0, got_usr1(%rip)
	movl	$0, watchdog_flag(%rip)
	call	alarm
	call	tmr_init
	movl	no_empty_referers(%rip), %eax
	xorl	%esi, %esi
	cmpl	$0, 14668(%rsp)
	movq	160(%rsp), %rdx
	movzwl	port(%rip), %ecx
	movl	cgi_limit(%rip), %r9d
	movq	cgi_pattern(%rip), %r8
	movl	%eax, 88(%rsp)
	movq	local_pattern(%rip), %rax
	cmove	%rsi, %rdx
	cmpl	$0, 14664(%rsp)
	movq	hostname(%rip), %rdi
	cmovne	136(%rsp), %rsi
	movq	%rbx, 40(%rsp)
	movq	%rax, 80(%rsp)
	movq	url_pattern(%rip), %rax
	movq	%rax, 72(%rsp)
	movl	do_global_passwd(%rip), %eax
	movl	%eax, 64(%rsp)
	movl	do_vhost(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	no_symlink_check(%rip), %eax
	movl	%eax, 48(%rsp)
	movl	no_log(%rip), %eax
	movl	%eax, 32(%rsp)
	leaq	10240(%rsp), %rax
	movq	%rax, 24(%rsp)
	movl	max_age(%rip), %eax
	movl	%eax, 16(%rsp)
	movq	p3p(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	charset(%rip), %rax
	movq	%rax, (%rsp)
	call	httpd_initialize
	testq	%rax, %rax
	movq	%rax, hs(%rip)
	je	.L1261
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$120000, %ecx
	movl	$occasional, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC276, %edx
	je	.L1260
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$5000, %ecx
	movl	$idle, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC277, %edx
	je	.L1260
	cmpl	$0, numthrottles(%rip)
	jle	.L685
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$2000, %ecx
	movl	$update_throttles, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC278, %edx
	je	.L1260
.L685:
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$3600000, %ecx
	movl	$show_stats, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L1292
	xorl	%edi, %edi
	call	__mfwrap_time
	movq	$0, stats_connections(%rip)
	movq	%rax, stats_time(%rip)
	movq	%rax, start_time(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	call	getuid
	testl	%eax, %eax
	je	.L1293
.L687:
	movslq	max_connects(%rip), %rdi
	imulq	$144, %rdi, %rdi
	call	malloc
	testq	%rax, %rax
	movq	%rax, 128(%rsp)
	movq	%rax, connects(%rip)
	je	.L692
	movl	max_connects(%rip), %r15d
	testl	%r15d, %r15d
	jle	.L694
	movq	128(%rsp), %rbx
	xorl	%r14d, %r14d
	movl	%r12d, %ecx
.L701:
	movq	%rbx, %rdx
	leaq	3(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	%rbx, __mf_lookup_cache(%rdx)
	ja	.L1086
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1086
.L695:
	leaq	4(%rbx), %rdi
	addl	$1, %r14d
	movl	$0, (%rbx)
	leaq	7(%rbx), %rax
	movq	%rdi, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L1087
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1087
.L697:
	leaq	8(%rbx), %rdi
	movl	%r14d, 4(%rbx)
	leaq	15(%rbx), %rax
	movq	%rdi, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rdi
	jb	.L1088
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1088
.L699:
	movq	$0, 8(%rbx)
	addq	$144, %rbx
	cmpl	%r15d, %r14d
	jne	.L701
	movl	%ecx, %r12d
.L694:
	movslq	%r15d, %rbx
	movl	%r12d, %ecx
	subq	$1, %rbx
	imulq	$144, %rbx, %rbx
	addq	128(%rsp), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1089
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1089
.L702:
	movl	$-1, 4(%rbx)
	movq	hs(%rip), %rbx
	movl	$0, first_free_connect(%rip)
	movl	$0, num_connects(%rip)
	movl	$0, httpd_conn_count(%rip)
	testq	%rbx, %rbx
	je	.L704
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	75(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1090
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1090
.L705:
	movl	72(%rbx), %edi
	cmpl	$-1, %edi
	je	.L707
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.L707:
	movq	hs(%rip), %rbx
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	leaq	79(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1091
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1091
.L708:
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L704
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.L704:
	leaq	14608(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	leaq	224(%rsp), %rsi
	movq	%rsi, %rax
	movq	%rsi, %rdx
	movq	%rsi, %rcx
	addq	$7, %rax
	addq	$15, %rdx
	addq	$23, %rcx
	movq	%rsi, 120(%rsp)
	movq	%rax, 200(%rsp)
	movq	%rdx, 208(%rsp)
	movq	%rcx, 216(%rsp)
.L1234:
	movl	terminate(%rip), %r11d
	testl	%r11d, %r11d
	je	.L1029
	cmpl	$0, num_connects(%rip)
	jle	.L1294
.L1029:
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	jne	.L1295
.L711:
	leaq	14608(%rsp), %rdi
	call	tmr_mstimeout
	movq	%rax, %rdi
	call	fdwatch
	testl	%eax, %eax
	movl	%eax, %ebx
	js	.L1296
	leaq	14608(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	testl	%ebx, %ebx
	je	.L1297
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L1235
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	79(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1093
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1093
.L720:
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L722
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L1298
.L723:
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L1235
.L722:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	75(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1095
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1095
.L727:
	movl	72(%rbx), %edi
	cmpl	$-1, %edi
	je	.L1235
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L1299
	.p2align 4,,10
	.p2align 3
.L1235:
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbx
	je	.L1300
.L1022:
	testq	%rbx, %rbx
	je	.L1235
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	15(%rbx), %rsi
	shrq	%cl, %rax
	andq	%rbp, %rax
	movq	%rsi, 128(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1097
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1097
.L732:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rdx
	leaq	707(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1098
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1098
.L734:
	movl	704(%r14), %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L948
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	3(%rbx), %rsi
	shrq	%cl, %rax
	andq	%rbp, %rax
	movq	%rsi, 152(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1099
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1099
.L738:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	.L741
	cmpl	$4, %eax
	je	.L742
	cmpl	$1, %eax
	jne	.L1235
	movl	$.LC303, %ecx
	movl	$3, %edx
	movl	$1024, %esi
	movq	%r13, %rdi
	call	__mf_register
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1100
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1100
.L743:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rax
	leaq	167(%r14), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1101
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1101
.L745:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	160(%r14), %r8
	shrq	%cl, %rdx
	leaq	159(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1102
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1102
.L747:
	movq	152(%r14), %rdx
	cmpq	%rdx, %r8
	jb	.L749
	cmpq	$5000, %rdx
	ja	.L1251
	leaq	152(%r14), %rsi
	leaq	144(%r14), %rdi
	addq	$1000, %rdx
	movq	%rax, 96(%rsp)
	call	httpd_realloc_str
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	96(%rsp), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1103
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1103
.L752:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	152(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1104
	cmpq	__mf_lookup_cache+8(%rdx), %r15
	ja	.L1104
.L754:
	subq	160(%r14), %rax
	movq	%rax, 144(%rsp)
.L1267:
	movq	%r14, %rax
	movl	%r12d, %ecx
	leaq	707(%r14), %rsi
	shrq	%cl, %rax
	andq	%rbp, %rax
	movq	%rsi, 168(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1105
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1105
.L756:
	movl	704(%r14), %edi
	movq	144(%rsp), %rdx
	movl	$1024, %ecx
	movq	%r13, %rsi
	call	__read_chk
	cmpl	$0, %eax
	je	.L1251
	jl	.L1301
	movq	%r14, %rdx
	movl	%r12d, %ecx
	cltq
	shrq	%cl, %rdx
	movq	%rax, 144(%rsp)
	leaq	151(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1107
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1107
.L762:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	144(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1108
	cmpq	__mf_lookup_cache+8(%rdx), %r15
	ja	.L1108
.L764:
	movq	%rax, %rdi
	addq	160(%r14), %rdi
	movq	144(%rsp), %rdx
	movq	%r13, %rsi
	call	memcpy
	movq	%r14, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1109
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1109
.L766:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	144(%rsp), %rax
	shrq	%cl, %rdx
	addq	160(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1110
	cmpq	__mf_lookup_cache+8(%rdx), %r15
	ja	.L1110
.L768:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movq	%rax, 160(%r14)
	shrq	%cl, %rdx
	movq	14608(%rsp), %r15
	leaq	95(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1111
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1111
.L770:
	movq	%r15, 88(%rbx)
	movq	%r14, %rdi
	call	httpd_got_request
	testl	%eax, %eax
	je	.L751
	cmpl	$2, %eax
	je	.L1302
	movq	%r14, %rdi
	call	httpd_parse_request
	testl	%eax, %eax
	js	.L1255
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	59(%rbx), %rsi
	shrq	%cl, %rax
	andq	%rbp, %rax
	movq	%rsi, 136(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1112
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1112
.L775:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	79(%rbx), %rsi
	shrq	%cl, %rax
	movl	$0, 56(%rbx)
	andq	%rbp, %rax
	movq	%rsi, 184(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1113
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1113
.L777:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	71(%rbx), %rsi
	shrq	%cl, %rax
	movq	$-1, 72(%rbx)
	andq	%rbp, %rax
	movq	%rsi, 176(%rsp)
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1114
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1114
.L779:
	movq	$-1, 64(%rbx)
	movq	$0, 144(%rsp)
	movl	%r12d, %ecx
	movl	$0, 160(%rsp)
	jmp	.L781
.L815:
	cmpq	%rax, %r12
	cmovg	%rax, %r12
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1131
	movq	176(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1131
.L819:
	movq	%r15, %rdx
	movq	%r12, 64(%rbx)
	leaq	23(%r15), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1132
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1132
.L821:
	movq	%rbx, %rax
	movq	16(%r15), %r12
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1133
	movq	184(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1133
.L823:
	movq	72(%rbx), %rax
	cmpq	$-1, %rax
	je	.L1303
	cmpq	%r12, %rax
	cmovge	%rax, %r12
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1135
	movq	184(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1135
.L828:
	movq	%r12, 72(%rbx)
.L788:
	addl	$1, 160(%rsp)
	addq	$48, 144(%rsp)
.L781:
	movl	160(%rsp), %edx
	cmpl	numthrottles(%rip), %edx
	jge	.L1249
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1136
	movq	136(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1136
.L831:
	cmpl	$9, 56(%rbx)
	jg	.L1249
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1115
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1115
.L782:
	movq	8(%rbx), %r12
	movq	%r12, %rdx
	leaq	247(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1116
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1116
.L784:
	movq	240(%r12), %r15
	movq	144(%rsp), %r12
	addq	throttles(%rip), %r12
	movq	%r12, %rdx
	leaq	7(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1117
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1117
.L786:
	movq	(%r12), %rdi
	movq	%r15, %rsi
	movb	%cl, 112(%rsp)
	call	match
	testl	%eax, %eax
	movzbl	112(%rsp), %ecx
	je	.L788
	movq	144(%rsp), %r12
	addq	throttles(%rip), %r12
	movq	%r12, %rdx
	leaq	31(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1118
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1118
.L789:
	movq	%r12, %rdx
	movq	24(%r12), %r15
	leaq	15(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1119
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1119
.L791:
	movq	8(%r12), %rax
	addq	%rax, %rax
	cmpq	%rax, %r15
	jg	.L793
	movq	%r12, %rdx
	leaq	23(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1120
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1120
.L794:
	cmpq	16(%r12), %r15
	jl	.L793
	movq	%r12, %rdx
	leaq	43(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1121
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1121
.L796:
	cmpl	$0, 40(%r12)
	js	.L1304
.L798:
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1123
	movq	136(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1123
.L801:
	movq	%rbx, %rdx
	movl	56(%rbx), %r12d
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	movslq	%r12d, %r15
	cmpq	__mf_lookup_cache(%rdx), %rbx
	leaq	19(%rbx,%r15,4), %rax
	jb	.L1124
	cmpq	%rax, __mf_lookup_cache+8(%rdx)
	jb	.L1124
.L803:
	movq	%rbx, %rax
	addl	$1, %r12d
	movl	160(%rsp), %edx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	movl	%edx, 16(%rbx,%r15,4)
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1125
	movq	136(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1125
.L805:
	movq	144(%rsp), %r15
	addq	throttles(%rip), %r15
	movl	%r12d, 56(%rbx)
	movq	%r15, %rax
	leaq	43(%r15), %r12
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r15
	jb	.L1126
	cmpq	__mf_lookup_cache+8(%rax), %r12
	ja	.L1126
.L807:
	movl	40(%r15), %eax
	addl	$1, %eax
	movl	%eax, 192(%rsp)
	movq	%r15, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r15
	jb	.L1127
	cmpq	__mf_lookup_cache+8(%rax), %r12
	ja	.L1127
.L809:
	movq	%r15, %rdx
	movl	192(%rsp), %eax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	movl	%eax, 40(%r15)
	leaq	15(%r15), %rax
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1128
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1128
.L811:
	movq	8(%r15), %rax
	movslq	192(%rsp), %rsi
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	%rsi
	movq	%rax, %r12
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1129
	movq	176(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1129
.L813:
	movq	64(%rbx), %rax
	cmpq	$-1, %rax
	jne	.L815
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1130
	movq	176(%rsp), %rax
	cmpq	8(%rdx), %rax
	jbe	.L819
.L1130:
	movl	$.LC334, %ecx
.L1263:
	movl	$1, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L819
	.p2align 4,,10
	.p2align 3
.L633:
	movq	throttles(%rip), %rax
	jmp	.L637
.L1284:
	jne	.L624
	.p2align 4,,4
	jmp	.L1233
.L1319:
	movq	152(%rsp), %rsi
	movl	$5000, %edx
	movq	%r13, %rdi
	call	__strcpy_chk
	jmp	.L1230
.L669:
	call	setsid
	.p2align 4,,8
	jmp	.L671
.L659:
	movl	$.LC254, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L660
	movq	stdout(%rip), %rbx
	jmp	.L658
.L741:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1161
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1161
.L889:
	leaq	71(%rbx), %rax
	movl	%r12d, %ecx
	movq	8(%rbx), %r14
	movq	%rax, 176(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1162
	movq	176(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1162
.L891:
	movq	64(%rbx), %rax
	movq	$1000000000, 136(%rsp)
	cmpq	$-1, %rax
	je	.L893
	movq	%rax, %rdx
	movl	$4, %ecx
	sarq	$63, %rdx
	idivq	%rcx
	movq	%rax, 136(%rsp)
.L893:
	leaq	479(%r14), %rax
	movl	%r12d, %ecx
	movq	%rax, 160(%rsp)
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1163
	movq	160(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1163
.L894:
	cmpq	$0, 472(%r14)
	jne	.L896
	leaq	135(%rbx), %rax
	movl	%r12d, %ecx
	movq	%rax, 144(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1164
	movq	144(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1164
.L897:
	movq	128(%rbx), %rax
	movl	%r12d, %ecx
	leaq	143(%rbx), %r15
	movq	%rax, 168(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1165
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1165
.L899:
	movq	136(%rbx), %rax
	movq	168(%rsp), %rdx
	movq	%r14, %rdi
	movl	%r12d, %ecx
	subq	%rax, %rdx
	cmpq	%rdx, 136(%rsp)
	cmovbe	136(%rsp), %rdx
	shrq	%cl, %rdi
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %r14
	movq	%rdx, 136(%rsp)
	leaq	719(%r14), %rdx
	jb	.L1166
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1166
.L901:
	addq	712(%r14), %rax
	movl	%r12d, %ecx
	leaq	707(%r14), %rsi
	movq	%rsi, 168(%rsp)
	movq	%rax, 184(%rsp)
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1167
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1167
.L903:
	movl	704(%r14), %edi
	movq	136(%rsp), %rdx
	movq	184(%rsp), %rsi
	call	write
	movl	%eax, 136(%rsp)
.L905:
	cmpl	$0, 136(%rsp)
	jl	.L1305
	je	.L930
	movq	%rbx, %rax
	movl	%r12d, %ecx
	movq	14608(%rsp), %r8
	shrq	%cl, %rax
	leaq	95(%rbx), %rsi
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1187
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1187
.L951:
	movq	%r14, %rax
	movl	%r12d, %ecx
	movq	%r8, 88(%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1188
	movq	160(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1188
.L953:
	movq	472(%r14), %rax
	testq	%rax, %rax
	je	.L955
	movslq	136(%rsp), %r8
	cmpq	%r8, %rax
	ja	.L1306
	subl	%eax, 136(%rsp)
	movl	%r12d, %ecx
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1191
	movq	160(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1191
.L961:
	movq	$0, 472(%r14)
.L955:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1192
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1192
.L963:
	movslq	136(%rsp), %rax
	movl	%r12d, %ecx
	movq	%rax, 136(%rsp)
	addq	136(%rbx), %rax
	movq	%rax, 184(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1193
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1193
.L965:
	movq	184(%rsp), %rax
	movl	%r12d, %ecx
	movq	%rax, 136(%rbx)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1194
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1194
.L967:
	movq	8(%rbx), %r15
	movl	%r12d, %ecx
	movq	%r15, %rdx
	leaq	207(%r15), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1195
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1195
.L969:
	movq	%r15, %rdx
	movl	%r12d, %ecx
	movq	136(%rsp), %rsi
	shrq	%cl, %rdx
	addq	200(%r15), %rsi
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	movq	%rsi, 160(%rsp)
	jb	.L1196
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1196
.L971:
	movq	160(%rsp), %rax
	movl	%r12d, %ecx
	leaq	59(%rbx), %rsi
	movq	%rax, 200(%r15)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1197
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1197
.L973:
	movl	56(%rbx), %r10d
	testl	%r10d, %r10d
	jle	.L975
	xorl	%eax, %eax
	movq	throttles(%rip), %r11
	movq	%r14, 192(%rsp)
	movq	%rax, %r15
	movq	136(%rsp), %rax
	movl	%r12d, %ecx
	movq	%rbp, %rdx
.L982:
	leaq	16(%rbx,%r15,4), %rdi
	leaq	19(%rbx,%r15,4), %rsi
	movq	%rdi, %r8
	shrq	%cl, %r8
	andq	%rdx, %r8
	salq	$4, %r8
	cmpq	%rdi, __mf_lookup_cache(%r8)
	ja	.L1198
	cmpq	%rsi, __mf_lookup_cache+8(%r8)
	jb	.L1198
.L976:
	movslq	16(%rbx,%r15,4), %rsi
	leaq	(%rsi,%rsi,2), %r14
	salq	$4, %r14
	addq	%r11, %r14
	movq	%r14, %rsi
	leaq	39(%r14), %rbp
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %r14
	jb	.L1199
	cmpq	__mf_lookup_cache+8(%rsi), %rbp
	ja	.L1199
.L978:
	movq	%r14, %rsi
	movq	%rax, %r12
	addq	32(%r14), %r12
	shrq	%cl, %rsi
	andq	%rdx, %rsi
	salq	$4, %rsi
	cmpq	__mf_lookup_cache(%rsi), %r14
	jb	.L1200
	cmpq	__mf_lookup_cache+8(%rsi), %rbp
	ja	.L1200
.L980:
	addq	$1, %r15
	movq	%r12, 32(%r14)
	cmpl	%r15d, %r10d
	jg	.L982
	movq	192(%rsp), %r14
	movl	%ecx, %r12d
	movq	%rdx, %rbp
.L975:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1201
	movq	144(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1201
.L983:
	movq	184(%rsp), %rax
	cmpq	128(%rbx), %rax
	jge	.L1307
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	119(%rbx), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1202
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1202
.L986:
	movq	112(%rbx), %rax
	cmpq	$100, %rax
	jle	.L988
	subq	$100, %rax
	movl	%r12d, %ecx
	movq	%rax, 144(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1203
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1203
.L989:
	movq	144(%rsp), %rax
	movq	%rax, 112(%rbx)
.L988:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1204
	movq	176(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1204
.L991:
	movq	64(%rbx), %r8
	cmpq	$-1, %r8
	je	.L1235
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movq	14608(%rsp), %r15
	shrq	%cl, %rdx
	leaq	87(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1205
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1205
.L993:
	subq	80(%rbx), %r15
	movl	$1, %eax
	cmove	%rax, %r15
	movq	160(%rsp), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	%r15
	cmpq	%rax, %r8
	jge	.L1235
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1206
	movq	152(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1206
.L996:
	movq	%r14, %rax
	movl	%r12d, %ecx
	movl	$3, (%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1207
	movq	168(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1207
.L998:
	movl	704(%r14), %edi
	call	fdwatch_del_fd
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1208
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1208
.L1000:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rdx
	leaq	207(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1209
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1209
.L1002:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	movq	200(%r14), %r14
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1210
	movq	176(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1210
.L1004:
	movq	%r14, %rdx
	movq	%r14, %rax
	movl	%r12d, %ecx
	sarq	$63, %rdx
	leaq	103(%rbx), %r14
	idivq	64(%rbx)
	subl	%r15d, %eax
	movl	%eax, %r15d
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1211
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1211
.L1006:
	cmpq	$0, 96(%rbx)
	je	.L1008
	movl	$.LC386, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L1008:
	testl	%r15d, %r15d
	movl	$500, %ecx
	jle	.L1009
	movslq	%r15d, %rcx
	imulq	$1000, %rcx, %rcx
.L1009:
	leaq	14608(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$wakeup_connection, %esi
	call	tmr_create
	movl	%r12d, %ecx
	movq	%rax, %r15
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1212
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1212
.L1010:
	testq	%r15, %r15
	movq	%r15, 96(%rbx)
	jne	.L1235
	movl	$.LC389, %edx
.L1259:
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L1261:
	movl	$1, %edi
	call	exit
.L1287:
	movq	user(%rip), %rdi
	call	__mfwrap_getpwnam
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1308
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	19(%rax), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1082
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1082
.L654:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movl	16(%rbx), %esi
	shrq	%cl, %rdx
	leaq	23(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	movl	%esi, 128(%rsp)
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1083
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1083
.L656:
	movl	20(%rbx), %r15d
	jmp	.L652
.L1293:
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	setgroups
	testl	%eax, %eax
	movl	$.LC280, %edx
	js	.L1259
	movl	%r15d, %edi
	call	setgid
	testl	%eax, %eax
	movl	$.LC281, %edx
	js	.L1259
	movq	user(%rip), %rdi
	movl	%r15d, %esi
	call	initgroups
	testl	%eax, %eax
	js	.L1309
.L690:
	movl	128(%rsp), %edi
	call	setuid
	testl	%eax, %eax
	movl	$.LC283, %edx
	js	.L1259
	cmpl	$0, do_chroot(%rip)
	jne	.L687
	movl	$.LC284, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L687
.L1278:
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L551
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1056
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1056
.L552:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, hostname(%rip)
	jmp	.L528
.L1317:
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1147
	movq	136(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1147
.L858:
	movl	56(%rbx), %eax
	movq	$0, 128(%rsp)
	movl	%r12d, %ecx
	movq	%r15, 136(%rsp)
	movl	%eax, 176(%rsp)
	movq	throttles(%rip), %rax
	movq	%rax, 144(%rsp)
	leaq	207(%r14), %rax
	movq	%rax, 152(%rsp)
	movq	%rbp, %rax
	movq	%rbx, %rbp
	jmp	.L860
.L869:
	movq	128(%rsp), %rdx
	leaq	16(%rbp,%rdx,4), %rdi
	leaq	19(%rbp,%rdx,4), %rdx
	movq	%rdi, %rsi
	shrq	%cl, %rsi
	andq	%rax, %rsi
	salq	$4, %rsi
	cmpq	%rdi, __mf_lookup_cache(%rsi)
	ja	.L1148
	cmpq	%rdx, __mf_lookup_cache+8(%rsi)
	jb	.L1148
.L861:
	movq	128(%rsp), %rsi
	movslq	16(%rbp,%rsi,4), %rbx
	imulq	$48, %rbx, %rbx
	addq	144(%rsp), %rbx
	movq	%rbx, %rdx
	leaq	39(%rbx), %r12
	shrq	%cl, %rdx
	andq	%rax, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1149
	cmpq	__mf_lookup_cache+8(%rdx), %r12
	ja	.L1149
.L863:
	movq	%r14, %rdx
	movq	32(%rbx), %r15
	shrq	%cl, %rdx
	andq	%rax, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	leaq	__mf_lookup_cache(%rdx), %rsi
	jb	.L1150
	movq	152(%rsp), %rdx
	cmpq	8(%rsi), %rdx
	ja	.L1150
.L865:
	movq	%rbx, %rdx
	addq	200(%r14), %r15
	shrq	%cl, %rdx
	andq	%rax, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1151
	cmpq	__mf_lookup_cache+8(%rdx), %r12
	ja	.L1151
.L867:
	addq	$1, 128(%rsp)
	movq	%r15, 32(%rbx)
.L860:
	movl	128(%rsp), %esi
	cmpl	%esi, 176(%rsp)
	jg	.L869
	movq	%rbp, %rbx
	movq	%rax, %rbp
	movq	%r14, %rax
	shrq	%cl, %rax
	movl	%ecx, %r12d
	movq	136(%rsp), %r15
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1152
	movq	152(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1152
.L870:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	movq	200(%r14), %r14
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1153
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1153
.L872:
	movq	%r14, 136(%rbx)
.L1255:
	leaq	14608(%rsp), %rsi
	movq	%rbx, %rdi
	call	finish_connection
.L751:
	movl	$3, %edx
	movl	$1024, %esi
	movq	%r13, %rdi
	call	__mf_unregister
	jmp	.L1235
.L1305:
	call	__errno_location
	movq	%rax, %r15
	movl	%r12d, %ecx
	leaq	3(%rax), %rax
	movq	%r15, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1178
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1178
.L927:
	movl	(%r15), %eax
	cmpl	$4, %eax
	je	.L1235
	cmpl	$11, %eax
	je	.L930
	cmpl	$22, %eax
	je	.L948
	cmpl	$32, %eax
	.p2align 4,,2
	je	.L948
	cmpl	$104, %eax
	.p2align 4,,2
	je	.L948
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	215(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1186
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1186
.L949:
	movq	208(%r14), %rcx
	movl	$.LC391, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L948:
	leaq	14608(%rsp), %rsi
	movq	%rbx, %rdi
	call	clear_connection
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbx
	jne	.L1022
.L1300:
	leaq	14608(%rsp), %rdi
	call	tmr_run
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L1234
	cmpl	$0, terminate(%rip)
	jne	.L1234
	movq	hs(%rip), %rbx
	movl	$1, terminate(%rip)
	testq	%rbx, %rbx
	je	.L1234
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	leaq	75(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1216
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1216
.L1023:
	movl	72(%rbx), %edi
	cmpl	$-1, %edi
	je	.L1025
	call	fdwatch_del_fd
.L1025:
	movq	hs(%rip), %rbx
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	leaq	79(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1217
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1217
.L1026:
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L1028
	call	fdwatch_del_fd
.L1028:
	movq	hs(%rip), %rdi
	call	httpd_unlisten
	jmp	.L1234
.L1296:
	call	__errno_location
	movq	%rax, %rbx
	movl	%r12d, %ecx
	leaq	3(%rax), %rax
	movq	%rbx, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1092
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1092
.L715:
	movl	(%rbx), %eax
	cmpl	$11, %eax
	je	.L1234
	cmpl	$4, %eax
	je	.L1234
	movl	$3, %edi
	movl	$.LC295, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L742:
	movl	$.LC415, %ecx
	movl	$3, %edx
	movl	$4096, %esi
	movq	%r13, %rdi
	call	__mf_register
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1213
	movq	128(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1213
.L1012:
	movq	8(%rbx), %r14
	movl	%r12d, %ecx
	movq	%r14, %rdx
	leaq	707(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1214
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1214
.L1014:
	movl	704(%r14), %edi
	movl	$4096, %edx
	movq	%r13, %rsi
	call	read
	cmpl	$0, %eax
	jl	.L1310
	je	.L1020
.L1019:
	movl	$3, %edx
	movl	$4096, %esi
	movq	%r13, %rdi
	call	__mf_unregister
	jmp	.L1235
.L1295:
	cmpl	$0, no_log(%rip)
	jne	.L712
	cmpq	$0, hs(%rip)
	je	.L712
	movq	logfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L712
	movl	$.LC254, %esi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L1311
.L712:
	movl	$0, got_hup(%rip)
	jmp	.L711
.L896:
	leaq	224(%rsp), %rdi
	movl	$.LC370, %ecx
	movl	$3, %edx
	movl	$32, %esi
	call	__mf_register
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	375(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1168
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1168
.L906:
	movq	120(%rsp), %rax
	movl	%r12d, %ecx
	movq	120(%rsp), %rsi
	movq	368(%r14), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rsi
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1169
	movq	200(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1169
.L908:
	movq	%r14, %rax
	movl	%r12d, %ecx
	movq	%r15, 224(%rsp)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1170
	movq	160(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1170
.L910:
	movq	120(%rsp), %rax
	movl	%r12d, %ecx
	movq	120(%rsp), %rsi
	movq	472(%r14), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rsi
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1171
	movq	208(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1171
.L912:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	%r15, 232(%rsp)
	shrq	%cl, %rdx
	leaq	719(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1172
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1172
.L914:
	movq	712(%r14), %rax
	movl	%r12d, %ecx
	leaq	143(%rbx), %r15
	movq	%rax, 144(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1173
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1173
.L916:
	movq	136(%rbx), %rax
	movq	144(%rsp), %rdx
	movl	%r12d, %ecx
	movq	120(%rsp), %rsi
	addq	%rax, %rdx
	movq	%rax, 168(%rsp)
	movq	120(%rsp), %rax
	movq	%rdx, 144(%rsp)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rsi
	leaq	__mf_lookup_cache(%rax), %rdx
	jb	.L1174
	movq	216(%rsp), %rax
	cmpq	8(%rdx), %rax
	ja	.L1174
.L918:
	movq	144(%rsp), %rax
	movl	%r12d, %ecx
	leaq	135(%rbx), %rdx
	movq	%rdx, 144(%rsp)
	movq	%rax, 240(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1175
	movq	144(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1175
.L920:
	movq	120(%rsp), %rdi
	movq	128(%rbx), %rax
	movl	%r12d, %ecx
	subq	168(%rsp), %rax
	leaq	255(%rsp), %rdx
	cmpq	%rax, 136(%rsp)
	cmovbe	136(%rsp), %rax
	shrq	%cl, %rdi
	movq	120(%rsp), %rcx
	andq	%rbp, %rdi
	salq	$4, %rdi
	cmpq	__mf_lookup_cache(%rdi), %rcx
	jb	.L1176
	cmpq	__mf_lookup_cache+8(%rdi), %rdx
	ja	.L1176
.L922:
	movq	%rax, 248(%rsp)
	movl	%r12d, %ecx
	movq	%r14, %rax
	shrq	%cl, %rax
	leaq	707(%r14), %rsi
	andq	%rbp, %rax
	salq	$4, %rax
	movq	%rsi, 168(%rsp)
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1177
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1177
.L924:
	movl	704(%r14), %edi
	leaq	224(%rsp), %rsi
	movl	$2, %edx
	call	writev
	leaq	224(%rsp), %rdi
	movl	$3, %edx
	movl	$32, %esi
	movl	%eax, 136(%rsp)
	call	__mf_unregister
	jmp	.L905
.L1301:
	call	__errno_location
	movq	%rax, %r15
	movl	%r12d, %ecx
	leaq	3(%rax), %rax
	movq	%r15, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r15
	jb	.L1106
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1106
.L760:
	movl	(%r15), %eax
	cmpl	$11, %eax
	je	.L751
	cmpl	$4, %eax
	je	.L751
.L1251:
	movq	httpd_err400form(%rip), %r8
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC103, %r9d
	movq	%r9, %rcx
	movl	$400, %esi
.L1253:
	movq	%r14, %rdi
	call	httpd_send_err
	jmp	.L1255
.L749:
	subq	%r8, %rdx
	movq	%rdx, 144(%rsp)
	jmp	.L1267
.L1297:
	leaq	14608(%rsp), %rdi
	call	tmr_run
	jmp	.L1234
.L1281:
	movl	$.LC224, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movl	$.LC225, %edx
.L1257:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L1279:
	movq	%rbx, %r15
.L581:
	movl	$0, 14668(%rsp)
	movq	%r15, %rbx
	jmp	.L591
.L1292:
	movl	$.LC279, %edx
.L1260:
	movl	$2, %edi
	movl	$1, %esi
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L1290:
	leaq	10240(%rsp), %rdi
	call	chroot
	testl	%eax, %eax
	js	.L1312
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	movq	%rax, 152(%rsp)
	je	.L677
	movl	$.LC254, %esi
	movq	%rax, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L677
	leaq	10240(%rsp), %rdi
	call	__mfwrap_strlen
	movq	152(%rsp), %rdi
	leaq	10240(%rsp), %rsi
	movq	%rax, %rdx
	movq	%rax, %r14
	call	__mfwrap_strncmp
	testl	%eax, %eax
	jne	.L678
	movq	152(%rsp), %rdx
	leaq	-1(%rdx,%r14), %rsi
	movq	%rdx, %rdi
	call	strcpy
.L677:
	leaq	10240(%rsp), %rdi
	movw	$47, 10240(%rsp)
	call	chdir
	testl	%eax, %eax
	jns	.L675
	movl	$.LC272, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC273, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L1040:
	xorl	%ebx, %ebx
	jmp	.L658
.L554:
	movl	$.LC196, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L557
	movl	$1, do_vhost(%rip)
	jmp	.L528
.L930:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	leaq	119(%rbx), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1179
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1179
.L933:
	movq	112(%rbx), %rax
	movl	%r12d, %ecx
	addq	$100, %rax
	movq	%rax, 128(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1180
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1180
.L935:
	movq	128(%rsp), %rax
	movl	%r12d, %ecx
	movq	%rax, 112(%rbx)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1181
	movq	152(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1181
.L937:
	movq	%r14, %rax
	movl	%r12d, %ecx
	movl	$3, (%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1182
	movq	168(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1182
.L939:
	movl	704(%r14), %edi
	leaq	103(%rbx), %r14
	call	fdwatch_del_fd
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1183
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1183
.L941:
	cmpq	$0, 96(%rbx)
	je	.L943
	movl	$.LC386, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L943:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1184
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1184
.L944:
	movq	112(%rbx), %rcx
	leaq	14608(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$wakeup_connection, %esi
	call	tmr_create
	movl	%r12d, %ecx
	movq	%rax, %r15
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1185
	cmpq	__mf_lookup_cache+8(%rax), %r14
	jbe	.L1010
.L1185:
	movl	$.LC388, %ecx
	jmp	.L1268
.L1280:
	movl	$0, 14664(%rsp)
	jmp	.L600
.L660:
	movq	%rbx, %rdi
	movl	$.LC255, %esi
	call	__mfwrap_fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1313
	movq	logfile(%rip), %r14
	movl	%r12d, %ecx
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1084
	cmpq	__mf_lookup_cache+8(%rax), %r14
	ja	.L1084
.L662:
	cmpb	$47, (%r14)
	je	.L664
	movl	$.LC257, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC258, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
.L664:
	movq	%rbx, %rdi
	call	__mfwrap_fileno
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L658
	movq	%rbx, %rdi
	call	__mfwrap_fileno
	movl	128(%rsp), %esi
	movl	%r15d, %edx
	movl	%eax, %edi
	call	fchown
	testl	%eax, %eax
	jns	.L658
	movl	$.LC259, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC260, %edi
	call	perror
	jmp	.L658
.L1310:
	call	__errno_location
	movq	%rax, %r14
	movl	%r12d, %ecx
	leaq	3(%rax), %rax
	movq	%r14, %rdx
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1215
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1215
.L1017:
	movl	(%r14), %eax
	cmpl	$11, %eax
	je	.L1019
	cmpl	$4, %eax
	je	.L1019
.L1020:
	leaq	14608(%rsp), %rsi
	movq	%rbx, %rdi
	call	really_clear_connection
	jmp	.L1019
.L1289:
	movq	pidfile(%rip), %rcx
	movl	$2, %edi
	movl	$.LC231, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L1288:
	movl	$.LC261, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC262, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L557:
	movl	$.LC197, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L558
	movl	$0, do_vhost(%rip)
	jmp	.L528
.L1291:
	movl	$.LC274, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC275, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L1311:
	xorl	%eax, %eax
	movl	$.LC292, %edx
	movl	$1, %esi
	movl	$5, %edi
	call	__syslog_chk
	movq	logfile(%rip), %rdi
	movl	$.LC255, %esi
	call	__mfwrap_fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1314
	movq	%rax, %rdi
	call	__mfwrap_fileno
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	movq	hs(%rip), %rdi
	movq	%rbx, %rsi
	call	httpd_set_logfp
	jmp	.L712
.L558:
	movl	$.LC198, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	je	.L1315
	movl	$.LC199, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L560
	movl	$0, do_global_passwd(%rip)
	jmp	.L528
.L1302:
	movq	httpd_err400form(%rip), %r8
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC103, %r9d
	movq	%r14, %rdi
	movq	%r9, %rcx
	movl	$400, %esi
	call	httpd_send_err
	leaq	14608(%rsp), %rsi
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L751
.L1299:
	movq	hs(%rip), %rbx
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	leaq	75(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1096
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1096
.L729:
	movl	72(%rbx), %esi
	leaq	14608(%rsp), %rdi
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L1234
	jmp	.L1235
.L1298:
	movq	hs(%rip), %rbx
	movl	%r12d, %ecx
	movq	%rbx, %rdx
	leaq	79(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1094
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1094
.L724:
	movl	76(%rbx), %esi
	leaq	14608(%rsp), %rdi
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L1234
	jmp	.L723
.L1307:
	leaq	14608(%rsp), %rsi
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L1235
.L1315:
	movl	$1, do_global_passwd(%rip)
	jmp	.L528
.L1303:
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1134
	movq	184(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	jbe	.L828
.L1134:
	movl	$.LC338, %ecx
.L1264:
	movl	$1, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L828
.L1304:
	xorl	%eax, %eax
	movl	$.LC325, %edx
	movl	$1, %esi
	movl	$3, %edi
	movb	%cl, 112(%rsp)
	call	__syslog_chk
	movq	144(%rsp), %r12
	addq	throttles(%rip), %r12
	movzbl	112(%rsp), %ecx
	movq	%r12, %rdx
	leaq	43(%r12), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r12
	jb	.L1122
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1122
.L799:
	movl	$0, 40(%r12)
	jmp	.L798
.L1306:
	subl	136(%rsp), %eax
	movl	%r12d, %ecx
	leaq	375(%r14), %rsi
	cltq
	movq	%rax, 136(%rsp)
	movq	%r14, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1189
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1189
.L957:
	movq	368(%r14), %rdi
	movq	136(%rsp), %rdx
	leaq	(%rdi,%r8), %rsi
	call	memmove
	movq	%r14, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1190
	movq	160(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1190
.L959:
	movq	136(%rsp), %rax
	movl	$0, 136(%rsp)
	movq	%rax, 472(%r14)
	jmp	.L955
.L1294:
	call	shut_down
	movl	$5, %edi
	movl	$.LC156, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	xorl	%edi, %edi
	call	exit
.L1312:
	movl	$.LC269, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC131, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L678:
	xorl	%eax, %eax
	movl	$.LC270, %edx
	movl	$1, %esi
	movl	$4, %edi
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC271, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	jmp	.L677
.L1036:
	movl	$1, %r13d
	jmp	.L518
.L1308:
	movq	user(%rip), %rcx
	movl	$.LC249, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	stderr(%rip), %rdi
	movq	user(%rip), %r8
	movl	$.LC250, %edx
	movq	argv0(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L692:
	movl	$.LC285, %edx
	jmp	.L1259
.L1053:
	movl	$.LC187, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L543
.L1055:
	movl	$.LC191, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L549
.L1282:
	movq	128(%rsp), %rcx
	movl	$.LC231, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	128(%rsp), %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L1176:
	leaq	224(%rsp), %rdi
	movl	$.LC379, %ecx
	movl	$1, %edx
	movl	$32, %esi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L922
.L1175:
	movl	$.LC378, %ecx
	xorl	%edx, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L920
.L1174:
	leaq	224(%rsp), %rdi
	movl	$.LC377, %ecx
	movl	$1, %edx
	movl	$24, %esi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L918
.L1173:
	movl	$.LC376, %ecx
	xorl	%edx, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L916
.L1172:
	movl	$.LC375, %ecx
	xorl	%edx, %edx
	movl	$720, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L914
.L1171:
	leaq	224(%rsp), %rdi
	movl	$.LC374, %ecx
	movl	$1, %edx
	movl	$16, %esi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L912
.L1170:
	movl	$.LC373, %ecx
	xorl	%edx, %edx
	movl	$480, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L910
.L1169:
	leaq	224(%rsp), %rdi
	movl	$.LC372, %ecx
	movl	$1, %edx
	movl	$8, %esi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L908
.L1168:
	movl	$.LC371, %ecx
	xorl	%edx, %edx
	movl	$376, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L906
.L1217:
	movl	$.LC420, %ecx
	xorl	%edx, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1026
.L1216:
	movl	$.LC419, %ecx
	xorl	%edx, %edx
	movl	$76, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1023
.L1214:
	movl	$.LC417, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1014
.L1213:
	movl	$.LC416, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1012
.L1212:
	movl	$.LC414, %ecx
.L1268:
	movl	$1, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1010
.L1211:
	movl	$.LC413, %ecx
	xorl	%edx, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1006
.L1210:
	movl	$.LC412, %ecx
	xorl	%edx, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1004
.L1209:
	movl	$.LC411, %ecx
	xorl	%edx, %edx
	movl	$208, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1002
.L1208:
	movl	$.LC410, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1000
.L1207:
	movl	$.LC409, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L998
.L1206:
	movl	$.LC408, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L996
.L1205:
	movl	$.LC407, %ecx
	xorl	%edx, %edx
	movl	$88, %esi
	movq	%rbx, %rdi
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	jmp	.L993
.L1204:
	movl	$.LC406, %ecx
	xorl	%edx, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L991
.L1203:
	movl	$.LC405, %ecx
	movl	$1, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L989
.L1183:
	movl	$.LC385, %ecx
	xorl	%edx, %edx
	movl	$104, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L941
.L1182:
	movl	$.LC384, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L939
.L1181:
	movl	$.LC383, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L937
.L1180:
	movl	$.LC382, %ecx
	movl	$1, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L935
.L1089:
	movl	$.LC289, %ecx
	movl	$1, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L702
.L1088:
	subq	%rdi, %rax
	movl	$.LC288, %ecx
	movl	$1, %edx
	leaq	1(%rax), %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L699
.L1087:
	subq	%rdi, %rax
	movl	$.LC287, %ecx
	movl	$1, %edx
	leaq	1(%rax), %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L697
.L1086:
	subq	%rbx, %rax
	movl	$.LC286, %ecx
	movl	$1, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L695
.L1072:
	movq	%rax, %rdi
	movl	$.LC232, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L613
.L1074:
	subq	%rbx, %rdx
	movl	$.LC234, %ecx
	movq	%rbx, %rdi
	leaq	1(%rdx), %rsi
	xorl	%edx, %edx
	movl	%eax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movl	96(%rsp), %eax
	jmp	.L621
.L1073:
	subq	%rbx, %rdx
	movl	$.LC233, %ecx
	movq	%rbx, %rdi
	leaq	1(%rdx), %rsi
	movl	$1, %edx
	movl	%eax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movl	96(%rsp), %eax
	jmp	.L617
.L1075:
	movl	$.LC239, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r13, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L628
.L636:
	movl	$.LC241, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movl	$.LC242, %edx
	jmp	.L1257
.L1076:
	movl	$.LC243, %ecx
	movl	$1, %edx
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L638
.L1077:
	movl	$.LC244, %ecx
	movl	$1, %edx
	movl	$16, %esi
	movq	%r14, %rdi
	movl	%eax, 96(%rsp)
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	movl	96(%rsp), %eax
	jmp	.L640
.L1048:
	movl	$.LC170, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L521
.L1108:
	movl	$.LC312, %ecx
	xorl	%edx, %edx
	movl	$168, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L764
.L1107:
	movl	$.LC311, %ecx
	xorl	%edx, %edx
	movl	$152, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L762
.L1105:
	movl	$.LC309, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L756
.L1104:
	movl	$.LC308, %ecx
	xorl	%edx, %edx
	movl	$168, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L754
.L1103:
	movl	$.LC307, %ecx
	xorl	%edx, %edx
	movl	$160, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L752
.L1102:
	movl	$.LC306, %ecx
	xorl	%edx, %edx
	movl	$160, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	movq	96(%rsp), %rax
	jmp	.L747
.L1101:
	movl	$.LC305, %ecx
	xorl	%edx, %edx
	movl	$168, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L745
.L1100:
	movl	$.LC304, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L743
.L1099:
	movl	$.LC302, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L738
.L1098:
	movl	$.LC301, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L734
.L1097:
	movl	$.LC300, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L732
.L1095:
	subq	%rbx, %rax
	movl	$.LC298, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L727
.L1091:
	movl	$.LC291, %ecx
	xorl	%edx, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L708
.L1090:
	movl	$.LC290, %ecx
	xorl	%edx, %edx
	movl	$76, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L705
.L1190:
	movl	$.LC395, %ecx
	movl	$1, %edx
	movl	$480, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L959
.L1189:
	movl	$.LC394, %ecx
	xorl	%edx, %edx
	movl	$376, %esi
	movq	%r14, %rdi
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	jmp	.L957
.L560:
	movl	$.LC200, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L561
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L561
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1058
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1058
.L562:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, pidfile(%rip)
	jmp	.L528
.L1314:
	movq	logfile(%rip), %rcx
	movl	$.LC293, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L712
.L1058:
	movl	$.LC201, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L562
.L561:
	movl	$.LC202, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L564
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L564
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1059
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1059
.L565:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, charset(%rip)
	jmp	.L528
.L1094:
	movl	$.LC297, %ecx
	xorl	%edx, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L724
.L1096:
	movl	$.LC299, %ecx
	xorl	%edx, %edx
	movl	$76, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L729
.L1059:
	movl	$.LC203, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L565
.L564:
	movl	$.LC204, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L567
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jle	.L567
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1060
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1060
.L568:
	movq	(%rbx), %rax
	movl	%r12d, %r13d
	movq	%rax, p3p(%rip)
	jmp	.L528
.L1177:
	movl	$.LC380, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L924
.L1274:
	movl	%eax, %edi
	call	__mfwrap_gai_strerror
	movq	hostname(%rip), %rcx
	movq	%rax, %r8
	movl	$.LC213, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	%ebx, %edi
	call	__mfwrap_gai_strerror
	movq	stderr(%rip), %rdi
	movq	hostname(%rip), %r8
	movq	%rax, %r9
	movq	argv0(%rip), %rcx
	movl	$.LC214, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L1071:
	subq	%rbx, %rax
	movl	$.LC223, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L606
.L1068:
	subq	%r14, %rax
	movl	$.LC220, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L597
.L1060:
	movl	$.LC205, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L568
.L567:
	movl	$.LC206, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L570
	leal	1(%r13), %r12d
	cmpl	%r12d, %r14d
	jg	.L1316
.L570:
	movl	$.LC208, %esi
	movq	%rbx, %rdi
	call	__mfwrap_strcmp
	testl	%eax, %eax
	jne	.L1032
	movl	$1, debug(%rip)
	jmp	.L528
.L1316:
	movslq	%r12d, %rax
	movzbl	128(%rsp), %ecx
	leaq	(%r15,%rax,8), %rbx
	movq	%rbx, %rdx
	leaq	7(%rbx), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1061
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1061
.L571:
	movq	(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%r12d, %r13d
	call	strtol
	movl	%eax, max_age(%rip)
	jmp	.L528
.L1079:
	movl	$.LC246, %ecx
	movl	$1, %edx
	movl	$32, %esi
	movq	%r14, %rdi
	movl	%eax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	96(%rsp), %eax
	jmp	.L644
.L1065:
	subq	%r15, %rax
	movl	$.LC216, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L587
.L1066:
	movq	%r15, %rsi
	movl	$.LC217, %ecx
	xorl	%edx, %edx
	subq	%r14, %rsi
	movq	%r14, %rdi
	addq	$1, %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L592
.L1046:
	movl	$.LC166, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L515
.L1085:
	subq	144(%rsp), %rax
	leaq	10240(%rsp), %rdi
	movl	$.LC263, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L666
.L1081:
	movl	$.LC248, %ecx
	movl	$1, %edx
	movl	$44, %esi
	movq	%r14, %rdi
	movl	%eax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	96(%rsp), %eax
	jmp	.L648
.L1064:
	subq	%r15, %rax
	movl	$.LC215, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L582
.L1080:
	movl	$.LC247, %ecx
	movl	$1, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	movl	%eax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movl	96(%rsp), %eax
	jmp	.L646
.L1061:
	movl	$.LC207, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L571
.L1047:
	subq	%rdi, %rax
	movl	$.LC169, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L519
.L1052:
	movl	$.LC183, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L538
.L1049:
	movl	$.LC175, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L526
.L1082:
	movl	$.LC251, %ecx
	xorl	%edx, %edx
	movl	$20, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L654
.L1083:
	movl	$.LC252, %ecx
	xorl	%edx, %edx
	movl	$24, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L656
.L1256:
	movq	hostname(%rip), %rcx
	movl	$2, %edi
	movl	$128, %r8d
	movl	$.LC218, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L1067:
	movq	%r15, %rsi
	movl	$.LC219, %ecx
	xorl	%edx, %edx
	subq	%r14, %rsi
	movq	%r14, %rdi
	addq	$1, %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L595
.L1063:
	movl	$.LC170, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L576
.L1062:
	movl	$.LC169, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L574
.L1050:
	movl	$.LC177, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L530
.L1051:
	movl	$.LC179, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L533
.L1269:
	movl	$1, %edi
	movl	$.LC172, %edx
	movl	$.LC173, %esi
	call	__printf_chk
	xorl	%edi, %edi
	call	exit
.L1032:
	call	usage
.L1069:
	movq	%r14, %rsi
	movl	$.LC221, %ecx
	xorl	%edx, %edx
	subq	%rbx, %rsi
	movq	%rbx, %rdi
	addq	$1, %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L601
.L1070:
	movq	%r14, %rsi
	movl	$.LC222, %ecx
	xorl	%edx, %edx
	subq	%rbx, %rsi
	movq	%rbx, %rdi
	addq	$1, %rsi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L604
.L1078:
	movl	$.LC245, %ecx
	movl	$1, %edx
	movl	$24, %esi
	movq	%r14, %rdi
	movl	%eax, 96(%rsp)
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	movl	96(%rsp), %eax
	jmp	.L642
.L1129:
	movl	$.LC333, %ecx
	xorl	%edx, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L813
.L1133:
	movl	$.LC337, %ecx
	xorl	%edx, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L823
.L1111:
	movl	$.LC314, %ecx
	movl	$1, %edx
	movl	$96, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L770
.L1135:
	movl	$.LC339, %ecx
	jmp	.L1264
.L1179:
	movl	$.LC382, %ecx
	xorl	%edx, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L933
.L1056:
	movl	$.LC193, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L552
.L1309:
	movl	$.LC282, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L690
.L1057:
	movl	$.LC195, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L555
.L1115:
	movl	$.LC318, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L782
.L1136:
	movl	$.LC340, %ecx
	xorl	%edx, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L831
.L1249:
	leaq	14608(%rsp), %rsi
	movq	%r14, %rdi
	movl	%ecx, %r12d
	call	httpd_start_request
	testl	%eax, %eax
	js	.L1255
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	531(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1138
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1138
.L836:
	cmpl	$0, 528(%r14)
	je	.L838
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	543(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1139
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1139
.L839:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movq	536(%r14), %rax
	shrq	%cl, %rdx
	leaq	143(%rbx), %r15
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1140
	cmpq	__mf_lookup_cache+8(%rdx), %r15
	ja	.L1140
.L841:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	movq	%rax, 136(%rbx)
	shrq	%cl, %rdx
	leaq	551(%r14), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1141
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1141
.L843:
	movq	544(%r14), %rax
	movl	%r12d, %ecx
	leaq	135(%rbx), %rsi
	movq	%rsi, 144(%rsp)
	addq	$1, %rax
	movq	%rax, 128(%rsp)
	movq	%rbx, %rax
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1142
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1142
.L845:
	movq	128(%rsp), %rax
	movq	%rax, 128(%rbx)
.L847:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	719(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1146
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1146
.L855:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	$0, 712(%r14)
	je	.L1317
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1154
	cmpq	__mf_lookup_cache+8(%rax), %r15
	ja	.L1154
.L874:
	movq	%rbx, %rax
	movl	%r12d, %ecx
	movq	136(%rbx), %r15
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1155
	movq	144(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1155
.L876:
	cmpq	128(%rbx), %r15
	jge	.L1255
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1156
	movq	152(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1156
.L879:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movl	$2, (%rbx)
	shrq	%cl, %rdx
	movq	14608(%rsp), %r15
	leaq	87(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1157
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1157
.L881:
	movq	%rbx, %rdx
	movl	%r12d, %ecx
	movq	%r15, 80(%rbx)
	shrq	%cl, %rdx
	leaq	119(%rbx), %rax
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %rbx
	jb	.L1158
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1158
.L883:
	movq	%r14, %rax
	movl	%r12d, %ecx
	movq	$0, 112(%rbx)
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1159
	movq	168(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1159
.L885:
	movl	704(%r14), %edi
	call	fdwatch_del_fd
	movq	%r14, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	andq	%rbp, %rax
	salq	$4, %rax
	cmpq	__mf_lookup_cache(%rax), %r14
	jb	.L1160
	movq	168(%rsp), %rsi
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1160
.L887:
	movl	704(%r14), %edi
	movq	%rbx, %rsi
	movl	$1, %edx
	call	fdwatch_add_fd
	movl	$3, %edx
	movl	$1024, %esi
	movq	%r13, %rdi
	call	__mf_unregister
	jmp	.L1235
.L1114:
	movl	$.LC317, %ecx
	movl	$1, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L779
.L1160:
	movl	$.LC363, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L887
.L1159:
	movl	$.LC362, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L885
.L1158:
	movl	$.LC361, %ecx
	movl	$1, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L883
.L1157:
	movl	$.LC360, %ecx
	movl	$1, %edx
	movl	$88, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L881
.L1156:
	movl	$.LC359, %ecx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L879
.L1155:
	movl	$.LC358, %ecx
	xorl	%edx, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L876
.L1154:
	movl	$.LC357, %ecx
	xorl	%edx, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L874
.L1146:
	movl	$.LC350, %ecx
	xorl	%edx, %edx
	movl	$720, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L855
.L1151:
	movl	$.LC353, %ecx
	movl	$1, %edx
	movl	$40, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L867
.L1150:
	movl	$.LC354, %ecx
	xorl	%edx, %edx
	movl	$208, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L865
.L1149:
	movl	$.LC353, %ecx
	xorl	%edx, %edx
	movl	$40, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L863
.L1148:
	subq	%rdi, %rdx
	movl	$.LC352, %ecx
	leaq	1(%rdx), %rsi
	xorl	%edx, %edx
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rax
	jmp	.L861
.L1147:
	movl	$.LC351, %ecx
	xorl	%edx, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L858
.L1153:
	movl	$.LC356, %ecx
	movl	$1, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L872
.L1152:
	movl	$.LC355, %ecx
	xorl	%edx, %edx
	movl	$208, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L870
.L1142:
	movl	$.LC346, %ecx
	movl	$1, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L845
.L1141:
	movl	$.LC345, %ecx
	xorl	%edx, %edx
	movl	$552, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L843
.L1140:
	movl	$.LC344, %ecx
	movl	$1, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L841
.L1139:
	movl	$.LC343, %ecx
	xorl	%edx, %edx
	movl	$544, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L839
.L838:
	movq	%r14, %rdx
	movl	%r12d, %ecx
	leaq	199(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1143
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1143
.L848:
	movq	192(%r14), %r15
	movq	%rbx, %rax
	movl	%r12d, %ecx
	shrq	%cl, %rax
	leaq	135(%rbx), %rsi
	andq	%rbp, %rax
	salq	$4, %rax
	testq	%r15, %r15
	movq	%rsi, 144(%rsp)
	js	.L1318
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1145
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1145
.L853:
	movq	%r15, 128(%rbx)
	leaq	143(%rbx), %r15
	jmp	.L847
.L1138:
	movl	$.LC342, %ecx
	xorl	%edx, %edx
	movl	$532, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L836
.L1145:
	movl	$.LC349, %ecx
	movl	$1, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L853
.L1318:
	cmpq	__mf_lookup_cache(%rax), %rbx
	jb	.L1144
	cmpq	__mf_lookup_cache+8(%rax), %rsi
	ja	.L1144
.L851:
	movq	$0, 128(%rbx)
	leaq	143(%rbx), %r15
	jmp	.L847
.L1143:
	movl	$.LC347, %ecx
	xorl	%edx, %edx
	movl	$200, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L848
.L1144:
	movl	$.LC348, %ecx
	movl	$1, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L851
.L1113:
	movl	$.LC316, %ecx
	movl	$1, %edx
	movl	$80, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L777
.L1112:
	movl	$.LC315, %ecx
	movl	$1, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L775
.L1110:
	movl	$.LC313, %ecx
	movl	$1, %edx
	movl	$168, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L768
.L1109:
	movl	$.LC313, %ecx
	xorl	%edx, %edx
	movl	$168, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L766
.L1117:
	movl	$.LC320, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L786
.L1116:
	movl	$.LC319, %ecx
	xorl	%edx, %edx
	movl	$248, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L784
.L1132:
	movl	$.LC336, %ecx
	xorl	%edx, %edx
	movl	$24, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L821
.L1131:
	movl	$.LC335, %ecx
	jmp	.L1263
.L1128:
	movl	$.LC332, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L811
.L1127:
	movl	$.LC331, %ecx
	movl	$1, %edx
	movl	$44, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L809
.L1126:
	movl	$.LC330, %ecx
	xorl	%edx, %edx
	movl	$44, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L807
.L1125:
	movl	$.LC329, %ecx
	movl	$1, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L805
.L1120:
	movl	$.LC323, %ecx
	xorl	%edx, %edx
	movl	$24, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L794
.L793:
	movq	%r14, %rdx
	movl	%ecx, %r12d
	leaq	215(%r14), %rax
	shrq	%cl, %rdx
	andq	%rbp, %rdx
	salq	$4, %rdx
	cmpq	__mf_lookup_cache(%rdx), %r14
	jb	.L1137
	cmpq	__mf_lookup_cache+8(%rdx), %rax
	ja	.L1137
.L834:
	movq	208(%r14), %r9
	movq	httpd_err503form(%rip), %r8
	movl	$.LC103, %ecx
	movq	httpd_err503title(%rip), %rdx
	movl	$503, %esi
	jmp	.L1253
.L1119:
	movl	$.LC322, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L791
.L1118:
	movl	$.LC321, %ecx
	xorl	%edx, %edx
	movl	$32, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L789
.L1137:
	movl	$.LC341, %ecx
	xorl	%edx, %edx
	movl	$216, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L834
.L1124:
	subq	%rbx, %rax
	movl	$.LC328, %ecx
	movl	$1, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L803
.L1123:
	movl	$.LC327, %ecx
	xorl	%edx, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L801
.L1121:
	movl	$.LC324, %ecx
	xorl	%edx, %edx
	movl	$44, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L796
.L1093:
	subq	%rbx, %rax
	movl	$.LC296, %ecx
	xorl	%edx, %edx
	leaq	1(%rax), %rsi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L720
.L1084:
	movl	$.LC256, %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L662
.L1313:
	movq	logfile(%rip), %rcx
	movl	$.LC231, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	logfile(%rip), %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L1184:
	movl	$.LC387, %ecx
	xorl	%edx, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L944
.L1178:
	movl	$.LC381, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L927
.L1106:
	movl	$.LC310, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L760
.L1215:
	movl	$.LC418, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L1017
.L1186:
	movl	$.LC390, %ecx
	xorl	%edx, %edx
	movl	$216, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L949
.L1166:
	movl	$.LC368, %ecx
	xorl	%edx, %edx
	movl	$720, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L901
.L1165:
	movl	$.LC367, %ecx
	xorl	%edx, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L899
.L1164:
	movl	$.LC367, %ecx
	xorl	%edx, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L897
.L1163:
	movl	$.LC366, %ecx
	xorl	%edx, %edx
	movl	$480, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L894
.L1162:
	movl	$.LC365, %ecx
	xorl	%edx, %edx
	movl	$72, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L891
.L1161:
	movl	$.LC364, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L889
.L1092:
	movl	$.LC294, %ecx
	xorl	%edx, %edx
	movl	$4, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L715
.L1054:
	movl	$.LC189, %ecx
	xorl	%edx, %edx
	movl	$8, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	movb	%cl, 128(%rsp)
	jmp	.L546
.L1202:
	movl	$.LC404, %ecx
	xorl	%edx, %edx
	movl	$120, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L986
.L1201:
	movl	$.LC403, %ecx
	xorl	%edx, %edx
	movl	$136, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L983
.L1200:
	movl	$.LC402, %ecx
	movl	$1, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	movl	%r10d, 112(%rsp)
	movq	%r11, 104(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	104(%rsp), %r11
	movl	112(%rsp), %r10d
	movq	96(%rsp), %rax
	jmp	.L980
.L1199:
	movl	$.LC402, %ecx
	xorl	%edx, %edx
	movl	$40, %esi
	movq	%r14, %rdi
	movq	%rax, 96(%rsp)
	movl	%r10d, 112(%rsp)
	movq	%r11, 104(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	104(%rsp), %r11
	movl	112(%rsp), %r10d
	movq	96(%rsp), %rax
	jmp	.L978
.L1198:
	subq	%rdi, %rsi
	movl	$.LC401, %ecx
	xorl	%edx, %edx
	addq	$1, %rsi
	movq	%rax, 96(%rsp)
	movl	%r10d, 112(%rsp)
	movq	%r11, 104(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rdx
	movq	104(%rsp), %r11
	movl	112(%rsp), %r10d
	movq	96(%rsp), %rax
	jmp	.L976
.L1197:
	movl	$.LC400, %ecx
	xorl	%edx, %edx
	movl	$60, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L973
.L1196:
	movl	$.LC399, %ecx
	movl	$1, %edx
	movl	$208, %esi
	movq	%r15, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L971
.L1195:
	movl	$.LC399, %ecx
	xorl	%edx, %edx
	movl	$208, %esi
	movq	%r15, %rdi
	movq	%rax, 96(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	96(%rsp), %rax
	jmp	.L969
.L1194:
	movl	$.LC398, %ecx
	xorl	%edx, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L967
.L1193:
	movl	$.LC397, %ecx
	movl	$1, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L965
.L1192:
	movl	$.LC397, %ecx
	xorl	%edx, %edx
	movl	$144, %esi
	movq	%rbx, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L963
.L1191:
	movl	$.LC396, %ecx
	movl	$1, %edx
	movl	$480, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L961
.L1187:
	movl	$.LC392, %ecx
	movl	$1, %edx
	movl	$96, %esi
	movq	%rbx, %rdi
	movq	%r8, 112(%rsp)
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	movq	112(%rsp), %r8
	jmp	.L951
.L1167:
	movl	$.LC369, %ecx
	xorl	%edx, %edx
	movl	$708, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L903
.L1188:
	movl	$.LC393, %ecx
	xorl	%edx, %edx
	movl	$480, %esi
	movq	%r14, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %r12d
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L953
.L1122:
	movl	$.LC326, %ecx
	movl	$1, %edx
	movl	$44, %esi
	movq	%r12, %rdi
	call	__mf_check
	movzbl	__mf_lc_shift(%rip), %ecx
	movq	__mf_lc_mask(%rip), %rbp
	jmp	.L799
	.cfi_endproc
.LFE78:
	.size	main, .-main
	.local	watchdog_flag
	.comm	watchdog_flag,4,4
	.local	got_usr1
	.comm	got_usr1,4,4
	.local	got_hup
	.comm	got_hup,4,4
	.comm	stats_simultaneous,4,4
	.comm	stats_bytes,8,8
	.comm	stats_connections,8,8
	.comm	stats_time,8,8
	.comm	start_time,8,8
	.globl	terminate
	.bss
	.align 4
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	4
	.local	argv0
	.comm	argv0,8,8
	.local	numthrottles
	.comm	numthrottles,4,4
	.local	maxthrottles
	.comm	maxthrottles,4,4
	.local	throttles
	.comm	throttles,8,8
	.local	throttlefile
	.comm	throttlefile,8,8
	.local	user
	.comm	user,8,8
	.local	logfile
	.comm	logfile,8,8
	.local	no_log
	.comm	no_log,4,4
	.local	dir
	.comm	dir,8,8
	.local	debug
	.comm	debug,4,4
	.local	pidfile
	.comm	pidfile,8,8
	.local	max_connects
	.comm	max_connects,4,4
	.local	do_chroot
	.comm	do_chroot,4,4
	.local	data_dir
	.comm	data_dir,8,8
	.local	no_empty_referers
	.comm	no_empty_referers,4,4
	.local	local_pattern
	.comm	local_pattern,8,8
	.local	url_pattern
	.comm	url_pattern,8,8
	.local	do_global_passwd
	.comm	do_global_passwd,4,4
	.local	do_vhost
	.comm	do_vhost,4,4
	.local	no_symlink_check
	.comm	no_symlink_check,4,4
	.local	max_age
	.comm	max_age,4,4
	.local	p3p
	.comm	p3p,8,8
	.local	charset
	.comm	charset,8,8
	.local	cgi_limit
	.comm	cgi_limit,4,4
	.local	cgi_pattern
	.comm	cgi_pattern,8,8
	.local	port
	.comm	port,2,2
	.local	hostname
	.comm	hostname,8,8
	.local	hs
	.comm	hs,8,8
	.local	connects
	.comm	connects,8,8
	.local	first_free_connect
	.comm	first_free_connect,4,4
	.local	num_connects
	.comm	num_connects,4,4
	.local	httpd_conn_count
	.comm	httpd_conn_count,4,4
	.section	.rodata
.LC421:
	.string	"string literal"
.LC422:
	.string	"thttpd.c:134:5 terminate"
	.align 8
.LC423:
	.string	"/usr/include/stdio.h:167:25 stderr"
.LC424:
	.string	"thttpd.c:137:7 stats_bytes"
	.align 8
.LC425:
	.string	"thttpd.c:136:6 stats_connections"
	.align 8
.LC426:
	.string	"thttpd.c:138:5 stats_simultaneous"
.LC427:
	.string	"thttpd.c:135:8 start_time"
.LC428:
	.string	"thttpd.c:135:20 stats_time"
	.align 8
.LC429:
	.string	"libhttpd.h:256:14 httpd_err408form"
	.align 8
.LC430:
	.string	"libhttpd.h:255:14 httpd_err408title"
	.align 8
.LC431:
	.string	"/usr/include/stdio.h:166:25 stdout"
	.align 8
.LC432:
	.string	"/usr/include/stdio.h:165:25 stdin"
.LC433:
	.string	"timers.h:47:19 JunkClientData"
	.align 8
.LC434:
	.string	"libhttpd.h:254:14 httpd_err400form"
	.align 8
.LC435:
	.string	"libhttpd.h:253:14 httpd_err400title"
	.align 8
.LC436:
	.string	"libhttpd.h:258:14 httpd_err503form"
	.align 8
.LC437:
	.string	"libhttpd.h:257:14 httpd_err503title"
	.section	.text.startup
	.p2align 4,,15
	.type	_GLOBAL__sub_I_00099_0_terminate, @function
_GLOBAL__sub_I_00099_0_terminate:
.LFB112:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__mf_init
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$219, %esi
	movl	$.LC5, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$70, %esi
	movl	$.LC27, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$62, %esi
	movl	$.LC30, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$65, %esi
	movl	$.LC34, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$22, %esi
	movl	$.LC43, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$36, %esi
	movl	$.LC45, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$39, %esi
	movl	$.LC48, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$33, %esi
	movl	$.LC78, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$43, %esi
	movl	$.LC80, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$39, %esi
	movl	$.LC84, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$104, %esi
	movl	$.LC85, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$25, %esi
	movl	$.LC96, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$35, %esi
	movl	$.LC101, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$1, %esi
	movl	$.LC103, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$35, %esi
	movl	$.LC107, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$16, %esi
	movl	$.LC111, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$37, %esi
	movl	$.LC116, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$34, %esi
	movl	$.LC117, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$31, %esi
	movl	$.LC118, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$36, %esi
	movl	$.LC119, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$2, %esi
	movl	$.LC121, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC123, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$6, %esi
	movl	$.LC128, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC129, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC130, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$7, %esi
	movl	$.LC131, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$9, %esi
	movl	$.LC132, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$9, %esi
	movl	$.LC133, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC134, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$10, %esi
	movl	$.LC135, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$9, %esi
	movl	$.LC136, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$11, %esi
	movl	$.LC137, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC138, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$7, %esi
	movl	$.LC139, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$9, %esi
	movl	$.LC140, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$7, %esi
	movl	$.LC141, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$16, %esi
	movl	$.LC142, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$9, %esi
	movl	$.LC143, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$10, %esi
	movl	$.LC144, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC145, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC146, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$6, %esi
	movl	$.LC147, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC148, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$13, %esi
	movl	$.LC149, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$15, %esi
	movl	$.LC150, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC151, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC152, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC153, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC154, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$32, %esi
	movl	$.LC155, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC156, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC158, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$7, %esi
	movl	$.LC167, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$11, %esi
	movl	$.LC168, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC171, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$23, %esi
	movl	$.LC172, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC173, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC174, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC176, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC178, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC180, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC181, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC182, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC184, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC185, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC186, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC188, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC190, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC192, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC194, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC196, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC197, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC198, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$5, %esi
	movl	$.LC199, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC200, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC202, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC204, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC206, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC208, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC212, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$26, %esi
	movl	$.LC213, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$25, %esi
	movl	$.LC214, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$39, %esi
	movl	$.LC218, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$29, %esi
	movl	$.LC224, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$34, %esi
	movl	$.LC225, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$11, %esi
	movl	$.LC231, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$20, %esi
	movl	$.LC235, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$16, %esi
	movl	$.LC236, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$33, %esi
	movl	$.LC237, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$38, %esi
	movl	$.LC238, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$3, %esi
	movl	$.LC240, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$39, %esi
	movl	$.LC241, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$44, %esi
	movl	$.LC242, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$23, %esi
	movl	$.LC249, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$25, %esi
	movl	$.LC250, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$10, %esi
	movl	$.LC253, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$2, %esi
	movl	$.LC254, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$2, %esi
	movl	$.LC255, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$67, %esi
	movl	$.LC257, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$72, %esi
	movl	$.LC258, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$20, %esi
	movl	$.LC259, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$15, %esi
	movl	$.LC260, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$11, %esi
	movl	$.LC261, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$6, %esi
	movl	$.LC262, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$2, %esi
	movl	$.LC264, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$12, %esi
	movl	$.LC265, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$2, %esi
	movl	$.LC266, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC267, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$31, %esi
	movl	$.LC268, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$12, %esi
	movl	$.LC269, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$74, %esi
	movl	$.LC270, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$79, %esi
	movl	$.LC271, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$18, %esi
	movl	$.LC272, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$13, %esi
	movl	$.LC273, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$20, %esi
	movl	$.LC274, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$15, %esi
	movl	$.LC275, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$30, %esi
	movl	$.LC276, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$24, %esi
	movl	$.LC277, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$36, %esi
	movl	$.LC278, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$30, %esi
	movl	$.LC279, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$15, %esi
	movl	$.LC280, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$12, %esi
	movl	$.LC281, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$16, %esi
	movl	$.LC282, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$12, %esi
	movl	$.LC283, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$58, %esi
	movl	$.LC284, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$38, %esi
	movl	$.LC285, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$19, %esi
	movl	$.LC292, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$22, %esi
	movl	$.LC293, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$13, %esi
	movl	$.LC295, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$56, %esi
	movl	$.LC325, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$33, %esi
	movl	$.LC386, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$37, %esi
	movl	$.LC389, %edi
	call	__mf_register
	movl	$.LC421, %ecx
	movl	$4, %edx
	movl	$25, %esi
	movl	$.LC391, %edi
	call	__mf_register
	movl	$.LC422, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$terminate, %edi
	call	__mf_register
	movl	$.LC423, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stderr, %edi
	call	__mf_register
	movl	$.LC424, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stats_bytes, %edi
	call	__mf_register
	movl	$.LC425, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stats_connections, %edi
	call	__mf_register
	movl	$.LC426, %ecx
	movl	$4, %edx
	movl	$4, %esi
	movl	$stats_simultaneous, %edi
	call	__mf_register
	movl	$.LC427, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$start_time, %edi
	call	__mf_register
	movl	$.LC428, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stats_time, %edi
	call	__mf_register
	movl	$.LC429, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err408form, %edi
	call	__mf_register
	movl	$.LC430, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err408title, %edi
	call	__mf_register
	movl	$.LC431, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stdout, %edi
	call	__mf_register
	movl	$.LC432, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$stdin, %edi
	call	__mf_register
	movl	$.LC433, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$JunkClientData, %edi
	call	__mf_register
	movl	$.LC434, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err400form, %edi
	call	__mf_register
	movl	$.LC435, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err400title, %edi
	call	__mf_register
	movl	$.LC436, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err503form, %edi
	call	__mf_register
	movl	$.LC437, %ecx
	movl	$4, %edx
	movl	$8, %esi
	movl	$httpd_err503title, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__mf_register
	.cfi_endproc
.LFE112:
	.size	_GLOBAL__sub_I_00099_0_terminate, .-_GLOBAL__sub_I_00099_0_terminate
	.section	.ctors.65436,"aw",@progbits
	.align 8
	.quad	_GLOBAL__sub_I_00099_0_terminate
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
