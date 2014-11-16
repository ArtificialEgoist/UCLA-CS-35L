	.file	"thttpd.c"
	.text
	.p2align 4,,15
	.type	wakeup_connection, @function
wakeup_connection:
.LFB111:
	.cfi_startproc
	cmpl	$3, (%rdi)
	movq	$0, 96(%rdi)
	je	.L4
	rep
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movq	8(%rdi), %rax
	movl	$2, (%rdi)
	movq	%rdi, %rsi
	movl	$1, %edx
	movl	704(%rax), %eax
	movl	%eax, %edi
	jmp	fdwatch_add_fd
	.cfi_endproc
.LFE111:
	.size	wakeup_connection, .-wakeup_connection
	.p2align 4,,15
	.type	handle_hup, @function
handle_hup:
.LFB85:
	.cfi_startproc
	movl	$1, got_hup(%rip)
	ret
	.cfi_endproc
.LFE85:
	.size	handle_hup, .-handle_hup
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.section	.text.unlikely,"ax",@progbits
	.type	usage, @function
usage:
.LFB92:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	movl	$.LC0, %edx
	movq	argv0(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE92:
	.size	usage, .-usage
	.text
	.p2align 4,,15
	.type	really_clear_connection, @function
really_clear_connection:
.LFB109:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rdi
	movq	200(%rdi), %rax
	addq	%rax, stats_bytes(%rip)
	cmpl	$3, (%rbx)
	je	.L8
	movl	704(%rdi), %edi
	movq	%rsi, 8(%rsp)
	call	fdwatch_del_fd
	movq	8(%rbx), %rdi
	movq	8(%rsp), %rsi
.L8:
	call	httpd_close_conn
	movl	56(%rbx), %esi
	testl	%esi, %esi
	jle	.L9
	movq	throttles(%rip), %rcx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L10:
	movslq	16(%rbx,%rdx,4), %rax
	addq	$1, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	subl	$1, 40(%rcx,%rax)
	cmpl	%edx, %esi
	jg	.L10
.L9:
	movq	104(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11
	call	tmr_cancel
	movq	$0, 104(%rbx)
.L11:
	movl	first_free_connect(%rip), %eax
	movl	$0, (%rbx)
	subl	$1, num_connects(%rip)
	movl	%eax, 4(%rbx)
	subq	connects(%rip), %rbx
	movabsq	$-8198552921648689607, %rax
	sarq	$4, %rbx
	imulq	%rax, %rbx
	movl	%ebx, first_free_connect(%rip)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE109:
	.size	really_clear_connection, .-really_clear_connection
	.p2align 4,,15
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB112:
	.cfi_startproc
	movq	$0, 104(%rdi)
	jmp	really_clear_connection
	.cfi_endproc
.LFE112:
	.size	linger_clear_connection, .-linger_clear_connection
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.align 8
.LC2:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.align 8
.LC3:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.text
	.p2align 4,,15
	.type	update_throttles, @function
update_throttles:
.LFB106:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movl	numthrottles(%rip), %edx
	testl	%edx, %edx
	jle	.L15
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	movabsq	$6148914691236517206, %r12
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L18:
	addl	$1, %ebx
	addq	$48, %rbp
	cmpl	%ebx, numthrottles(%rip)
	jle	.L15
.L19:
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	movq	32(%rcx), %rax
	movq	24(%rcx), %rdx
	movq	$0, 32(%rcx)
	movq	%rax, %rsi
	shrq	$63, %rsi
	addq	%rsi, %rax
	sarq	%rax
	leaq	(%rax,%rdx,2), %rsi
	movq	%rsi, %rax
	sarq	$63, %rsi
	imulq	%r12
	movq	8(%rcx), %rax
	subq	%rsi, %rdx
	cmpq	%rax, %rdx
	movq	%rdx, 24(%rcx)
	jle	.L16
	movl	40(%rcx), %esi
	testl	%esi, %esi
	je	.L16
	leaq	(%rax,%rax), %rdi
	movl	%esi, 8(%rsp)
	movq	%rax, (%rsp)
	movq	%rdx, %r9
	movq	(%rcx), %r8
	movl	%ebx, %ecx
	cmpq	%rdi, %rdx
	jle	.L17
	movl	$.LC1, %edx
	movl	$1, %esi
	movl	$5, %edi
.L28:
	xorl	%eax, %eax
	call	__syslog_chk
	movq	%rbp, %rcx
	addq	throttles(%rip), %rcx
	movq	24(%rcx), %rdx
.L16:
	movq	16(%rcx), %rax
	cmpq	%rax, %rdx
	jge	.L18
	movl	40(%rcx), %esi
	testl	%esi, %esi
	je	.L18
	movl	%esi, 8(%rsp)
	movq	%rax, (%rsp)
	movq	%rdx, %r9
	movq	(%rcx), %r8
	xorl	%eax, %eax
	movl	%ebx, %ecx
	movl	$.LC3, %edx
	movl	$1, %esi
	movl	$5, %edi
	addl	$1, %ebx
	addq	$48, %rbp
	call	__syslog_chk
	cmpl	%ebx, numthrottles(%rip)
	jg	.L19
	.p2align 4,,10
	.p2align 3
.L15:
	movl	max_connects(%rip), %r11d
	testl	%r11d, %r11d
	jle	.L14
	movq	throttles(%rip), %r10
	movq	connects(%rip), %rdi
	xorl	%r8d, %r8d
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L21:
	addl	$1, %r8d
	addq	$144, %rdi
	cmpl	%r8d, %r11d
	jle	.L14
.L25:
	movl	(%rdi), %eax
	subl	$2, %eax
	cmpl	$1, %eax
	ja	.L21
	movl	56(%rdi), %eax
	movq	$-1, 64(%rdi)
	testl	%eax, %eax
	jle	.L21
	subl	$1, %eax
	movq	%rdi, %rcx
	movq	$-1, %rsi
	leaq	4(%rdi,%rax,4), %r9
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L22:
	cmpq	%rax, %rsi
	cmovg	%rax, %rsi
	movq	%rsi, 64(%rdi)
.L23:
	addq	$4, %rcx
	cmpq	%r9, %rcx
	je	.L21
	movq	64(%rdi), %rsi
.L24:
	movslq	16(%rcx), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$4, %rax
	addq	%r10, %rax
	movslq	40(%rax), %rbx
	movq	8(%rax), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	%rbx
	cmpq	$-1, %rsi
	jne	.L22
	movq	%rax, 64(%rdi)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L17:
	movl	$.LC2, %edx
	movl	$1, %esi
	movl	$6, %edi
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L14:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE106:
	.size	update_throttles, .-update_throttles
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"too many connections!"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"the connects free list is messed up"
	.align 8
.LC6:
	.string	"out of memory allocating an httpd_conn"
	.text
	.p2align 4,,15
	.type	handle_newconnect, @function
handle_newconnect:
.LFB100:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	num_connects(%rip), %eax
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.L43:
	cmpl	%eax, max_connects(%rip)
	jle	.L46
	movl	first_free_connect(%rip), %eax
	cmpl	$-1, %eax
	je	.L32
	cltq
	leaq	(%rax,%rax,8), %rbx
	salq	$4, %rbx
	addq	connects(%rip), %rbx
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jne	.L32
	movq	8(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L47
.L34:
	movq	hs(%rip), %rdi
	movl	%ebp, %esi
	call	httpd_get_conn
	testl	%eax, %eax
	jne	.L48
	movq	%r12, %rdi
	call	tmr_run
	xorl	%eax, %eax
.L31:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	cmpl	$2, %eax
	je	.L49
	movl	4(%rbx), %eax
	movl	$1, (%rbx)
	movl	$-1, 4(%rbx)
	addl	$1, num_connects(%rip)
	movl	%eax, first_free_connect(%rip)
	movq	(%r12), %rax
	movq	$0, 96(%rbx)
	movq	$0, 104(%rbx)
	movq	%rax, 88(%rbx)
	movq	8(%rbx), %rax
	movq	$0, 136(%rbx)
	movl	$0, 56(%rbx)
	movl	704(%rax), %edi
	call	httpd_set_ndelay
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
	addq	$1, stats_connections(%rip)
	movl	num_connects(%rip), %eax
	cmpl	stats_simultaneous(%rip), %eax
	jle	.L43
	movl	%eax, stats_simultaneous(%rip)
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L49:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	movl	$720, %edi
	call	malloc
	testq	%rax, %rax
	movq	%rax, %rdx
	movq	%rax, 8(%rbx)
	je	.L50
	movl	$0, (%rax)
	addl	$1, httpd_conn_count(%rip)
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L46:
	xorl	%eax, %eax
	movl	$.LC4, %edx
	movl	$1, %esi
	movl	$4, %edi
	call	__syslog_chk
	movq	%r12, %rdi
	call	tmr_run
	xorl	%eax, %eax
	jmp	.L31
.L32:
	movl	$.LC5, %edx
.L45:
	movl	$2, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L50:
	movl	$.LC6, %edx
	jmp	.L45
	.cfi_endproc
.LFE100:
	.size	handle_newconnect, .-handle_newconnect
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"replacing non-null linger_timer!"
	.align 8
.LC8:
	.string	"tmr_create(linger_clear_connection) failed"
	.text
	.p2align 4,,15
	.type	clear_connection, @function
clear_connection:
.LFB108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	96(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L52
	call	tmr_cancel
	movq	$0, 96(%rbx)
.L52:
	movl	(%rbx), %edx
	cmpl	$4, %edx
	je	.L53
	movq	8(%rbx), %rax
	movl	556(%rax), %esi
	testl	%esi, %esi
	je	.L55
	cmpl	$3, %edx
	je	.L56
	movl	704(%rax), %edi
	call	fdwatch_del_fd
	movq	8(%rbx), %rax
.L56:
	movl	704(%rax), %edi
	movl	$1, %esi
	movl	$4, (%rbx)
	call	shutdown
	movq	8(%rbx), %rax
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movl	704(%rax), %edi
	call	fdwatch_add_fd
	cmpq	$0, 104(%rbx)
	je	.L57
	movl	$.LC7, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L57:
	xorl	%r8d, %r8d
	movl	$500, %ecx
	movq	%rbx, %rdx
	movl	$linger_clear_connection, %esi
	movq	%rbp, %rdi
	call	tmr_create
	testq	%rax, %rax
	movq	%rax, 104(%rbx)
	je	.L59
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
.L53:
	.cfi_restore_state
	movq	104(%rbx), %rdi
	call	tmr_cancel
	movq	8(%rbx), %rax
	movq	$0, 104(%rbx)
	movl	$0, 556(%rax)
.L55:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	really_clear_connection
.L59:
	.cfi_restore_state
	movl	$2, %edi
	movl	$.LC8, %edx
	movl	$1, %esi
	call	__syslog_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE108:
	.size	clear_connection, .-clear_connection
	.p2align 4,,15
	.type	finish_connection, @function
finish_connection:
.LFB107:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	movq	%rdi, %rbx
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rdi
	movq	%rsi, %rbp
	call	httpd_write_response
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	16(%rsp), %rbp
	movq	8(%rsp), %rbx
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	jmp	clear_connection
	.cfi_endproc
.LFE107:
	.size	finish_connection, .-finish_connection
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"up %ld seconds, stats for %ld seconds:"
	.align 8
.LC10:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.text
	.p2align 4,,15
	.type	logstats, @function
logstats:
.LFB115:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	testq	%rdi, %rdi
	je	.L66
.L62:
	movq	(%rdi), %rax
	movq	%rax, %rcx
	movq	%rax, %rbx
	subq	start_time(%rip), %rcx
	subq	stats_time(%rip), %rbx
	movq	%rax, stats_time(%rip)
	je	.L63
	xorl	%eax, %eax
	movq	%rbx, %r8
	movl	$.LC9, %edx
	movl	$1, %esi
	movl	$6, %edi
	call	__syslog_chk
	testq	%rbx, %rbx
	jg	.L65
.L64:
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
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L63:
	.cfi_restore_state
	movl	$1, %r8d
	movl	$.LC9, %edx
	movl	$1, %esi
	movl	$6, %edi
	xorl	%eax, %eax
	movl	$1, %ebx
	call	__syslog_chk
.L65:
	movq	stats_bytes(%rip), %r9
	movq	stats_connections(%rip), %rcx
	movl	$.LC10, %edx
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
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L66:
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	leaq	16(%rsp), %rdi
	jmp	.L62
	.cfi_endproc
.LFE115:
	.size	logstats, .-logstats
	.p2align 4,,15
	.type	shut_down, @function
shut_down:
.LFB99:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%esi, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsp, %rdi
	call	gettimeofday
	movq	%rsp, %rdi
	call	logstats
	movl	max_connects(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L68
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L69:
	movq	8(%rax), %rdi
	testq	%rdi, %rdi
	je	.L70
	call	httpd_destroy_conn
	movq	%rbx, %r12
	addq	connects(%rip), %r12
	movq	8(%r12), %rdi
	call	free
	subl	$1, httpd_conn_count(%rip)
	movq	$0, 8(%r12)
.L70:
	addl	$1, %ebp
	addq	$144, %rbx
	cmpl	%ebp, max_connects(%rip)
	jle	.L68
.L71:
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L69
	movq	8(%rax), %rdi
	movq	%rsp, %rsi
	call	httpd_close_conn
	movq	%rbx, %rax
	addq	connects(%rip), %rax
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L68:
	movq	hs(%rip), %rbx
	testq	%rbx, %rbx
	je	.L72
	movl	72(%rbx), %edi
	movq	$0, hs(%rip)
	cmpl	$-1, %edi
	je	.L73
	call	fdwatch_del_fd
.L73:
	movl	76(%rbx), %edi
	cmpl	$-1, %edi
	je	.L74
	call	fdwatch_del_fd
.L74:
	movq	%rbx, %rdi
	call	httpd_terminate
.L72:
	call	mmc_destroy
	call	tmr_destroy
	movq	connects(%rip), %rdi
	call	free
	movq	throttles(%rip), %rdi
	testq	%rdi, %rdi
	je	.L67
	call	free
.L67:
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE99:
	.size	shut_down, .-shut_down
	.p2align 4,,15
	.type	show_stats, @function
show_stats:
.LFB114:
	.cfi_startproc
	movq	%rsi, %rdi
	jmp	logstats
	.cfi_endproc
.LFE114:
	.size	show_stats, .-show_stats
	.p2align 4,,15
	.type	handle_usr2, @function
handle_usr2:
.LFB87:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	call	__errno_location
	movl	(%rax), %ebp
	movq	%rax, %rbx
	xorl	%edi, %edi
	call	logstats
	movl	%ebp, (%rbx)
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE87:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata.str1.1
.LC11:
	.string	"exiting due to signal %d"
	.text
	.p2align 4,,15
	.type	handle_term, @function
handle_term:
.LFB83:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	shut_down
	movl	$5, %edi
	movl	%ebx, %ecx
	movl	$.LC11, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE83:
	.size	handle_term, .-handle_term
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"%.80s connection timed out reading"
	.section	.rodata.str1.1
.LC13:
	.string	""
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"%.80s connection timed out sending"
	.text
	.p2align 4,,15
	.type	idle, @function
idle:
.LFB110:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	max_connects(%rip), %r9d
	testl	%r9d, %r9d
	jle	.L80
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L89:
	jl	.L82
	cmpl	$3, %eax
	jg	.L82
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$299, %rax
	jg	.L88
.L82:
	addl	$1, %r12d
	addq	$144, %rbp
	cmpl	%r12d, max_connects(%rip)
	jle	.L80
.L85:
	movq	%rbp, %rbx
	addq	connects(%rip), %rbx
	movl	(%rbx), %eax
	cmpl	$1, %eax
	jne	.L89
	movq	0(%r13), %rax
	subq	88(%rbx), %rax
	cmpq	$59, %rax
	jle	.L82
	movq	8(%rbx), %rdi
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC12, %edx
	movq	%rax, %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	movl	$6, %edi
	call	__syslog_chk
	movq	8(%rbx), %rdi
	movq	httpd_err408form(%rip), %r8
	movl	$.LC13, %r9d
	movq	httpd_err408title(%rip), %rdx
	movq	%r9, %rcx
	movl	$408, %esi
	call	httpd_send_err
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L80:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
	movq	8(%rbx), %rdi
	addq	$16, %rdi
	call	httpd_ntoa
	movl	$.LC14, %edx
	movq	%rax, %rcx
	movl	$1, %esi
	movl	$6, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	clear_connection
	jmp	.L82
	.cfi_endproc
.LFE110:
	.size	idle, .-idle
	.p2align 4,,15
	.type	occasional, @function
occasional:
.LFB113:
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
.LFE113:
	.size	occasional, .-occasional
	.section	.rodata.str1.1
.LC15:
	.string	"child wait - %m"
	.text
	.p2align 4,,15
	.type	handle_chld, @function
handle_chld:
.LFB84:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	call	__errno_location
	movl	(%rax), %r12d
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L98:
	leaq	12(%rsp), %rsi
	movl	$1, %edx
	movl	$-1, %edi
	call	waitpid
	cmpl	$0, %eax
	je	.L93
	jl	.L99
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L98
	movl	36(%rax), %edx
	subl	$1, %edx
	cmovs	%ebp, %edx
	movl	%edx, 36(%rax)
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L99:
	movl	(%rbx), %eax
	cmpl	$11, %eax
	je	.L98
	cmpl	$4, %eax
	je	.L98
	cmpl	$10, %eax
	je	.L93
	movl	$.LC15, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L93:
	movl	%r12d, (%rbx)
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE84:
	.size	handle_chld, .-handle_chld
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"%s: no value required for %s option\n"
	.text
	.p2align 4,,15
	.type	no_value_required, @function
no_value_required:
.LFB95:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rsi, %rsi
	jne	.L102
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L102:
	.cfi_restore_state
	movq	%rdi, %r8
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC16, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE95:
	.size	no_value_required, .-no_value_required
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"%s: value required for %s option\n"
	.text
	.p2align 4,,15
	.type	value_required, @function
value_required:
.LFB94:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rsi, %rsi
	je	.L105
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L105:
	.cfi_restore_state
	movq	%rdi, %r8
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC17, %edx
	movb	$1, %sil
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE94:
	.size	value_required, .-value_required
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"out of memory copying a string"
	.align 8
.LC19:
	.string	"%s: out of memory copying a string\n"
	.text
	.p2align 4,,15
	.type	e_strdup, @function
e_strdup:
.LFB96:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__strdup
	testq	%rax, %rax
	je	.L108
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L108:
	.cfi_restore_state
	movl	$.LC18, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rcx
	movl	$.LC19, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE96:
	.size	e_strdup, .-e_strdup
	.section	.rodata.str1.1
.LC20:
	.string	"r"
.LC21:
	.string	" \t\n\r"
.LC22:
	.string	"debug"
.LC23:
	.string	"port"
.LC24:
	.string	"dir"
.LC25:
	.string	"chroot"
.LC26:
	.string	"nochroot"
.LC27:
	.string	"data_dir"
.LC28:
	.string	"symlink"
.LC29:
	.string	"nosymlink"
.LC30:
	.string	"symlinks"
.LC31:
	.string	"nosymlinks"
.LC32:
	.string	"user"
.LC33:
	.string	"cgipat"
.LC34:
	.string	"cgilimit"
.LC35:
	.string	"urlpat"
.LC36:
	.string	"noemptyreferers"
.LC37:
	.string	"localpat"
.LC38:
	.string	"throttles"
.LC39:
	.string	"host"
.LC40:
	.string	"logfile"
.LC41:
	.string	"vhost"
.LC42:
	.string	"novhost"
.LC43:
	.string	"globalpasswd"
.LC44:
	.string	"noglobalpasswd"
.LC45:
	.string	"pidfile"
.LC46:
	.string	"charset"
.LC47:
	.string	"p3p"
.LC48:
	.string	"max_age"
	.section	.rodata.str1.8
	.align 8
.LC49:
	.string	"%s: unknown config option '%s'\n"
	.text
	.p2align 4,,15
	.type	read_config, @function
read_config:
.LFB93:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$.LC20, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$10024, %rsp
	.cfi_def_cfa_offset 10064
	movq	%fs:40, %rax
	movq	%rax, 10008(%rsp)
	xorl	%eax, %eax
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L154
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rbp, %rdx
	movl	$10000, %esi
	movq	%rsp, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L155
	movl	$35, %esi
	movq	%rsp, %rdi
	call	strchr
	testq	%rax, %rax
	je	.L112
	movb	$0, (%rax)
.L112:
	movl	$.LC21, %esi
	movq	%rsp, %rdi
	call	strspn
	cmpb	$0, (%rsp,%rax)
	je	.L151
	leaq	(%rsp), %r13
	addq	%rax, %r13
.L145:
	movl	$.LC21, %esi
	movq	%r13, %rdi
	call	strcspn
	leaq	0(%r13,%rax), %rbx
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L115:
	movb	$0, (%rbx)
	addq	$1, %rbx
.L114:
	movzbl	(%rbx), %eax
	cmpb	$9, %al
	je	.L115
	cmpb	$32, %al
	je	.L115
	cmpb	$10, %al
	je	.L115
	cmpb	$13, %al
	.p2align 4,,5
	je	.L115
	movl	$61, %esi
	movq	%r13, %rdi
	call	strchr
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L116
	movb	$0, (%rax)
	addq	$1, %r12
.L116:
	movl	$.LC22, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L156
	movl	$.LC23, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L157
	movl	$.LC24, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L158
	movl	$.LC25, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L159
	movl	$.LC26, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L160
	movl	$.LC27, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L161
	movl	$.LC28, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L152
	movl	$.LC29, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L153
	movl	$.LC30, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L152
	movl	$.LC31, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L153
	movl	$.LC32, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L162
	movl	$.LC33, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L163
	movl	$.LC34, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L164
	movl	$.LC35, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L165
	movl	$.LC36, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L166
	movl	$.LC37, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L167
	movl	$.LC38, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L168
	movl	$.LC39, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L169
	movl	$.LC40, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L170
	movl	$.LC41, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L171
	movl	$.LC42, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L172
	movl	$.LC43, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L173
	movl	$.LC44, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L174
	movl	$.LC45, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L175
	movl	$.LC46, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L176
	movl	$.LC47, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	je	.L177
	movl	$.LC48, %esi
	movq	%r13, %rdi
	call	strcasecmp
	testl	%eax, %eax
	jne	.L144
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	strtol
	movl	%eax, max_age(%rip)
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L155:
	movq	%rbp, %rdi
	call	fclose
	movq	10008(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L178
	addq	$10024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L156:
	.cfi_restore_state
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, debug(%rip)
.L118:
	movl	$.LC21, %esi
	movq	%rbx, %rdi
	call	strspn
	leaq	(%rbx,%rax), %r13
	cmpb	$0, 0(%r13)
	je	.L151
	jmp	.L145
.L157:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	strtol
	movw	%ax, port(%rip)
	jmp	.L118
.L158:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, dir(%rip)
	jmp	.L118
.L152:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, no_symlink_check(%rip)
	jmp	.L118
.L159:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	jmp	.L118
.L160:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	jmp	.L118
.L161:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, data_dir(%rip)
	jmp	.L118
.L153:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, no_symlink_check(%rip)
	jmp	.L118
.L165:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, url_pattern(%rip)
	jmp	.L118
.L162:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, user(%rip)
	jmp	.L118
.L163:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, cgi_pattern(%rip)
	jmp	.L118
.L164:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	strtol
	movl	%eax, cgi_limit(%rip)
	jmp	.L118
.L167:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, local_pattern(%rip)
	jmp	.L118
.L166:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, no_empty_referers(%rip)
	jmp	.L118
.L144:
	movq	stderr(%rip), %rdi
	movq	argv0(%rip), %rcx
	movq	%r13, %r8
	movl	$.LC49, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L154:
	movq	%rbx, %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L178:
	call	__stack_chk_fail
.L169:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, hostname(%rip)
	jmp	.L118
.L168:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, throttlefile(%rip)
	jmp	.L118
.L177:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, p3p(%rip)
	jmp	.L118
.L176:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, charset(%rip)
	jmp	.L118
.L175:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, pidfile(%rip)
	jmp	.L118
.L174:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_global_passwd(%rip)
	jmp	.L118
.L173:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_global_passwd(%rip)
	jmp	.L118
.L172:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$0, do_vhost(%rip)
	jmp	.L118
.L171:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	no_value_required
	movl	$1, do_vhost(%rip)
	jmp	.L118
.L170:
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	value_required
	movq	%r12, %rdi
	call	e_strdup
	movq	%rax, logfile(%rip)
	jmp	.L118
	.cfi_endproc
.LFE93:
	.size	read_config, .-read_config
	.section	.rodata.str1.1
.LC50:
	.string	"exiting"
	.text
	.p2align 4,,15
	.type	handle_usr1, @function
handle_usr1:
.LFB86:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	num_connects(%rip), %r10d
	testl	%r10d, %r10d
	je	.L181
	movl	$1, got_usr1(%rip)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L181:
	.cfi_restore_state
	call	shut_down
	movl	$5, %edi
	movl	$.LC50, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE86:
	.size	handle_usr1, .-handle_usr1
	.section	.rodata.str1.1
.LC51:
	.string	"/tmp"
	.text
	.p2align 4,,15
	.type	handle_alrm, @function
handle_alrm:
.LFB88:
	.cfi_startproc
	movq	%rbx, -16(%rsp)
	movq	%rbp, -8(%rsp)
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -16
	.cfi_offset 3, -24
	call	__errno_location
	movq	%rax, %rbx
	movl	(%rax), %ebp
	movl	watchdog_flag(%rip), %eax
	testl	%eax, %eax
	je	.L184
	movl	$360, %edi
	movl	$0, watchdog_flag(%rip)
	call	alarm
	movl	%ebp, (%rbx)
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rbp
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L184:
	.cfi_restore_state
	movl	$.LC51, %edi
	call	chdir
	call	abort
	.cfi_endproc
.LFE88:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata.str1.1
.LC52:
	.string	"nobody"
.LC53:
	.string	"iso-8859-1"
.LC54:
	.string	"thttpd/2.25b 29dec2003"
.LC55:
	.string	"-nor"
.LC56:
	.string	"-nos"
.LC57:
	.string	"-nov"
.LC58:
	.string	"-nog"
.LC59:
	.string	"%d"
.LC60:
	.string	"getaddrinfo %.80s - %.80s"
.LC61:
	.string	"%s: getaddrinfo %s - %s\n"
	.section	.rodata.str1.8
	.align 8
.LC62:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.section	.rodata.str1.1
.LC63:
	.string	"can't find any valid address"
	.section	.rodata.str1.8
	.align 8
.LC64:
	.string	"%s: can't find any valid address\n"
	.section	.rodata.str1.1
.LC65:
	.string	"%.80s - %m"
.LC66:
	.string	" %4900[^ \t] %ld-%ld"
.LC67:
	.string	" %4900[^ \t] %ld"
	.section	.rodata.str1.8
	.align 8
.LC68:
	.string	"unparsable line in %.80s - %.80s"
	.align 8
.LC69:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.section	.rodata.str1.1
.LC70:
	.string	"|/"
	.section	.rodata.str1.8
	.align 8
.LC71:
	.string	"out of memory allocating a throttletab"
	.align 8
.LC72:
	.string	"%s: out of memory allocating a throttletab\n"
	.section	.rodata.str1.1
.LC73:
	.string	"unknown user - '%.80s'"
.LC74:
	.string	"%s: unknown user - '%s'\n"
.LC75:
	.string	"/dev/null"
.LC76:
	.string	"a"
	.section	.rodata.str1.8
	.align 8
.LC77:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.align 8
.LC78:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.section	.rodata.str1.1
.LC79:
	.string	"fchown logfile - %m"
.LC80:
	.string	"fchown logfile"
.LC81:
	.string	"chdir - %m"
.LC82:
	.string	"chdir"
.LC83:
	.string	"/"
.LC84:
	.string	"daemon - %m"
.LC85:
	.string	"w"
.LC86:
	.string	"%d\n"
	.section	.rodata.str1.8
	.align 8
.LC87:
	.string	"fdwatch initialization failure"
	.section	.rodata.str1.1
.LC88:
	.string	"chroot - %m"
	.section	.rodata.str1.8
	.align 8
.LC89:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.align 8
.LC90:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.section	.rodata.str1.1
.LC91:
	.string	"chroot chdir - %m"
.LC92:
	.string	"chroot chdir"
.LC93:
	.string	"data_dir chdir - %m"
.LC94:
	.string	"data_dir chdir"
.LC95:
	.string	"tmr_create(occasional) failed"
.LC96:
	.string	"tmr_create(idle) failed"
	.section	.rodata.str1.8
	.align 8
.LC97:
	.string	"tmr_create(update_throttles) failed"
	.section	.rodata.str1.1
.LC98:
	.string	"tmr_create(show_stats) failed"
.LC99:
	.string	"setgroups - %m"
.LC100:
	.string	"setgid - %m"
.LC101:
	.string	"initgroups - %m"
.LC102:
	.string	"setuid - %m"
	.section	.rodata.str1.8
	.align 8
.LC103:
	.string	"started as root without requesting chroot(), warning only"
	.align 8
.LC104:
	.string	"out of memory allocating a connecttab"
	.section	.rodata.str1.1
.LC105:
	.string	"re-opening logfile"
.LC106:
	.string	"re-opening %.80s - %m"
.LC107:
	.string	"fdwatch - %m"
	.section	.rodata.str1.8
	.align 8
.LC108:
	.string	"throttle sending count was negative - shouldn't happen!"
	.align 8
.LC109:
	.string	"replacing non-null wakeup_timer!"
	.align 8
.LC110:
	.string	"tmr_create(wakeup_connection) failed"
	.section	.rodata.str1.1
.LC111:
	.string	"write - %m sending %.80s"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB90:
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
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$14664, %rsp
	.cfi_def_cfa_offset 14720
	movq	(%rsi), %rbx
	movl	$47, %esi
	movq	%fs:40, %rax
	movq	%rax, 14648(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	%rbx, argv0(%rip)
	call	strrchr
	leaq	1(%rax), %rdx
	testq	%rax, %rax
	movl	$9, %esi
	cmovne	%rdx, %rbx
	movl	$24, %edx
	movq	%rbx, %rdi
	call	openlog
	cmpl	$1, %ebp
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
	movq	$.LC52, user(%rip)
	movq	$.LC53, charset(%rip)
	movq	$.LC13, p3p(%rip)
	movl	$-1, max_age(%rip)
	jle	.L362
	movq	8(%r12), %r14
	cmpb	$45, (%r14)
	jne	.L359
	movl	$1, %ebx
	movl	$5, %r13d
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L189:
	movl	$.LC55, %edi
	movq	%r14, %rsi
	movq	%r13, %rcx
	repz cmpsb
	jne	.L195
	movl	$0, do_chroot(%rip)
	movl	$0, no_symlink_check(%rip)
	.p2align 4,,10
	.p2align 3
.L193:
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	jle	.L187
.L419:
	movslq	%ebx, %rax
	movq	(%r12,%rax,8), %r14
	cmpb	$45, (%r14)
	jne	.L359
.L213:
	movzbl	(%r14), %r15d
	subl	$45, %r15d
	jne	.L189
	cmpb	$86, 1(%r14)
	jne	.L190
	cmpb	$0, 2(%r14)
	je	.L417
.L191:
	cmpb	$112, 1(%r14)
	jne	.L192
	cmpb	$0, 2(%r14)
	jne	.L192
	leal	1(%rbx), %ecx
	cmpl	%ecx, %ebp
	jg	.L418
.L194:
	cmpb	$114, 1(%r14)
	jne	.L189
	cmpb	$0, 2(%r14)
	jne	.L189
	addl	$1, %ebx
	movl	$1, do_chroot(%rip)
	movl	$1, no_symlink_check(%rip)
	cmpl	%ebx, %ebp
	jg	.L419
.L187:
	cmpl	%ebx, %ebp
	jne	.L359
	leaq	112(%rsp), %rbx
	call	tzset
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movl	$6, %ecx
	rep stosq
	movzwl	port(%rip), %r9d
	leaq	5264(%rsp), %rdi
	movl	$.LC59, %r8d
	movl	$1, %edx
	movl	$10, %esi
	movl	$1, 112(%rsp)
	movl	$1, 120(%rsp)
	movb	$10, %cl
	call	__snprintf_chk
	movq	hostname(%rip), %rdi
	leaq	232(%rsp), %rcx
	leaq	5264(%rsp), %rsi
	movq	%rbx, %rdx
	call	getaddrinfo
	testl	%eax, %eax
	movl	%eax, %ebx
	jne	.L420
	movq	232(%rsp), %rax
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L363
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L422:
	cmpl	$10, %edx
	jne	.L217
	testq	%rsi, %rsi
	cmove	%rax, %rsi
.L217:
	movq	40(%rax), %rax
	testq	%rax, %rax
	je	.L421
.L220:
	movl	4(%rax), %edx
	cmpl	$2, %edx
	jne	.L422
	testq	%rbx, %rbx
	cmove	%rax, %rbx
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L220
.L421:
	testq	%rsi, %rsi
	je	.L366
	mov	16(%rsi), %r9d
	cmpl	$128, %r9d
	ja	.L423
	leaq	14512(%rsp), %r8
	movl	$16, %ecx
	movl	$1, %r13d
	movq	%r8, %rdi
	rep stosq
	movq	%r8, %rdi
	mov	16(%rsi), %edx
	movq	24(%rsi), %rsi
	movb	$-128, %cl
	call	__memmove_chk
.L221:
	testq	%rbx, %rbx
	je	.L424
	mov	16(%rbx), %r9d
	cmpl	$128, %r9d
	ja	.L425
	leaq	14384(%rsp), %r8
	xorl	%eax, %eax
	movl	$16, %ecx
	movl	$1, %r15d
	movq	%r8, %rdi
	rep stosq
	movq	%r8, %rdi
	mov	16(%rbx), %edx
	movq	24(%rbx), %rsi
	movb	$-128, %cl
	call	__memmove_chk
	movq	232(%rsp), %rdi
	call	freeaddrinfo
.L224:
	movq	throttlefile(%rip), %r12
	movl	$0, numthrottles(%rip)
	movl	$0, maxthrottles(%rip)
	movq	$0, throttles(%rip)
	testq	%r12, %r12
	je	.L225
	movl	$.LC20, %esi
	movq	%r12, %rdi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L426
	leaq	208(%rsp), %rdi
	leaq	256(%rsp), %rbx
	leaq	5265(%rsp), %r14
	xorl	%esi, %esi
	call	gettimeofday
	.p2align 4,,10
	.p2align 3
.L392:
	movq	%rbp, %rdx
	movl	$5000, %esi
	movq	%rbx, %rdi
	call	fgets
	testq	%rax, %rax
	je	.L427
	movl	$35, %esi
	movq	%rbx, %rdi
	call	strchr
	testq	%rax, %rax
	je	.L228
	movb	$0, (%rax)
.L228:
	movq	%rbx, %rax
.L229:
	movl	(%rax), %ecx
	addq	$4, %rax
	leal	-16843009(%rcx), %edx
	notl	%ecx
	andl	%ecx, %edx
	andl	$-2139062144, %edx
	je	.L229
	movl	%edx, %ecx
	shrl	$16, %ecx
	testl	$32896, %edx
	cmove	%ecx, %edx
	leaq	2(%rax), %rcx
	cmove	%rcx, %rax
	addb	%dl, %dl
	sbbq	$3, %rax
	subl	%ebx, %eax
	cmpl	$0, %eax
	jg	.L380
	jmp	.L466
	.p2align 4,,10
	.p2align 3
.L235:
	testl	%eax, %eax
	movb	$0, 256(%rsp,%rcx)
	je	.L392
.L380:
	subl	$1, %eax
	movslq	%eax, %rcx
	movzbl	256(%rsp,%rcx), %edx
	cmpb	$9, %dl
	je	.L235
	cmpb	$32, %dl
	je	.L235
	cmpb	$10, %dl
	je	.L235
	cmpb	$13, %dl
	.p2align 4,,2
	je	.L235
.L236:
	leaq	240(%rsp), %r8
	leaq	248(%rsp), %rcx
	leaq	5264(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC66, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L237
	leaq	240(%rsp), %rcx
	leaq	5264(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC67, %esi
	movq	%rbx, %rdi
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L238
	movq	$0, 248(%rsp)
.L237:
	cmpb	$47, 5264(%rsp)
	jne	.L389
	jmp	.L467
	.p2align 4,,10
	.p2align 3
.L242:
	leaq	2(%rax), %rsi
	leaq	1(%rax), %rdi
	call	strcpy
.L389:
	leaq	5264(%rsp), %rdi
	movl	$.LC70, %esi
	call	strstr
	testq	%rax, %rax
	jne	.L242
	movl	numthrottles(%rip), %edx
	movl	maxthrottles(%rip), %eax
	cmpl	%eax, %edx
	jl	.L243
	testl	%eax, %eax
	jne	.L244
	movl	$4800, %edi
	movl	$100, maxthrottles(%rip)
	call	malloc
	movq	%rax, throttles(%rip)
.L245:
	testq	%rax, %rax
	je	.L246
	movl	numthrottles(%rip), %edx
.L247:
	movslq	%edx, %rdx
	leaq	5264(%rsp), %rdi
	leaq	(%rdx,%rdx,2), %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movq	%rdx, 104(%rsp)
	call	e_strdup
	movq	104(%rsp), %rdx
	movq	240(%rsp), %rcx
	movq	%rax, (%rdx)
	movl	numthrottles(%rip), %edx
	movslq	%edx, %rax
	addl	$1, %edx
	leaq	(%rax,%rax,2), %rax
	movl	%edx, numthrottles(%rip)
	salq	$4, %rax
	addq	throttles(%rip), %rax
	movq	%rcx, 8(%rax)
	movq	248(%rsp), %rcx
	movq	$0, 24(%rax)
	movq	$0, 32(%rax)
	movl	$0, 40(%rax)
	movq	%rcx, 16(%rax)
	jmp	.L392
	.p2align 4,,10
	.p2align 3
.L190:
	cmpb	$67, 1(%r14)
	jne	.L191
	cmpb	$0, 2(%r14)
	jne	.L191
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L430
.L192:
	cmpb	$100, 1(%r14)
	jne	.L194
	cmpb	$0, 2(%r14)
	jne	.L194
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L189
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, dir(%rip)
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L430:
	movslq	%eax, %rdx
	movq	(%r12,%rdx,8), %rdi
	movl	%eax, 96(%rsp)
	call	read_config
	movl	96(%rsp), %eax
	movl	%eax, %ebx
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L195:
	testl	%r15d, %r15d
	je	.L431
.L196:
	movl	$.LC56, %edi
	movq	%r14, %rsi
	movq	%r13, %rcx
	repz cmpsb
	jne	.L198
	movl	$1, no_symlink_check(%rip)
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L418:
	movslq	%ecx, %rax
	movl	$10, %edx
	xorl	%esi, %esi
	movq	(%r12,%rax,8), %rdi
	movl	%ecx, 96(%rsp)
	call	strtol
	movl	96(%rsp), %ecx
	movw	%ax, port(%rip)
	movl	%ecx, %ebx
	jmp	.L193
.L431:
	cmpb	$100, 1(%r14)
	je	.L432
.L197:
	cmpb	$115, 1(%r14)
	jne	.L196
	cmpb	$0, 2(%r14)
	jne	.L196
	movl	$0, no_symlink_check(%rip)
	jmp	.L193
.L432:
	cmpb	$100, 2(%r14)
	jne	.L197
	cmpb	$0, 3(%r14)
	jne	.L197
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L196
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, data_dir(%rip)
	jmp	.L193
.L198:
	testl	%r15d, %r15d
	je	.L433
.L199:
	movl	$.LC57, %esi
	movq	%r14, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L205
	movl	$0, do_vhost(%rip)
	jmp	.L193
	.p2align 4,,10
	.p2align 3
.L238:
	movq	%rbx, %r8
	movq	%r12, %rcx
	xorl	%eax, %eax
	movl	$.LC68, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movq	%rbx, %r9
	movq	%r12, %r8
	movl	$.LC69, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	jmp	.L392
.L244:
	addl	%eax, %eax
	movq	throttles(%rip), %rdi
	movl	%eax, maxthrottles(%rip)
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$4, %rsi
	call	realloc
	movq	%rax, throttles(%rip)
	jmp	.L245
.L427:
	movq	%rbp, %rdi
	call	fclose
.L225:
	call	getuid
	testl	%eax, %eax
	movl	$32767, %ebx
	movl	$32767, 104(%rsp)
	je	.L434
.L250:
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L369
	movl	$.LC75, %edi
	movl	$10, %ecx
	movq	%rax, %rsi
	repz cmpsb
	jne	.L253
	movl	$1, no_log(%rip)
	xorl	%r12d, %r12d
.L252:
	movq	dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L257
	call	chdir
	testl	%eax, %eax
	js	.L435
.L257:
	leaq	10272(%rsp), %rbp
	movl	$4096, %esi
	movq	%rbp, %rdi
	call	getcwd
	movq	%rbp, %rdx
.L258:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L258
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	cmove	%rcx, %rdx
	addb	%al, %al
	sbbq	$3, %rdx
	subq	%rbp, %rdx
	cmpb	$47, 10271(%rsp,%rdx)
	je	.L260
	movl	$4097, %edx
	movl	$.LC83, %esi
	movq	%rbp, %rdi
	call	__strcat_chk
.L260:
	movl	debug(%rip), %r14d
	testl	%r14d, %r14d
	jne	.L261
	movq	stdin(%rip), %rdi
	call	fclose
	movq	stdout(%rip), %rdi
	cmpq	%rdi, %r12
	je	.L262
	call	fclose
.L262:
	movq	stderr(%rip), %rdi
	call	fclose
	movl	$1, %esi
	movl	$1, %edi
	call	daemon
	testl	%eax, %eax
	movl	$.LC84, %edx
	js	.L409
.L263:
	movq	pidfile(%rip), %rdi
	testq	%rdi, %rdi
	je	.L264
	movl	$.LC85, %esi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L436
	call	getpid
	movq	%r14, %rdi
	movl	%eax, %ecx
	movl	$.LC86, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movq	%r14, %rdi
	call	fclose
.L264:
	call	fdwatch_get_nfiles
	testl	%eax, %eax
	movl	%eax, max_connects(%rip)
	js	.L437
	subl	$10, %eax
	cmpl	$0, do_chroot(%rip)
	movl	%eax, max_connects(%rip)
	jne	.L438
.L267:
	movq	data_dir(%rip), %rdi
	testq	%rdi, %rdi
	je	.L272
	call	chdir
	testl	%eax, %eax
	js	.L439
.L272:
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
	leaq	14512(%rsp), %rax
	xorl	%edx, %edx
	testl	%r13d, %r13d
	movzwl	port(%rip), %ecx
	movl	cgi_limit(%rip), %r9d
	cmovne	%rax, %rdx
	leaq	14384(%rsp), %rax
	xorl	%esi, %esi
	testl	%r15d, %r15d
	movq	cgi_pattern(%rip), %r8
	movq	hostname(%rip), %rdi
	cmovne	%rax, %rsi
	movl	no_empty_referers(%rip), %eax
	movq	%r12, 40(%rsp)
	movq	%rbp, 24(%rsp)
	movl	%eax, 88(%rsp)
	movq	local_pattern(%rip), %rax
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
	movl	max_age(%rip), %eax
	movl	%eax, 16(%rsp)
	movq	p3p(%rip), %rax
	movq	%rax, 8(%rsp)
	movq	charset(%rip), %rax
	movq	%rax, (%rsp)
	call	httpd_initialize
	testq	%rax, %rax
	movq	%rax, hs(%rip)
	je	.L415
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$120000, %ecx
	movl	$occasional, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC95, %edx
	je	.L414
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$5000, %ecx
	movl	$idle, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC96, %edx
	je	.L414
	cmpl	$0, numthrottles(%rip)
	jle	.L278
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$2000, %ecx
	movl	$update_throttles, %esi
	call	tmr_create
	testq	%rax, %rax
	je	.L440
.L278:
	movq	JunkClientData(%rip), %rdx
	xorl	%edi, %edi
	movl	$1, %r8d
	movl	$3600000, %ecx
	movl	$show_stats, %esi
	call	tmr_create
	testq	%rax, %rax
	movl	$.LC98, %edx
	je	.L414
	xorl	%edi, %edi
	call	time
	movq	$0, stats_connections(%rip)
	movq	%rax, stats_time(%rip)
	movq	%rax, start_time(%rip)
	movq	$0, stats_bytes(%rip)
	movl	$0, stats_simultaneous(%rip)
	call	getuid
	testl	%eax, %eax
	jne	.L280
	xorl	%esi, %esi
	xorl	%edi, %edi
	call	setgroups
	testl	%eax, %eax
	movl	$.LC99, %edx
	js	.L409
	movl	%ebx, %edi
	call	setgid
	testl	%eax, %eax
	movl	$.LC100, %edx
	js	.L409
	movq	user(%rip), %rdi
	movl	%ebx, %esi
	call	initgroups
	testl	%eax, %eax
	js	.L441
.L283:
	movl	104(%rsp), %edi
	call	setuid
	testl	%eax, %eax
	movl	$.LC102, %edx
	js	.L409
	cmpl	$0, do_chroot(%rip)
	je	.L442
.L280:
	movl	max_connects(%rip), %ebx
	movslq	%ebx, %rbp
	imulq	$144, %rbp, %rdi
	call	malloc
	testq	%rax, %rax
	movq	%rax, connects(%rip)
	je	.L285
	testl	%ebx, %ebx
	jle	.L287
	movq	%rax, %rdx
	xorl	%ecx, %ecx
.L288:
	addl	$1, %ecx
	movl	$0, (%rdx)
	movq	$0, 8(%rdx)
	movl	%ecx, 4(%rdx)
	addq	$144, %rdx
	cmpl	%ebx, %ecx
	jne	.L288
.L287:
	leaq	-1(%rbp), %rdx
	movl	$0, first_free_connect(%rip)
	movl	$0, num_connects(%rip)
	movl	$0, httpd_conn_count(%rip)
	imulq	$144, %rdx, %rdx
	movl	$-1, 4(%rax,%rdx)
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L289
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L290
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
	movq	hs(%rip), %rax
.L290:
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L289
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	fdwatch_add_fd
.L289:
	leaq	192(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
.L393:
	movl	terminate(%rip), %r11d
	testl	%r11d, %r11d
	je	.L356
	cmpl	$0, num_connects(%rip)
	jle	.L443
.L356:
	movl	got_hup(%rip), %eax
	testl	%eax, %eax
	jne	.L444
.L292:
	leaq	192(%rsp), %rdi
	call	tmr_mstimeout
	movq	%rax, %rdi
	call	fdwatch
	testl	%eax, %eax
	movl	%eax, %ebx
	js	.L445
	leaq	192(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	testl	%ebx, %ebx
	je	.L446
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L394
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L300
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L447
.L301:
	movq	hs(%rip), %rax
	testq	%rax, %rax
	je	.L394
.L300:
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L394
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L448
	.p2align 4,,10
	.p2align 3
.L394:
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbx
	je	.L449
.L353:
	testq	%rbx, %rbx
	je	.L394
	movq	8(%rbx), %rax
	movl	704(%rax), %edi
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L341
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	.L307
	cmpl	$4, %eax
	je	.L308
	cmpl	$1, %eax
	jne	.L394
	movq	8(%rbx), %rbp
	movq	160(%rbp), %rax
	movq	152(%rbp), %rdx
	cmpq	%rdx, %rax
	jb	.L309
	cmpq	$5000, %rdx
	ja	.L405
	leaq	144(%rbp), %rdi
	leaq	152(%rbp), %rsi
	addq	$1000, %rdx
	call	httpd_realloc_str
	movq	152(%rbp), %rdx
	subq	160(%rbp), %rdx
	movl	704(%rbp), %edi
.L360:
	leaq	5264(%rsp), %rsi
	movl	$1024, %ecx
	call	__read_chk
	cmpl	$0, %eax
	je	.L405
	jl	.L450
	movq	144(%rbp), %rdi
	addq	160(%rbp), %rdi
	movslq	%eax, %r12
	leaq	5264(%rsp), %rsi
	movq	%r12, %rdx
	call	memcpy
	addq	%r12, 160(%rbp)
	movq	192(%rsp), %rax
	movq	%rbp, %rdi
	movq	%rax, 88(%rbx)
	call	httpd_got_request
	testl	%eax, %eax
	je	.L394
	cmpl	$2, %eax
	je	.L405
	movq	%rbp, %rdi
	call	httpd_parse_request
	testl	%eax, %eax
	js	.L407
	movl	$0, 56(%rbx)
	movq	$-1, 72(%rbx)
	xorl	%r12d, %r12d
	movq	$-1, 64(%rbx)
	xorl	%r13d, %r13d
	jmp	.L316
.L319:
	movl	56(%rbx), %eax
	movq	%r12, %rcx
	addq	throttles(%rip), %rcx
	movslq	%eax, %rdx
	addl	$1, %eax
	movl	%eax, 56(%rbx)
	movl	40(%rcx), %esi
	movq	8(%rcx), %rax
	movl	%r13d, 16(%rbx,%rdx,4)
	addl	$1, %esi
	movq	%rax, %rdx
	movl	%esi, 40(%rcx)
	movslq	%esi, %rsi
	sarq	$63, %rdx
	idivq	%rsi
	movq	64(%rbx), %rdx
	cmpq	$-1, %rdx
	je	.L401
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
.L401:
	movq	72(%rbx), %rdx
	movq	%rax, 64(%rbx)
	movq	16(%rcx), %rax
	cmpq	$-1, %rdx
	je	.L402
	cmpq	%rax, %rdx
	cmovge	%rdx, %rax
.L402:
	movq	%rax, 72(%rbx)
.L317:
	addl	$1, %r13d
	addq	$48, %r12
.L316:
	cmpl	numthrottles(%rip), %r13d
	jge	.L323
	cmpl	$9, 56(%rbx)
	jg	.L323
	movq	8(%rbx), %rax
	movq	240(%rax), %rsi
	movq	throttles(%rip), %rax
	movq	(%rax,%r12), %rdi
	call	match
	testl	%eax, %eax
	je	.L317
	movq	%r12, %rax
	addq	throttles(%rip), %rax
	movq	8(%rax), %rcx
	movq	24(%rax), %rdx
	addq	%rcx, %rcx
	cmpq	%rcx, %rdx
	jg	.L318
	cmpq	16(%rax), %rdx
	jl	.L318
	cmpl	$0, 40(%rax)
	jns	.L319
	xorl	%eax, %eax
	movl	$.LC108, %edx
	movl	$1, %esi
	movl	$3, %edi
	call	__syslog_chk
	movq	throttles(%rip), %rax
	movl	$0, 40(%rax,%r12)
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L243:
	movq	throttles(%rip), %rax
	jmp	.L247
.L466:
	jne	.L236
	.p2align 4,,4
	jmp	.L392
.L253:
	cmpb	$45, (%rax)
	.p2align 4,,8
	je	.L451
.L254:
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L452
	movq	logfile(%rip), %rax
	cmpb	$47, (%rax)
	je	.L256
	movl	$.LC77, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC78, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
.L256:
	movq	%r12, %rdi
	call	fileno
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L252
	movq	%r12, %rdi
	call	fileno
	movl	104(%rsp), %esi
	movl	%ebx, %edx
	movl	%eax, %edi
	call	fchown
	testl	%eax, %eax
	jns	.L252
	movl	$.LC79, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC80, %edi
	call	perror
	jmp	.L252
.L433:
	cmpb	$117, 1(%r14)
	je	.L453
.L200:
	cmpb	$99, 1(%r14)
	jne	.L201
	cmpb	$0, 2(%r14)
	jne	.L201
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L454
.L202:
	cmpb	$104, 1(%r14)
	jne	.L203
	cmpb	$0, 2(%r14)
	jne	.L203
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L455
.L204:
	cmpb	$118, 1(%r14)
	jne	.L199
	cmpb	$0, 2(%r14)
	jne	.L199
	movl	$1, do_vhost(%rip)
	jmp	.L193
.L261:
	call	setsid
	jmp	.L263
.L467:
	leaq	5264(%rsp), %rdi
	movl	$5000, %edx
	movq	%r14, %rsi
	call	__strcpy_chk
	jmp	.L389
.L434:
	movq	user(%rip), %rdi
	call	getpwnam
	testq	%rax, %rax
	je	.L456
	movl	16(%rax), %edx
	movl	20(%rax), %ebx
	movl	%edx, 104(%rsp)
	jmp	.L250
.L440:
	movl	$.LC97, %edx
.L414:
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
.L415:
	movl	$1, %edi
	call	exit
.L437:
	movl	$.LC87, %edx
.L409:
	movl	$2, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L451:
	cmpb	$0, 1(%rax)
	movq	stdout(%rip), %r12
	je	.L252
	jmp	.L254
.L453:
	cmpb	$0, 2(%r14)
	jne	.L200
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L457
.L201:
	cmpb	$116, 1(%r14)
	jne	.L202
	cmpb	$0, 2(%r14)
	jne	.L202
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L458
.L203:
	cmpb	$108, 1(%r14)
	jne	.L204
	cmpb	$0, 2(%r14)
	jne	.L204
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L199
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, logfile(%rip)
	jmp	.L193
.L459:
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L394
	cmpl	$11, %eax
	je	.L337
	cmpl	$22, %eax
	je	.L341
	cmpl	$32, %eax
	.p2align 4,,2
	je	.L341
	cmpl	$104, %eax
	.p2align 4,,2
	je	.L341
	movq	208(%rbp), %rcx
	movl	$.LC111, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L341:
	leaq	192(%rsp), %rsi
	movq	%rbx, %rdi
	call	clear_connection
	call	fdwatch_get_next_client_data
	cmpq	$-1, %rax
	movq	%rax, %rbx
	jne	.L353
.L449:
	leaq	192(%rsp), %rdi
	call	tmr_run
	movl	got_usr1(%rip), %eax
	testl	%eax, %eax
	je	.L393
	cmpl	$0, terminate(%rip)
	jne	.L393
	movq	hs(%rip), %rax
	movl	$1, terminate(%rip)
	testq	%rax, %rax
	je	.L393
	movl	72(%rax), %edi
	cmpl	$-1, %edi
	je	.L354
	call	fdwatch_del_fd
	movq	hs(%rip), %rax
.L354:
	movl	76(%rax), %edi
	cmpl	$-1, %edi
	je	.L355
	call	fdwatch_del_fd
.L355:
	movq	hs(%rip), %rdi
	call	httpd_unlisten
	jmp	.L393
.L445:
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	.p2align 4,,3
	je	.L393
	cmpl	$4, %eax
	je	.L393
	movl	$3, %edi
	movl	$.LC107, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L307:
	movq	64(%rbx), %rax
	movq	8(%rbx), %rbp
	movl	$1000000000, %ecx
	cmpq	$-1, %rax
	je	.L332
	movq	%rax, %rdx
	movl	$4, %ecx
	sarq	$63, %rdx
	idivq	%rcx
	movq	%rax, %rcx
.L332:
	movq	472(%rbp), %rax
	testq	%rax, %rax
	jne	.L333
	movq	136(%rbx), %rsi
	movq	128(%rbx), %rax
	movl	704(%rbp), %edi
	subq	%rsi, %rax
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	cmovbe	%rcx, %rdx
	addq	712(%rbp), %rsi
	call	write
	movl	%eax, %r8d
.L334:
	cmpl	$0, %r8d
	jl	.L459
	je	.L337
	movq	192(%rsp), %rax
	movq	%rax, 88(%rbx)
	movq	472(%rbp), %rax
	testq	%rax, %rax
	je	.L342
	movslq	%r8d, %rsi
	cmpq	%rsi, %rax
	ja	.L460
	subl	%eax, %r8d
	movq	$0, 472(%rbp)
.L342:
	movq	8(%rbx), %rcx
	movslq	%r8d, %r8
	movl	56(%rbx), %r9d
	movq	%r8, %rdx
	movq	%r8, %rax
	addq	136(%rbx), %rdx
	addq	200(%rcx), %rax
	testl	%r9d, %r9d
	movq	%rdx, 136(%rbx)
	movq	%rax, 200(%rcx)
	jle	.L344
	movq	throttles(%rip), %rdi
	xorl	%esi, %esi
.L345:
	movslq	16(%rbx,%rsi,4), %rcx
	addq	$1, %rsi
	leaq	(%rcx,%rcx,2), %rcx
	salq	$4, %rcx
	addq	%r8, 32(%rdi,%rcx)
	cmpl	%esi, %r9d
	jg	.L345
.L344:
	cmpq	128(%rbx), %rdx
	jge	.L407
	movq	112(%rbx), %rdx
	cmpq	$100, %rdx
	jle	.L347
	subq	$100, %rdx
	movq	%rdx, 112(%rbx)
.L347:
	movq	64(%rbx), %rcx
	cmpq	$-1, %rcx
	je	.L394
	movq	192(%rsp), %r12
	subq	80(%rbx), %r12
	movl	$1, %edx
	cmove	%rdx, %r12
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	%r12
	cmpq	%rax, %rcx
	jge	.L394
	movl	704(%rbp), %edi
	movl	$3, (%rbx)
	call	fdwatch_del_fd
	movq	8(%rbx), %rax
	movq	200(%rax), %rax
	movq	%rax, %rdx
	sarq	$63, %rdx
	idivq	64(%rbx)
	movl	%eax, %ebp
	subl	%r12d, %ebp
	cmpq	$0, 96(%rbx)
	je	.L349
	movl	$.LC109, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L349:
	testl	%ebp, %ebp
	movl	$500, %ecx
	jle	.L350
	movslq	%ebp, %rcx
	imulq	$1000, %rcx, %rcx
.L350:
	leaq	192(%rsp), %rdi
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	movl	$wakeup_connection, %esi
	call	tmr_create
	testq	%rax, %rax
	movq	%rax, 96(%rbx)
	jne	.L394
	movl	$.LC110, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	jmp	.L415
.L308:
	movq	8(%rbx), %rax
	leaq	5264(%rsp), %rsi
	movl	$4096, %edx
	movl	704(%rax), %edi
	call	read
	cmpl	$0, %eax
	jl	.L461
	jne	.L394
	.p2align 4,,8
	jmp	.L352
.L444:
	cmpl	$0, no_log(%rip)
	.p2align 4,,4
	jne	.L293
	cmpq	$0, hs(%rip)
	je	.L293
	movq	logfile(%rip), %rax
	testq	%rax, %rax
	je	.L293
	cmpb	$45, (%rax)
	jne	.L294
	cmpb	$0, 1(%rax)
	jne	.L294
.L293:
	movl	$0, got_hup(%rip)
	jmp	.L292
.L450:
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L394
	cmpl	$4, %eax
	je	.L394
.L405:
	movq	httpd_err400form(%rip), %r8
	movq	httpd_err400title(%rip), %rdx
	movl	$.LC13, %r9d
	movq	%r9, %rcx
	movl	$400, %esi
.L406:
	movq	%rbp, %rdi
	call	httpd_send_err
.L407:
	leaq	192(%rsp), %rsi
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L394
.L309:
	subq	%rax, %rdx
	movl	704(%rbp), %edi
	jmp	.L360
.L333:
	movq	368(%rbp), %rdx
	movq	%rax, 168(%rsp)
	leaq	160(%rsp), %rsi
	movl	704(%rbp), %edi
	movq	%rdx, 160(%rsp)
	movq	136(%rbx), %rdx
	movq	%rdx, %rax
	addq	712(%rbp), %rax
	movq	%rax, 176(%rsp)
	movq	128(%rbx), %rax
	subq	%rdx, %rax
	movl	$2, %edx
	cmpq	%rax, %rcx
	cmovbe	%rcx, %rax
	movq	%rax, 184(%rsp)
	call	writev
	movl	%eax, %r8d
	jmp	.L334
.L457:
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, user(%rip)
	jmp	.L193
.L446:
	leaq	192(%rsp), %rdi
	call	tmr_run
	jmp	.L393
.L438:
	movq	%rbp, %rdi
	call	chroot
	testl	%eax, %eax
	.p2align 4,,3
	js	.L462
	movq	logfile(%rip), %r14
	testq	%r14, %r14
	je	.L269
	cmpb	$45, (%r14)
	jne	.L270
	cmpb	$0, 1(%r14)
	jne	.L270
.L269:
	movq	%rbp, %rdi
	movw	$47, 10272(%rsp)
	call	chdir
	testl	%eax, %eax
	jns	.L267
	movl	$.LC91, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC92, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L337:
	addq	$100, 112(%rbx)
	movl	704(%rbp), %edi
	movl	$3, (%rbx)
	call	fdwatch_del_fd
	cmpq	$0, 96(%rbx)
	je	.L340
	movl	$.LC109, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
.L340:
	movq	112(%rbx), %rcx
	jmp	.L350
.L369:
	xorl	%r12d, %r12d
	jmp	.L252
.L454:
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, cgi_pattern(%rip)
	jmp	.L193
.L461:
	call	__errno_location
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L394
	cmpl	$4, %eax
	je	.L394
.L352:
	leaq	192(%rsp), %rsi
	movq	%rbx, %rdi
	call	really_clear_connection
	jmp	.L394
.L363:
	xorl	%r13d, %r13d
.L216:
	call	freeaddrinfo
	xorl	%r15d, %r15d
	testl	%r13d, %r13d
	jne	.L224
	movl	$.LC63, %edx
	movl	$1, %esi
	movl	$3, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movl	$.LC64, %edx
.L408:
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L458:
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, throttlefile(%rip)
	jmp	.L193
.L436:
	movq	pidfile(%rip), %rcx
	movl	$2, %edi
	movl	$.LC65, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L435:
	movl	$.LC81, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC82, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L455:
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, hostname(%rip)
	jmp	.L193
.L439:
	movl	$.LC93, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC94, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L294:
	xorl	%eax, %eax
	movl	$.LC105, %edx
	movl	$1, %esi
	movl	$5, %edi
	call	__syslog_chk
	movq	logfile(%rip), %rdi
	movl	$.LC76, %esi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L463
	movq	%rax, %rdi
	call	fileno
	movl	$1, %edx
	movl	%eax, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	call	fcntl
	movq	hs(%rip), %rdi
	movq	%rbx, %rsi
	call	httpd_set_logfp
	jmp	.L293
.L366:
	xorl	%r13d, %r13d
	jmp	.L221
.L270:
	xorl	%eax, %eax
	orq	$-1, %rcx
	movq	%rbp, %rdi
	repnz scasb
	movq	%rbp, %rsi
	movq	%r14, %rdi
	notq	%rcx
	leaq	-1(%rcx), %rdx
	movq	%rcx, 96(%rsp)
	call	strncmp
	testl	%eax, %eax
	movq	96(%rsp), %rcx
	jne	.L271
	leaq	-2(%r14,%rcx), %rsi
	movq	%r14, %rdi
	call	strcpy
	jmp	.L269
.L448:
	movq	hs(%rip), %rax
	leaq	192(%rsp), %rdi
	movl	72(%rax), %esi
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L393
	jmp	.L394
.L447:
	movq	hs(%rip), %rax
	leaq	192(%rsp), %rdi
	movl	76(%rax), %esi
	call	handle_newconnect
	testl	%eax, %eax
	jne	.L393
	jmp	.L301
.L323:
	leaq	192(%rsp), %rsi
	movq	%rbp, %rdi
	call	httpd_start_request
	testl	%eax, %eax
	js	.L407
	cmpl	$0, 528(%rbp)
	je	.L325
	movq	536(%rbp), %rax
	movq	%rax, 136(%rbx)
	movq	544(%rbp), %rax
	addq	$1, %rax
	movq	%rax, 128(%rbx)
.L326:
	cmpq	$0, 712(%rbp)
	je	.L464
	movq	128(%rbx), %rax
	cmpq	%rax, 136(%rbx)
	jge	.L407
	movq	192(%rsp), %rax
	movl	704(%rbp), %edi
	movl	$2, (%rbx)
	movq	$0, 112(%rbx)
	movq	%rax, 80(%rbx)
	call	fdwatch_del_fd
	movl	704(%rbp), %edi
	movl	$1, %edx
	movq	%rbx, %rsi
	call	fdwatch_add_fd
	jmp	.L394
.L205:
	testl	%r15d, %r15d
	jne	.L206
	cmpb	$103, 1(%r14)
	.p2align 4,,3
	jne	.L206
	cmpb	$0, 2(%r14)
	jne	.L206
	movl	$1, do_global_passwd(%rip)
	jmp	.L193
.L206:
	movl	$.LC58, %esi
	movq	%r14, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L207
	movl	$0, do_global_passwd(%rip)
	jmp	.L193
.L442:
	movl	$.LC103, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L280
.L325:
	movq	192(%rbp), %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	cmovns	%rdx, %rax
	movq	%rax, 128(%rbx)
	jmp	.L326
.L460:
	movq	368(%rbp), %rdi
	subl	%r8d, %eax
	movslq	%eax, %r12
	movq	%r12, %rdx
	addq	%rdi, %rsi
	call	memmove
	movq	%r12, 472(%rbp)
	xorl	%r8d, %r8d
	jmp	.L342
.L462:
	movl	$.LC88, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$.LC25, %edi
	call	perror
	movl	$1, %edi
	call	exit
.L443:
	call	shut_down
	movl	$5, %edi
	movl	$.LC50, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	call	closelog
	xorl	%edi, %edi
	call	exit
.L285:
	movl	$.LC104, %edx
	jmp	.L409
.L456:
	movq	user(%rip), %rcx
	movl	$.LC73, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	__syslog_chk
	movq	stderr(%rip), %rdi
	movq	user(%rip), %r8
	movl	$.LC74, %edx
	movq	argv0(%rip), %rcx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L424:
	movq	232(%rsp), %rdi
	jmp	.L216
.L362:
	movl	$1, %ebx
	jmp	.L187
.L271:
	xorl	%eax, %eax
	movl	$.LC89, %edx
	movl	$1, %esi
	movl	$4, %edi
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movq	stderr(%rip), %rdi
	movl	$.LC90, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	jmp	.L269
.L318:
	movq	208(%rbp), %r9
	movq	httpd_err503form(%rip), %r8
	movl	$.LC13, %ecx
	movq	httpd_err503title(%rip), %rdx
	movl	$503, %esi
	jmp	.L406
.L420:
	movl	%eax, %edi
	call	gai_strerror
	movq	hostname(%rip), %rcx
	movq	%rax, %r8
	movl	$.LC60, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	%ebx, %edi
	call	gai_strerror
	movq	stderr(%rip), %rdi
	movq	hostname(%rip), %r8
	movq	%rax, %r9
	movq	argv0(%rip), %rcx
	movl	$.LC61, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk
	movl	$1, %edi
	call	exit
.L246:
	movl	$.LC71, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	argv0(%rip), %rcx
	movl	$.LC72, %edx
	jmp	.L408
.L452:
	movq	logfile(%rip), %rcx
	movl	$.LC65, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	logfile(%rip), %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L426:
	movq	%r12, %rcx
	movl	$.LC65, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	movq	%r12, %rdi
	call	perror
	movl	$1, %edi
	call	exit
.L207:
	testl	%r15d, %r15d
	jne	.L359
	cmpb	$105, 1(%r14)
	jne	.L209
	cmpb	$0, 2(%r14)
	jne	.L209
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L210
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, pidfile(%rip)
	jmp	.L193
.L464:
	movl	56(%rbx), %edi
	movq	throttles(%rip), %rcx
	xorl	%eax, %eax
	movq	200(%rbp), %rdx
.L329:
	cmpl	%eax, %edi
	jle	.L465
	movslq	16(%rbx,%rax,4), %rsi
	addq	$1, %rax
	imulq	$48, %rsi, %rsi
	addq	%rdx, 32(%rcx,%rsi)
	jmp	.L329
.L210:
	cmpb	$80, 1(%r14)
	jne	.L211
	cmpb	$0, 2(%r14)
	jne	.L211
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L212
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, p3p(%rip)
	jmp	.L193
.L423:
	movq	hostname(%rip), %rcx
	movl	$2, %edi
	movl	$128, %r8d
	movl	$.LC62, %edx
	movl	$1, %esi
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L425:
	movq	hostname(%rip), %rcx
	movl	$2, %edi
	movl	$128, %r8d
	movl	$.LC62, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__syslog_chk
	movl	$1, %edi
	call	exit
.L463:
	movq	logfile(%rip), %rcx
	movl	$.LC106, %edx
	movl	$1, %esi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L293
.L441:
	movl	$.LC101, %edx
	movl	$1, %esi
	movl	$4, %edi
	xorl	%eax, %eax
	call	__syslog_chk
	jmp	.L283
.L209:
	cmpb	$84, 1(%r14)
	jne	.L210
	cmpb	$0, 2(%r14)
	jne	.L210
	leal	1(%rbx), %eax
	cmpl	%eax, %ebp
	jle	.L211
	movslq	%eax, %rdx
	movl	%eax, %ebx
	movq	(%r12,%rdx,8), %rdx
	movq	%rdx, charset(%rip)
	jmp	.L193
.L465:
	leaq	192(%rsp), %rsi
	movq	%rdx, 136(%rbx)
	movq	%rbx, %rdi
	call	finish_connection
	jmp	.L394
.L417:
	movl	$.LC54, %edi
	call	puts
	xorl	%edi, %edi
	call	exit
.L359:
	call	usage
.L212:
	cmpb	$68, 1(%r14)
	jne	.L359
	cmpb	$0, 2(%r14)
	jne	.L359
	movl	$1, debug(%rip)
	jmp	.L193
.L211:
	cmpb	$77, 1(%r14)
	jne	.L212
	cmpb	$0, 2(%r14)
	jne	.L212
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	jle	.L359
	movslq	%ebx, %rax
	movl	$10, %edx
	xorl	%esi, %esi
	movq	(%r12,%rax,8), %rdi
	call	strtol
	movl	%eax, max_age(%rip)
	jmp	.L193
	.cfi_endproc
.LFE90:
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
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
