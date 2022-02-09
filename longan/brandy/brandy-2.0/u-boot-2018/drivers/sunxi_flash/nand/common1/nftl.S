/*
 * Copyright 2000-2019
 * SPDX-License-Identifier: GPL-2.0
 */
	.arch armv7-a
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 2
	.file	"nftl.c"
	.section	.text._nand_sector_read,"ax",%progbits
	.align	1
	.global	_nand_sector_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_sector_read, %function
_nand_sector_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	_nand_sector_read, .-_nand_sector_read
	.section	.text._nand_flush_sector_write_cache,"ax",%progbits
	.align	1
	.global	_nand_flush_sector_write_cache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_flush_sector_write_cache, %function
_nand_flush_sector_write_cache:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	_nand_flush_sector_write_cache, .-_nand_flush_sector_write_cache
	.section	.text._shutdown_op,"ax",%progbits
	.align	1
	.global	_shutdown_op
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_shutdown_op, %function
_shutdown_op:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	_shutdown_op, .-_shutdown_op
	.section	.text._nftl_nand_erase_superblk,"ax",%progbits
	.align	1
	.global	_nftl_nand_erase_superblk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_erase_superblk, %function
_nftl_nand_erase_superblk:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	ldr	r3, [r0]
	ldr	r0, [r3, #4]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #84]
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.size	_nftl_nand_erase_superblk, .-_nftl_nand_erase_superblk
	.section	.text._nftl_nand_is_blk_good,"ax",%progbits
	.align	1
	.global	_nftl_nand_is_blk_good
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_is_blk_good, %function
_nftl_nand_is_blk_good:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	ldr	r3, [r0]
	ldr	r0, [r3, #4]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #96]
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.size	_nftl_nand_is_blk_good, .-_nftl_nand_is_blk_good
	.section	.text._nftl_nand_mark_bad_blk,"ax",%progbits
	.align	1
	.global	_nftl_nand_mark_bad_blk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_mark_bad_blk, %function
_nftl_nand_mark_bad_blk:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	ldr	r3, [r0]
	ldr	r0, [r3, #4]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #100]
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.size	_nftl_nand_mark_bad_blk, .-_nftl_nand_mark_bad_blk
	.section	.text.dumphex,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dumphex, %function
dumphex:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r7, .L10
	sub	sp, sp, #56
	mov	r4, r0
	movs	r5, #0
	ldr	r8, .L10+8
.L8:
	cmp	r5, r6
	add	r4, r4, #16
	bcc	.L9
	ldr	r0, .L10+4
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	NAND_Print
.L9:
	mov	r1, r5
	mov	r0, r7
	bl	NAND_Print
	ldrb	r0, [r4, #-1]	@ zero_extendqisi2
	adds	r5, r5, #16
	ldrb	r3, [r4, #-14]	@ zero_extendqisi2
	ldrb	r2, [r4, #-15]	@ zero_extendqisi2
	ldrb	r1, [r4, #-16]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [r4, #-2]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [r4, #-3]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [r4, #-4]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [r4, #-5]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [r4, #-6]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [r4, #-7]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [r4, #-8]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [r4, #-9]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [r4, #-10]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [r4, #-11]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [r4, #-12]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [r4, #-13]	@ zero_extendqisi2
	str	r0, [sp]
	mov	r0, r8
	bl	NAND_Print
	b	.L8
.L11:
	.align	2
.L10:
	.word	.LC5
	.word	.LC7
	.word	.LC6
	.size	dumphex, .-dumphex
	.section	.text._nftl_nand_read_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_read_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_read_page, %function
_nftl_nand_read_page:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, [r4, #1968]
	sub	sp, sp, #20
	ldr	r3, [r0]
	ldr	r0, [r3, #4]
	ldrd	r3, r5, [r2, #80]
	adds	r3, r3, #1
	adc	r5, r5, #0
	strd	r3, r5, [r2, #80]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #88]
	blx	r3
	adds	r3, r0, #2
	itttt	eq
	ldreq	r2, [r4, #1968]
	ldreq	r3, [r2, #132]
	addeq	r3, r3, #1
	streq	r3, [r2, #132]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.size	_nftl_nand_read_page, .-_nftl_nand_read_page
	.section	.text._nftl_nand_write_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_write_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_write_page, %function
_nftl_nand_write_page:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0]
	sub	sp, sp, #20
	ldr	r2, [r4, #1968]
	ldr	r0, [r3, #4]
	ldrd	r3, r5, [r2, #88]
	adds	r3, r3, #1
	adc	r5, r5, #0
	strd	r3, r5, [r2, #88]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #92]
	blx	r3
	cbz	r0, .L14
	ldr	r2, [r4, #1968]
	ldr	r3, [r2, #136]
	adds	r3, r3, #1
	str	r3, [r2, #136]
.L14:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.size	_nftl_nand_write_page, .-_nftl_nand_write_page
	.section	.text._nand_sector_write,"ax",%progbits
	.align	1
	.global	_nand_sector_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_sector_write, %function
_nand_sector_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	_nand_sector_write, .-_nand_sector_write
	.section	.text.is_on_panic,"ax",%progbits
	.align	1
	.global	is_on_panic
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_on_panic, %function
is_on_panic:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldr	r0, [r3]
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	is_on_panic, .-is_on_panic
	.section	.text.panic_mark_enable,"ax",%progbits
	.align	1
	.global	panic_mark_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_mark_enable, %function
panic_mark_enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	movs	r2, #1
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR1
	.size	panic_mark_enable, .-panic_mark_enable
	.section	.text.is_panic_enable,"ax",%progbits
	.align	1
	.global	is_panic_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_panic_enable, %function
is_panic_enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldr	r0, [r3]
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR1
	.size	is_panic_enable, .-is_panic_enable
	.section	.text.panic_init_part,"ax",%progbits
	.align	1
	.global	panic_init_part
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_init_part, %function
panic_init_part:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r3, r2
	cbz	r0, .L33
	cbz	r2, .L33
	ldr	r5, .L34
	ldr	r4, [r5, #8]
	cbnz	r4, .L33
	str	r2, [r5, #8]
	ldr	r2, .L34+4
	strd	r0, r1, [r5]
	movs	r5, #1
	str	r5, [r2]
	mov	r2, r1
	mov	r1, r0
	ldr	r0, .L34+8
	bl	NAND_Print
	mov	r0, r4
.L29:
	pop	{r3, r4, r5, pc}
.L33:
	mov	r0, #-1
	b	.L29
.L35:
	.align	2
.L34:
	.word	.LANCHOR2
	.word	.LANCHOR1
	.word	.LC8
	.size	panic_init_part, .-panic_init_part
	.section	.text.panic_read,"ax",%progbits
	.align	1
	.global	panic_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_read, %function
panic_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r3
	ldr	r3, .L42
	mov	r6, r0
	mov	r5, r2
	ldr	r3, [r3]
	cbz	r3, .L40
	ldr	r3, .L42+4
	movs	r2, #1
	mov	r4, r1
	sub	fp, r8, r1
	str	r2, [r3]
	bic	r3, r5, #32640
	bic	r3, r3, #127
	add	r10, r3, r1
.L38:
	cmp	r4, r10
	add	r3, fp, r4
	bne	.L39
	ubfx	r2, r5, #0, #15
	bic	r5, r5, #32640
	bic	r5, r5, #127
	add	r3, r8, r5
	cbz	r2, .L41
	ldr	r5, [r6, #44]
	mov	r1, r4
	mov	r0, r6
	blx	r5
	movs	r0, #0
.L36:
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L39:
	mov	r1, r4
	ldr	r7, [r6, #44]
	mov	r2, #32768
	mov	r0, r6
	blx	r7
	add	r4, r4, #32768
	b	.L38
.L40:
	mov	r0, #-1
	b	.L36
.L41:
	mov	r0, r2
	b	.L36
.L43:
	.align	2
.L42:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.size	panic_read, .-panic_read
	.section	.text.is_panic_data_page,"ax",%progbits
	.align	1
	.global	is_panic_data_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_panic_data_page, %function
is_panic_data_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L46
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	sub	r3, r0, #99
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
.L46:
	movs	r0, #0
	bx	lr
	.size	is_panic_data_page, .-is_panic_data_page
	.section	.text.is_panic_dummy_page,"ax",%progbits
	.align	1
	.global	is_panic_dummy_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_panic_dummy_page, %function
is_panic_dummy_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L49
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	sub	r3, r0, #98
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
.L49:
	movs	r0, #0
	bx	lr
	.size	is_panic_dummy_page, .-is_panic_dummy_page
	.section	.text.panic_recover_info,"ax",%progbits
	.align	1
	.global	panic_recover_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_recover_info, %function
panic_recover_info:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r1
	ldrb	r4, [r0, #4]	@ zero_extendqisi2
	cmp	r4, #2
	bhi	.L51
	ldrh	r1, [r1]
	ldr	r0, .L53
	bl	NAND_Print
	ldr	r3, .L53+4
	movs	r0, #0
	str	r5, [r3, r4, lsl #2]
.L50:
	pop	{r3, r4, r5, pc}
.L51:
	mov	r1, r4
	ldr	r0, .L53+8
	bl	NAND_Print
	mov	r0, #-1
	b	.L50
.L54:
	.align	2
.L53:
	.word	.LC9
	.word	.LANCHOR3
	.word	.LC10
	.size	panic_recover_info, .-panic_recover_info
	.section	.text.print_all_nftl_blk,"ax",%progbits
	.align	1
	.global	print_all_nftl_blk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_all_nftl_blk, %function
print_all_nftl_blk:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L58
	ldr	r5, .L58+4
.L56:
	ldr	r3, [r4, #8]
	cbnz	r3, .L57
	pop	{r3, r4, r5, pc}
.L57:
	ldr	r1, [r3]
	mov	r0, r5
	bl	NAND_Print_DBG
	ldr	r4, [r4, #8]
	b	.L56
.L59:
	.align	2
.L58:
	.word	.LANCHOR4
	.word	.LC11
	.size	print_all_nftl_blk, .-print_all_nftl_blk
	.section	.text.get_nftl_num,"ax",%progbits
	.align	1
	.global	get_nftl_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_nftl_num, %function
get_nftl_num:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L63
	movs	r0, #0
.L61:
	ldr	r3, [r3, #8]
	cbnz	r3, .L62
	bx	lr
.L62:
	adds	r0, r0, #1
	b	.L61
.L64:
	.align	2
.L63:
	.word	.LANCHOR4
	.size	get_nftl_num, .-get_nftl_num
	.section	.text.get_nftl_cap,"ax",%progbits
	.align	1
	.global	get_nftl_cap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_nftl_cap, %function
get_nftl_cap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L68
	movs	r0, #0
.L66:
	ldr	r3, [r3, #8]
	cbnz	r3, .L67
	bx	lr
.L67:
	ldr	r2, [r3]
	add	r0, r0, r2
	b	.L66
.L69:
	.align	2
.L68:
	.word	.LANCHOR4
	.size	get_nftl_cap, .-get_nftl_cap
	.section	.text.get_first_nftl_cap,"ax",%progbits
	.align	1
	.global	get_first_nftl_cap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_first_nftl_cap, %function
get_first_nftl_cap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L71
	ldr	r3, [r3, #8]
	ldr	r0, [r3]
	bx	lr
.L72:
	.align	2
.L71:
	.word	.LANCHOR4
	.size	get_first_nftl_cap, .-get_first_nftl_cap
	.section	.text.nftl_read,"ax",%progbits
	.align	1
	.global	nftl_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_read, %function
nftl_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r2
	push	{r4, r5, r6, lr}
	mov	r2, r1
	cbnz	r1, .L82
.L74:
	mov	r0, r2
	pop	{r4, r5, r6, pc}
.L77:
	ldr	r4, [r4, #8]
	subs	r0, r0, r1
	cbnz	r4, .L76
	mov	r1, r0
	ldr	r0, .L83
	bl	NAND_Print
	movs	r2, #1
	b	.L74
.L82:
	ldr	r1, .L83+4
	ldr	r4, [r1, #8]
.L76:
	ldr	r1, [r4]
	cmp	r1, r0
	bls	.L77
	ldr	r5, [r4, #44]
	mov	r1, r0
	mov	r0, r4
	mov	ip, r5
	pop	{r4, r5, r6, lr}
	bx	ip
.L84:
	.align	2
.L83:
	.word	.LC12
	.word	.LANCHOR4
	.size	nftl_read, .-nftl_read
	.section	.text.nftl_read_history,"ax",%progbits
	.align	1
	.global	nftl_read_history
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_read_history, %function
nftl_read_history:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r8, r2
	mov	r5, r1
	cbz	r1, .L86
	ldr	r3, .L93
	ldr	r0, .L93+4
	ldr	r4, [r3, #8]
	ldr	r1, [r4]
	bl	NAND_Print
.L87:
	ldr	r1, [r4]
	cmp	r1, r6
	bls	.L88
	ldr	r7, [r4, #40]
	mov	r3, r8
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	mov	ip, r7
	pop	{r4, r5, r6, r7, r8, lr}
	bx	ip
.L88:
	ldr	r4, [r4, #8]
	subs	r6, r6, r1
	cmp	r4, #0
	bne	.L87
	mov	r2, r5
	movs	r5, #1
	mov	r1, r6
	ldr	r0, .L93+8
	bl	NAND_Print
.L86:
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L94:
	.align	2
.L93:
	.word	.LANCHOR4
	.word	.LC13
	.word	.LC12
	.size	nftl_read_history, .-nftl_read_history
	.section	.text.nftl_write,"ax",%progbits
	.align	1
	.global	nftl_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_write, %function
nftl_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r2
	push	{r4, r5, r6, lr}
	mov	r2, r1
	cbnz	r1, .L104
.L96:
	mov	r0, r2
	pop	{r4, r5, r6, pc}
.L99:
	ldr	r4, [r4, #8]
	subs	r0, r0, r1
	cbnz	r4, .L98
	mov	r1, r0
	ldr	r0, .L105
	bl	NAND_Print
	movs	r2, #1
	b	.L96
.L104:
	ldr	r1, .L105+4
	ldr	r4, [r1, #8]
.L98:
	ldr	r1, [r4]
	cmp	r1, r0
	bls	.L99
	ldr	r5, [r4, #48]
	mov	r1, r0
	mov	r0, r4
	mov	ip, r5
	pop	{r4, r5, r6, lr}
	bx	ip
.L106:
	.align	2
.L105:
	.word	.LC12
	.word	.LANCHOR4
	.size	nftl_write, .-nftl_write
	.section	.text.nftl_discard,"ax",%progbits
	.align	1
	.global	nftl_discard
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_discard, %function
nftl_discard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, r1
	cbnz	r1, .L116
.L108:
	mov	r0, r2
	pop	{r4, pc}
.L111:
	ldr	r3, [r3, #8]
	subs	r0, r0, r1
	cbnz	r3, .L110
	mov	r1, r0
	ldr	r0, .L117
	bl	NAND_Print
	movs	r2, #1
	b	.L108
.L116:
	ldr	r3, .L117+4
	ldr	r3, [r3, #8]
.L110:
	ldr	r1, [r3]
	cmp	r1, r0
	bls	.L111
	ldr	r4, [r3, #56]
	mov	r1, r0
	mov	r0, r3
	mov	r3, r4
	pop	{r4, lr}
	bx	r3
.L118:
	.align	2
.L117:
	.word	.LC12
	.word	.LANCHOR4
	.size	nftl_discard, .-nftl_discard
	.section	.text.nftl_flush_write_cache,"ax",%progbits
	.align	1
	.global	nftl_flush_write_cache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_flush_write_cache, %function
nftl_flush_write_cache:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L122
	push	{r4, lr}
	ldr	r4, [r3, #8]
.L120:
	cbnz	r4, .L121
	mov	r0, r4
	pop	{r4, pc}
.L121:
	ldr	r3, [r4, #52]
	mov	r0, r4
	movw	r1, #65535
	blx	r3
	ldr	r4, [r4, #8]
	b	.L120
.L123:
	.align	2
.L122:
	.word	.LANCHOR4
	.size	nftl_flush_write_cache, .-nftl_flush_write_cache
	.section	.text.nftl_malloc,"ax",%progbits
	.align	1
	.global	nftl_malloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_malloc, %function
nftl_malloc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1572864
	push	{r4, lr}
	mov	r4, r0
	bls	.L125
	mov	r1, r0
	ldr	r0, .L126
	bl	NAND_Print
.L125:
	mov	r0, r4
	pop	{r4, lr}
	b	NAND_Malloc
.L127:
	.align	2
.L126:
	.word	.LC14
	.size	nftl_malloc, .-nftl_malloc
	.section	.text.nftl_free,"ax",%progbits
	.align	1
	.global	nftl_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_free, %function
nftl_free:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	NAND_Free
	.size	nftl_free, .-nftl_free
	.section	.text.add_nftl_blk_list,"ax",%progbits
	.align	1
	.global	add_nftl_blk_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_nftl_blk_list, %function
add_nftl_blk_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
	str	r3, [r1, #8]
.L130:
	ldr	r3, [r0, #8]
	cbnz	r3, .L131
	str	r1, [r0, #8]
	bx	lr
.L131:
	mov	r0, r3
	b	.L130
	.size	add_nftl_blk_list, .-add_nftl_blk_list
	.section	.text.del_last_nftl_blk,"ax",%progbits
	.align	1
	.global	del_last_nftl_blk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_last_nftl_blk, %function
del_last_nftl_blk:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L133:
	ldr	r3, [r0, #8]
	cbz	r3, .L132
	ldr	r2, [r3, #8]
	cbnz	r2, .L136
	str	r2, [r0, #8]
.L132:
	mov	r0, r3
	bx	lr
.L136:
	mov	r0, r3
	b	.L133
	.size	del_last_nftl_blk, .-del_last_nftl_blk
	.section	.text.nftl_support_boot_check_crc_from_dts,"ax",%progbits
	.align	1
	.global	nftl_support_boot_check_crc_from_dts
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_support_boot_check_crc_from_dts, %function
nftl_support_boot_check_crc_from_dts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	nand_get_support_boot_check_crc
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	pop	{r3, pc}
	.size	nftl_support_boot_check_crc_from_dts, .-nftl_support_boot_check_crc_from_dts
	.section	.text._nftl_nand_read_history_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_read_history_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_read_history_page, %function
_nftl_nand_read_history_page:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, [r4, #1968]
	sub	sp, sp, #20
	ldr	r3, [r0]
	ldr	r0, [r3, #4]
	ldrd	r3, r5, [r2, #80]
	adds	r3, r3, #1
	adc	r5, r5, #0
	strd	r3, r5, [r2, #80]
	ldrh	r3, [r1, #2]
	strh	r3, [sp, #2]	@ movhi
	ldrh	r3, [r1]
	strh	r3, [sp]	@ movhi
	ldrh	r3, [r1, #4]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r1, #8]
	str	r3, [sp, #8]
	ldr	r3, [r1, #12]
	mov	r1, sp
	str	r3, [sp, #12]
	ldr	r3, [r0, #88]
	blx	r3
	adds	r3, r0, #2
	itttt	eq
	ldreq	r2, [r4, #1968]
	ldreq	r3, [r2, #132]
	addeq	r3, r3, #1
	streq	r3, [r2, #132]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
	.size	_nftl_nand_read_history_page, .-_nftl_nand_read_history_page
	.section	.text.dump_buf,"ax",%progbits
	.align	1
	.global	dump_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dump_buf, %function
dump_buf:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	movs	r4, #0
	ldr	r7, .L145
	mov	r6, r0
	mov	r5, r1
	ldr	r8, .L145+8
	ldr	r0, .L145+4
	bl	NAND_Print
.L141:
	cmp	r4, r5
	bne	.L144
	ldr	r0, .L145+4
	pop	{r4, r5, r6, r7, r8, lr}
	b	NAND_Print
.L144:
	lsls	r2, r4, #28
	bne	.L142
	mov	r1, r4
	mov	r0, r7
	bl	NAND_Print
.L142:
	ldrb	r1, [r6, r4]	@ zero_extendqisi2
	mov	r0, r8
	adds	r4, r4, #1
	bl	NAND_Print
	lsls	r3, r4, #28
	bne	.L141
	ldr	r0, .L145+4
	bl	NAND_Print
	b	.L141
.L146:
	.align	2
.L145:
	.word	.LC5
	.word	.LC7
	.word	.LC15
	.size	dump_buf, .-dump_buf
	.global	__aeabi_uidiv
	.section	.text.init_zone_after_first_scan,"ax",%progbits
	.align	1
	.global	init_zone_after_first_scan
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	init_zone_after_first_scan, %function
init_zone_after_first_scan:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r1
	ldr	r6, [r0, #4]
	mov	r4, r0
	ldr	r0, [r0, #24]
	ldrb	r1, [r6, #8]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	ldrh	r1, [r6, #20]
	bl	__aeabi_uidiv
	mov	r1, r5
	mov	r6, r0
	mov	r2, r0
	ldr	r0, .L154
	bl	NAND_Print_DBG
	cmp	r6, r5
	bcc	.L148
	ldr	r0, .L154+4
	mov	r2, r6
	mov	r1, r5
.L153:
	bl	NAND_Print
	movs	r0, #1
.L147:
	pop	{r4, r5, r6, pc}
.L148:
	ldr	r1, [r4, #4]
	subs	r2, r5, r6
	ldrb	r0, [r1, #8]	@ zero_extendqisi2
	ldrh	r3, [r1, #20]
	muls	r3, r0, r3
	muls	r3, r2, r3
	str	r3, [r4, #32]
	ldr	r3, [r4, #1972]
	ldrh	r1, [r3, #12]
	subs	r1, r1, #1
	cmp	r2, r1
	bcs	.L150
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L154+8
	b	.L153
.L150:
	ldr	r0, .L154+12
	umull	r0, r1, r2, r0
	ubfx	r0, r1, #2, #16
	ldrh	r1, [r3, #14]
	strh	r0, [r4, #380]	@ movhi
	cmp	r0, r1
	ldrh	r0, [r3, #18]
	it	cc
	strhcc	r1, [r4, #380]	@ movhi
	ldrh	r1, [r3, #20]
	muls	r0, r2, r0
	bl	__aeabi_uidiv
	ldrh	r3, [r4, #380]
	strh	r0, [r4, #382]	@ movhi
	uxth	r0, r0
	adds	r2, r3, #1
	cmp	r2, r0
	mov	r0, #0
	itt	ge
	addge	r3, r3, #2
	strhge	r3, [r4, #382]	@ movhi
	movs	r3, #1
	str	r3, [r4, #384]
	b	.L147
.L155:
	.align	2
.L154:
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	-858993459
	.size	init_zone_after_first_scan, .-init_zone_after_first_scan
	.section	.text.check_bit_nums,"ax",%progbits
	.align	1
	.global	check_bit_nums
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_bit_nums, %function
check_bit_nums:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r2, #0
	mov	r4, r0
.L157:
	subs	r3, r4, r0
	cmp	r3, r1
	blt	.L160
	mov	r0, r2
	pop	{r4, r5, r6, pc}
.L160:
	ldrb	r6, [r4], #1	@ zero_extendqisi2
	movs	r5, #8
	movs	r3, #1
.L159:
	tst	r6, r3
	lsl	r3, r3, #1
	it	ne
	addne	r2, r2, #1
	subs	r5, r5, #1
	uxtb	r3, r3
	bne	.L159
	b	.L157
	.size	check_bit_nums, .-check_bit_nums
	.section	.text.is_all_bit_ff,"ax",%progbits
	.align	1
	.global	is_all_bit_ff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_all_bit_ff, %function
is_all_bit_ff:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	rsb	r4, r2, r1, lsl #3
	bl	check_bit_nums
	cmp	r4, r0
	ite	gt
	movgt	r0, #0
	movle	r0, #1
	pop	{r4, pc}
	.size	is_all_bit_ff, .-is_all_bit_ff
	.section	.text.is_all_byte_ff,"ax",%progbits
	.align	1
	.global	is_all_byte_ff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_all_byte_ff, %function
is_all_byte_ff:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	subs	r2, r1, r2
	mov	r4, r0
	movs	r3, #0
.L167:
	subs	r5, r4, r0
	cmp	r1, r5
	bgt	.L169
	cmp	r3, r2
	ite	lt
	movlt	r0, #0
	movge	r0, #1
	pop	{r4, r5, pc}
.L169:
	ldrb	r5, [r4], #1	@ zero_extendqisi2
	cmp	r5, #255
	it	eq
	addeq	r3, r3, #1
	b	.L167
	.size	is_all_byte_ff, .-is_all_byte_ff
	.section	.text.do_write_error_in_build_list,"ax",%progbits
	.align	1
	.global	do_write_error_in_build_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_write_error_in_build_list, %function
do_write_error_in_build_list:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r3
	ldr	r3, [r0, #4]
	mov	r7, r2
	sub	sp, sp, #24
	movs	r5, #0
	ldrh	r2, [r2]
	mov	r10, r1
	ldrh	r3, [r3, #28]
	add	r1, sp, #8
	strh	r5, [sp, #8]	@ movhi
	mov	r4, r0
	strh	r2, [sp, #10]	@ movhi
	strh	r3, [sp, #12]	@ movhi
	strd	r5, r5, [sp, #16]
	ldr	r3, [r0, #1976]
	blx	r3
	ldrh	r3, [r7, #6]
	strh	r5, [r7, #4]	@ movhi
	adds	r3, r3, #1
	strh	r3, [r7, #6]	@ movhi
	cmp	r0, #0
	beq	.L175
	ldr	r0, .L180
	bl	NAND_Print
	ldr	r3, [r4, #1996]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	movs	r0, #1
.L170:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L174:
	uxth	r3, r6
	mov	r2, r7
	mov	r1, r10
	ldr	r5, [r4, #1988]
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [r4, #284]
	blx	r5
	cbz	r0, .L173
	mov	r0, fp
	bl	NAND_Print
.L173:
	adds	r6, r6, #1
.L171:
	cmp	r8, r6
	bhi	.L174
	ldr	r3, [r4, #4]
	movs	r5, #0
	ldrh	r2, [r10]
	add	r1, sp, #8
	strh	r5, [sp, #8]	@ movhi
	mov	r0, r4
	ldrh	r3, [r3, #28]
	strh	r2, [sp, #10]	@ movhi
	strd	r5, r5, [sp, #16]
	strh	r3, [sp, #12]	@ movhi
	ldr	r3, [r4, #1996]
	blx	r3
	cmp	r8, #0
	bne	.L176
	str	r7, [r4, #292]
	mov	r0, r8
	strh	r8, [r4, #320]	@ movhi
	b	.L170
.L175:
	mov	r6, r0
	ldr	fp, .L180+4
	b	.L171
.L176:
	mov	r0, r5
	b	.L170
.L181:
	.align	2
.L180:
	.word	.LC19
	.word	.LC20
	.size	do_write_error_in_build_list, .-do_write_error_in_build_list
	.section	.text.init_nrc,"ax",%progbits
	.align	1
	.global	init_nrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	init_nrc, %function
init_nrc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	movs	r0, #16
	mov	r6, r1
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L183
	movw	r2, #1399
	ldr	r1, .L203
	ldr	r0, .L203+4
	bl	NAND_Print
.L202:
	mov	r0, #-1
	b	.L182
.L183:
	movs	r2, #16
	movs	r1, #0
	bl	NAND_Memset
	ldr	r3, [r5, #4]
	ldrh	r5, [r3, #20]
	ldrh	r0, [r3, #26]
	adds	r0, r0, #64
	muls	r0, r5, r0
	bl	nftl_malloc
	str	r0, [r4, #8]
	cbnz	r0, .L185
	ldr	r1, .L203
	mov	r2, #1408
	ldr	r0, .L203+8
.L201:
.L186:
	bl	NAND_Print
	ldr	r0, [r4, #8]
	cbz	r0, .L189
	bl	nftl_free
.L189:
	ldr	r0, [r4, #12]
	cbz	r0, .L190
	bl	nftl_free
.L190:
	ldr	r0, [r4, #4]
	cbz	r0, .L191
	bl	nftl_free
.L191:
	mov	r0, r4
	bl	nftl_free
	movs	r3, #0
	str	r3, [r6]
	b	.L202
.L185:
	lsls	r7, r5, #2
	mov	r0, r7
	bl	nftl_malloc
	str	r0, [r4, #12]
	cbnz	r0, .L187
	movw	r2, #1413
	ldr	r1, .L203
	ldr	r0, .L203+12
	b	.L201
.L187:
	mov	r2, r7
	movs	r1, #255
	bl	NAND_Memset
	mov	r0, r5
	bl	nftl_malloc
	str	r0, [r4, #4]
	cbnz	r0, .L188
	movw	r2, #1419
	ldr	r1, .L203
	ldr	r0, .L203+16
	b	.L201
.L188:
	mov	r2, r5
	movs	r1, #0
	bl	NAND_Memset
	movs	r0, #0
	str	r4, [r6]
.L182:
	pop	{r3, r4, r5, r6, r7, pc}
.L204:
	.align	2
.L203:
	.word	.LANCHOR5
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.size	init_nrc, .-init_nrc
	.section	.text.free_nrc,"ax",%progbits
	.align	1
	.global	free_nrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	free_nrc, %function
free_nrc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	cbz	r0, .L206
	ldr	r0, [r0, #8]
	bl	nftl_free
	ldr	r0, [r4, #4]
	bl	nftl_free
	ldr	r0, [r4, #12]
	bl	nftl_free
	mov	r0, r4
	bl	nftl_free
.L206:
	movs	r0, #0
	pop	{r4, pc}
	.size	free_nrc, .-free_nrc
	.section	.text.nftl_check_pattern,"ax",%progbits
	.align	1
	.global	nftl_check_pattern
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_check_pattern, %function
nftl_check_pattern:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	push	{r4, lr}
.L211:
	subs	r4, r3, r0
	cmp	r2, r4
	bgt	.L213
	movs	r0, #0
.L210:
	pop	{r4, pc}
.L213:
	ldrb	r4, [r3], #1	@ zero_extendqisi2
	cmp	r4, r1
	beq	.L211
	movs	r0, #1
	b	.L210
	.size	nftl_check_pattern, .-nftl_check_pattern
	.section	.text.is_last_phy_block,"ax",%progbits
	.align	1
	.global	is_last_phy_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_last_phy_block, %function
is_last_phy_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #4]
	ldrh	r0, [r0]
	ldrh	r3, [r3, #24]
	subs	r3, r3, #1
	subs	r3, r3, r0
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
	.size	is_last_phy_block, .-is_last_phy_block
	.section	.text.get_vaild_blocks,"ax",%progbits
	.align	1
	.global	get_vaild_blocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vaild_blocks, %function
get_vaild_blocks:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	movs	r4, #36
	ldr	r3, [r0, #4]
	sub	r8, r2, r1
	mov	r7, r0
	mov	r5, r1
	mov	r6, r8
	ldr	r3, [r3, #32]
	mla	r4, r4, r1, r3
.L217:
	cmp	r5, r8
	bcc	.L220
.L216:
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L220:
	ldrh	r3, [r4]
	mov	r1, sp
	mov	r0, r7
	strh	r3, [sp, #2]	@ movhi
	ldr	r3, [r7, #1992]
	blx	r3
	cmp	r0, #159
	bne	.L218
	subs	r6, r6, #1
	beq	.L216
.L218:
	mov	r1, r7
	mov	r0, r4
	bl	is_last_phy_block
	cmp	r0, #1
	beq	.L216
	adds	r4, r4, #36
	adds	r5, r5, #1
	b	.L217
	.size	get_vaild_blocks, .-get_vaild_blocks
	.section	.text.is_phy_block_valid,"ax",%progbits
	.align	1
	.global	is_phy_block_valid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_phy_block_valid, %function
is_phy_block_valid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #4]
	ldrh	r0, [r0]
	ldrh	r3, [r3, #24]
	cmp	r0, r3
	ite	cs
	movcs	r0, #0
	movcc	r0, #1
	bx	lr
	.size	is_phy_block_valid, .-is_phy_block_valid
	.section	.text.get_phy_block_addr,"ax",%progbits
	.align	1
	.global	get_phy_block_addr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_phy_block_addr, %function
get_phy_block_addr:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	movs	r0, #36
	ldr	r3, [r3, #32]
	mla	r0, r0, r1, r3
	bx	lr
	.size	get_phy_block_addr, .-get_phy_block_addr
	.section	.text.check_cross_talk,"ax",%progbits
	.align	1
	.global	check_cross_talk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_cross_talk, %function
check_cross_talk:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, #0
	sub	sp, sp, #36
	mov	r5, r0
	mov	r6, r1
	mov	r7, r4
.L230:
	ldr	r3, [r5, #4]
	ldrh	r2, [r3, #20]
	cmp	r2, r4
	bls	.L232
	ldrh	r3, [r3, #28]
	add	r1, sp, #16
	ldrh	r2, [r6]
	mov	r0, r5
	strh	r4, [sp, #16]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	strh	r2, [sp, #18]	@ movhi
	str	r7, [sp, #24]
	str	sp, [sp, #28]
	ldr	r3, [r5, #1980]
	blx	r3
	cbnz	r0, .L231
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	cmp	r3, #99
	bhi	.L231
	ldr	r2, [r5, #1968]
	ldr	r1, [r2, #168]
	cmp	r1, r3
	bhi	.L231
	str	r3, [r2, #168]
.L232:
	movs	r0, #0
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L231:
	adds	r4, r4, #1
	b	.L230
	.size	check_cross_talk, .-check_cross_talk
	.section	.text.nftl_get_bad_block_cnt,"ax",%progbits
	.align	1
	.global	nftl_get_bad_block_cnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_bad_block_cnt, %function
nftl_get_bad_block_cnt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	ldrh	r0, [r3, #20]
	bx	lr
	.size	nftl_get_bad_block_cnt, .-nftl_get_bad_block_cnt
	.section	.text.nand_dbg_phy_read,"ax",%progbits
	.align	1
	.global	nand_dbg_phy_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_phy_read, %function
nand_dbg_phy_read:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	sub	sp, sp, #76
	mov	r0, #4096
	mov	r6, r1
	mov	r7, r2
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L236
	ldr	r1, .L237
	ldr	r0, .L237+4
	bl	NAND_Print
.L236:
	add	r3, sp, #56
	mov	r2, r7
	strd	r4, r3, [sp]
	mov	r1, r6
	movs	r3, #8
	mov	r0, r5
	bl	page_read
	mov	r5, r0
	ldrb	r0, [sp, #71]	@ zero_extendqisi2
	ldrb	r3, [sp, #58]	@ zero_extendqisi2
	ldrb	r2, [sp, #57]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #70]	@ zero_extendqisi2
	ldrb	r1, [sp, #56]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #68]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #67]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #66]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #65]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #64]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #63]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #62]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #61]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #60]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #59]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L237+8
	bl	NAND_Print_DBG
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [r4, #9]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [r4, #7]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [r4, #6]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L237+12
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	nftl_free
	mov	r0, r5
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L238:
	.align	2
.L237:
	.word	.LANCHOR6
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.size	nand_dbg_phy_read, .-nand_dbg_phy_read
	.section	.text.nand_dbg_zone_phy_read,"ax",%progbits
	.align	1
	.global	nand_dbg_zone_phy_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_zone_phy_read, %function
nand_dbg_zone_phy_read:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	sub	sp, sp, #92
	mov	r0, #4096
	mov	r7, r1
	mov	r6, r2
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L240
	ldr	r1, .L241
	ldr	r0, .L241+4
	bl	NAND_Print
.L240:
	ldr	r3, [r5, #4]
	movs	r1, #36
	muls	r1, r7, r1
	mov	r0, r5
	ldr	r3, [r3, #32]
	ldrh	r3, [r3, r1]
	add	r1, sp, #56
	strh	r6, [sp, #56]	@ movhi
	str	r4, [sp, #64]
	strh	r3, [sp, #58]	@ movhi
	movs	r3, #8
	strh	r3, [sp, #60]	@ movhi
	add	r3, sp, #72
	str	r3, [sp, #68]
	ldr	r3, [r5, #1980]
	blx	r3
	mov	r5, r0
	ldrb	r0, [sp, #87]	@ zero_extendqisi2
	ldrb	r3, [sp, #74]	@ zero_extendqisi2
	ldrb	r2, [sp, #73]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #86]	@ zero_extendqisi2
	ldrb	r1, [sp, #72]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #85]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #84]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #82]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #81]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #80]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #79]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #78]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #77]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #76]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #75]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L241+8
	bl	NAND_Print_DBG
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [r4, #9]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [r4, #7]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [r4, #6]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L241+12
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	nftl_free
	mov	r0, r5
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L242:
	.align	2
.L241:
	.word	.LANCHOR7
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.size	nand_dbg_zone_phy_read, .-nand_dbg_zone_phy_read
	.section	.text.nand_dbg_zone_phy_write,"ax",%progbits
	.align	1
	.global	nand_dbg_zone_phy_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_zone_phy_write, %function
nand_dbg_zone_phy_write:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	sub	sp, sp, #32
	mov	r0, #8192
	mov	r6, r1
	mov	r7, r2
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L244
	ldr	r1, .L245
	ldr	r0, .L245+4
	bl	NAND_Print
.L244:
	ldr	r3, [r5, #4]
	movs	r2, #36
	muls	r6, r2, r6
	mov	r0, r4
	mov	r2, #4096
	movs	r1, #165
	ldr	r8, [r3, #32]
	bl	NAND_Memset
	ldr	r2, .L245+8
	mov	r3, #-1
	strh	r3, [sp, #24]	@ movhi
	mov	r1, sp
	mov	r0, r5
	strd	r3, r2, [sp, #16]
	movw	r3, #65535
	strb	r3, [sp, #26]
	ldr	r3, [r5, #4]
	ldrh	r2, [r8, r6]
	strh	r7, [sp]	@ movhi
	ldrh	r3, [r3, #28]
	strh	r2, [sp, #2]	@ movhi
	str	r4, [sp, #8]
	strh	r3, [sp, #4]	@ movhi
	add	r3, sp, #16
	str	r3, [sp, #12]
	ldr	r3, [r5, #1984]
	blx	r3
	mov	r5, r0
	mov	r0, r4
	bl	nftl_free
	mov	r0, r5
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L246:
	.align	2
.L245:
	.word	.LANCHOR8
	.word	.LC28
	.word	-5921281
	.size	nand_dbg_zone_phy_write, .-nand_dbg_zone_phy_write
	.section	.text.nand_dbg_phy_write,"ax",%progbits
	.align	1
	.global	nand_dbg_phy_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_phy_write, %function
nand_dbg_phy_write:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	sub	sp, sp, #28
	mov	r0, #8192
	mov	r6, r1
	mov	r7, r2
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L248
	ldr	r1, .L249
	ldr	r0, .L249+4
	bl	NAND_Print
.L248:
	mov	r0, r4
	mov	r2, #4096
	movs	r1, #165
	bl	NAND_Memset
	ldr	r2, .L249+8
	mov	r3, #-1
	strh	r3, [sp, #16]	@ movhi
	mov	r1, r6
	mov	r0, r5
	strd	r3, r2, [sp, #8]
	movw	r3, #65535
	strb	r3, [sp, #18]
	add	r3, sp, #8
	strd	r4, r3, [sp]
	mov	r2, r7
	movs	r3, #8
	bl	page_write
	mov	r5, r0
	mov	r0, r4
	bl	nftl_free
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L250:
	.align	2
.L249:
	.word	.LANCHOR9
	.word	.LC28
	.word	-5921281
	.size	nand_dbg_phy_write, .-nand_dbg_phy_write
	.section	.text.nand_dbg_phy_erase,"ax",%progbits
	.align	1
	.global	nand_dbg_phy_erase
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_phy_erase, %function
nand_dbg_phy_erase:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	block_erase
	.size	nand_dbg_phy_erase, .-nand_dbg_phy_erase
	.section	.text.nand_dbg_single_phy_erase,"ax",%progbits
	.align	1
	.global	nand_dbg_single_phy_erase
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_single_phy_erase, %function
nand_dbg_single_phy_erase:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	nand_physic_erase_block
	.size	nand_dbg_single_phy_erase, .-nand_dbg_single_phy_erase
	.section	.text.nand_clean_zone_table2,"ax",%progbits
	.align	1
	.global	nand_clean_zone_table2
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_clean_zone_table2, %function
nand_clean_zone_table2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r0, [r0, #24]
	add	r8, r4, #52
	mov	r5, r4
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	lsls	r6, r0, #2
	ldr	fp, .L262+4
	mov	r2, r0
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	lsrs	r7, r6, #20
	ldr	r0, .L262
	add	r10, r8, r7, lsl #2
	bl	NAND_Print_DBG
.L254:
	cmp	r8, r10
	bne	.L255
	ubfx	r6, r6, #0, #20
	cbz	r6, .L256
	add	r7, r4, r7, lsl #2
	movs	r1, #255
	mov	r2, r6
	ldr	r0, [r7, #52]
	bl	NAND_Memset
	mov	r1, r6
	ldr	r0, .L262+4
	bl	NAND_Print_DBG
.L256:
	movs	r3, #0
	movw	r2, #65535
	strh	r2, [r4, #320]	@ movhi
	strh	r2, [r4, #352]	@ movhi
	mov	r2, r3
	str	r3, [r4, #292]
	str	r3, [r4, #324]
	strd	r3, r3, [r4, #172]
	strd	r3, r3, [r4, #164]
	strd	r3, r3, [r4, #180]
	strd	r3, r3, [r4, #208]
	strd	r3, r3, [r4, #200]
	strd	r3, r3, [r4, #216]
	strd	r3, r3, [r4, #244]
	strd	r3, r3, [r4, #236]
	strd	r3, r3, [r4, #252]
	str	r3, [r4, #20]
	strh	r3, [r4, #392]	@ movhi
.L257:
	strh	r3, [r5, #396]	@ movhi
	adds	r3, r3, #1
	cmp	r3, #10
	strh	r2, [r5, #398]	@ movhi
	strd	r2, r2, [r5, #400]
	add	r5, r5, #16
	str	r2, [r5, #392]
	bne	.L257
	movs	r3, #255
	strh	r2, [r4, #394]	@ movhi
	strd	r3, r2, [r4, #556]
	movs	r0, #0
	strd	r2, r2, [r4, #564]
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L255:
	ldr	r0, [r8], #4
	mov	r2, #1048576
	movs	r1, #255
	bl	NAND_Memset
	mov	r1, #1048576
	mov	r0, fp
	bl	NAND_Print_DBG
	b	.L254
.L263:
	.align	2
.L262:
	.word	.LC29
	.word	.LC30
	.size	nand_clean_zone_table2, .-nand_clean_zone_table2
	.section	.text.set_spare_data,"ax",%progbits
	.align	1
	.global	set_spare_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_spare_data, %function
set_spare_data:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r6, r3, #536870912
	movs	r4, #0
	add	r2, r2, r0
	subs	r6, r6, #1
.L265:
	cmp	r3, r4
	bhi	.L266
	pop	{r4, r5, r6, pc}
.L266:
	subs	r5, r6, r4
	lsls	r5, r5, #3
	lsr	r5, r1, r5
	strb	r5, [r2, r4]
	adds	r4, r4, #1
	b	.L265
	.size	set_spare_data, .-set_spare_data
	.section	.text.panic_write,"ax",%progbits
	.align	1
	.global	panic_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_write, %function
panic_write:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #56
	str	r3, [sp, #16]
	mov	fp, r2
	ldr	r3, .L280
	str	r1, [sp, #12]
	ldr	r3, [r3]
	cbz	r3, .L278
	ldr	r8, [r0, #12]
	movs	r2, #1
	ldr	r3, .L280+4
	add	r0, fp, #-1
	ldr	r7, .L280+8
	ldr	r5, [r8, #4]
	str	r2, [r3]
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	add	r0, r0, r1
	bl	__aeabi_uidiv
	ldrh	r1, [r5, #20]
	mov	r10, r0
	subs	r0, r1, #1
	add	r0, r0, r10
	bl	__aeabi_uidiv
	mov	r3, r10
	str	r0, [sp]
	mov	r2, fp
	ldr	r1, [sp, #12]
	ldr	r0, .L280+12
	bl	NAND_Print
	ldr	r3, [r7, #12]
	subs	r3, r3, #3
	cmp	r3, r10
	bcs	.L269
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	ldr	r0, .L280+16
	muls	r1, r3, r1
	bl	NAND_Print
.L278:
	mov	r0, #-1
	b	.L267
.L269:
	movs	r2, #16
	movs	r1, #165
	add	r0, sp, #24
	mov	r4, r7
	bl	NAND_Memset
	ldr	r3, [r7, #16]
	ldr	r6, [r7, r3, lsl #2]
.L270:
	ldr	r3, [r7, #20]
	cmp	r10, #0
	bne	.L273
	ldr	fp, .L280+24
	movs	r7, #3
	add	r10, sp, #24
	movs	r3, #98
	strb	r3, [sp, #26]
.L277:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bne	.L274
.L275:
	movs	r0, #0
.L267:
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L273:
	ldrh	r2, [r5, #20]
	cmp	r3, r2
	bcc	.L271
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r6, [r7, r3, lsl #2]
	movs	r3, #0
	str	r3, [r7, #20]
.L271:
	ldr	r3, [r4, #20]
	ldrh	r1, [r6]
	cbnz	r3, .L272
	ldrh	r2, [r5, #28]
	mov	r0, r8
	strh	r3, [sp, #40]	@ movhi
	strh	r1, [sp, #42]	@ movhi
	add	r1, sp, #40
	strh	r2, [sp, #44]	@ movhi
	strd	r3, r3, [sp, #48]
	ldr	r2, [r8, #1976]
	str	r3, [sp, #20]
	blx	r2
	ldrh	r2, [r6, #6]
	ldr	r3, [sp, #20]
	adds	r2, r2, #1
	strh	r2, [r6, #6]	@ movhi
	strh	r3, [r6, #4]	@ movhi
.L272:
	ldr	r2, [r4, #20]
	add	r10, r10, #-1
	ldrh	r1, [r6]
	ldr	r0, .L280+20
	bl	NAND_Print
	movw	r3, #43775
	movs	r2, #5
	strh	r3, [sp, #24]	@ movhi
	movs	r3, #99
	strb	r3, [sp, #26]
	add	r0, sp, #24
	ldrb	r3, [r8, #16]	@ zero_extendqisi2
	strb	r3, [sp, #27]
	ldr	r3, [r4, #16]
	strb	r3, [sp, #28]
	movs	r3, #2
	ldrh	r1, [r6, #6]
	bl	set_spare_data
	movs	r3, #4
	movs	r2, #7
	ldr	r1, [sp, #12]
	add	r0, sp, #24
	bl	set_spare_data
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	movs	r3, #4
	movs	r2, #11
	add	r0, sp, #24
	cmp	r1, fp
	it	cs
	movcs	r1, fp
	bl	set_spare_data
	ldrh	r3, [r5, #28]
	mov	r0, r8
	ldrh	r2, [r6]
	ldr	r1, [r4, #20]
	strh	r3, [sp, #44]	@ movhi
	ldr	r3, [sp, #16]
	strh	r1, [sp, #40]	@ movhi
	add	r1, sp, #40
	strh	r2, [sp, #42]	@ movhi
	str	r3, [sp, #48]
	add	r3, sp, #24
	str	r3, [sp, #52]
	ldr	r3, [r8, #1984]
	blx	r3
	ldr	r2, [sp, #16]
	ldrh	r3, [r5, #26]
	adds	r3, r2, r3
	ldr	r2, [sp, #12]
	str	r3, [sp, #16]
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, fp
	it	cs
	movcs	r3, fp
	add	r2, r2, r3
	sub	fp, fp, r3
	ldr	r3, [r4, #12]
	str	r2, [sp, #12]
	subs	r3, r3, #1
	str	r3, [r4, #12]
	ldr	r3, [r4, #20]
	adds	r3, r3, #1
	str	r3, [r4, #20]
	b	.L270
.L274:
	ldrh	r3, [r5, #20]
	cmp	r2, r3
	bcs	.L275
	ldrh	r1, [r6]
	mov	r0, fp
	bl	NAND_Print
	ldrh	r3, [r5, #28]
	mov	r0, r8
	ldrh	r2, [r6]
	ldr	r1, [r4, #20]
	strh	r3, [sp, #44]	@ movhi
	ldr	r3, [sp, #16]
	strh	r1, [sp, #40]	@ movhi
	add	r1, sp, #40
	strh	r2, [sp, #42]	@ movhi
	strd	r3, r10, [sp, #48]
	ldr	r3, [r8, #1984]
	blx	r3
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #20]
	subs	r2, r2, #1
	str	r2, [r4, #12]
	adds	r3, r3, #1
	ldrh	r2, [r5, #20]
	str	r3, [r4, #20]
	cmp	r3, r2
	bcc	.L276
	ldr	r3, [r4, #16]
	adds	r3, r3, #1
	str	r3, [r4, #16]
	ldr	r6, [r4, r3, lsl #2]
	movs	r3, #0
	str	r3, [r4, #20]
.L276:
	subs	r7, r7, #1
	bne	.L277
	b	.L275
.L281:
	.align	2
.L280:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LANCHOR3
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.size	panic_write, .-panic_write
	.section	.text.get_spare_data,"ax",%progbits
	.align	1
	.global	get_spare_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_spare_data, %function
get_spare_data:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	add	r1, r1, r0
	mov	r4, r3
.L283:
	cmp	r2, r3
	bhi	.L284
	mov	r0, r4
	pop	{r4, pc}
.L284:
	ldrb	r0, [r1, r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	orr	r4, r0, r4, lsl #8
	b	.L283
	.size	get_spare_data, .-get_spare_data
	.section	.text.set_oob_logic_page,"ax",%progbits
	.align	1
	.global	set_oob_logic_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_oob_logic_page, %function
set_oob_logic_page:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r3
	movs	r3, #255
	mov	r1, r2
	mov	r0, r4
	strb	r3, [r4]
	movs	r2, #1
	movs	r3, #4
	bl	set_spare_data
	movs	r3, #2
	movs	r2, #5
	ldrh	r1, [sp, #16]
	bl	set_spare_data
	movs	r3, #4
	movs	r2, #7
	mov	r1, r5
	bl	set_spare_data
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	orn	r3, r3, #63
	strb	r3, [r4, #1]
	pop	{r3, r4, r5, pc}
	.size	set_oob_logic_page, .-set_oob_logic_page
	.section	.text.set_oob_special_page,"ax",%progbits
	.align	1
	.global	set_oob_special_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_oob_special_page, %function
set_oob_special_page:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldrh	r6, [sp, #16]
	mov	r5, r3
	movs	r3, #255
	mov	r1, r2
	strb	r3, [r4]
	mov	r0, r4
	movs	r3, #4
	movs	r2, #1
	bl	set_spare_data
	mov	r1, r6
	movs	r3, #2
	movs	r2, #5
	bl	set_spare_data
	mov	r1, r5
	movs	r3, #4
	movs	r2, #7
	pop	{r4, r5, r6, lr}
	b	set_spare_data
	.size	set_oob_special_page, .-set_oob_special_page
	.section	.text.mark_free_block,"ax",%progbits
	.align	1
	.global	mark_free_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mark_free_block, %function
mark_free_block:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #44
	add	r6, sp, #24
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	movs	r2, #16
	movs	r1, #165
	bl	NAND_Memset
	ldr	r3, [r4, #4]
	movs	r7, #0
	ldrh	r1, [r5]
	mov	r0, r4
	strh	r7, [sp, #8]	@ movhi
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #10]	@ movhi
	mov	r1, r6
	strh	r2, [sp, #12]	@ movhi
	mov	r2, #1431655765
	strd	r3, r6, [sp, #16]
	ldrh	r3, [r5, #6]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	bl	set_oob_special_page
	ldr	r3, [r4, #1984]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	ldr	r3, [r4, #4]
	movs	r0, #1
	ldrh	r1, [r5]
	strh	r0, [sp, #8]	@ movhi
	mov	r0, r4
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #10]	@ movhi
	mov	r1, r6
	strh	r2, [sp, #12]	@ movhi
	mov	r2, #1431655765
	strd	r3, r6, [sp, #16]
	ldrh	r3, [r5, #6]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	bl	set_oob_special_page
	ldr	r3, [r4, #1984]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	ldr	r3, [r4, #4]
	ldrh	r0, [r5]
	ldr	r2, [r4, #284]
	ldrh	r1, [r3, #28]
	ldrh	r3, [r3, #20]
	strh	r0, [sp, #10]	@ movhi
	mov	r0, r4
	strh	r1, [sp, #12]	@ movhi
	mov	r1, r6
	subs	r3, r3, #2
	strd	r2, r6, [sp, #16]
	strh	r3, [sp, #8]	@ movhi
	mov	r2, #1431655765
	ldrh	r3, [r5, #6]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	bl	set_oob_special_page
	ldr	r3, [r4, #1984]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	ldr	r3, [r4, #4]
	ldrh	r0, [r5]
	ldr	r2, [r4, #284]
	ldrh	r1, [r3, #28]
	ldrh	r3, [r3, #20]
	strh	r0, [sp, #10]	@ movhi
	mov	r0, r4
	strh	r1, [sp, #12]	@ movhi
	mov	r1, r6
	subs	r3, r3, #1
	strd	r2, r6, [sp, #16]
	strh	r3, [sp, #8]	@ movhi
	mov	r2, #1431655765
	ldrh	r3, [r5, #6]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	bl	set_oob_special_page
	ldr	r3, [r4, #1984]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	mov	r0, r7
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
	.size	mark_free_block, .-mark_free_block
	.section	.text.set_no_use_page,"ax",%progbits
	.align	1
	.global	set_no_use_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_no_use_page, %function
set_no_use_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #255
	push	{r4, lr}
	mov	r4, r1
	strb	r3, [r1]
	movs	r3, #1
	movs	r1, #170
	mov	r2, r3
	mov	r0, r4
	bl	set_spare_data
	movs	r3, #1
	movs	r2, #2
	movs	r1, #187
	pop	{r4, lr}
	b	set_spare_data
	.size	set_no_use_page, .-set_no_use_page
	.section	.text.set_start_block_flag,"ax",%progbits
	.align	1
	.global	set_start_block_flag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_start_block_flag, %function
set_start_block_flag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #255
	push	{r4, r5, r6, lr}
	mov	r4, r1
	strb	r3, [r1]
	movs	r3, #1
	mov	r5, r2
	mov	r0, r4
	mov	r2, r3
	movs	r1, #170
	bl	set_spare_data
	movs	r3, #1
	movs	r2, #2
	movs	r1, #238
	bl	set_spare_data
	mov	r1, r5
	movs	r3, #4
	movs	r2, #3
	pop	{r4, r5, r6, lr}
	b	set_spare_data
	.size	set_start_block_flag, .-set_start_block_flag
	.section	.text.set_end_block_flag,"ax",%progbits
	.align	1
	.global	set_end_block_flag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_end_block_flag, %function
set_end_block_flag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #255
	push	{r4, lr}
	mov	r4, r1
	strb	r3, [r1]
	movs	r3, #1
	movs	r1, #170
	mov	r2, r3
	mov	r0, r4
	bl	set_spare_data
	movs	r3, #1
	movs	r2, #2
	movs	r1, #204
	pop	{r4, lr}
	b	set_spare_data
	.size	set_end_block_flag, .-set_end_block_flag
	.section	.text.build_zone_list_first,"ax",%progbits
	.align	1
	.global	build_zone_list_first
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	build_zone_list_first, %function
build_zone_list_first:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r0
	sub	sp, sp, #36
	ldr	r0, .L317
	mov	r10, r1
	bl	NAND_Print_DBG
	ldr	r3, [r4, #24]
	ldr	r5, [r4, #40]
	cmp	r3, #0
	beq	.L312
	ldr	r6, [r4, #4]
	ldr	r0, [r4, #32]
	ldrb	r1, [r6, #8]	@ zero_extendqisi2
	add	r0, r0, r3
	bl	__aeabi_uidiv
	ldrh	r1, [r6, #20]
	bl	__aeabi_uidiv
	mov	r8, r0
.L292:
	movs	r7, #0
	strh	r7, [r4, #18]	@ movhi
.L293:
	ldrh	r3, [r4, #18]
	cmp	r3, r8
	bcs	.L303
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	str	r5, [r4, #44]
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #18]	@ movhi
	add	r1, sp, #16
	strh	r7, [sp, #16]	@ movhi
	str	r3, [sp, #24]
	strh	r2, [sp, #20]	@ movhi
	str	sp, [sp, #28]
	ldr	r3, [r4, #1992]
	blx	r3
	cmp	r0, #1
	bne	.L294
	ldr	r3, [r4, #1976]
	add	r1, sp, #16
	mov	r0, r4
	blx	r3
	mov	r6, r0
	cbz	r0, .L295
	movs	r3, #255
	add	r1, sp, #16
	strh	r3, [r5, #2]	@ movhi
	mov	r0, r4
	ldr	r3, [r4, #1996]
	blx	r3
.L296:
	movw	r3, #65535
	str	r7, [r5, #20]
	strh	r3, [r5, #4]	@ movhi
	mov	r1, r4
	strd	r7, r7, [r5, #12]
	mov	r0, r5
	str	r5, [r4, #44]
	bl	is_last_phy_block
	cmp	r0, #1
	bne	.L299
.L303:
	ldrh	r1, [r4, #18]
	cmp	r1, #1
	bhi	.L300
	ldr	r0, .L317+4
	bl	NAND_Print
	movs	r0, #1
	b	.L291
.L312:
	mov	r8, #-1
	b	.L292
.L295:
	ldrh	r3, [r4, #18]
	adds	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #18]	@ movhi
	strh	r0, [r5, #2]	@ movhi
	strh	r0, [r5, #6]	@ movhi
	bne	.L296
	movs	r2, #16
	movs	r1, #255
	mov	r0, sp
	bl	NAND_Memset
	mov	r2, r10
	mov	r1, sp
	mov	r0, r4
	bl	set_start_block_flag
	ldr	r3, [r4, #4]
	ldrh	r1, [r5]
	strh	r6, [sp, #16]	@ movhi
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #18]	@ movhi
	strh	r2, [sp, #20]	@ movhi
	str	r3, [sp, #24]
	str	sp, [sp, #28]
.L297:
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	cmp	r3, r6
	bhi	.L298
	add	r3, r5, #36
	str	r3, [r4, #40]
	b	.L296
.L298:
	ldr	r3, [r4, #1984]
	add	r1, sp, #16
	mov	r0, r4
	adds	r6, r6, #1
	blx	r3
	ldrh	r3, [sp, #16]
	adds	r3, r3, #1
	strh	r3, [sp, #16]	@ movhi
	b	.L297
.L294:
	movs	r3, #255
	strh	r3, [r5, #2]	@ movhi
	b	.L296
.L299:
	adds	r5, r5, #36
	b	.L293
.L300:
	cmp	r8, #-1
	add	r1, r1, #-1
	strh	r1, [r4, #18]	@ movhi
	bne	.L304
.L306:
	movs	r0, #0
.L291:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L304:
	mov	r1, r4
	mov	r0, r5
	bl	is_last_phy_block
	cmp	r0, #1
	beq	.L306
	movs	r7, #0
.L307:
	ldr	r2, [r4, #4]
	ldrh	r3, [r5]
	ldrh	r1, [r2, #24]
	cmp	r1, r3
	bls	.L306
	ldrh	r1, [r2, #28]
	mov	r0, r4
	ldr	r2, [r4, #284]
	strh	r3, [sp, #18]	@ movhi
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	strh	r7, [sp, #16]	@ movhi
	str	r2, [sp, #24]
	str	sp, [sp, #28]
	ldr	r3, [r4, #1992]
	blx	r3
	cmp	r0, #1
	bne	.L308
	ldr	r3, [r4, #1976]
	add	r1, sp, #16
	mov	r0, r4
	blx	r3
	mov	r6, r0
	cbz	r0, .L309
	movs	r3, #255
	add	r1, sp, #16
	strh	r3, [r5, #2]	@ movhi
	mov	r0, r4
	ldr	r3, [r4, #1996]
	blx	r3
.L310:
	adds	r5, r5, #36
	b	.L307
.L309:
	movs	r2, #16
	mov	r0, sp
	movs	r1, #255
	bl	NAND_Memset
	mov	r1, sp
	mov	r0, r4
	bl	set_end_block_flag
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	strh	r6, [sp, #16]	@ movhi
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #18]	@ movhi
	add	r1, sp, #16
	strh	r2, [sp, #20]	@ movhi
	str	r3, [sp, #24]
	str	sp, [sp, #28]
	ldr	r3, [r4, #1984]
	blx	r3
	b	.L306
.L308:
	movs	r3, #255
	strh	r3, [r5, #2]	@ movhi
	b	.L310
.L318:
	.align	2
.L317:
	.word	.LC35
	.word	.LC36
	.size	build_zone_list_first, .-build_zone_list_first
	.section	.text.get_bad_flag_from_oob,"ax",%progbits
	.align	1
	.global	get_bad_flag_from_oob
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_bad_flag_from_oob, %function
get_bad_flag_from_oob:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r2, #4
	movs	r1, #1
	bl	get_spare_data
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	pop	{r3, pc}
	.size	get_bad_flag_from_oob, .-get_bad_flag_from_oob
	.section	.text.get_block_used_count_from_oob,"ax",%progbits
	.align	1
	.global	get_block_used_count_from_oob
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_used_count_from_oob, %function
get_block_used_count_from_oob:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #4
	movs	r1, #7
	b	get_spare_data
	.size	get_block_used_count_from_oob, .-get_block_used_count_from_oob
	.section	.text.get_used_block_count,"ax",%progbits
	.align	1
	.global	get_used_block_count
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_used_block_count, %function
get_used_block_count:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r2, [r1]
	movs	r3, #0
	push	{r4, lr}
	sub	sp, sp, #32
	add	r4, sp, #16
	strh	r3, [sp]	@ movhi
	mov	r1, sp
	strh	r2, [sp, #2]	@ movhi
	strh	r3, [sp, #4]	@ movhi
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	ldr	r3, [r0, #1980]
	blx	r3
	mov	r0, r4
	bl	get_block_used_count_from_oob
	add	sp, sp, #32
	@ sp needed
	pop	{r4, pc}
	.size	get_used_block_count, .-get_used_block_count
	.section	.text.get_logic_page_from_oob,"ax",%progbits
	.align	1
	.global	get_logic_page_from_oob
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_logic_page_from_oob, %function
get_logic_page_from_oob:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r2, #4
	movs	r1, #1
	bl	get_spare_data
	bic	r0, r0, #-268435456
	pop	{r3, pc}
	.size	get_logic_page_from_oob, .-get_logic_page_from_oob
	.section	.text._nftl_nand_read_logic_history_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_read_logic_history_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_read_logic_history_page, %function
_nftl_nand_read_logic_history_page:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #56
	movs	r2, #16
	mov	r5, r0
	add	r0, sp, #24
	str	r1, [sp, #16]
	movs	r1, #0
	bl	memset
	ldr	r3, [r5, #4]
	ldrb	r6, [r3, #8]	@ zero_extendqisi2
	lsls	r6, r6, #9
	mov	r0, r6
	bl	nftl_malloc
	mov	r8, r0
	mov	r0, r6
	bl	nftl_malloc
	mov	fp, r0
	cmp	r8, #0
	bne	.L324
.L341:
	ldr	r1, .L342
	ldr	r0, .L342+4
	bl	NAND_Print
	movs	r0, #1
.L323:
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L324:
	cbnz	r0, .L326
	mov	r0, r8
	bl	nftl_free
	b	.L341
.L326:
	ldrh	r2, [r5, #18]
	movs	r1, #0
	ldrh	r3, [r5, #20]
	mov	r0, r8
	mov	r10, #0
	mov	r7, r10
	adds	r3, r2, r3
	mov	r2, r6
	str	r3, [sp, #8]
	bl	NAND_Memset
	mov	r2, r6
	movs	r1, #0
	mov	r0, fp
	bl	NAND_Memset
	movs	r2, #16
	movs	r1, #0
	add	r0, sp, #24
	bl	NAND_Memset
	lsrs	r3, r6, #9
	str	r3, [sp, #20]
.L327:
	ldr	r3, [sp, #8]
	cmp	r3, r7
	bne	.L335
	mov	r1, r3
	ldr	r0, .L342+8
	bl	NAND_Print
	mov	r0, r8
	bl	nftl_free
	mov	r0, fp
	bl	nftl_free
	movs	r0, #0
	b	.L323
.L335:
	mov	r1, r7
	ldr	r0, .L342+12
	bl	NAND_Print
	uxth	r3, r7
	movs	r4, #0
	strh	r4, [sp, #40]	@ movhi
	add	r1, sp, #40
	str	r3, [sp, #4]
	mov	r0, r5
	ldrh	r3, [sp, #4]
	strh	r4, [sp, #44]	@ movhi
	str	r4, [sp, #48]
	strh	r3, [sp, #42]	@ movhi
	add	r3, sp, #24
	str	r3, [sp, #52]
	ldr	r3, [r5, #1992]
	blx	r3
	cmp	r0, #1
	beq	.L328
	mov	r1, r7
	ldr	r0, .L342+16
	bl	NAND_Print
.L329:
	adds	r7, r7, #1
	b	.L327
.L334:
	movs	r2, #16
	movs	r1, #0
	add	r0, sp, #24
	bl	NAND_Memset
	uxth	r3, r4
	add	r1, sp, #40
	mov	r0, r5
	str	r3, [sp, #12]
	ldrh	r3, [sp, #12]
	strh	r3, [sp, #40]	@ movhi
	ldrh	r3, [sp, #4]
	strh	r3, [sp, #42]	@ movhi
	movs	r3, #0
	strh	r3, [sp, #44]	@ movhi
	str	r3, [sp, #48]
	add	r3, sp, #24
	str	r3, [sp, #52]
	ldr	r3, [r5, #1980]
	blx	r3
	adds	r0, r0, #2
	bne	.L330
	ldr	r0, .L342+20
	mov	r2, r4
	mov	r1, r7
.L340:
	bl	NAND_Print
.L331:
	adds	r4, r4, #1
.L328:
	ldr	r3, [r5, #4]
	ldrh	r3, [r3, #20]
	cmp	r3, r4
	bgt	.L334
	b	.L329
.L330:
	add	r0, sp, #24
	bl	get_logic_page_from_oob
	ldr	r3, [sp, #16]
	cmp	r0, r3
	bne	.L331
	ldrh	r3, [sp, #12]
	add	r1, sp, #40
	str	r8, [sp, #48]
	mov	r0, r5
	strh	r3, [sp, #40]	@ movhi
	ldrh	r3, [sp, #4]
	strh	r3, [sp, #42]	@ movhi
	ldrh	r3, [sp, #20]
	strh	r3, [sp, #44]	@ movhi
	add	r3, sp, #24
	str	r3, [sp, #52]
	ldr	r3, [r5, #1980]
	blx	r3
	adds	r0, r0, #2
	bne	.L332
	mov	r2, r4
	mov	r1, r7
	ldr	r0, .L342+24
	b	.L340
.L332:
	add	r3, r10, #1
	str	r3, [sp, #12]
	cmp	r10, #0
	beq	.L333
	mov	r2, r10
	ldr	r1, [sp, #16]
	ldr	r0, .L342+28
	bl	NAND_Print
	mov	r1, r6
	mov	r0, fp
	bl	dumphex
	ldr	r0, .L342+32
	bl	NAND_Print
	movs	r1, #16
	add	r0, sp, #24
	bl	dumphex
.L333:
	mov	r2, r6
	mov	r1, r8
	mov	r0, fp
	bl	NAND_Memcpy
	ldr	r10, [sp, #12]
	b	.L331
.L343:
	.align	2
.L342:
	.word	.LANCHOR10
	.word	.LC37
	.word	.LC44
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.size	_nftl_nand_read_logic_history_page, .-_nftl_nand_read_logic_history_page
	.section	.text._nand_read_history,"ax",%progbits
	.align	1
	.global	_nand_read_history
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_read_history, %function
_nand_read_history:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r3
	ldr	r4, [r0, #12]
	add	r2, r2, r1
	mov	r5, r1
	ldr	r3, [r4, #24]
	cmp	r2, r3
	bhi	.L348
	ldr	r3, [r4, #4]
	mov	r0, r5
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	mov	r2, r6
	mov	r1, r0
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	b	_nftl_nand_read_logic_history_page
.L348:
	ldr	r0, .L349
	bl	NAND_Print
	movs	r0, #1
	pop	{r4, r5, r6, pc}
.L350:
	.align	2
.L349:
	.word	.LC45
	.size	_nand_read_history, .-_nand_read_history
	.section	.text.get_special_data_from_oob,"ax",%progbits
	.align	1
	.global	get_special_data_from_oob
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_special_data_from_oob, %function
get_special_data_from_oob:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #4
	movs	r1, #1
	b	get_spare_data
	.size	get_special_data_from_oob, .-get_special_data_from_oob
	.section	.text._nftl_nand_copy_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_copy_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_copy_page, %function
_nftl_nand_copy_page:
	@ args = 4, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #56
	mov	r8, r2
	ldrh	r2, [sp, #80]
	mov	r6, r1
	add	r5, sp, #8
	ldrh	r1, [r1]
	mov	r4, r0
	strh	r2, [sp, #24]	@ movhi
	strh	r2, [sp, #40]	@ movhi
	ldr	r2, [r0, #4]
	strh	r1, [sp, #26]	@ movhi
	ldrh	r1, [r8]
	ldrh	r2, [r2, #28]
	str	r3, [sp, #32]
	strh	r1, [sp, #42]	@ movhi
	add	r1, sp, #24
	strh	r2, [sp, #28]	@ movhi
	strh	r2, [sp, #44]	@ movhi
	str	r3, [sp, #48]
	str	r5, [sp, #36]
	ldr	r3, [r0, #1980]
	str	r5, [sp, #52]
	blx	r3
	cmp	r0, #10
	ite	ne
	movne	r7, r0
	moveq	r7, #0
	mov	r0, r5
	bl	get_special_data_from_oob
	ldrh	r3, [r8, #6]
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	adds	r3, r3, #1
	uxth	r3, r3
	str	r3, [sp]
	ldr	r3, [r6, #8]
	bl	set_oob_special_page
	ldr	r3, [r4, #1984]
	add	r1, sp, #40
	mov	r0, r4
	blx	r3
	orr	r0, r7, r0, lsl #8
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
	.size	_nftl_nand_copy_page, .-_nftl_nand_copy_page
	.section	.text.get_erase_count_from_oob,"ax",%progbits
	.align	1
	.global	get_erase_count_from_oob
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_erase_count_from_oob, %function
get_erase_count_from_oob:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r2, #2
	movs	r1, #5
	bl	get_spare_data
	uxth	r0, r0
	pop	{r3, pc}
	.size	get_erase_count_from_oob, .-get_erase_count_from_oob
	.section	.text.is_ftl_start_flag_page,"ax",%progbits
	.align	1
	.global	is_ftl_start_flag_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_ftl_start_flag_page, %function
is_ftl_start_flag_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L357
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	sub	r3, r0, #238
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
.L357:
	movs	r0, #0
	bx	lr
	.size	is_ftl_start_flag_page, .-is_ftl_start_flag_page
	.section	.text.is_no_use_device,"ax",%progbits
	.align	1
	.global	is_no_use_device
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_no_use_device, %function
is_no_use_device:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	sub	sp, sp, #32
	mov	r6, r1
	ldr	r5, [r0, #40]
	cmp	r3, #0
	beq	.L368
	ldr	r7, [r0, #4]
	ldr	r0, [r0, #32]
	ldrb	r1, [r7, #8]	@ zero_extendqisi2
	add	r0, r0, r3
	bl	__aeabi_uidiv
	ldrh	r1, [r7, #20]
	bl	__aeabi_uidiv
	mov	r7, r0
.L359:
	movs	r3, #0
	mov	r8, r3
	strh	r3, [r4, #18]	@ movhi
.L360:
	ldrh	r3, [r4, #18]
	cmp	r3, r7
	bcs	.L375
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	str	r5, [r4, #44]
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #18]	@ movhi
	add	r1, sp, #16
	strh	r8, [sp, #16]	@ movhi
	str	r3, [sp, #24]
	strh	r2, [sp, #20]	@ movhi
	str	sp, [sp, #28]
	ldr	r3, [r4, #1992]
	blx	r3
	cmp	r0, #1
	bne	.L361
	ldr	r3, [r4, #1980]
	add	r1, sp, #16
	mov	r0, r4
	blx	r3
	mov	r2, r0
	mov	r0, sp
	bl	is_ftl_start_flag_page
	cmp	r0, #1
	beq	.L362
.L375:
	movs	r0, #1
.L358:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L368:
	mov	r7, #-1
	b	.L359
.L362:
	cbz	r2, .L364
	cmp	r2, #10
	bne	.L375
.L364:
	movs	r2, #4
	movs	r1, #3
	mov	r0, sp
	bl	get_spare_data
	cmp	r0, r6
	beq	.L366
	ldr	r0, .L376
	bl	NAND_Print
	b	.L375
.L366:
	adds	r5, r5, #36
	movs	r0, #0
	str	r5, [r4, #40]
	b	.L358
.L361:
	movs	r3, #255
	mov	r1, r4
	strh	r3, [r5, #2]	@ movhi
	mov	r0, r5
	ldrh	r3, [r4, #18]
	adds	r3, r3, #1
	strh	r3, [r4, #18]	@ movhi
	bl	is_last_phy_block
	cmp	r0, #1
	beq	.L375
	adds	r5, r5, #36
	b	.L360
.L377:
	.align	2
.L376:
	.word	.LC46
	.size	is_no_use_device, .-is_no_use_device
	.section	.text.is_ftl_end_flag_page,"ax",%progbits
	.align	1
	.global	is_ftl_end_flag_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_ftl_end_flag_page, %function
is_ftl_end_flag_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L380
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	sub	r3, r0, #204
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
.L380:
	movs	r0, #0
	bx	lr
	.size	is_ftl_end_flag_page, .-is_ftl_end_flag_page
	.section	.text.is_ftl_special_data,"ax",%progbits
	.align	1
	.global	is_ftl_special_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_ftl_special_data, %function
is_ftl_special_data:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	sub	r3, r0, #170
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
	.size	is_ftl_special_data, .-is_ftl_special_data
	.section	.text.is_ftl_logic_page_data,"ax",%progbits
	.align	1
	.global	is_ftl_logic_page_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_ftl_logic_page_data, %function
is_ftl_logic_page_data:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	and	r0, r0, #240
	sub	r3, r0, #192
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
	.size	is_ftl_logic_page_data, .-is_ftl_logic_page_data
	.section	.text.is_nouse_page,"ax",%progbits
	.align	1
	.global	is_nouse_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_nouse_page, %function
is_nouse_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r0, #1
	add	r1, r0, #9
	movs	r3, #0
	push	{r4, lr}
.L385:
	ldrb	r4, [r2, #1]!	@ zero_extendqisi2
	cmp	r4, #255
	it	eq
	addeq	r3, r3, #1
	cmp	r2, r1
	bne	.L385
	cmp	r3, #8
	bls	.L387
	ldrb	r0, [r0]	@ zero_extendqisi2
	sub	r3, r0, #255
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
.L383:
	pop	{r4, pc}
.L387:
	movs	r0, #0
	b	.L383
	.size	is_nouse_page, .-is_nouse_page
	.section	.text.is_fill_page,"ax",%progbits
	.align	1
	.global	is_fill_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_fill_page, %function
is_fill_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	get_special_data_from_oob
	sub	r3, r0, #1431655765
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	pop	{r3, pc}
	.size	is_fill_page, .-is_fill_page
	.section	.text.is_phy_mapping_page,"ax",%progbits
	.align	1
	.global	is_phy_mapping_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_phy_mapping_page, %function
is_phy_mapping_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	get_special_data_from_oob
	ldr	r3, .L391
	subs	r3, r0, r3
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	pop	{r3, pc}
.L392:
	.align	2
.L391:
	.word	-1431633921
	.size	is_phy_mapping_page, .-is_phy_mapping_page
	.section	.text.is_function_info_page,"ax",%progbits
	.align	1
	.global	is_function_info_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_function_info_page, %function
is_function_info_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	get_special_data_from_oob
	lsrs	r0, r0, #16
	ldr	r3, .L394
	lsls	r0, r0, #16
	subs	r3, r0, r3
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	pop	{r3, pc}
.L395:
	.align	2
.L394:
	.word	-1441726464
	.size	is_function_info_page, .-is_function_info_page
	.section	.text.is_power_down_info_page,"ax",%progbits
	.align	1
	.global	is_power_down_info_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_power_down_info_page, %function
is_power_down_info_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	get_special_data_from_oob
	ldr	r3, .L397
	subs	r3, r0, r3
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	pop	{r3, pc}
.L398:
	.align	2
.L397:
	.word	-1441713357
	.size	is_power_down_info_page, .-is_power_down_info_page
	.section	.text.get_logic_page_map,"ax",%progbits
	.align	1
	.global	get_logic_page_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_logic_page_map, %function
get_logic_page_map:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	mov	r2, r1
	ldr	r3, [r0, #28]
	cmp	r3, r1
	bhi	.L400
	ldr	r1, .L402
	ldr	r0, .L402+4
	bl	NAND_Print
	movs	r0, #0
.L399:
	pop	{r3, pc}
.L400:
	lsrs	r1, r1, #18
	add	r0, r0, r1, lsl #2
	rsb	r1, r1, r1, lsl #14
	ldr	r0, [r0, #52]
	add	r2, r2, r1, lsl #18
	add	r0, r0, r2, lsl #2
	b	.L399
.L403:
	.align	2
.L402:
	.word	.LANCHOR11
	.word	.LC47
	.size	get_logic_page_map, .-get_logic_page_map
	.section	.text.malloc_logic_page_map,"ax",%progbits
	.align	1
	.global	malloc_logic_page_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	malloc_logic_page_map, %function
malloc_logic_page_map:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	add	r7, r0, #52
	mov	r4, r1
	mov	r6, r0
	add	r2, r0, #152
	mov	r3, r7
	movs	r1, #0
.L405:
	str	r1, [r3], #4
	cmp	r3, r2
	bne	.L405
	ldr	r8, .L417+12
	movs	r5, #0
.L409:
	cmp	r4, r8
	bls	.L406
	mov	r0, #1048576
	bl	NAND_Malloc
	str	r0, [r7], #4
	cbnz	r0, .L407
	ldr	r0, .L417
	mov	r1, r5
.L416:
	bl	NAND_Print
	mvn	r0, #1
.L404:
	pop	{r4, r5, r6, r7, r8, pc}
.L407:
	mov	r2, #1048576
	movs	r1, #255
	adds	r5, r5, #1
	sub	r4, r4, #262144
	bl	NAND_Memset
	cmp	r5, #25
	bne	.L409
	cbz	r4, .L412
	mov	r1, r4
	ldr	r0, .L417+4
	b	.L416
.L406:
	lsls	r4, r4, #2
	mov	r0, r4
	bl	nftl_malloc
	add	r3, r6, r5, lsl #2
	str	r0, [r3, #52]
	cbnz	r0, .L411
	mov	r1, r5
	ldr	r0, .L417+8
	b	.L416
.L411:
	mov	r2, r4
	movs	r1, #255
	bl	NAND_Memset
	movs	r0, #0
	b	.L404
.L412:
	mov	r0, r4
	b	.L404
.L418:
	.align	2
.L417:
	.word	.LC48
	.word	.LC50
	.word	.LC49
	.word	262143
	.size	malloc_logic_page_map, .-malloc_logic_page_map
	.section	.text.zone_param_init,"ax",%progbits
	.align	1
	.global	zone_param_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	zone_param_init, %function
zone_param_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r3
	ldr	r3, [r0, #4]
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	ldrh	r0, [r3, #26]
	bl	nftl_malloc
	str	r0, [r4, #284]
	cbnz	r0, .L420
	ldr	r1, .L431
	ldr	r0, .L431+4
.L429:
	bl	NAND_Print
	b	.L430
.L420:
	ldr	r3, [r4, #4]
	ldrh	r0, [r3, #26]
	bl	nftl_malloc
	str	r0, [r4, #288]
	cbnz	r0, .L422
	ldr	r1, .L431
	ldr	r0, .L431+8
	b	.L429
.L422:
	ldr	r2, [r4, #4]
	movs	r1, #36
	strh	r5, [r4, #36]	@ movhi
	mov	r0, r6
	str	r6, [r4, #24]
	ldr	r3, [r2, #32]
	str	r7, [r4, #32]
	mla	r5, r1, r5, r3
	movs	r3, #0
	strh	r3, [r4, #18]	@ movhi
	str	r5, [r4, #40]
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	str	r3, [r4, #44]
	ldrb	r1, [r2, #8]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	mov	r1, r0
	mov	r0, r4
	bl	malloc_logic_page_map
	mov	r5, r0
	cbz	r0, .L423
	ldr	r0, .L431+12
	bl	NAND_Print
.L430:
	mvn	r5, #1
.L419:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L423:
	ldr	r3, [r4, #4]
	ldrh	r0, [r3, #20]
	mov	r3, #320
	str	r3, [r4, #316]
	lsls	r0, r0, #2
	str	r0, [r4, #308]
	add	r0, r0, r3
	str	r0, [r4, #300]
	bl	nftl_malloc
	mov	r3, r0
	str	r0, [r4, #296]
	cbnz	r0, .L424
	ldr	r1, .L431
	ldr	r0, .L431+16
	b	.L429
.L424:
	ldr	r2, [r4, #308]
	movs	r1, #255
	str	r0, [r4, #304]
	add	r3, r3, r2
	ldr	r2, [r4, #300]
	str	r3, [r4, #312]
	str	r3, [r4, #1968]
	bl	NAND_Memset
	ldr	r3, [r4, #308]
	ldr	r0, [r4, #300]
	str	r3, [r4, #340]
	str	r0, [r4, #332]
	bl	nftl_malloc
	mov	r3, r0
	str	r0, [r4, #328]
	cbnz	r0, .L425
	ldr	r1, .L431
	ldr	r0, .L431+20
	b	.L429
.L425:
	ldr	r2, [r4, #340]
	movs	r1, #255
	str	r0, [r4, #336]
	add	r3, r3, r2
	ldr	r2, [r4, #332]
	str	r3, [r4, #344]
	bl	NAND_Memset
	ldr	r3, [r4, #308]
	ldr	r0, [r4, #300]
	str	r3, [r4, #272]
	ldr	r3, [r4, #316]
	str	r0, [r4, #264]
	str	r3, [r4, #280]
	bl	nftl_malloc
	str	r0, [r4, #260]
	cbnz	r0, .L426
	ldr	r1, .L431
	ldr	r0, .L431+24
	b	.L429
.L426:
	ldr	r3, [r4, #272]
	mov	r1, r5
	str	r0, [r4, #268]
	str	r5, [r4, #356]
	add	r0, r0, r3
	ldr	r3, [r4, #4]
	str	r0, [r4, #276]
	str	r5, [r4, #376]
	ldrh	r2, [r3, #16]
	strd	r5, r5, [r4, #360]
	strd	r5, r5, [r4, #368]
	strd	r5, r5, [r4, #576]
	lsrs	r3, r2, #1
	str	r5, [r4, #292]
	str	r5, [r4, #324]
	strh	r3, [r4, #572]	@ movhi
	ldr	r3, .L431+28
	strd	r5, r5, [r4, #172]
	strd	r5, r5, [r4, #164]
	strd	r5, r5, [r4, #180]
	umull	r2, r3, r2, r3
	mov	r2, r4
	strd	r5, r5, [r4, #208]
	strd	r5, r5, [r4, #200]
	strd	r5, r5, [r4, #216]
	lsrs	r3, r3, #2
	strh	r3, [r4, #574]	@ movhi
	movw	r3, #65535
	strh	r3, [r4, #320]	@ movhi
	strh	r3, [r4, #352]	@ movhi
	mov	r3, r5
	strd	r5, r5, [r4, #244]
	strd	r5, r5, [r4, #236]
	strd	r5, r5, [r4, #252]
	strh	r5, [r4, #392]	@ movhi
.L427:
	strh	r1, [r2, #396]	@ movhi
	adds	r1, r1, #1
	cmp	r1, #10
	strh	r3, [r2, #398]	@ movhi
	strd	r3, r3, [r2, #400]
	add	r2, r2, #16
	str	r3, [r2, #392]
	bne	.L427
	movs	r2, #255
	strh	r3, [r4, #394]	@ movhi
	strd	r2, r3, [r4, #556]
	strd	r3, r3, [r4, #564]
	b	.L419
.L432:
	.align	2
.L431:
	.word	.LANCHOR12
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	-1431655765
	.size	zone_param_init, .-zone_param_init
	.section	.text.free_logic_page_map,"ax",%progbits
	.align	1
	.global	free_logic_page_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	free_logic_page_map, %function
free_logic_page_map:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	add	r5, r0, #52
	add	r4, r0, #152
.L435:
	ldr	r0, [r5], #4
	cbz	r0, .L434
	bl	nftl_free
.L434:
	cmp	r5, r4
	bne	.L435
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.size	free_logic_page_map, .-free_logic_page_map
	.section	.text.zone_param_exit,"ax",%progbits
	.align	1
	.global	zone_param_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	zone_param_exit, %function
zone_param_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	free_logic_page_map
	ldr	r0, [r4, #260]
	bl	nftl_free
	ldr	r0, [r4, #296]
	bl	nftl_free
	ldr	r0, [r4, #328]
	bl	nftl_free
	ldr	r0, [r4, #284]
	bl	nftl_free
	ldr	r0, [r4, #288]
	bl	nftl_free
	movs	r0, #0
	pop	{r4, pc}
	.size	zone_param_exit, .-zone_param_exit
	.section	.text.set_physic_op_par,"ax",%progbits
	.align	1
	.global	set_physic_op_par
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_physic_op_par, %function
set_physic_op_par:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	strh	r3, [r0, #4]	@ movhi
	ldr	r3, [sp]
	strh	r2, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	str	r3, [r0, #8]
	ldr	r3, [sp, #4]
	str	r3, [r0, #12]
	bx	lr
	.size	set_physic_op_par, .-set_physic_op_par
	.section	.text.nftl_cache_init,"ax",%progbits
	.align	1
	.global	nftl_cache_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_cache_init, %function
nftl_cache_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #1972]
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r6, r0
	movs	r7, #255
	mov	r8, #-1
	movs	r5, #0
	ldrh	r3, [r3, #22]
	strh	r5, [r0, #586]	@ movhi
	strh	r5, [r0, #588]	@ movhi
	strh	r3, [r0, #584]	@ movhi
	strh	r5, [r0, #590]	@ movhi
	str	r5, [r0, #1568]
	str	r5, [r0, #1572]
	str	r5, [r0, #1576]
	str	r5, [r0, #1580]
	str	r5, [r0, #1600]
	str	r5, [r0, #1604]
	str	r5, [r0, #1608]
	str	r5, [r0, #1612]
.L443:
	ldr	r3, [r4, #4]
	ldrh	r0, [r3, #26]
	ldrh	r3, [r4, #584]
	cmp	r3, r5
	bhi	.L446
	bl	nftl_malloc
	str	r0, [r4, #1616]
	cbnz	r0, .L447
	ldr	r1, .L449
	ldr	r0, .L449+4
	b	.L448
.L446:
	movs	r3, #0
	strh	r5, [r6, #592]	@ movhi
	strh	r7, [r6, #594]	@ movhi
	str	r8, [r6, #600]
	strd	r3, r3, [r6, #608]
	strd	r3, r3, [r6, #616]
	adds	r6, r6, #32
	strh	r3, [r6, #564]	@ movhi
	strh	r3, [r6, #566]	@ movhi
	bl	nftl_malloc
	str	r0, [r6, #572]
	cbnz	r0, .L444
	ldr	r1, .L449
	ldr	r0, .L449+8
.L448:
	bl	NAND_Print
	movs	r0, #1
.L442:
	pop	{r4, r5, r6, r7, r8, pc}
.L444:
	adds	r5, r5, #1
	b	.L443
.L447:
	movs	r0, #0
	b	.L442
.L450:
	.align	2
.L449:
	.word	.LANCHOR13
	.word	.LC58
	.word	.LC57
	.size	nftl_cache_init, .-nftl_cache_init
	.section	.text.nftl_cache_exit,"ax",%progbits
	.align	1
	.global	nftl_cache_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_cache_exit, %function
nftl_cache_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	movs	r4, #0
.L452:
	ldrh	r3, [r5, #584]
	cmp	r3, r4
	bgt	.L453
	ldr	r0, [r5, #1616]
	bl	nftl_free
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L453:
	add	r3, r5, r4, lsl #5
	adds	r4, r4, #1
	ldr	r0, [r3, #604]
	bl	nftl_free
	b	.L452
	.size	nftl_cache_exit, .-nftl_cache_exit
	.section	.text.nftl_cache_clean,"ax",%progbits
	.align	1
	.global	nftl_cache_clean
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_cache_clean, %function
nftl_cache_clean:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #1972]
	add	r0, r0, #592
	push	{r4, r5, lr}
	movs	r4, #255
	mov	r5, #-1
	ldrh	r1, [r3, #22]
	movs	r3, #0
	strh	r3, [r0, #-6]	@ movhi
	mov	r2, r3
	strh	r3, [r0, #-4]	@ movhi
	strh	r1, [r0, #-8]	@ movhi
	strh	r3, [r0, #-2]	@ movhi
	str	r3, [r0, #976]
	str	r3, [r0, #980]
	str	r3, [r0, #984]
	str	r3, [r0, #988]
	str	r3, [r0, #1008]
	str	r3, [r0, #1012]
	str	r3, [r0, #1016]
	str	r3, [r0, #1020]
.L455:
	cmp	r1, r3
	add	r0, r0, #32
	bhi	.L456
	movs	r0, #0
	pop	{r4, r5, pc}
.L456:
	strh	r3, [r0, #-32]	@ movhi
	adds	r3, r3, #1
	strh	r4, [r0, #-30]	@ movhi
	str	r5, [r0, #-24]
	strd	r2, r2, [r0, #-16]
	strd	r2, r2, [r0, #-8]
	strh	r2, [r0, #-28]	@ movhi
	strh	r2, [r0, #-26]	@ movhi
	b	.L455
	.size	nftl_cache_clean, .-nftl_cache_clean
	.section	.text.search_from_cache_read_list,"ax",%progbits
	.align	1
	.global	search_from_cache_read_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	search_from_cache_read_list, %function
search_from_cache_read_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #984]
.L458:
	cbnz	r0, .L460
.L457:
	bx	lr
.L460:
	ldr	r3, [r0, #8]
	cmp	r3, r1
	beq	.L457
	ldr	r0, [r0, #16]
	b	.L458
	.size	search_from_cache_read_list, .-search_from_cache_read_list
	.section	.text.search_from_cache_write_list,"ax",%progbits
	.align	1
	.global	search_from_cache_write_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	search_from_cache_write_list, %function
search_from_cache_write_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #1024]
.L462:
	cbnz	r0, .L464
.L461:
	bx	lr
.L464:
	ldr	r3, [r0, #8]
	cmp	r3, r1
	beq	.L461
	ldr	r0, [r0, #24]
	b	.L462
	.size	search_from_cache_write_list, .-search_from_cache_write_list
	.section	.text.add_to_cache_read_list_tail,"ax",%progbits
	.align	1
	.global	add_to_cache_read_list_tail
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_to_cache_read_list_tail, %function
add_to_cache_read_list_tail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, #968
	push	{r4, lr}
.L466:
	ldr	r4, [r3, #16]
	cbnz	r4, .L469
	str	r1, [r3, #16]
	strd	r4, r3, [r1, #16]
	strh	r2, [r1, #2]	@ movhi
	cbnz	r2, .L467
	ldrh	r3, [r0, #2]
	adds	r3, r3, #1
	strh	r3, [r0, #2]	@ movhi
.L468:
	movs	r0, #0
	pop	{r4, pc}
.L469:
	mov	r3, r4
	b	.L466
.L467:
	ldrh	r3, [r0, #6]
	adds	r3, r3, #1
	strh	r3, [r0, #6]	@ movhi
	b	.L468
	.size	add_to_cache_read_list_tail, .-add_to_cache_read_list_tail
	.section	.text.add_to_cache_write_list_tail,"ax",%progbits
	.align	1
	.global	add_to_cache_write_list_tail
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_to_cache_write_list_tail, %function
add_to_cache_write_list_tail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, #1000
.L471:
	ldr	r3, [r2, #24]
	cbnz	r3, .L472
	str	r1, [r2, #24]
	strd	r3, r2, [r1, #24]
	movs	r2, #1
	strh	r2, [r1, #2]	@ movhi
	ldrh	r2, [r0, #4]
	adds	r2, r2, #1
	strh	r2, [r0, #4]	@ movhi
	mov	r0, r3
	bx	lr
.L472:
	mov	r2, r3
	b	.L471
	.size	add_to_cache_write_list_tail, .-add_to_cache_write_list_tail
	.section	.text.del_from_cache_read_list,"ax",%progbits
	.align	1
	.global	del_from_cache_read_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_from_cache_read_list, %function
del_from_cache_read_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r3, r2, [r1, #16]
	str	r3, [r2, #16]
	ldr	r3, [r1, #16]
	cbz	r3, .L474
	str	r2, [r3, #20]
.L474:
	ldrh	r3, [r1, #2]
	cbnz	r3, .L475
	ldrh	r3, [r0, #2]
	subs	r3, r3, #1
	strh	r3, [r0, #2]	@ movhi
.L476:
	movs	r3, #255
	mov	r0, r1
	strh	r3, [r1, #2]	@ movhi
	movs	r3, #0
	strd	r3, r3, [r1, #16]
	bx	lr
.L475:
	ldrh	r3, [r0, #6]
	subs	r3, r3, #1
	strh	r3, [r0, #6]	@ movhi
	b	.L476
	.size	del_from_cache_read_list, .-del_from_cache_read_list
	.section	.text.del_from_cache_write_list,"ax",%progbits
	.align	1
	.global	del_from_cache_write_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_from_cache_write_list, %function
del_from_cache_write_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r3, r2, [r1, #24]
	str	r3, [r2, #24]
	ldr	r3, [r1, #24]
	cbz	r3, .L481
	str	r2, [r3, #28]
.L481:
	movs	r3, #0
	strd	r3, r3, [r1, #24]
	movs	r3, #255
	strh	r3, [r1, #2]	@ movhi
	ldrh	r3, [r0, #4]
	subs	r3, r3, #1
	strh	r3, [r0, #4]	@ movhi
	mov	r0, r1
	bx	lr
	.size	del_from_cache_write_list, .-del_from_cache_write_list
	.section	.text.get_empty_cahce_node,"ax",%progbits
	.align	1
	.global	get_empty_cahce_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_empty_cahce_node, %function
get_empty_cahce_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r2, [r0]
	movs	r1, #0
	push	{r4}
.L486:
	uxth	r3, r1
	cmp	r2, r3
	bhi	.L488
	ldrh	r3, [r0, #6]
	ldr	r1, [r0, #984]
	cmp	r3, #9
	bhi	.L489
.L490:
	cbz	r1, .L485
	ldrh	r3, [r1, #2]
	cbz	r3, .L497
	ldr	r1, [r1, #16]
	b	.L490
.L488:
	adds	r3, r1, #1
	add	r4, r0, r3, lsl #5
	ldrh	r4, [r4, #-22]
	cmp	r4, #255
	bne	.L495
	add	r1, r0, r1, lsl #5
	adds	r1, r1, #8
.L485:
	mov	r0, r1
	pop	{r4}
	bx	lr
.L495:
	mov	r1, r3
	b	.L486
.L491:
	ldr	r1, [r1, #16]
.L489:
	cmp	r1, #0
	beq	.L485
	ldrh	r3, [r1, #2]
	cmp	r3, #2
	bne	.L491
.L497:
	pop	{r4}
	b	del_from_cache_read_list
	.size	get_empty_cahce_node, .-get_empty_cahce_node
	.section	.text.nand_cache_read,"ax",%progbits
	.align	1
	.global	nand_cache_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_cache_read, %function
nand_cache_read:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	str	r1, [sp, #4]
	mov	r7, r3
	cbnz	r3, .L499
	ldr	r0, .L509
	bl	NAND_Print
.L507:
	mov	fp, #0
.L498:
	mov	r0, fp
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L499:
	lsrs	r3, r2, #8
	uxtb	r2, r2
	lsl	r8, r3, #9
	ldr	r3, [r0, #1972]
	lsls	r5, r2, #9
	ldrh	r3, [r3]
	str	r3, [sp, #12]
	cbz	r3, .L501
	ldr	r6, [r0, #604]
	ldr	r3, [r0, #2004]
	mov	r2, r6
	blx	r3
	mov	r2, r5
	mov	fp, r0
	add	r1, r6, r8
	mov	r0, r7
	bl	NAND_Memcpy
	cmp	fp, #10
	bne	.L498
	ldr	r2, [r4, #1968]
	mov	r0, r4
	ldr	r1, [sp, #4]
	ldr	r3, [r2, #116]
	adds	r3, r3, #1
	str	r3, [r2, #116]
	mov	r2, r6
	ldr	r3, [r4, #2000]
	blx	r3
	b	.L507
.L501:
	add	r10, r0, #584
	mov	r0, r10
	bl	search_from_cache_write_list
	mov	fp, r0
	cbz	r0, .L502
	ldr	r3, [r0, #12]
	ldrh	r6, [r0, #6]
	str	r3, [sp, #8]
	ldrh	r3, [r0, #4]
	lsls	r6, r6, #9
	ldr	r2, [sp, #8]
	uxth	r6, r6
	lsls	r3, r3, #9
	add	r10, r2, r8
	uxth	r3, r3
	add	r3, r3, r6
	cmp	r3, r8
	bcc	.L503
	add	r2, r8, r5
	cmp	r3, r2
	bcc	.L503
.L508:
	mov	r2, r5
	mov	r1, r10
	mov	r0, r7
	bl	NAND_Memcpy
	b	.L507
.L503:
	ldr	r3, [r4, #2004]
	mov	r0, r4
	ldr	r2, [r4, #1616]
	ldr	r1, [sp, #4]
	blx	r3
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #1616]
	ldrh	r2, [r3, #26]
	ldr	r3, [sp, #8]
	add	r1, r1, r6
	subs	r2, r2, r6
	add	r3, r3, r6
	mov	r0, r3
	bl	NAND_Memcpy
	ldr	r3, [r4, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	strh	r3, [fp, #6]	@ movhi
	b	.L508
.L502:
	ldr	r1, [sp, #4]
	mov	r0, r10
	bl	search_from_cache_read_list
	mov	r6, r0
	cbz	r0, .L504
	ldrh	r4, [r0, #2]
	cbnz	r4, .L505
	mov	r1, r0
	mov	r0, r10
	bl	del_from_cache_read_list
	ldr	r1, [r6, #12]
	mov	r2, r5
	mov	r0, r7
	add	r1, r1, r8
	bl	NAND_Memcpy
	mov	r2, r4
	mov	r1, r6
	mov	r0, r10
	bl	add_to_cache_read_list_tail
	b	.L507
.L505:
	ldr	r1, [r0, #12]
	mov	r2, r5
	mov	r0, r7
	add	r1, r1, r8
	bl	NAND_Memcpy
	b	.L498
.L504:
	mov	r0, r10
	bl	get_empty_cahce_node
	cbnz	r0, .L506
	ldrh	r3, [r4, #590]
	mov	fp, #1
	ldrh	r2, [r4, #586]
	ldrh	r1, [r4, #588]
	ldr	r0, .L509+4
	bl	NAND_Print
	b	.L498
.L506:
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #4]
	ldr	r3, [r4, #2004]
	str	r2, [r0, #8]
	ldr	r2, [r0, #12]
	strd	r2, r0, [sp, #8]
	mov	r0, r4
	blx	r3
	ldr	r3, [sp, #12]
	mov	fp, r0
	ldr	r2, [r4, #4]
	mov	r0, r10
	strh	r6, [r3, #4]	@ movhi
	mov	r1, r3
	ldrb	r2, [r2, #8]	@ zero_extendqisi2
	strh	r2, [r3, #6]	@ movhi
	mov	r2, r6
	bl	add_to_cache_read_list_tail
	ldr	r3, [sp, #8]
	mov	r2, r5
	mov	r0, r7
	add	r1, r3, r8
	bl	NAND_Memcpy
	cmp	fp, #10
	bne	.L498
	ldr	r2, [r4, #1968]
	mov	r0, r4
	mov	fp, r6
	ldr	r3, [r2, #116]
	adds	r3, r3, #1
	str	r3, [r2, #116]
	ldr	r3, [r4, #2000]
	ldrd	r1, r2, [sp, #4]
	blx	r3
	b	.L498
.L510:
	.align	2
.L509:
	.word	.LC59
	.word	.LC60
	.size	nand_cache_read, .-nand_cache_read
	.global	__aeabi_uidivmod
	.section	.text.nand_op,"ax",%progbits
	.align	1
	.global	nand_op
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_op, %function
nand_op:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r1
	ldr	r10, [sp, #32]
	mov	r4, r3
	cbz	r3, .L512
	ldr	r1, [r1, #24]
	add	r3, r3, r2
	cmp	r3, r1
	bls	.L513
	movs	r4, #1
	ldr	r0, .L526
	bl	NAND_Print
.L512:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L513:
	ldr	r1, .L526+4
	ldr	r3, .L526+8
	cmp	r0, #0
	ite	ne
	movne	r8, r1
	moveq	r8, r3
	ldr	r3, [r6, #4]
	mov	r0, r2
	ldrb	r5, [r3, #8]	@ zero_extendqisi2
	mov	r1, r5
	bl	__aeabi_uidivmod
	subs	r5, r5, r1
	mov	fp, r0
	uxth	r5, r5
	mov	r3, r10
	cmp	r4, r5
	itet	ls
	uxthls	r5, r4
	subhi	r7, r4, r5
	movls	r7, #0
	orr	r2, r5, r1, lsl #8
	mov	r1, r0
	mov	r0, r6
	uxth	r2, r2
	blx	r8
	mov	r4, r0
	cmp	r7, #0
	beq	.L512
.L517:
	ldr	r3, [r6, #4]
	add	fp, fp, #1
	add	r10, r10, r5, lsl #9
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r7, r3
	bhi	.L518
	mov	r3, r10
	uxth	r2, r7
	mov	r1, fp
	mov	r0, r6
	blx	r8
	orrs	r4, r4, r0
	b	.L512
.L518:
	uxth	r5, r3
	subs	r7, r7, r3
	mov	r1, fp
	mov	r3, r10
	mov	r2, r5
	mov	r0, r6
	blx	r8
	orrs	r4, r4, r0
	b	.L517
.L527:
	.align	2
.L526:
	.word	.LC45
	.word	nand_cache_write
	.word	nand_cache_read
	.size	nand_op, .-nand_op
	.section	.text.__nand_read,"ax",%progbits
	.align	1
	.global	__nand_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_read, %function
__nand_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, fp, lr}
	mov	r7, r3
	ldr	r3, [r0, #356]
	mov	r4, r0
	mov	r6, r1
	mov	r5, r2
	cmp	r3, #3
	bne	.L529
	ldr	r0, .L530
	bl	NAND_Print_DBG
.L529:
	ldr	r1, [r4, #1968]
	movs	r0, #0
	ldrd	r2, [r1, #64]
	adds	fp, r2, r5
	mov	r2, r6
	adc	ip, r3, #0
	mov	r3, r5
	strd	fp, [r1, #64]
	mov	r1, r4
	str	r7, [sp]
	bl	nand_op
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, fp, pc}
.L531:
	.align	2
.L530:
	.word	.LC61
	.size	__nand_read, .-__nand_read
	.section	.text._nand_read,"ax",%progbits
	.align	1
	.global	_nand_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_read, %function
_nand_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #12]
	b	__nand_read
	.size	_nand_read, .-_nand_read
	.section	.text.__nand_write,"ax",%progbits
	.align	1
	.global	__nand_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_write, %function
__nand_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, fp, lr}
	mov	r7, r3
	ldr	r3, [r0, #356]
	mov	r4, r0
	mov	r6, r1
	mov	r5, r2
	cmp	r3, #3
	bne	.L534
	ldr	r0, .L535
	bl	NAND_Print_DBG
.L534:
	ldr	r1, [r4, #1968]
	movs	r0, #1
	ldrd	r2, [r1, #72]
	adds	fp, r2, r5
	mov	r2, r6
	adc	ip, r3, #0
	mov	r3, r5
	strd	fp, [r1, #72]
	mov	r1, r4
	str	r7, [sp]
	bl	nand_op
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, fp, pc}
.L536:
	.align	2
.L535:
	.word	.LC62
	.size	__nand_write, .-__nand_write
	.section	.text._nand_write,"ax",%progbits
	.align	1
	.global	_nand_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_write, %function
_nand_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #12]
	b	__nand_write
	.size	_nand_write, .-_nand_write
	.section	.text.write_data_to_nand,"ax",%progbits
	.align	1
	.global	write_data_to_nand
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_data_to_nand, %function
write_data_to_nand:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r0
	mov	r0, #512
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L539
	ldr	r1, .L542
	ldr	r0, .L542+4
	bl	NAND_Print
.L539:
	movs	r5, #0
	mov	r2, #512
	movs	r1, #170
	mov	r0, r4
	bl	NAND_Memset
.L540:
	mov	r1, r5
	mov	r3, r4
	movs	r2, #1
	mov	r0, r6
	adds	r5, r5, #1
	bl	__nand_write
	cmp	r5, #38912
	bne	.L540
	mov	r0, r4
	bl	nftl_free
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L543:
	.align	2
.L542:
	.word	.LANCHOR14
	.word	.LC63
	.size	write_data_to_nand, .-write_data_to_nand
	.section	.text.flush_write_cache_to_nand,"ax",%progbits
	.align	1
	.global	flush_write_cache_to_nand
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	flush_write_cache_to_nand, %function
flush_write_cache_to_nand:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	sub	sp, sp, #20
	mov	r4, r0
	movs	r2, #8
	mov	r8, r1
	mov	r0, sp
	ldr	r1, .L571
	bl	memcpy
	movs	r2, #8
	ldr	r1, .L571+4
	add	r0, sp, r2
	bl	memcpy
	ldr	r1, [r4, #1608]
	cbnz	r1, .L545
	ldr	r0, .L571+8
	bl	NAND_Print
.L546:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L545:
	add	r7, r4, #584
	mov	r0, r7
	bl	del_from_cache_write_list
	mov	r5, r0
	cmp	r0, #0
	beq	.L546
	ldr	r3, [r4, #4]
	ldrh	r2, [r0, #6]
	ldrd	r1, r6, [r0, #8]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L548
	ldr	r3, [r4, #2004]
	mov	r0, r4
	ldr	r2, [r4, #1616]
	blx	r3
	mov	r10, r0
	ldrh	r0, [r5, #6]
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #1616]
	lsls	r0, r0, #9
	ldrh	r2, [r3, #26]
	uxth	r0, r0
	subs	r2, r2, r0
	add	r1, r1, r0
	add	r0, r0, r6
	bl	NAND_Memcpy
	cmp	r10, #10
	bne	.L548
	ldrh	r2, [r4, #590]
	ldr	r1, [r5, #8]
	ldr	r0, .L571+12
	bl	NAND_Print
.L548:
	movs	r3, #0
	mov	r2, r6
	strh	r3, [r5, #4]	@ movhi
	mov	r0, r4
	ldr	r3, [r4, #4]
	ldr	r1, [r5, #8]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	strh	r3, [r5, #6]	@ movhi
	ldr	r3, [r4, #2000]
	blx	r3
	cbz	r0, .L550
	ldr	r0, .L571+16
	bl	NAND_Print
.L550:
	ldr	r10, [r4, #4]
	movs	r2, #8
	mov	r1, sp
	mov	r0, r10
	bl	NAND_Memcmp
	tst	r0, #255
	bne	.L551
.L554:
	cmp	r8, #1
	bne	.L555
	ldrh	r1, [r4, #320]
	ldr	r0, .L571+20
	bl	NAND_Print
	ldrh	r0, [r4, #320]
	cbz	r0, .L555
	subs	r0, r0, #1
	bl	nand_phy_get_page_type
	cmp	r0, #2
	bne	.L555
	ldr	r0, .L571+24
	bl	NAND_Print
	ldr	r3, [r4, #2000]
	mov	r2, r6
	ldr	r1, [r5, #8]
	mov	r0, r4
	blx	r3
	cbz	r0, .L555
	ldr	r0, .L571+16
	bl	NAND_Print
	b	.L555
.L551:
	movs	r2, #8
	mov	r0, r10
	add	r1, sp, r2
	bl	NAND_Memcmp
	tst	r0, #255
	beq	.L554
.L555:
	movs	r2, #2
	mov	r1, r5
	mov	r0, r7
	bl	add_to_cache_read_list_tail
	b	.L546
.L572:
	.align	2
.L571:
	.word	.LANCHOR15
	.word	.LANCHOR15+8
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.size	flush_write_cache_to_nand, .-flush_write_cache_to_nand
	.section	.text.nand_cache_write,"ax",%progbits
	.align	1
	.global	nand_cache_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_cache_write, %function
nand_cache_write:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	mov	r6, r1
	str	r3, [sp, #4]
	cbnz	r3, .L574
.L612:
	movs	r0, #0
	b	.L573
.L574:
	lsls	r3, r2, #1
	lsl	r8, r2, #9
	and	r10, r3, #65024
	ldr	r3, [r0, #1972]
	uxth	r8, r8
	ldrh	r5, [r3]
	cbz	r5, .L576
	ldr	r5, [r0, #604]
	ldr	r3, [r0, #2004]
	mov	r2, r5
	blx	r3
	mov	r2, r8
	ldr	r1, [sp, #4]
	add	r0, r5, r10
	bl	NAND_Memcpy
	ldr	r3, [r4, #2000]
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, lr}
	bx	r3
.L576:
	add	r5, r0, #584
	ldrh	r0, [r3, #2]
	cbnz	r0, .L577
	ldr	r0, [r4, #4]
	ldrb	r7, [r0, #8]	@ zero_extendqisi2
	cmp	r7, r2
	bne	.L577
	ldrh	r3, [r3, #26]
	cbnz	r3, .L577
	mov	r0, r5
	bl	search_from_cache_write_list
	mov	r1, r0
	cbz	r0, .L578
	mov	r0, r5
	bl	del_from_cache_write_list
.L578:
	mov	r1, r6
	mov	r0, r5
	bl	search_from_cache_read_list
	mov	r1, r0
	cbz	r0, .L579
	mov	r0, r5
	bl	del_from_cache_read_list
.L579:
	ldr	r3, [r4, #2000]
	mov	r1, r6
	ldr	r2, [sp, #4]
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	beq	.L612
	mov	r1, r7
	ldr	r0, .L614
	bl	NAND_Print
.L611:
	movs	r0, #1
.L573:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L577:
	mov	r1, r6
	mov	r0, r5
	bl	search_from_cache_write_list
	mov	r7, r0
	cmp	r0, #0
	beq	.L581
	mov	r1, r0
	mov	r0, r5
	bl	del_from_cache_write_list
	ldr	r3, [r7, #12]
	ldr	r2, [r4, #4]
	str	r3, [sp, #8]
	ldrb	r2, [r2, #8]	@ zero_extendqisi2
	ldrh	r3, [r7, #6]
	cmp	r2, r3
	beq	.L583
	lsl	fp, r3, #9
	uxth	fp, fp
	cmp	r10, fp
	bne	.L584
	add	r3, r3, r8, lsr #9
	strh	r3, [r7, #6]	@ movhi
.L583:
	ldrd	r1, r3, [sp, #4]
	mov	r2, r8
	add	r3, r3, r10
	mov	r0, r3
	bl	NAND_Memcpy
	mov	r1, r7
	mov	r0, r5
	bl	add_to_cache_write_list_tail
	mov	r1, r6
	mov	r0, r5
	bl	search_from_cache_read_list
	mov	r1, r0
	cmp	r0, #0
	beq	.L612
	mov	r0, r5
	bl	del_from_cache_read_list
	b	.L612
.L584:
	ldr	r3, [r4, #2004]
	mov	r1, r6
	ldr	r2, [r4, #1616]
	mov	r0, r4
	blx	r3
	ldr	r2, [r4, #4]
	ldr	r3, [sp, #8]
	ldr	r1, [r4, #1616]
	ldrh	r2, [r2, #26]
	str	r0, [sp, #12]
	add	r0, r3, fp
	add	r1, r1, fp
	sub	r2, r2, fp
	bl	NAND_Memcpy
	ldr	r2, [r4, #4]
	ldr	r3, [sp, #12]
	ldrb	r2, [r2, #8]	@ zero_extendqisi2
	cmp	r3, #10
	strh	r2, [r7, #6]	@ movhi
	bne	.L583
	mov	r1, r6
	ldr	r0, .L614+4
	bl	NAND_Print
	b	.L583
.L581:
	mov	r0, r5
	bl	search_from_cache_read_list
	mov	fp, r0
	cbz	r0, .L586
	ldr	r0, [r0, #12]
	mov	r2, r8
	ldr	r1, [sp, #4]
	add	r0, r0, r10
	bl	NAND_Memcpy
	ldr	r3, [r4, #4]
	mov	r1, fp
	strh	r7, [fp, #4]	@ movhi
	mov	r0, r5
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	strh	r3, [fp, #6]	@ movhi
	bl	del_from_cache_read_list
	mov	r0, r5
	bl	add_to_cache_write_list_tail
	ldr	r3, [r4, #1972]
	ldrh	r2, [r4, #588]
	ldrh	r3, [r3, #24]
	cmp	r2, r3
	bcc	.L612
	mov	r1, r7
	mov	r0, r4
	bl	flush_write_cache_to_nand
	cmp	r0, #0
	beq	.L612
	ldr	r0, .L614+8
.L613:
	bl	NAND_Print
	b	.L611
.L587:
	movs	r1, #0
	mov	r0, r4
	bl	flush_write_cache_to_nand
	cbz	r0, .L586
	ldr	r0, .L614+12
	b	.L613
.L586:
	ldr	r3, [r4, #1972]
	ldrh	r2, [r4, #588]
	ldrh	r3, [r3, #24]
	cmp	r2, r3
	bcs	.L587
	mov	r0, r5
	bl	get_empty_cahce_node
	mov	r7, r0
	cbnz	r0, .L588
	ldrh	r3, [r4, #590]
	ldrh	r2, [r4, #586]
	ldrh	r1, [r4, #588]
	ldr	r0, .L614+16
	bl	NAND_Print
	b	.L611
.L588:
	str	r6, [r0, #8]
	ldr	fp, [r0, #12]
	cmp	r10, #0
	bne	.L589
	lsr	r3, r8, #9
	strh	r10, [r0, #4]	@ movhi
.L610:
	ldr	r1, [sp, #4]
	add	r0, fp, r10
	strh	r3, [r7, #6]	@ movhi
	mov	r2, r8
	bl	NAND_Memcpy
	mov	r1, r7
	mov	r0, r5
	bl	add_to_cache_write_list_tail
	b	.L612
.L589:
	ldr	r3, [r4, #2004]
	mov	r2, fp
	mov	r1, r6
	mov	r0, r4
	blx	r3
	cmp	r0, #10
	bne	.L591
	mov	r1, r6
	ldr	r0, .L614+20
	bl	NAND_Print
.L591:
	movs	r3, #0
	strh	r3, [r7, #4]	@ movhi
	ldr	r3, [r4, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	b	.L610
.L615:
	.align	2
.L614:
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.word	.LC72
	.word	.LC60
	.word	.LC73
	.size	nand_cache_write, .-nand_cache_write
	.section	.text.__nand_flush_write_cache,"ax",%progbits
	.align	1
	.global	__nand_flush_write_cache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_flush_write_cache, %function
__nand_flush_write_cache:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r4, #0
	mov	r6, r0
	mov	r7, r1
	mov	r5, r4
.L617:
	ldr	r3, [r6, #1608]
	cbz	r3, .L618
	adds	r4, r4, #1
	movs	r1, #1
	mov	r0, r6
	bl	flush_write_cache_to_nand
	cmp	r7, r4
	orr	r5, r5, r0
	bne	.L617
.L618:
	cbz	r5, .L620
	ldr	r0, .L631
	bl	NAND_Print
.L620:
	cbz	r4, .L616
	ldr	r3, [r6, #356]
	cbz	r3, .L616
	mov	r2, r4
	ldrb	r1, [r6, #16]	@ zero_extendqisi2
	ldr	r0, .L631+4
	bl	NAND_Print_DBG
.L616:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L632:
	.align	2
.L631:
	.word	.LC74
	.word	.LC75
	.size	__nand_flush_write_cache, .-__nand_flush_write_cache
	.section	.text._nand_flush_write_cache,"ax",%progbits
	.align	1
	.global	_nand_flush_write_cache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_flush_write_cache, %function
_nand_flush_write_cache:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #12]
	b	__nand_flush_write_cache
	.size	_nand_flush_write_cache, .-_nand_flush_write_cache
	.section	.text.nand_discard,"ax",%progbits
	.align	1
	.global	nand_discard
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_discard, %function
nand_discard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r3, [r6, #24]
	mov	r4, r2
	adds	r2, r1, r2
	mov	r0, r1
	cmp	r2, r3
	bls	.L635
	ldr	r0, .L656
	bl	NAND_Print
	movs	r0, #1
.L634:
	pop	{r4, r5, r6, r7, r8, pc}
.L635:
	ldr	r1, [r6, #1968]
	ldrd	r2, [r1, #96]
	adds	r7, r2, r4
	adc	r8, r3, #0
	ldr	r3, [r6, #4]
	strd	r7, [r1, #96]
	ldrb	r7, [r3, #8]	@ zero_extendqisi2
	mov	r1, r7
	bl	__aeabi_uidivmod
	mov	r5, r0
	cbz	r1, .L637
	subs	r1, r7, r1
	adds	r5, r5, #1
	uxth	r1, r1
	cmp	r1, r4
	bhi	.L645
	subs	r4, r4, r1
.L638:
	mov	r1, r7
	mov	r0, r4
	bl	__aeabi_uidiv
	cbz	r0, .L639
	add	r7, r6, #584
	adds	r4, r5, r0
.L644:
	ldr	r3, [r6, #1972]
	ldrh	r3, [r3]
	cbnz	r3, .L641
	mov	r1, r5
	mov	r0, r7
	bl	search_from_cache_write_list
	mov	r1, r0
	cbz	r0, .L642
	mov	r0, r7
	bl	del_from_cache_write_list
.L642:
	mov	r1, r5
	mov	r0, r7
	bl	search_from_cache_read_list
	mov	r1, r0
	cbz	r0, .L641
	mov	r0, r7
	bl	del_from_cache_read_list
.L641:
	mov	r1, r5
	ldr	r3, [r6, #2012]
	mov	r0, r6
	adds	r5, r5, #1
	blx	r3
	ldr	r3, [r6, #4]
	movs	r1, #0
	ldr	ip, [r6, #1968]
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	ldrd	r3, r2, [ip, #104]
	adds	r3, r3, r0
	adc	r2, r1, r2
	cmp	r5, r4
	strd	r3, r2, [ip, #104]
	bne	.L644
.L639:
	movs	r0, #0
	b	.L634
.L637:
	cmp	r7, r4
	it	hi
	movhi	r4, #0
	b	.L638
.L645:
	movs	r4, #0
	b	.L638
.L657:
	.align	2
.L656:
	.word	.LC76
	.size	nand_discard, .-nand_discard
	.section	.text.__nand_discard,"ax",%progbits
	.align	1
	.global	__nand_discard
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_discard, %function
__nand_discard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #356]
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	cmp	r3, #3
	bne	.L659
	ldr	r0, .L660
	bl	NAND_Print_DBG
.L659:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	b	nand_discard
.L661:
	.align	2
.L660:
	.word	.LC77
	.size	__nand_discard, .-__nand_discard
	.section	.text._nand_discard,"ax",%progbits
	.align	1
	.global	_nand_discard
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nand_discard, %function
_nand_discard:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #12]
	b	__nand_discard
	.size	_nand_discard, .-_nand_discard
	.section	.text.__shutdown_op,"ax",%progbits
	.align	1
	.global	__shutdown_op
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__shutdown_op, %function
__shutdown_op:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	__shutdown_op, .-__shutdown_op
	.section	.text.print_logic_page_map,"ax",%progbits
	.align	1
	.global	print_logic_page_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_logic_page_map, %function
print_logic_page_map:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r7, .L669
	movs	r4, #0
	ldr	r8, .L669+4
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	ldr	r0, [r0, #24]
	bl	__aeabi_uidiv
	mov	r6, r0
.L665:
	cmp	r4, r6
	bne	.L668
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L668:
	mov	r1, r4
	mov	r0, r5
	bl	get_logic_page_map
	cbnz	r0, .L666
	mov	r0, r8
	bl	NAND_Print
.L667:
	adds	r4, r4, #1
	b	.L665
.L666:
	ldrh	r2, [r0, #2]
	movw	r3, #65535
	cmp	r2, r3
	beq	.L667
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	ldrh	r3, [r0]
	mov	r0, r7
	ubfx	r1, r1, #4, #1
	str	r1, [sp]
	ubfx	r3, r3, #0, #12
	mov	r1, r4
	bl	NAND_Print_DBG
	b	.L667
.L670:
	.align	2
.L669:
	.word	.LC79
	.word	.LC78
	.size	print_logic_page_map, .-print_logic_page_map
	.section	.text.get_last_nftl,"ax",%progbits
	.align	1
	.global	get_last_nftl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_last_nftl, %function
get_last_nftl:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
.L672:
	cbnz	r3, .L673
	bx	lr
.L673:
	mov	r0, r3
	ldr	r3, [r3, #8]
	b	.L672
	.size	get_last_nftl, .-get_last_nftl
	.section	.text.get_nftl_need_read_claim,"ax",%progbits
	.align	1
	.global	get_nftl_need_read_claim
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_nftl_need_read_claim, %function
get_nftl_need_read_claim:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	mov	r3, r0
.L675:
	cbnz	r3, .L676
	ldr	r3, [r2, #12]
	ldr	r3, [r3, #1968]
	ldr	r3, [r3, #172]
.L677:
	cbnz	r0, .L679
.L674:
	bx	lr
.L676:
	mov	r2, r3
	ldr	r3, [r3, #8]
	b	.L675
.L679:
	ldr	r2, [r0, #12]
	ldrb	r2, [r2, #16]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L674
	ldr	r0, [r0, #8]
	b	.L677
	.size	get_nftl_need_read_claim, .-get_nftl_need_read_claim
	.section	.text.get_nftl_read_claim_page_no,"ax",%progbits
	.align	1
	.global	get_nftl_read_claim_page_no
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_nftl_read_claim_page_no, %function
get_nftl_read_claim_page_no:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
.L681:
	cbnz	r3, .L682
	ldr	r3, [r0, #12]
	ldr	r3, [r3, #1968]
	ldr	r0, [r3, #176]
	bx	lr
.L682:
	mov	r0, r3
	ldr	r3, [r3, #8]
	b	.L681
	.size	get_nftl_read_claim_page_no, .-get_nftl_read_claim_page_no
	.section	.text.clean_read_reclaim_complete_flag,"ax",%progbits
	.align	1
	.global	clean_read_reclaim_complete_flag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	clean_read_reclaim_complete_flag, %function
clean_read_reclaim_complete_flag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L684:
	cbnz	r0, .L685
	bx	lr
.L685:
	ldr	r2, [r0, #12]
	ldr	r0, [r0, #8]
	ldr	r3, [r2, #364]
	clz	r3, r3
	lsrs	r3, r3, #5
	str	r3, [r2, #364]
	b	.L684
	.size	clean_read_reclaim_complete_flag, .-clean_read_reclaim_complete_flag
	.section	.text.set_nftl_read_claim_complete,"ax",%progbits
	.align	1
	.global	set_nftl_read_claim_complete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_nftl_read_claim_complete, %function
set_nftl_read_claim_complete:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r3, #1
	ldr	r5, [r1, #12]
	mov	r4, r0
	str	r3, [r5, #360]
	mov	r3, r0
.L687:
	cbnz	r3, .L688
	ldr	r1, [r1, #8]
	ldr	r2, [r4, #12]
	ldr	r2, [r2, #1968]
	cbnz	r1, .L689
	str	r3, [r2, #172]
	bl	clean_read_reclaim_complete_flag
.L690:
	ldr	r3, [r4, #12]
	movs	r0, #0
	ldr	r3, [r3, #1968]
	str	r0, [r3, #176]
	pop	{r3, r4, r5, pc}
.L688:
	mov	r4, r3
	ldr	r3, [r3, #8]
	b	.L687
.L689:
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	adds	r3, r3, #1
	str	r3, [r2, #172]
	b	.L690
	.size	set_nftl_read_claim_complete, .-set_nftl_read_claim_complete
	.section	.text.set_nftl_read_claim_flag,"ax",%progbits
	.align	1
	.global	set_nftl_read_claim_flag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_nftl_read_claim_flag, %function
set_nftl_read_claim_flag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L692:
	cbnz	r0, .L693
	bx	lr
.L693:
	ldr	r3, [r0, #12]
	ldr	r0, [r0, #8]
	ldr	r3, [r3, #1968]
	strd	r1, r2, [r3, #172]
	b	.L692
	.size	set_nftl_read_claim_flag, .-set_nftl_read_claim_flag
	.section	.text.get_cold_logic_page,"ax",%progbits
	.align	1
	.global	get_cold_logic_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_cold_logic_page, %function
get_cold_logic_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r8, .L700
	mov	r6, r2
	mov	r4, r1
	movw	r7, #65535
.L695:
	cmp	r4, r6
	bcc	.L699
	mov	r4, #-1
	b	.L694
.L699:
	mov	r1, r4
	mov	r0, r5
	bl	get_logic_page_map
	cbnz	r0, .L696
	mov	r0, r8
	bl	NAND_Print
.L697:
	adds	r4, r4, #1
	b	.L695
.L696:
	ldrh	r3, [r0, #2]
	cmp	r3, r7
	beq	.L697
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	ldr	r2, [r5, #364]
	ubfx	r1, r3, #4, #1
	cmp	r1, r2
	beq	.L697
	bfi	r3, r2, #4, #1
	strb	r3, [r0, #1]
.L694:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L701:
	.align	2
.L700:
	.word	.LC78
	.size	get_cold_logic_page, .-get_cold_logic_page
	.section	.text.read_reclaim,"ax",%progbits
	.align	1
	.global	read_reclaim
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	read_reclaim, %function
read_reclaim:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r7, r2
	mov	r6, r0
	bl	get_nftl_read_claim_page_no
	ldr	r5, [r1, #12]
	mov	r1, r0
	ldr	r2, [r5, #28]
	mov	r0, r5
	bl	get_cold_logic_page
	adds	r3, r0, #1
	mov	r5, r0
	bne	.L703
	mov	r1, r4
	mov	r0, r6
	pop	{r3, r4, r5, r6, r7, lr}
	b	set_nftl_read_claim_complete
.L703:
	ldr	r0, [r4, #12]
	mov	r3, r7
	mov	r1, r5
	ldr	r2, [r0, #4]
	ldrb	r2, [r2, #8]	@ zero_extendqisi2
	bl	nand_cache_read
	ldr	r3, [r4, #12]
	mov	r2, r5
	mov	r0, r6
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	bl	set_nftl_read_claim_flag
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
	.size	read_reclaim, .-read_reclaim
	.section	.text.get_empty_gc_node,"ax",%progbits
	.align	1
	.global	get_empty_gc_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_empty_gc_node, %function
get_empty_gc_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
.L707:
	lsls	r2, r3, #4
	adds	r1, r0, r2
	ldrh	r1, [r1, #6]
	cbnz	r1, .L705
	adds	r2, r2, #4
	add	r0, r0, r2
	bx	lr
.L705:
	adds	r3, r3, #1
	cmp	r3, #10
	bne	.L707
	movs	r0, #0
	bx	lr
	.size	get_empty_gc_node, .-get_empty_gc_node
	.section	.text.search_gc_node,"ax",%progbits
	.align	1
	.global	search_gc_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	search_gc_node, %function
search_gc_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #172]
.L710:
	cbnz	r0, .L712
.L709:
	bx	lr
.L712:
	ldr	r3, [r0, #4]
	cmp	r3, r1
	beq	.L709
	ldr	r0, [r0, #8]
	b	.L710
	.size	search_gc_node, .-search_gc_node
	.section	.text.add_to_gc_list_tail,"ax",%progbits
	.align	1
	.global	add_to_gc_list_tail
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_to_gc_list_tail, %function
add_to_gc_list_tail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, #164
.L714:
	ldr	r3, [r2, #8]
	cbnz	r3, .L715
	str	r1, [r2, #8]
	strd	r3, r2, [r1, #8]
	ldrh	r2, [r0]
	adds	r2, r2, #1
	strh	r2, [r0]	@ movhi
	mov	r0, r3
	bx	lr
.L715:
	mov	r2, r3
	b	.L714
	.size	add_to_gc_list_tail, .-add_to_gc_list_tail
	.section	.text.del_from_gc_list,"ax",%progbits
	.align	1
	.global	del_from_gc_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_from_gc_list, %function
del_from_gc_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r3, r2, [r1, #8]
	str	r3, [r2, #8]
	ldr	r3, [r1, #8]
	cbz	r3, .L717
	str	r2, [r3, #12]
.L717:
	movs	r3, #0
	strd	r3, r3, [r1, #8]
	ldrh	r3, [r0]
	subs	r3, r3, #1
	strh	r3, [r0]	@ movhi
	mov	r0, r1
	bx	lr
	.size	del_from_gc_list, .-del_from_gc_list
	.section	.text.add_prio_gc,"ax",%progbits
	.align	1
	.global	add_prio_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_prio_gc, %function
add_prio_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	add	r5, r0, #392
	mov	r0, r5
	mov	r7, r1
	mov	r6, r2
	bl	search_gc_node
	mov	r4, r0
	cbnz	r0, .L724
	mov	r0, r5
	bl	get_empty_gc_node
	mov	r1, r0
	cbz	r0, .L724
	str	r7, [r0, #4]
	strh	r6, [r0, #2]	@ movhi
	strd	r4, r4, [r0, #8]
	mov	r0, r5
	bl	add_to_gc_list_tail
	mov	r0, r4
.L721:
	pop	{r3, r4, r5, r6, r7, pc}
.L724:
	movs	r0, #1
	b	.L721
	.size	add_prio_gc, .-add_prio_gc
	.section	.text.prio_gc_one,"ax",%progbits
	.align	1
	.global	prio_gc_one
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	prio_gc_one, %function
prio_gc_one:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	cmp	r2, #1
	push	{r4, lr}
	ldr	r4, [r3, #32]
	mov	r3, #36
	mla	r1, r3, r1, r4
	beq	.L726
	cmp	r2, #2
	it	ne
	movne	r2, #3
.L726:
	uxth	r2, r2
	bl	add_prio_gc
	movs	r0, #0
	pop	{r4, pc}
	.size	prio_gc_one, .-prio_gc_one
	.section	.text.get_total_invalid_page,"ax",%progbits
	.align	1
	.global	get_total_invalid_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_total_invalid_page, %function
get_total_invalid_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r3, r0, #188
	movs	r0, #0
.L733:
	ldr	r3, [r3, #12]
	cbnz	r3, .L734
	bx	lr
.L734:
	ldrh	r2, [r3, #4]
	add	r0, r0, r2
	b	.L733
	.size	get_total_invalid_page, .-get_total_invalid_page
	.section	.text.is_current_blcok,"ax",%progbits
	.align	1
	.global	is_current_blcok
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_current_blcok, %function
is_current_blcok:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #17]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L736
	ldr	r3, [r0, #324]
	cmp	r1, r3
	beq	.L738
.L736:
	ldr	r0, [r0, #292]
	subs	r3, r0, r1
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
.L738:
	movs	r0, #1
	bx	lr
	.size	is_current_blcok, .-is_current_blcok
	.section	.text.nftl_get_gc_info,"ax",%progbits
	.align	1
	.global	nftl_get_gc_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_gc_info, %function
nftl_get_gc_info:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r2
	movs	r2, #0
	mov	r5, r0
	mov	r7, r1
	sub	sp, sp, #32
	ldr	ip, [r0, #4]
	mov	r6, r2
	ldr	r4, [r0, #200]
	mov	r1, r2
	mov	r0, r2
.L740:
	cbnz	r4, .L742
	ldr	ip, [r5, #1968]
	mov	fp, #10
	ldrh	r3, [r5, #22]
	strd	r1, r0, [sp, #16]
	mov	r1, r8
	strd	r6, r2, [sp, #24]
	mov	r0, r7
	ldr	r2, [ip, #124]
	ldr	r10, .L753+4
	str	r2, [sp, #12]
	ldr	r2, [ip, #120]
	str	r2, [sp, #8]
	ldrh	r2, [r5, #382]
	str	r2, [sp, #4]
	ldrh	r2, [r5, #380]
	str	r2, [sp]
	ldr	r2, .L753
	bl	NAND_Snprintf
	ldr	r5, [r5, #200]
	mov	r6, r0
.L743:
	sub	r1, r8, r6
	adds	r0, r7, r6
	cmp	r1, #1
	bne	.L746
.L744:
	movs	r3, #10
	strb	r3, [r0, #-1]
	mov	r0, r6
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L742:
	ldrh	r3, [r4, #4]
	adds	r0, r0, #1
	ldrh	lr, [ip, #20]
	ldr	r4, [r4, #12]
	add	r2, r2, r3
	cmp	r3, lr, lsr #1
	itt	hi
	addhi	r6, r6, r3
	addhi	r1, r1, #1
	b	.L740
.L746:
	cmp	r5, #0
	beq	.L744
	ldrh	r2, [r5, #4]
	cmp	r2, #0
	beq	.L744
	ldrh	r3, [r5]
	adds	r4, r4, #1
	str	r2, [sp]
	mov	r2, r10
	bl	NAND_Snprintf
	lsls	r3, r4, #29
	add	r6, r6, r0
	itt	eq
	addeq	r3, r7, r6
	strbeq	fp, [r3, #-1]
	ldr	r5, [r5, #12]
	b	.L743
.L754:
	.align	2
.L753:
	.word	.LC80
	.word	.LC81
	.size	nftl_get_gc_info, .-nftl_get_gc_info
	.section	.text.nftl_zone_release,"ax",%progbits
	.align	1
	.global	nftl_zone_release
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_zone_release, %function
nftl_zone_release:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	nftl_cache_exit
	mov	r0, r4
	bl	zone_param_exit
	ldr	r3, [r4, #4]
	ldr	r0, [r3, #32]
	bl	nftl_free
	ldr	r0, [r4, #4]
	bl	nftl_free
	mov	r0, r4
	pop	{r4, lr}
	b	nftl_free
	.size	nftl_zone_release, .-nftl_zone_release
	.section	.text.nftl_exit,"ax",%progbits
	.align	1
	.global	nftl_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_exit, %function
nftl_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #4]
	bl	free_nand_partition
	ldr	r0, [r4, #12]
	bl	nftl_zone_release
	ldr	r0, [r4, #16]
	bl	nftl_free
	movs	r0, #0
	pop	{r4, pc}
	.size	nftl_exit, .-nftl_exit
	.section	.text.nand_ftl_exit,"ax",%progbits
	.align	1
	.global	nand_ftl_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_ftl_exit, %function
nand_ftl_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r5, .L760
	ldr	r0, .L760
	bl	del_last_nftl_blk
	mov	r4, r0
.L758:
	mov	r0, r4
	cbnz	r4, .L759
	pop	{r3, r4, r5, pc}
.L759:
	bl	nftl_exit
	mov	r0, r4
	bl	nftl_free
	mov	r0, r5
	bl	del_last_nftl_blk
	mov	r4, r0
	b	.L758
.L761:
	.align	2
.L760:
	.word	.LANCHOR4
	.size	nand_ftl_exit, .-nand_ftl_exit
	.section	.text.nand_crc16,"ax",%progbits
	.align	1
	.global	nand_crc16
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_crc16, %function
nand_crc16:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r2, r2, r1
	ldr	r4, .L765
.L763:
	cmp	r2, r1
	bne	.L764
	pop	{r4, pc}
.L764:
	ldrb	r3, [r1], #1	@ zero_extendqisi2
	eors	r3, r3, r0
	uxtb	r3, r3
	ldrh	r3, [r4, r3, lsl #1]
	eor	r0, r3, r0, lsr #8
	b	.L763
.L766:
	.align	2
.L765:
	.word	.LANCHOR16
	.size	nand_crc16, .-nand_crc16
	.section	.text.crc_wrong,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	crc_wrong, %function
crc_wrong:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r6, r0
	mov	r0, r2
	mov	r7, r1
	mov	r5, r2
	bl	is_nouse_page
	cbnz	r0, .L772
	ldr	r3, [r6, #4]
	mov	r0, r5
	ldrb	r4, [r3, #8]	@ zero_extendqisi2
	bl	is_phy_mapping_page
	cbnz	r0, .L769
	lsls	r4, r4, #9
.L770:
	mov	r2, r4
	mov	r1, r7
	movw	r0, #65535
	bl	nand_crc16
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	mov	r1, r0
	ldrb	r2, [r5, #13]	@ zero_extendqisi2
	orr	r2, r2, r3, lsl #8
	cmp	r0, r2
	beq	.L772
	mov	r3, r4
	ldr	r0, .L773
	bl	NAND_Print
	movs	r0, #1
.L767:
	pop	{r3, r4, r5, r6, r7, pc}
.L769:
	ldr	r4, [r6, #308]
	b	.L770
.L772:
	movs	r0, #0
	b	.L767
.L774:
	.align	2
.L773:
	.word	.LC82
	.size	crc_wrong, .-crc_wrong
	.section	.text.nand_power_off_ecc_error,"ax",%progbits
	.align	1
	.global	nand_power_off_ecc_error
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_power_off_ecc_error, %function
nand_power_off_ecc_error:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r2
	ldrb	r5, [r2]	@ zero_extendqisi2
	sub	sp, sp, #60
	cmp	r5, #255
	beq	.L776
	ldr	r0, .L787
.L786:
	bl	NAND_Print
	movs	r3, #1
	movw	r2, #3063
	ldr	r1, .L787+4
	ldr	r0, .L787+8
	bl	NAND_Print
	ldr	r0, .L787+12
	bl	NAND_Print
	ldrb	r0, [r4, #15]	@ zero_extendqisi2
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [r4, #14]	@ zero_extendqisi2
	ldrb	r1, [r4]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [r4, #13]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [r4, #12]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [r4, #11]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [r4, #10]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [r4, #9]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [r4, #7]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [r4, #6]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [r4, #5]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L787+16
	bl	NAND_Print
	movs	r0, #1
	b	.L780
.L776:
	ldr	r3, [r0, #1972]
	ldrh	r3, [r3, #28]
	cbz	r3, .L778
	bl	crc_wrong
	cbnz	r0, .L779
.L782:
	movs	r0, #0
.L780:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, pc}
.L779:
	ldr	r0, .L787+20
	b	.L786
.L778:
	ldrb	r3, [r2, #11]	@ zero_extendqisi2
	cmp	r3, #165
	bne	.L781
	ldrb	r3, [r2, #15]	@ zero_extendqisi2
	cmp	r3, #165
	beq	.L782
.L781:
	ldr	r0, .L787+24
	b	.L786
.L788:
	.align	2
.L787:
	.word	.LC83
	.word	.LANCHOR17
	.word	.LC86
	.word	.LC87
	.word	.LC88
	.word	.LC84
	.word	.LC85
	.size	nand_power_off_ecc_error, .-nand_power_off_ecc_error
	.section	.text.recover_phy_page_mapping,"ax",%progbits
	.align	1
	.global	recover_phy_page_mapping
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	recover_phy_page_mapping, %function
recover_phy_page_mapping:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r2
	ldr	r10, .L823+20
	movs	r4, #0
	sub	sp, sp, #32
	mov	r5, r0
	ldr	fp, .L823+24
	mov	r7, r1
	ldr	r2, [r0, #308]
	movs	r1, #255
	mov	r0, r8
	bl	NAND_Memset
.L790:
	ldr	r3, [r5, #4]
	ldrh	r2, [r3, #20]
	cmp	r2, r4
	ble	.L793
	ldrh	r2, [r3, #28]
	mov	r0, r5
	ldrh	r1, [r7]
	ldr	r3, [r5, #284]
	strh	r2, [sp, #20]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	add	r1, sp, #16
	str	r3, [sp, #24]
	strh	r4, [sp, #16]	@ movhi
	ldr	r3, [r5, #1980]
	str	sp, [sp, #28]
	blx	r3
	mov	r6, r0
	mov	r0, sp
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L791
	cbnz	r6, .L792
.L794:
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L823
	bl	NAND_Print
.L793:
	mov	r0, r4
	b	.L789
.L792:
	cmp	r6, #10
	beq	.L794
.L791:
	mov	r0, sp
	bl	is_ftl_logic_page_data
	cmp	r0, #1
	bne	.L795
	cbz	r6, .L796
	cmp	r6, #10
	bne	.L797
.L796:
	mov	r2, sp
	ldr	r1, [r5, #284]
	mov	r0, r5
	bl	nand_power_off_ecc_error
	cbz	r0, .L798
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L823+4
	bl	NAND_Print
.L797:
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L823+8
	bl	NAND_Print
	movw	r0, #65535
.L789:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L798:
	mov	r0, sp
	bl	get_logic_page_from_oob
	str	r0, [r8, r4, lsl #2]
	mov	r3, r0
	ldr	r2, [r5, #28]
	cmp	r0, r2
	bcc	.L799
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L823+12
	bl	NAND_Print
	mov	r3, #-1
	str	r3, [r8, r4, lsl #2]
.L799:
	cbz	r6, .L804
	cmp	r6, #10
	bne	.L797
.L804:
	adds	r4, r4, #1
	b	.L790
.L795:
	ldrb	r3, [sp, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L800
	ldr	r0, .L823+16
	mov	r1, r4
.L822:
	bl	NAND_Print
	b	.L799
.L800:
	mov	r0, sp
	bl	is_power_down_info_page
	cmp	r0, #1
	bne	.L801
	cbz	r6, .L802
	cmp	r6, #10
	bne	.L797
.L802:
	mov	r0, sp
	bl	get_special_data_from_oob
	mov	r1, r4
	str	r0, [r8, r4, lsl #2]
	mov	r0, fp
	b	.L822
.L801:
	mov	r1, r4
	mov	r0, r10
	b	.L822
.L824:
	.align	2
.L823:
	.word	.LC89
	.word	.LC90
	.word	.LC95
	.word	.LC91
	.word	.LC92
	.word	.LC94
	.word	.LC93
	.size	recover_phy_page_mapping, .-recover_phy_page_mapping
	.section	.text.recover_block_phy_page_mapping,"ax",%progbits
	.align	1
	.global	recover_block_phy_page_mapping
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	recover_block_phy_page_mapping, %function
recover_block_phy_page_mapping:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r10, r2
	movs	r4, #0
	ldr	r2, [r0, #308]
	sub	sp, sp, #40
	mov	r5, r0
	mov	r7, r1
	mov	r0, r10
	movs	r1, #255
	bl	NAND_Memset
.L826:
	ldr	r2, [r5, #4]
	ldrh	r3, [r2, #20]
	subs	r3, r3, #1
	cmp	r3, r4
	bgt	.L837
	movs	r0, #0
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L837:
	ldr	r3, [r5, #1972]
	uxth	r0, r4
	ldrh	r1, [r7]
	add	r6, sp, #8
	ldrh	r3, [r3, #28]
	cmp	r3, #0
	beq	.L827
	ldr	r3, [r5, #284]
	ldrh	r2, [r2, #28]
	strh	r0, [sp, #24]	@ movhi
	strh	r1, [sp, #26]	@ movhi
	strh	r2, [sp, #28]	@ movhi
.L848:
	mov	fp, #0
	strd	r3, r6, [sp, #32]
.L831:
	ldr	r3, [r5, #1980]
	add	r1, sp, #24
	mov	r0, r5
	blx	r3
	subs	r8, r0, #0
	bge	.L829
	mov	r3, r4
	ldrh	r2, [r7]
	mov	r1, r8
	ldr	r0, .L849
	bl	NAND_Print
	cmp	fp, #0
	beq	.L838
	ldrh	r2, [r7]
	mov	r3, r4
	str	fp, [sp]
	mov	r1, r8
	ldr	r0, .L849+4
	bl	NAND_Print
.L829:
	mov	r0, r6
	bl	is_ftl_logic_page_data
	cmp	r0, #1
	bne	.L832
	cmp	r8, #0
	beq	.L833
	cmp	r8, #10
	bne	.L834
.L833:
	mov	r2, r6
	ldr	r1, [r5, #284]
	mov	r0, r5
	bl	nand_power_off_ecc_error
	cbz	r0, .L835
	ldr	r0, .L849+8
	bl	NAND_Print
.L834:
	adds	r4, r4, #1
	b	.L826
.L827:
	strh	r0, [sp, #24]	@ movhi
	strh	r1, [sp, #26]	@ movhi
	strh	r3, [sp, #28]	@ movhi
	b	.L848
.L838:
	mov	fp, #1
	b	.L831
.L835:
	mov	r0, r6
	bl	get_logic_page_from_oob
	str	r0, [r10, r4, lsl #2]
	mov	r3, r0
	ldr	r2, [r5, #28]
	cmp	r0, r2
	bcc	.L834
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L849+12
	bl	NAND_Print
	mov	r3, #-1
	str	r3, [r10, r4, lsl #2]
	b	.L834
.L832:
	mov	r0, r6
	bl	is_nouse_page
	cmp	r0, #1
	beq	.L834
	mov	r2, r4
	ldrh	r1, [r7]
	ldr	r0, .L849+16
	bl	NAND_Print
	b	.L834
.L850:
	.align	2
.L849:
	.word	.LC96
	.word	.LC97
	.word	.LC98
	.word	.LC91
	.word	.LC99
	.size	recover_block_phy_page_mapping, .-recover_block_phy_page_mapping
	.section	.text.get_used_page_num,"ax",%progbits
	.align	1
	.global	get_used_page_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_used_page_num, %function
get_used_page_num:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r0
	mov	fp, r2
	mov	r5, r3
	sub	sp, sp, #104
	movs	r4, #0
	str	r1, [sp, #64]
	str	r4, [r2]
.L852:
	ldr	r3, [r6, #4]
	ldrh	r2, [r3, #20]
	cmp	r2, r4
	bhi	.L863
.L851:
	mov	r0, r4
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L863:
	cmp	r5, #0
	beq	.L853
	ldr	r2, [r5, #4]
	ldrb	r2, [r2, r4]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L853
	ldrh	r7, [r3, #26]
	ldr	r2, [r5, #8]
	add	r8, r7, #64
	mla	r8, r4, r8, r2
	add	r7, r7, r8
.L854:
	ldr	r2, [sp, #64]
	uxth	r0, r4
	ldrh	r1, [r2]
	ldr	r2, [r6, #1972]
	ldrh	r2, [r2, #28]
	cmp	r2, #0
	beq	.L855
	ldrh	r3, [r3, #28]
	strh	r0, [sp, #88]	@ movhi
	strh	r1, [sp, #90]	@ movhi
	strh	r3, [sp, #92]	@ movhi
	str	r8, [sp, #96]
.L901:
	str	r7, [sp, #100]
	add	r1, sp, #88
	ldr	r3, [r6, #1980]
	mov	r0, r6
	blx	r3
	mov	r10, r0
	cbz	r0, .L857
	cmp	r0, #10
	beq	.L857
	ldr	r3, [sp, #64]
	mov	r2, r4
	ldr	r0, .L903
	ldrh	r1, [r3]
	bl	NAND_Print
	ldr	r3, [fp]
	adds	r3, r3, #1
	str	r3, [fp]
.L857:
	mov	r0, r7
	bl	is_nouse_page
	cmp	r0, #1
	beq	.L874
	adds	r3, r4, #1
	cmp	r10, #0
	beq	.L859
	cmp	r10, #10
	bne	.L860
.L859:
	cmp	r8, #0
	beq	.L860
	mov	r2, r7
	mov	r1, r8
	mov	r0, r6
	str	r3, [sp, #68]
	bl	nand_power_off_ecc_error
	ldr	r3, [sp, #68]
	cbz	r0, .L862
	ldr	r0, .L903+4
	bl	NAND_Print
	ldr	r3, [sp, #68]
.L860:
	mov	r4, r3
	b	.L852
.L853:
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	cmp	r2, #8
	ittee	eq
	ldreq	r8, [r6, #284]
	addeq	r7, sp, #72
	addne	r7, sp, #72
	movne	r8, #0
	b	.L854
.L855:
	strh	r0, [sp, #88]	@ movhi
	strh	r1, [sp, #90]	@ movhi
	strh	r2, [sp, #92]	@ movhi
	str	r2, [sp, #96]
	b	.L901
.L862:
	ldr	r2, [r5, #4]
	movs	r1, #1
	strb	r1, [r2, r4]
	ldr	r2, [r5]
	cmp	r2, r3
	it	cc
	strcc	r3, [r5]
	b	.L860
.L871:
	cmp	r5, #0
	beq	.L876
	ldr	r2, [r5, #4]
	ldrb	r2, [r2, r7]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L876
	ldrh	r2, [r3, #26]
	ldr	r1, [r5, #8]
	add	r8, r2, #64
	mla	r8, r7, r8, r1
	add	fp, r8, r2
.L864:
	ldr	r1, [r6, #1972]
	uxth	ip, r7
	ldr	r2, [sp, #64]
	ldrh	r1, [r1, #28]
	ldrh	r0, [r2]
	cmp	r1, #0
	beq	.L865
	ldrh	r3, [r3, #28]
	strh	ip, [sp, #88]	@ movhi
	strh	r0, [sp, #90]	@ movhi
	strh	r3, [sp, #92]	@ movhi
	str	r8, [sp, #96]
.L902:
	ldr	r3, [r6, #1980]
	add	r1, sp, #88
	str	fp, [sp, #100]
	mov	r0, r6
	blx	r3
	str	r0, [sp, #68]
	mov	r0, fp
	bl	is_nouse_page
	cmp	r0, #1
	add	r10, r7, #1
	beq	.L868
	ldrb	r0, [fp, #15]	@ zero_extendqisi2
	ldr	r2, [sp, #64]
	ldrb	r3, [fp]	@ zero_extendqisi2
	ldrh	r1, [r2]
	str	r0, [sp, #56]
	ldrb	r0, [fp, #14]	@ zero_extendqisi2
	str	r0, [sp, #52]
	ldrb	r0, [fp, #13]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [fp, #12]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [fp, #11]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [fp, #10]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [fp, #9]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [fp, #8]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [fp, #7]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [fp, #6]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [fp, #5]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [fp, #4]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [fp, #3]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [fp, #2]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r2, [fp, #1]	@ zero_extendqisi2
	ldr	r0, .L903+8
	str	r2, [sp]
	mov	r2, r7
	bl	NAND_Print
	ldr	r3, [sp, #68]
	cbz	r3, .L869
	cmp	r3, #10
	bne	.L868
.L869:
	cmp	r8, #0
	beq	.L868
	ldr	r3, [r5, #4]
	movs	r2, #1
	strb	r2, [r3, r7]
	ldr	r3, [r5]
	cmp	r3, r10
	it	cc
	strcc	r10, [r5]
.L868:
	mov	r7, r10
.L858:
	ldr	r3, [r6, #4]
	ldrh	r2, [r3, #20]
	cmp	r2, r7
	bhi	.L871
	b	.L851
.L876:
	add	fp, sp, #72
	mov	r8, #0
	b	.L864
.L865:
	strh	ip, [sp, #88]	@ movhi
	strh	r0, [sp, #90]	@ movhi
	strh	r1, [sp, #92]	@ movhi
	str	r1, [sp, #96]
	b	.L902
.L874:
	mov	r7, r4
	b	.L858
.L904:
	.align	2
.L903:
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.size	get_used_page_num, .-get_used_page_num
	.section	.text.get_used_page_num_no_crosstalk,"ax",%progbits
	.align	1
	.global	get_used_page_num_no_crosstalk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_used_page_num_no_crosstalk, %function
get_used_page_num_no_crosstalk:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r3
	movs	r3, #0
	mov	r8, r0
	mov	r10, r3
	mov	fp, r3
	mov	r4, #-1
	mov	r5, r3
	sub	sp, sp, #48
	str	r3, [r2]
	str	r1, [sp, #4]
.L906:
	ldr	r2, [r8, #4]
	ldrh	r3, [r2, #20]
	cmp	r3, r5
	bhi	.L915
	adds	r2, r4, #1
	bne	.L913
	mov	r4, r3
.L916:
	mov	r0, r4
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L915:
	cbz	r6, .L907
	ldr	r3, [r6, #4]
	ldrb	r3, [r3, r5]	@ zero_extendqisi2
	cbnz	r3, .L907
	ldrh	r7, [r2, #26]
	ldr	r3, [r6, #8]
	add	r1, r7, #64
	mla	r3, r5, r1, r3
	add	r7, r7, r3
.L908:
	ldr	r1, [sp, #4]
	mov	r0, r8
	ldrh	r2, [r2, #28]
	str	r3, [sp, #40]
	ldrh	r1, [r1]
	strh	r2, [sp, #36]	@ movhi
	strh	r5, [sp, #32]	@ movhi
	strh	r1, [sp, #34]	@ movhi
	add	r1, sp, #32
	str	r7, [sp, #44]
	ldr	r2, [r8, #1980]
	str	r3, [sp, #8]
	blx	r2
	ldr	r3, [sp, #8]
	cbz	r0, .L909
	cmp	r0, #10
	beq	.L909
	ldr	r3, [sp, #4]
	cmp	r4, #-1
	it	eq
	moveq	r4, r5
	mov	r2, r5
	ldr	r0, .L936
	ldrh	r1, [r3]
	bl	NAND_Print
.L910:
	adds	r5, r5, #1
	b	.L906
.L907:
	ldrb	r3, [r2, #8]	@ zero_extendqisi2
	cmp	r3, #4
	ittee	eq
	ldreq	r3, [r8, #284]
	addeq	r7, sp, #16
	addne	r7, sp, #16
	movne	r3, #0
	b	.L908
.L909:
	mov	r0, r7
	str	r3, [sp, #8]
	bl	is_nouse_page
	cmp	r0, #1
	ldr	r3, [sp, #8]
	bne	.L911
	add	r10, r10, #1
	cmp	r4, #-1
	it	eq
	moveq	r4, r5
	cmp	r10, #3
	bne	.L910
.L913:
	cmp	fp, r4
	beq	.L916
	ldr	r1, [sp, #4]
	mov	r3, r4
	mov	r2, fp
	ldr	r0, .L936+4
	ldrh	r1, [r1]
	bl	NAND_Print
	ldr	r2, [r8, #1968]
	ldr	r3, [r2, #168]
	adds	r3, r3, #1
	str	r3, [r2, #168]
	movs	r3, #0
.L917:
	ldr	r2, [r6]
	cmp	r2, r3
	bls	.L916
	ldr	r2, [r6, #4]
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	cbz	r2, .L918
	ldr	r2, [r8, #4]
	ldr	r1, [r6, #8]
	ldrh	r0, [r2, #26]
	add	r1, r1, r0
	add	r2, r0, #64
	mla	r2, r3, r2, r1
	ldr	r1, [r8, #1968]
	ldr	r1, [r1, #168]
	strb	r1, [r2, #14]
.L918:
	adds	r3, r3, #1
	b	.L917
.L911:
	mov	r2, r7
	mov	r1, r3
	mov	r0, r8
	bl	nand_power_off_ecc_error
	cbz	r0, .L914
	ldr	r0, .L936+8
	bl	NAND_Print
	b	.L910
.L914:
	adds	r1, r4, #1
	add	fp, fp, #1
	bne	.L910
	ldr	r2, [r6, #4]
	movs	r1, #1
	adds	r3, r5, #1
	mov	r0, r7
	str	r3, [sp, #12]
	strb	r1, [r2, r5]
	ldr	r2, [r6, #12]
	str	r2, [sp, #8]
	bl	get_logic_page_from_oob
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #12]
	str	r0, [r2, r5, lsl #2]
	ldr	r2, [r6]
	cmp	r2, r3
	it	cc
	strcc	r3, [r6]
	b	.L910
.L937:
	.align	2
.L936:
	.word	.LC103
	.word	.LC105
	.word	.LC104
	.size	get_used_page_num_no_crosstalk, .-get_used_page_num_no_crosstalk
	.section	.text.new_block_init_for_write,"ax",%progbits
	.align	1
	.global	new_block_init_for_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	new_block_init_for_write, %function
new_block_init_for_write:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	push	{r4, r5, r6, r7, lr}
	mov	r7, r2
	ldrh	r2, [r1]
	sub	sp, sp, #20
	movs	r6, #0
	mov	r5, r1
	ldrh	r3, [r3, #28]
	mov	r1, sp
	strh	r2, [sp, #2]	@ movhi
	mov	r4, r0
	strh	r6, [sp]	@ movhi
	strh	r3, [sp, #4]	@ movhi
	strd	r6, r6, [sp, #8]
	ldr	r3, [r0, #1976]
	blx	r3
	ldrh	r3, [r5, #6]
	ldr	r2, [r4, #376]
	strh	r6, [r5, #4]	@ movhi
	adds	r3, r3, #1
	uxth	r3, r3
	cmp	r3, r2
	strh	r3, [r5, #6]	@ movhi
	bls	.L939
	ldr	r2, [r4, #4]
	ldrh	r2, [r2, #16]
	cmp	r2, r3
	it	hi
	strhi	r3, [r4, #376]
.L939:
	str	r7, [r5, #8]
	cbz	r0, .L938
	ldr	r3, [r4, #1996]
	mov	r1, sp
	mov	r0, r4
	blx	r3
	ldr	r0, .L944
	bl	NAND_Print
	movs	r0, #1
.L938:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L945:
	.align	2
.L944:
	.word	.LC106
	.size	new_block_init_for_write, .-new_block_init_for_write
	.section	.text.check_invalid_page_right,"ax",%progbits
	.align	1
	.global	check_invalid_page_right
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_invalid_page_right, %function
check_invalid_page_right:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	movs	r4, #0
	ldr	fp, .L955+4
	mov	r8, r0
	mov	r10, r1
	mov	r7, r2
	mov	r6, r3
	mov	r5, r4
.L947:
	cmp	r6, r5
	bhi	.L952
	ldrh	r2, [r7, #4]
	cmp	r2, r4
	beq	.L954
	mov	r3, r6
	mov	r1, r4
	ldr	r0, .L955
	bl	NAND_Print
	movs	r0, #1
.L946:
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L952:
	ldr	r3, [r10, #8]
	ldr	r1, [r3, r5, lsl #2]
	adds	r3, r1, #1
	beq	.L948
	mov	r0, r8
	bl	get_logic_page_map
	cbnz	r0, .L949
	mov	r0, fp
	bl	NAND_Print_DBG
.L948:
	adds	r4, r4, #1
	b	.L950
.L949:
	ldrh	r2, [r0, #2]
	ldrh	r3, [r7]
	cmp	r2, r3
	bne	.L948
	ldrh	r3, [r0]
	ubfx	r3, r3, #0, #12
	cmp	r3, r5
	bne	.L948
.L950:
	adds	r5, r5, #1
	b	.L947
.L954:
	movs	r0, #0
	b	.L946
.L956:
	.align	2
.L955:
	.word	.LC108
	.word	.LC107
	.size	check_invalid_page_right, .-check_invalid_page_right
	.section	.text.nftl_ops_init,"ax",%progbits
	.align	1
	.global	nftl_ops_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_ops_init, %function
nftl_ops_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L958
	str	r3, [r0, #1976]
	ldr	r3, .L958+4
	str	r3, [r0, #1980]
	ldr	r3, .L958+8
	str	r3, [r0, #1984]
	ldr	r3, .L958+12
	str	r3, [r0, #1992]
	ldr	r3, .L958+16
	str	r3, [r0, #1996]
	ldr	r3, .L958+20
	str	r3, [r0, #1988]
	ldr	r3, .L958+24
	str	r3, [r0, #2004]
	ldr	r3, .L958+28
	str	r3, [r0, #2008]
	ldr	r3, .L958+32
	str	r3, [r0, #2000]
	ldr	r3, .L958+36
	str	r3, [r0, #2012]
	bx	lr
.L959:
	.align	2
.L958:
	.word	_nftl_nand_erase_superblk
	.word	_nftl_nand_read_page
	.word	_nftl_nand_write_page
	.word	_nftl_nand_is_blk_good
	.word	_nftl_nand_mark_bad_blk
	.word	_nftl_nand_copy_page
	.word	_nftl_nand_read_logic_page
	.word	_nftl_nand_read_logic_history_page
	.word	_nftl_nand_write_logic_page
	.word	_nftl_discard_logic_page
	.size	nftl_ops_init, .-nftl_ops_init
	.section	.text.current_block_at_last_page,"ax",%progbits
	.align	1
	.global	current_block_at_last_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	current_block_at_last_page, %function
current_block_at_last_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldrh	r0, [r1, #28]
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	subs	r3, r3, r0
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	bx	lr
	.size	current_block_at_last_page, .-current_block_at_last_page
	.section	.text.current_block_at_first_page,"ax",%progbits
	.align	1
	.global	current_block_at_first_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	current_block_at_first_page, %function
current_block_at_first_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r0, [r1, #28]
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.size	current_block_at_first_page, .-current_block_at_first_page
	.section	.text.nftl_get_boot_cnt,"ax",%progbits
	.align	1
	.global	nftl_get_boot_cnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_boot_cnt, %function
nftl_get_boot_cnt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #1968]
	ldr	r0, [r3, #140]
	bx	lr
	.size	nftl_get_boot_cnt, .-nftl_get_boot_cnt
	.section	.text.nftl_get_zone_cap,"ax",%progbits
	.align	1
	.global	nftl_get_zone_cap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_zone_cap, %function
nftl_get_zone_cap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #24]
	bx	lr
	.size	nftl_get_zone_cap, .-nftl_get_zone_cap
	.section	.text.nftl_get_zone_priv,"ax",%progbits
	.align	1
	.global	nftl_get_zone_priv
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_zone_priv, %function
nftl_get_zone_priv:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0]
	bx	lr
	.size	nftl_get_zone_priv, .-nftl_get_zone_priv
	.section	.text.nftl_get_zone_write_cache_nums,"ax",%progbits
	.align	1
	.global	nftl_get_zone_write_cache_nums
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_get_zone_write_cache_nums, %function
nftl_get_zone_write_cache_nums:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r0, [r0, #588]
	bx	lr
	.size	nftl_get_zone_write_cache_nums, .-nftl_get_zone_write_cache_nums
	.section	.text.print_smart,"ax",%progbits
	.align	1
	.global	print_smart
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_smart, %function
print_smart:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #356]
	push	{r4, lr}
	cmp	r3, #0
	beq	.L966
	ldr	r4, [r0, #1968]
	ldr	r0, .L968
	ldr	r1, [r4, #112]
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #64]
	ldr	r0, .L968+4
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #72]
	ldr	r0, .L968+8
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #80]
	ldr	r0, .L968+12
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #88]
	ldr	r0, .L968+16
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #96]
	ldr	r0, .L968+20
	bl	NAND_Print_DBG
	ldrd	r2, [r4, #104]
	ldr	r0, .L968+24
	bl	NAND_Print_DBG
	ldr	r1, [r4, #116]
	ldr	r0, .L968+28
	bl	NAND_Print_DBG
	ldr	r1, [r4, #120]
	ldr	r0, .L968+32
	bl	NAND_Print_DBG
	ldr	r1, [r4, #124]
	ldr	r0, .L968+36
	bl	NAND_Print_DBG
	ldr	r1, [r4, #128]
	ldr	r0, .L968+40
	bl	NAND_Print_DBG
	ldr	r1, [r4, #180]
	ldr	r0, .L968+44
	bl	NAND_Print_DBG
	ldr	r1, [r4, #132]
	ldr	r0, .L968+48
	bl	NAND_Print_DBG
	ldr	r1, [r4, #136]
	ldr	r0, .L968+52
	bl	NAND_Print_DBG
	ldr	r1, [r4, #140]
	ldr	r0, .L968+56
	bl	NAND_Print_DBG
	ldr	r1, [r4, #144]
	ldr	r0, .L968+60
	bl	NAND_Print_DBG
	ldr	r1, [r4, #148]
	ldr	r0, .L968+64
	bl	NAND_Print_DBG
	ldr	r1, [r4, #152]
	ldr	r0, .L968+68
	bl	NAND_Print_DBG
	ldr	r1, [r4, #156]
	ldr	r0, .L968+72
	bl	NAND_Print_DBG
	ldr	r1, [r4, #160]
	ldr	r0, .L968+76
	bl	NAND_Print_DBG
	ldr	r1, [r4, #164]
	ldr	r0, .L968+80
	bl	NAND_Print_DBG
	ldr	r1, [r4, #168]
	ldr	r0, .L968+84
	bl	NAND_Print_DBG
	ldr	r1, [r4, #172]
	ldr	r0, .L968+88
	bl	NAND_Print_DBG
	ldr	r1, [r4, #176]
	ldr	r0, .L968+92
	pop	{r4, lr}
	b	NAND_Print_DBG
.L966:
	pop	{r4, pc}
.L969:
	.align	2
.L968:
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LC121
	.word	.LC122
	.word	.LC123
	.word	.LC124
	.word	.LC125
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC132
	.size	print_smart, .-print_smart
	.section	.text.init_smart_info,"ax",%progbits
	.align	1
	.global	init_smart_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	init_smart_info, %function
init_smart_info:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #320
	mov	r4, r0
	sub	sp, sp, #32
	mov	r5, r1
	movs	r1, #0
	ldr	r0, [r0, #1968]
	bl	NAND_Memset
	ldr	r3, [r4, #1968]
	ldr	r6, .L984
	ldr	r2, [r3, #140]
	str	r6, [r3, #112]
	adds	r2, r2, #1
	str	r2, [r3, #140]
	cmp	r5, #0
	beq	.L971
	ldr	r3, [r4, #4]
	ldrh	r0, [r5]
	ldr	r2, [r4, #284]
	ldrh	r1, [r3, #28]
	ldrh	r3, [r3, #20]
	strh	r0, [sp, #18]	@ movhi
	mov	r0, r4
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	subs	r3, r3, #1
	str	r2, [sp, #24]
	strh	r3, [sp, #16]	@ movhi
	str	sp, [sp, #28]
	ldr	r3, [r4, #1980]
	blx	r3
	mov	r5, r0
	mov	r0, sp
	bl	is_phy_mapping_page
	cmp	r0, #1
	bne	.L973
	cbz	r5, .L974
	cmp	r5, #10
	bne	.L973
.L974:
	ldr	r3, [r4, #308]
	ldr	r1, [r4, #284]
	add	r1, r1, r3
	ldr	r3, [r1, #112]
	cmp	r3, r6
	bne	.L973
	mov	r2, #320
	ldr	r0, [r4, #1968]
	bl	NAND_Memcpy
	ldr	r3, [r4, #1968]
	ldr	r2, [r3, #140]
	adds	r2, r2, #1
	str	r2, [r3, #140]
	ldr	r2, [r3, #164]
	adds	r2, r2, #1
	itt	eq
	moveq	r2, #0
	streq	r2, [r3, #164]
	ldr	r2, [r3, #172]
	adds	r2, r2, #1
	itt	eq
	moveq	r2, #0
	streq	r2, [r3, #172]
	ldr	r2, [r3, #176]
	adds	r2, r2, #1
	itt	eq
	moveq	r2, #0
	streq	r2, [r3, #176]
.L973:
	mov	r0, r4
	bl	print_smart
.L971:
	movs	r0, #0
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L985:
	.align	2
.L984:
	.word	-1431655935
	.size	init_smart_info, .-init_smart_info
	.section	.text.print_nftl_zone,"ax",%progbits
	.align	1
	.global	print_nftl_zone
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_nftl_zone, %function
print_nftl_zone:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #356]
	cmp	r3, #0
	beq	.L986
	ldr	r0, .L992
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldr	r0, .L992+4
	ldrh	r1, [r3, #24]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldr	r0, .L992+8
	ldrh	r1, [r3, #26]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldr	r0, .L992+12
	ldrh	r1, [r3, #20]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldr	r0, .L992+16
	ldrh	r1, [r3, #16]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldr	r0, .L992+20
	ldrh	r1, [r3, #30]
	bl	NAND_Print_DBG
	ldr	r1, [r4, #356]
	ldr	r0, .L992+24
	bl	NAND_Print_DBG
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	ldr	r0, .L992+28
	bl	NAND_Print_DBG
	ldrb	r1, [r4, #17]	@ zero_extendqisi2
	ldr	r0, .L992+32
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #18]
	ldr	r0, .L992+36
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #20]
	ldr	r0, .L992+40
	bl	NAND_Print_DBG
	ldr	r1, [r4, #24]
	ldr	r0, .L992+44
	bl	NAND_Print_DBG
	ldr	r1, [r4, #32]
	ldr	r0, .L992+48
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #22]
	ldr	r0, .L992+52
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #380]
	ldr	r0, .L992+56
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #382]
	ldr	r0, .L992+60
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #388]
	ldr	r0, .L992+64
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #384]
	ldr	r0, .L992+68
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #394]
	ldr	r0, .L992+72
	bl	NAND_Print_DBG
	ldr	r3, [r4, #40]
	ldr	r0, .L992+76
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #44]
	ldr	r0, .L992+80
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	add	r3, r4, #272
	ldm	r3, {r0, r1, r2}
	add	r3, r4, #260
	stm	sp, {r0, r1, r2}
	ldr	r0, .L992+84
	ldm	r3, {r1, r2, r3}
	bl	NAND_Print_DBG
	add	r3, r4, #308
	ldm	r3, {r0, r1, r2}
	add	r3, r4, #296
	stm	sp, {r0, r1, r2}
	ldr	r0, .L992+88
	ldm	r3, {r1, r2, r3}
	bl	NAND_Print_DBG
	ldr	r1, [r4, #292]
	ldr	r0, .L992+92
	bl	NAND_Print_DBG
	ldr	r3, [r4, #292]
	ldr	r0, .L992+96
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #320]
	ldr	r0, .L992+100
	bl	NAND_Print_DBG
	ldr	r3, [r4, #292]
	ldr	r0, .L992+104
	ldr	r1, [r3, #8]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #48]
	ldr	r0, .L992+108
	ldrh	r2, [r3, #6]
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L988
	add	r3, r4, #340
	ldm	r3, {r0, r1, r2}
	add	r3, r4, #328
	stm	sp, {r0, r1, r2}
	ldr	r0, .L992+112
	ldm	r3, {r1, r2, r3}
	bl	NAND_Print_DBG
	ldr	r1, [r4, #324]
	ldr	r0, .L992+116
	bl	NAND_Print_DBG
	ldr	r3, [r4, #324]
	ldr	r0, .L992+120
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #352]
	ldr	r0, .L992+124
	bl	NAND_Print_DBG
	ldr	r3, [r4, #324]
	ldr	r0, .L992+128
	ldr	r1, [r3, #8]
	bl	NAND_Print_DBG
.L988:
	ldr	r1, [r4, #360]
	ldr	r0, .L992+132
	bl	NAND_Print_DBG
	ldr	r1, [r4, #284]
	ldr	r0, .L992+136
	bl	NAND_Print_DBG
	ldr	r1, [r4, #376]
	ldr	r0, .L992+140
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #584]
	ldr	r0, .L992+144
	bl	NAND_Print_DBG
	ldr	r1, [r4, #368]
	ldr	r0, .L992+148
	bl	NAND_Print_DBG
	ldr	r1, [r4, #372]
	ldr	r0, .L992+152
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+156
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+160
	ldrh	r1, [r3, #2]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+164
	ldrh	r1, [r3, #4]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+168
	ldrh	r1, [r3, #6]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+172
	ldrh	r1, [r3, #10]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+176
	ldrh	r1, [r3, #12]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+180
	ldrh	r1, [r3, #14]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+184
	ldrh	r1, [r3, #16]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+188
	ldrh	r1, [r3, #18]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+192
	ldrh	r1, [r3, #20]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+196
	ldrh	r1, [r3, #22]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+200
	ldrh	r1, [r3, #24]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+204
	ldrh	r1, [r3, #26]
	bl	NAND_Print_DBG
	ldr	r3, [r4, #1972]
	ldr	r0, .L992+208
	ldr	r1, [r3, #32]
	bl	NAND_Print_DBG
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	b	print_smart
.L986:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L993:
	.align	2
.L992:
	.word	.LC133
	.word	.LC134
	.word	.LC135
	.word	.LC136
	.word	.LC137
	.word	.LC138
	.word	.LC139
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC149
	.word	.LC150
	.word	.LC151
	.word	.LC152
	.word	.LC153
	.word	.LC154
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC161
	.word	.LC162
	.word	.LC163
	.word	.LC164
	.word	.LC165
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC170
	.word	.LC171
	.word	.LC172
	.word	.LC173
	.word	.LC174
	.word	.LC175
	.word	.LC176
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC182
	.word	.LC183
	.word	.LC184
	.word	.LC185
	.size	print_nftl_zone, .-print_nftl_zone
	.section	.text.nftl_set_zone_test,"ax",%progbits
	.align	1
	.global	nftl_set_zone_test
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_set_zone_test, %function
nftl_set_zone_test:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r1, [r0, #356]
	b	print_nftl_zone
	.size	nftl_set_zone_test, .-nftl_set_zone_test
	.section	.text.add_free_list,"ax",%progbits
	.align	1
	.global	add_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_free_list, %function
add_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	adds	r0, r0, #152
	push	{r4, lr}
.L996:
	ldr	r3, [r0, #20]
	cbnz	r3, .L998
	str	r1, [r0, #20]
	str	r3, [r1, #20]
	b	.L1000
.L998:
	ldrh	r2, [r3, #6]
	ldrh	r4, [r1, #6]
	cmp	r4, r2
	bhi	.L999
	str	r1, [r3, #24]
	str	r3, [r1, #20]
	str	r1, [r0, #20]
.L1000:
	str	r0, [r1, #24]
	movs	r0, #0
	pop	{r4, pc}
.L999:
	mov	r0, r3
	b	.L996
	.size	add_free_list, .-add_free_list
	.section	.text.del_free_list,"ax",%progbits
	.align	1
	.global	del_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_free_list, %function
del_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, [r0, #172]
	cbz	r0, .L1001
	ldr	r2, [r0, #20]
	str	r2, [r3, #172]
	ldr	r2, [r0, #20]
	str	r2, [r3, #172]
	ldr	r2, [r0, #20]
	cbz	r2, .L1001
	adds	r3, r3, #152
	str	r3, [r2, #24]
.L1001:
	bx	lr
	.size	del_free_list, .-del_free_list
	.section	.text.del_free_list_by_block,"ax",%progbits
	.align	1
	.global	del_free_list_by_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_free_list_by_block, %function
del_free_list_by_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #172]
.L1009:
	cbnz	r0, .L1012
	bx	lr
.L1012:
	cmp	r0, r1
	ldr	r3, [r0, #20]
	bne	.L1013
	ldr	r2, [r0, #24]
	str	r3, [r2, #20]
	ldr	r3, [r0, #20]
	cbz	r3, .L1010
	str	r2, [r3, #24]
.L1010:
	movs	r3, #0
	strd	r3, r3, [r0, #20]
	bx	lr
.L1013:
	mov	r0, r3
	b	.L1009
	.size	del_free_list_by_block, .-del_free_list_by_block
	.section	.text.is_block_in_free_list,"ax",%progbits
	.align	1
	.global	is_block_in_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_block_in_free_list, %function
is_block_in_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #172]
.L1018:
	cbnz	r0, .L1020
	bx	lr
.L1020:
	cmp	r0, r1
	beq	.L1021
	ldr	r0, [r0, #20]
	b	.L1018
.L1021:
	movs	r0, #1
	bx	lr
	.size	is_block_in_free_list, .-is_block_in_free_list
	.section	.text.print_free_list,"ax",%progbits
	.align	1
	.global	print_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_free_list, %function
print_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #356]
	push	{r4, r5, r6, lr}
	mov	r4, r0
	cbz	r3, .L1022
	ldr	r0, .L1027
	bl	NAND_Print_DBG
	ldr	r5, .L1027+4
	ldr	r4, [r4, #172]
	ldr	r6, .L1027+8
.L1024:
	cbnz	r4, .L1025
.L1022:
	pop	{r4, r5, r6, pc}
.L1025:
	ldrh	r2, [r4, #6]
	mov	r0, r5
	ldrh	r1, [r4]
	bl	NAND_Print_DBG
	ldr	r1, [r4, #8]
	mov	r0, r6
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #2]
	ldr	r0, .L1027+12
	bl	NAND_Print_DBG
	ldr	r4, [r4, #20]
	b	.L1024
.L1028:
	.align	2
.L1027:
	.word	.LC186
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.size	print_free_list, .-print_free_list
	.section	.text.add_block_invalid_list,"ax",%progbits
	.align	1
	.global	add_block_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_block_invalid_list, %function
add_block_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	adds	r0, r0, #188
	push	{r4, lr}
.L1030:
	ldr	r3, [r0, #12]
	cbnz	r3, .L1032
	str	r1, [r0, #12]
	str	r3, [r1, #12]
	b	.L1034
.L1032:
	ldrh	r2, [r3, #4]
	ldrh	r4, [r1, #4]
	cmp	r4, r2
	bcc	.L1033
	str	r1, [r3, #16]
	str	r3, [r1, #12]
	str	r1, [r0, #12]
.L1034:
	str	r0, [r1, #16]
	movs	r0, #0
	pop	{r4, pc}
.L1033:
	mov	r0, r3
	b	.L1030
	.size	add_block_invalid_list, .-add_block_invalid_list
	.section	.text.del_block_invalid_list,"ax",%progbits
	.align	1
	.global	del_block_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_block_invalid_list, %function
del_block_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, [r0, #200]
	cbz	r0, .L1035
	ldr	r2, [r0, #12]
	str	r2, [r3, #200]
	ldr	r2, [r0, #12]
	cbz	r2, .L1035
	adds	r3, r3, #188
	str	r3, [r2, #16]
.L1035:
	bx	lr
	.size	del_block_invalid_list, .-del_block_invalid_list
	.section	.text.del_block_invalid_list_by_block,"ax",%progbits
	.align	1
	.global	del_block_invalid_list_by_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_block_invalid_list_by_block, %function
del_block_invalid_list_by_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #200]
.L1043:
	cbnz	r0, .L1046
	bx	lr
.L1046:
	cmp	r0, r1
	ldr	r3, [r0, #12]
	bne	.L1047
	ldr	r2, [r0, #16]
	str	r3, [r2, #12]
	ldr	r3, [r0, #12]
	cbz	r3, .L1044
	str	r2, [r3, #16]
.L1044:
	movs	r3, #0
	strd	r3, r3, [r0, #12]
	bx	lr
.L1047:
	mov	r0, r3
	b	.L1043
	.size	del_block_invalid_list_by_block, .-del_block_invalid_list_by_block
	.section	.text.is_block_in_invalid_list,"ax",%progbits
	.align	1
	.global	is_block_in_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	is_block_in_invalid_list, %function
is_block_in_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #200]
.L1052:
	cbnz	r0, .L1054
	bx	lr
.L1054:
	cmp	r0, r1
	beq	.L1055
	ldr	r0, [r0, #12]
	b	.L1052
.L1055:
	movs	r0, #1
	bx	lr
	.size	is_block_in_invalid_list, .-is_block_in_invalid_list
	.section	.text.print_block_invalid_list,"ax",%progbits
	.align	1
	.global	print_block_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_block_invalid_list, %function
print_block_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #356]
	push	{r4, r5, r6, lr}
	mov	r4, r0
	cbz	r3, .L1056
	ldr	r0, .L1061
	bl	NAND_Print_DBG
	ldr	r5, .L1061+4
	ldr	r4, [r4, #200]
	ldr	r6, .L1061+8
.L1058:
	cbnz	r4, .L1059
.L1056:
	pop	{r4, r5, r6, pc}
.L1059:
	ldrh	r2, [r4, #6]
	mov	r0, r5
	ldrh	r1, [r4]
	bl	NAND_Print_DBG
	ldrh	r2, [r4, #4]
	mov	r0, r6
	ldr	r1, [r4, #8]
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #2]
	ldr	r0, .L1061+12
	bl	NAND_Print_DBG
	ldr	r4, [r4, #12]
	b	.L1058
.L1062:
	.align	2
.L1061:
	.word	.LC190
	.word	.LC187
	.word	.LC191
	.word	.LC189
	.size	print_block_invalid_list, .-print_block_invalid_list
	.section	.text.add_block_count_list,"ax",%progbits
	.align	1
	.global	add_block_count_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_block_count_list, %function
add_block_count_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	adds	r0, r0, #224
	push	{r4, lr}
.L1064:
	ldr	r3, [r0, #28]
	cbnz	r3, .L1066
	str	r1, [r0, #28]
	str	r3, [r1, #28]
	b	.L1068
.L1066:
	ldr	r4, [r3, #8]
	ldr	r2, [r1, #8]
	cmp	r4, r2
	blt	.L1067
	str	r1, [r3, #32]
	str	r3, [r1, #28]
	str	r1, [r0, #28]
.L1068:
	str	r0, [r1, #32]
	movs	r0, #0
	pop	{r4, pc}
.L1067:
	mov	r0, r3
	b	.L1064
	.size	add_block_count_list, .-add_block_count_list
	.section	.text.del_block_count_list,"ax",%progbits
	.align	1
	.global	del_block_count_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_block_count_list, %function
del_block_count_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	adds	r0, r0, #224
	ldr	r2, [r3, #252]
	cbz	r2, .L1069
	ldr	r2, [r2, #28]
	str	r2, [r3, #252]
.L1069:
	bx	lr
	.size	del_block_count_list, .-del_block_count_list
	.section	.text.del_block_count_by_block,"ax",%progbits
	.align	1
	.global	del_block_count_by_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_block_count_by_block, %function
del_block_count_by_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #252]
.L1075:
	cbnz	r0, .L1078
	bx	lr
.L1078:
	cmp	r0, r1
	ldr	r3, [r0, #28]
	bne	.L1079
	ldr	r2, [r0, #32]
	str	r3, [r2, #28]
	ldr	r3, [r0, #28]
	cbz	r3, .L1076
	str	r2, [r3, #32]
.L1076:
	movs	r3, #0
	strd	r3, r3, [r0, #28]
	bx	lr
.L1079:
	mov	r0, r3
	b	.L1075
	.size	del_block_count_by_block, .-del_block_count_by_block
	.section	.text.print_block_count_list,"ax",%progbits
	.align	1
	.global	print_block_count_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	print_block_count_list, %function
print_block_count_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #356]
	push	{r4, r5, r6, lr}
	mov	r4, r0
	cbz	r3, .L1083
	ldr	r0, .L1088
	bl	NAND_Print_DBG
	ldr	r5, .L1088+4
	ldr	r4, [r4, #252]
	ldr	r6, .L1088+8
.L1085:
	cbnz	r4, .L1086
.L1083:
	pop	{r4, r5, r6, pc}
.L1086:
	ldrh	r1, [r4]
	mov	r0, r5
	bl	NAND_Print_DBG
	ldr	r1, [r4, #8]
	mov	r0, r6
	bl	NAND_Print_DBG
	ldr	r4, [r4, #28]
	b	.L1085
.L1089:
	.align	2
.L1088:
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.size	print_block_count_list, .-print_block_count_list
	.section	.text.put_phy_block_to_free_list,"ax",%progbits
	.align	1
	.global	put_phy_block_to_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	put_phy_block_to_free_list, %function
put_phy_block_to_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r3, r4, r5, lr}
	strd	r2, r2, [r1, #20]
	mov	r5, r0
	bl	add_free_list
	mov	r4, r0
	cbnz	r0, .L1091
	ldrh	r3, [r5, #22]
	adds	r3, r3, #1
	strh	r3, [r5, #22]	@ movhi
.L1090:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L1091:
	ldr	r0, .L1093
	bl	NAND_Print_DBG
	b	.L1090
.L1094:
	.align	2
.L1093:
	.word	.LC195
	.size	put_phy_block_to_free_list, .-put_phy_block_to_free_list
	.section	.text.erase_block,"ax",%progbits
	.align	1
	.global	erase_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	erase_block, %function
erase_block:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r4, r1
	ldr	r0, .L1098
	mov	r8, r2
	movs	r6, #0
	ldrh	r1, [r1]
	bl	NAND_Print
	ldr	r3, [r5, #4]
	mov	r1, sp
	ldrh	r2, [r4]
	mov	r0, r5
	strh	r6, [sp]	@ movhi
	ldrh	r3, [r3, #28]
	strh	r2, [sp, #2]	@ movhi
	strd	r6, r6, [sp, #8]
	strh	r3, [sp, #4]	@ movhi
	ldr	r3, [r5, #1976]
	blx	r3
	mov	r7, r0
	cbz	r0, .L1096
	ldrh	r1, [r4]
	ldr	r0, .L1098+4
	bl	NAND_Print
	ldr	r3, [r5, #1996]
	mov	r1, sp
	mov	r0, r5
	blx	r3
	movs	r3, #255
	strh	r6, [r4, #4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	ldrh	r3, [r5, #20]
	adds	r3, r3, #1
	strh	r3, [r5, #20]	@ movhi
.L1095:
	mov	r0, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L1096:
	mov	r3, #-1
	mov	r1, r4
	str	r3, [r4, #8]
	mov	r0, r5
	strh	r8, [r4, #6]	@ movhi
	bl	put_phy_block_to_free_list
	mov	r1, r4
	mov	r0, r5
	bl	mark_free_block
	ldr	r3, [r5, #4]
	ldrh	r3, [r3, #20]
	strh	r7, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	b	.L1095
.L1099:
	.align	2
.L1098:
	.word	.LC196
	.word	.LC197
	.size	erase_block, .-erase_block
	.section	.text.panic_recover_data,"ax",%progbits
	.align	1
	.global	panic_recover_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_recover_data, %function
panic_recover_data:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #40
	ldr	r4, .L1119
	ldr	r5, [r4]
	cbnz	r5, .L1101
	ldr	r0, .L1119+4
	bl	NAND_Print
.L1118:
	movs	r0, #0
	b	.L1100
.L1101:
	ldr	r6, [r0, #12]
	ldr	r0, .L1119+8
	ldr	r7, [r6, #4]
	bl	NAND_Print
	ldrh	r0, [r7, #26]
	bl	NAND_Malloc
	mov	fp, r0
	cbnz	r0, .L1103
	mov	r2, #308
	ldr	r1, .L1119+12
	ldr	r0, .L1119+16
	bl	NAND_Print
	mov	r0, #-1
.L1100:
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1103:
	ldrh	r2, [r7, #26]
	movs	r1, #0
	bl	NAND_Memset
	movs	r3, #0
.L1117:
	str	r3, [r4, #16]
	ldr	r3, [r4, #16]
	cmp	r3, #2
	bhi	.L1111
	ldr	r3, [r4, r3, lsl #2]
	str	r3, [sp]
	movs	r3, #0
.L1116:
	str	r3, [r4, #20]
	ldrh	r2, [r7, #20]
	ldr	r3, [r4, #20]
	cmp	r3, r2
	bcc	.L1112
	ldr	r3, [r4, #16]
	adds	r3, r3, #1
	b	.L1117
.L1112:
	ldr	r2, [sp]
	add	r5, sp, #24
	mov	r0, r6
	ldrh	r1, [r2]
	ldrh	r2, [r7, #28]
	strh	r3, [sp, #8]	@ movhi
	strh	r1, [sp, #10]	@ movhi
	add	r1, sp, #8
	ldr	r3, [r6, #1980]
	strh	r2, [sp, #12]	@ movhi
	str	fp, [sp, #16]
	str	r5, [sp, #20]
	blx	r3
	mov	r0, r5
	bl	is_panic_dummy_page
	ldr	r3, [sp]
	ldrh	r8, [r3]
	cbz	r0, .L1106
	ldr	r2, [r4, #20]
	mov	r1, r8
	ldr	r0, .L1119+20
	bl	NAND_Print
.L1107:
	ldr	r3, [r4, #20]
	adds	r3, r3, #1
	b	.L1116
.L1106:
	mov	r0, r5
	bl	is_panic_data_page
	ldr	r10, [r4, #20]
	cbnz	r0, .L1108
	ldr	r3, [r4, #16]
	mov	r2, r10
	mov	r1, r8
	cbnz	r3, .L1109
	cmp	r10, #0
	bne	.L1109
	ldr	r0, .L1119+24
	bl	NAND_Print
.L1110:
	movs	r1, #0
	mov	r0, fp
	bl	NAND_Free
	b	.L1118
.L1109:
	ldr	r0, .L1119+28
	bl	NAND_Print
.L1111:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L1110
	ldr	r1, [r4, r3, lsl #2]
	mov	r0, r6
	ldrh	r2, [r1, #6]
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	ldr	r3, [r4, #16]
	subs	r3, r3, #1
	str	r3, [r4, #16]
	b	.L1111
.L1108:
	movs	r2, #4
	movs	r1, #7
	mov	r0, r5
	bl	get_spare_data
	movs	r2, #4
	str	r0, [sp, #4]
	movs	r1, #11
	mov	r0, r5
	bl	get_spare_data
	mov	r2, r10
	mov	r5, r0
	mov	r1, r8
	ldr	r3, [sp, #4]
	ldr	r0, .L1119+32
	bl	NAND_Print
	mov	r2, fp
	mov	r1, r5
	ldr	r0, [sp, #4]
	bl	nftl_write
	b	.L1107
.L1120:
	.align	2
.L1119:
	.word	.LANCHOR3
	.word	.LC198
	.word	.LC199
	.word	.LANCHOR18
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.size	panic_recover_data, .-panic_recover_data
	.section	.text.torture_block_and_mark,"ax",%progbits
	.align	1
	.global	torture_block_and_mark
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	torture_block_and_mark, %function
torture_block_and_mark:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	sub	sp, sp, #44
	add	r7, sp, #8
	mov	r4, r0
	mov	r5, r1
	movs	r2, #15
	movs	r1, #0
	mov	r0, r7
	bl	memset
	ldrh	r1, [r5]
	ldr	r0, .L1137
	bl	NAND_Print
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	ldrh	r2, [r3, #28]
	movs	r3, #0
	strh	r3, [sp, #24]	@ movhi
	strh	r1, [sp, #26]	@ movhi
	add	r1, sp, #24
	strd	r3, r3, [sp, #32]
	strh	r2, [sp, #28]	@ movhi
	ldr	r3, [r4, #1976]
	blx	r3
	mov	r6, r0
	cbz	r0, .L1122
	ldrh	r1, [r5]
	ldr	r0, .L1137+4
.L1134:
	bl	NAND_Print
	b	.L1123
.L1122:
	ldrh	r3, [r5, #6]
	movs	r1, #165
	ldr	r0, [r4, #284]
	mov	r8, r6
	adds	r3, r3, #1
	strh	r3, [r5, #6]	@ movhi
	ldr	r3, [r4, #4]
	ldrh	r2, [r3, #26]
	bl	NAND_Memset
	movs	r2, #15
	movs	r1, #165
	mov	r0, r7
	bl	NAND_Memset
.L1125:
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	strh	r8, [sp, #24]	@ movhi
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #26]	@ movhi
	add	r1, sp, #24
	strh	r2, [sp, #28]	@ movhi
	strd	r3, r7, [sp, #32]
	ldr	r3, [r4, #1984]
	blx	r3
	mov	r6, r0
	cbz	r0, .L1124
	ldrh	r2, [r5]
	mov	r3, r8
	ldr	r1, .L1137+8
	ldr	r0, .L1137+12
.L1135:
	bl	NAND_Print
.L1123:
	ldr	r3, [r4, #1996]
	add	r1, sp, #24
	mov	r0, r4
	blx	r3
	movs	r3, #0
	strh	r3, [r5, #4]	@ movhi
	movs	r3, #255
	strh	r3, [r5, #2]	@ movhi
	ldrh	r3, [r4, #20]
	adds	r3, r3, #1
	strh	r3, [r4, #20]	@ movhi
	b	.L1121
.L1124:
	add	r8, r8, #1
	cmp	r8, #3
	bne	.L1125
	mov	r8, r0
.L1129:
	ldr	r3, [r4, #4]
	movs	r1, #0
	ldr	r0, [r4, #284]
	ldrh	r2, [r3, #26]
	bl	NAND_Memset
	movs	r2, #15
	movs	r1, #0
	mov	r0, r7
	bl	NAND_Memset
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	strh	r8, [sp, #24]	@ movhi
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #26]	@ movhi
	add	r1, sp, #24
	strh	r2, [sp, #28]	@ movhi
	strd	r3, r7, [sp, #32]
	ldr	r3, [r4, #1980]
	blx	r3
	mov	r6, r0
	cbz	r0, .L1126
	mov	r3, r8
	ldrh	r2, [r5]
	ldr	r1, .L1137+8
	ldr	r0, .L1137+16
	b	.L1135
.L1126:
	ldr	r10, [r4, #4]
	movs	r1, #165
	ldr	r0, [r4, #284]
	ldrh	r2, [r10, #26]
	bl	nftl_check_pattern
	mov	r6, r0
	cbz	r0, .L1127
	ldrh	r2, [r5]
	movs	r3, #165
	ldr	r1, .L1137+8
	ldr	r0, .L1137+20
	str	r3, [sp]
	mov	r3, r8
.L1136:
	bl	NAND_Print
	b	.L1123
.L1127:
	movs	r2, #15
	movs	r1, #165
	mov	r0, r7
	bl	nftl_check_pattern
	mov	r6, r0
	cbz	r0, .L1128
	movs	r3, #165
	ldrh	r2, [r5]
	str	r3, [sp]
	mov	r3, r8
	ldr	r1, .L1137+8
	ldr	r0, .L1137+24
	b	.L1136
.L1128:
	add	r8, r8, #1
	cmp	r8, #3
	bne	.L1129
	ldrh	r3, [r10, #28]
	add	r1, sp, #24
	ldrh	r2, [r5]
	strh	r0, [sp, #24]	@ movhi
	strh	r3, [sp, #28]	@ movhi
	strd	r0, r0, [sp, #32]
	mov	r0, r4
	strh	r2, [sp, #26]	@ movhi
	ldr	r3, [r4, #1976]
	blx	r3
	mov	r6, r0
	cbz	r0, .L1130
	ldrh	r1, [r5]
	ldr	r0, .L1137+28
	b	.L1134
.L1130:
	ldrh	r3, [r5, #6]
	mov	r1, r5
	mov	r0, r4
	adds	r3, r3, #1
	strh	r3, [r5, #6]	@ movhi
	mov	r3, #-1
	str	r3, [r5, #8]
	bl	put_phy_block_to_free_list
	mov	r1, r5
	mov	r0, r4
	bl	mark_free_block
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	strh	r6, [r5, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
.L1121:
	mov	r0, r6
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L1138:
	.align	2
.L1137:
	.word	.LC205
	.word	.LC197
	.word	.LANCHOR19
	.word	.LC206
	.word	.LC207
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.size	torture_block_and_mark, .-torture_block_and_mark
	.section	.text.first_scan_all_blocks,"ax",%progbits
	.align	1
	.global	first_scan_all_blocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	first_scan_all_blocks, %function
first_scan_all_blocks:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #88
	ldr	r4, [r0, #40]
	mov	r5, r0
	movs	r2, #5
	add	r0, sp, #72
	ldr	r1, .L1193
	add	r6, sp, #88
	bl	memcpy
	movs	r3, #47
	ldr	r1, .L1193+4
	strh	r3, [r6, #-32]!	@ movhi
	mov	r0, r6
	bl	nand_fdt_get_string
	cmp	r0, #0
	beq	.L1140
	movs	r2, #3
	add	r1, sp, #72
	bl	NAND_Memcmp
	mov	r7, r0
	cbnz	r0, .L1140
	ldr	r0, .L1193+8
	bl	NAND_Print_DBG
	strh	r7, [r5, #18]	@ movhi
.L1141:
	ldr	r2, [r5, #4]
	mov	r8, #0
	ldrh	r3, [r4]
	ldrh	r2, [r2, #24]
	cmp	r2, r3
	bls	.L1186
	strh	r3, [sp, #74]	@ movhi
	add	r1, sp, #72
	strh	r8, [sp, #72]	@ movhi
	mov	r0, r5
	strh	r8, [sp, #76]	@ movhi
	strd	r8, r6, [sp, #80]
	ldr	r3, [r5, #1992]
	blx	r3
	cmp	r0, #1
	bne	.L1143
	ldr	r3, [r5, #1980]
	add	r1, sp, #72
	mov	r0, r5
	blx	r3
	str	r4, [r5, #44]
	mov	r10, r0
	mov	r0, r6
	bl	get_block_used_count_from_oob
	mov	fp, r0
	mov	r0, r6
	bl	is_ftl_end_flag_page
	cmp	r0, #1
	bne	.L1144
	ldrh	r1, [r4]
	ldr	r0, .L1193+12
	bl	NAND_Print
.L1186:
	mov	r0, r8
	b	.L1139
.L1140:
	mov	r0, #-1
.L1139:
	add	sp, sp, #88
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1144:
	mov	r0, r6
	bl	is_panic_data_page
	cmp	r0, #1
	bne	.L1145
	ldrb	r2, [sp, #59]	@ zero_extendqisi2
	ldrb	r3, [r5, #16]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L1146
	mov	r1, r4
	mov	r0, r6
	bl	panic_recover_info
.L1146:
	adds	r4, r4, #36
	b	.L1141
.L1145:
	mov	r0, r6
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L1147
	ldrh	r3, [r5, #18]
	mov	r1, r4
	mov	r0, r5
	adds	r3, r3, #1
	strh	r3, [r5, #18]	@ movhi
	strh	r8, [r4, #2]	@ movhi
	strh	r8, [r4, #6]	@ movhi
	strh	r8, [r4, #4]	@ movhi
	bl	put_phy_block_to_free_list
	b	.L1146
.L1147:
	mov	r0, r6
	bl	is_ftl_logic_page_data
	cmp	r0, #1
	beq	.L1148
	mov	r0, r6
	bl	is_function_info_page
	cmp	r0, #1
	bne	.L1149
.L1148:
	cmp	r10, #0
	beq	.L1150
	cmp	r10, #10
	bne	.L1149
.L1150:
	ldrh	r3, [r5, #18]
	mov	r8, #1
	mov	r0, r6
	adds	r3, r3, #1
	strh	r3, [r5, #18]	@ movhi
	strh	r8, [r4, #2]	@ movhi
	bl	get_erase_count_from_oob
	movs	r3, #0
	strh	r0, [r4, #6]	@ movhi
	mov	r7, r0
	strh	r3, [r4, #4]	@ movhi
	str	fp, [r4, #8]
	mov	r1, r4
	strd	r3, r3, [r4, #28]
	mov	r0, r5
	bl	add_block_count_list
	cmp	r10, #10
	bne	.L1146
	ldr	r3, [r5, #1972]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1146
	mov	r2, r8
	mov	r0, r5
	bl	add_prio_gc
	ldr	r0, .L1193+16
	bl	NAND_Print_DBG
	b	.L1146
.L1149:
	mov	r0, r6
	bl	is_ftl_start_flag_page
	cmp	r0, #1
	bne	.L1151
	ldr	r0, .L1193+20
.L1185:
	bl	NAND_Print
	b	.L1146
.L1151:
	mov	r0, r6
	bl	is_fill_page
	cmp	r0, #1
	bne	.L1152
	ldrh	r3, [r5, #18]
	mov	r0, r6
	adds	r3, r3, #1
	strh	r3, [r5, #18]	@ movhi
	movs	r3, #0
	strh	r3, [r4, #2]	@ movhi
	bl	get_erase_count_from_oob
	ldr	r3, [r5, #4]
	mov	r1, r4
	strh	r0, [r4, #6]	@ movhi
	mov	r7, r0
	mov	r0, r5
	ldrh	r3, [r3, #20]
	strh	r3, [r4, #4]	@ movhi
	bl	put_phy_block_to_free_list
	ldrh	r1, [r4]
	ldr	r0, .L1193+24
	bl	NAND_Print_DBG
	b	.L1146
.L1152:
	ldrb	r0, [sp, #71]	@ zero_extendqisi2
	ldrh	r1, [r4]
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	str	r0, [sp, #52]
	ldrb	r0, [sp, #70]	@ zero_extendqisi2
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #68]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #67]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #66]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #65]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #64]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #63]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #62]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #61]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #60]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #59]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #58]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L1193+28
	bl	NAND_Print
	uxth	r2, r7
	adds	r3, r2, #1
	strh	r3, [r4, #6]	@ movhi
	cmp	r10, #0
	beq	.L1153
	cmp	r10, #10
	bne	.L1154
.L1153:
	ldrb	r3, [sp, #56]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L1155
	ldrh	r1, [r4]
	ldr	r0, .L1193+32
	bl	NAND_Print
	movs	r3, #255
	strh	r3, [r4, #2]	@ movhi
.L1184:
	ldrh	r3, [r5, #20]
	adds	r3, r3, #1
	strh	r3, [r5, #20]	@ movhi
	b	.L1146
.L1155:
	adds	r2, r2, #2
.L1191:
	uxth	r2, r2
	mov	r1, r4
	mov	r0, r5
	bl	erase_block
.L1188:
	cmp	r0, #0
	bne	.L1146
	ldrh	r3, [r5, #18]
	adds	r3, r3, #1
	strh	r3, [r5, #18]	@ movhi
	b	.L1146
.L1154:
	ldrh	r1, [r4]
	ldr	r0, .L1193+36
	bl	NAND_Print
	ldr	r3, [r5, #4]
	add	r1, sp, #72
	ldrh	r2, [r4]
	mov	r0, r5
	ldrh	r3, [r3, #20]
	strh	r2, [sp, #74]	@ movhi
	subs	r3, r3, #1
	strh	r3, [sp, #72]	@ movhi
	movs	r3, #0
	strh	r3, [sp, #76]	@ movhi
	strd	r3, r6, [sp, #80]
	ldr	r3, [r5, #1980]
	blx	r3
	ldrh	r8, [r4]
	mov	fp, r0
	cbz	r0, .L1156
	cmp	r0, #10
	bne	.L1157
.L1156:
	mov	r0, r6
	bl	is_phy_mapping_page
	cmp	r0, #1
	mov	r10, r0
	bne	.L1158
	mov	r1, r8
	ldr	r0, .L1193+40
	bl	NAND_Print
	mov	r0, r6
	bl	get_block_used_count_from_oob
	ldrh	r3, [r5, #18]
	mov	r8, r0
	mov	r0, r6
	adds	r3, r3, #1
	strh	r3, [r5, #18]	@ movhi
	strh	r10, [r4, #2]	@ movhi
	bl	get_erase_count_from_oob
	movs	r3, #0
	strh	r0, [r4, #6]	@ movhi
	mov	r7, r0
	strh	r3, [r4, #4]	@ movhi
	str	r8, [r4, #8]
	mov	r1, r4
	strd	r3, r3, [r4, #28]
	mov	r0, r5
	bl	add_block_count_list
	cmp	fp, #10
	bne	.L1146
	ldr	r3, [r5, #1972]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1146
	mov	r2, r10
	mov	r0, r5
	bl	add_prio_gc
	ldr	r0, .L1193+44
	b	.L1185
.L1158:
	mov	r0, r6
	bl	is_nouse_page
	cmp	r0, #1
	mov	r1, r8
	ite	eq
	ldreq	r0, .L1193+48
	ldrne	r0, .L1193+52
	bl	NAND_Print
	ldrh	r2, [r4, #6]
	adds	r2, r2, #1
	b	.L1191
.L1194:
	.align	2
.L1193:
	.word	.LANCHOR15+16
	.word	.LANCHOR20
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC214
	.word	.LC215
	.word	.LC216
	.word	.LC217
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC221
	.word	.LC222
.L1157:
	mov	r1, r8
	ldr	r0, .L1195
	bl	NAND_Print
	ldrb	r0, [sp, #71]	@ zero_extendqisi2
	ldrh	r1, [r4]
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	str	r0, [sp, #52]
	ldrb	r0, [sp, #70]	@ zero_extendqisi2
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #68]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #67]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #66]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #65]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #64]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #63]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #62]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #61]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #60]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #59]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #58]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L1195+4
	bl	NAND_Print
	mov	r1, r4
	mov	r0, r5
	bl	torture_block_and_mark
	b	.L1188
.L1143:
	ldrh	r1, [r4]
	ldr	r0, .L1195+8
	bl	NAND_Print
	movs	r3, #255
	strh	r8, [r4, #6]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	b	.L1184
.L1196:
	.align	2
.L1195:
	.word	.LC223
	.word	.LC224
	.word	.LC225
	.size	first_scan_all_blocks, .-first_scan_all_blocks
	.section	.text.out_phy_block_from_free_list,"ax",%progbits
	.align	1
	.global	out_phy_block_from_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	out_phy_block_from_free_list, %function
out_phy_block_from_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	mov	r1, r0
	bl	del_free_list
	cbz	r0, .L1197
	movs	r3, #0
	strd	r3, r3, [r0, #20]
	ldrh	r3, [r1, #22]
	cbz	r3, .L1197
	subs	r3, r3, #1
	strh	r3, [r1, #22]	@ movhi
.L1197:
	pop	{r3, pc}
	.size	out_phy_block_from_free_list, .-out_phy_block_from_free_list
	.section	.text.panic_backup_block,"ax",%progbits
	.align	1
	.global	panic_backup_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	panic_backup_block, %function
panic_backup_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1215
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r0
	ldr	r0, [r3]
	cbz	r0, .L1204
	ldr	r6, .L1215+4
	movs	r5, #0
	ldr	fp, .L1215+16
.L1208:
	ldr	r4, [r6, r5, lsl #2]
	lsl	r10, r5, #2
	cbz	r4, .L1206
	ldrh	r1, [r4]
	ldr	r0, .L1215+8
	bl	NAND_Print
	movs	r0, #0
.L1204:
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1206:
	mov	r0, r8
	bl	out_phy_block_from_free_list
	mov	r7, r0
	cbz	r0, .L1207
	ldrh	r1, [r0]
	adds	r5, r5, #1
	mov	r0, fp
	bl	NAND_Print
	cmp	r5, #3
	str	r7, [r10, r6]
	bne	.L1208
	ldr	r3, [r8, #4]
	mov	r0, r4
	ldrh	r3, [r3, #20]
	add	r3, r3, r3, lsl #1
	str	r3, [r6, #12]
	b	.L1204
.L1207:
	ldr	r0, .L1215+12
	bl	NAND_Print
	mov	r0, #-1
	b	.L1204
.L1216:
	.align	2
.L1215:
	.word	.LANCHOR1
	.word	.LANCHOR3
	.word	.LC226
	.word	.LC228
	.word	.LC227
	.size	panic_backup_block, .-panic_backup_block
	.section	.text.cross_talk_rebuild_current_block,"ax",%progbits
	.align	1
	.global	cross_talk_rebuild_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	cross_talk_rebuild_current_block, %function
cross_talk_rebuild_current_block:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #56
	mov	r6, r1
	movs	r7, #0
	add	r1, sp, #56
	mov	r5, r0
	str	r7, [r1, #-20]!
	mov	r4, r2
	bl	init_nrc
	cbz	r0, .L1218
	ldr	r0, [sp, #36]
	mov	r4, r7
	bl	free_nrc
	ldr	r0, .L1238
	bl	NAND_Print
.L1219:
	mov	r0, r4
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1218:
	ldr	r3, [sp, #36]
	add	r2, sp, #28
	mov	r1, r6
	mov	r0, r5
	bl	get_used_page_num
	mov	r10, r0
	cbnz	r4, .L1220
	ldr	r3, [r6, #8]
	mov	r2, r0
	ldrh	r1, [r6]
	ldr	r0, .L1238+4
	bl	NAND_Print
	ldr	r0, [sp, #36]
	ldr	r3, [r0]
	cmp	r3, #0
	bne	.L1233
	bl	free_nrc
	ldr	r0, .L1238+8
	bl	NAND_Print
	ldrh	r2, [r6, #6]
	mov	r1, r6
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	b	.L1219
.L1220:
	ldr	r3, [sp, #36]
	add	r2, sp, #32
	mov	r1, r4
	mov	r0, r5
	bl	get_used_page_num
	ldr	r3, [r4, #8]
	mov	fp, r0
	ldrh	r1, [r6]
	mov	r2, r10
	strd	r0, r3, [sp, #4]
	ldrh	r3, [r4]
	ldr	r0, .L1238+12
	str	r3, [sp]
	ldr	r3, [r6, #8]
	bl	NAND_Print
	ldr	r0, [sp, #36]
	ldr	r3, [r0]
	cbnz	r3, .L1222
	str	r3, [sp, #20]
	bl	free_nrc
	ldr	r0, .L1238+16
	bl	NAND_Print
	ldrh	r2, [r6, #6]
	mov	r1, r6
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	ldrh	r2, [r4, #6]
	mov	r1, r4
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	ldr	r3, [sp, #20]
	mov	r4, r3
	b	.L1219
.L1222:
	ldrh	r7, [r4, #6]
	cmp	r10, fp
	ldrh	r8, [r6, #6]
	ittt	ls
	movls	r2, r7
	movls	r7, r8
	movls	r8, r2
	ldr	r2, [sp, #28]
	cbnz	r2, .L1224
	ldr	r2, [sp, #32]
	cbz	r2, .L1225
.L1224:
	adds	r7, r7, #20
	add	r8, r8, #20
.L1225:
	cmp	r10, fp
	add	r7, r7, #1
	uxth	r7, r7
	mov	r2, fp
	mov	r1, r10
	bcs	.L1226
	ldr	r0, .L1238+20
	bl	NAND_Print
	mov	r1, r6
	mov	r6, r4
	mov	r2, r7
	mov	r0, r5
	bl	erase_block
.L1221:
	ldr	r7, .L1238+24
.L1229:
	mov	r0, r5
	bl	out_phy_block_from_free_list
	mov	r4, r0
	cbnz	r0, .L1227
	ldr	r0, .L1238+28
	bl	NAND_Print
	b	.L1219
.L1226:
	ldr	r0, .L1238+32
	bl	NAND_Print
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	erase_block
	b	.L1221
.L1233:
	mov	r8, r4
	b	.L1221
.L1227:
	ldr	r2, [r6, #8]
	mov	r1, r0
	adds	r2, r2, #1
	str	r2, [r0, #8]
	mov	r0, r5
	bl	new_block_init_for_write
	cmp	r0, #0
	beq	.L1234
	mov	r0, r7
	bl	NAND_Print
	b	.L1229
.L1232:
	ldr	r3, [r0, #4]
	ldrb	r3, [r3, r10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1230
	ldr	r2, [r5, #4]
	ldr	r0, [r0, #8]
	ldrh	r1, [r2, #26]
	ldrh	r2, [r2, #28]
	add	r3, r1, #64
	mla	r3, r10, r3, r0
	ldrh	r0, [r4]
	strh	r7, [sp, #40]	@ movhi
	strh	r2, [sp, #44]	@ movhi
	adds	r7, r7, #1
	strh	r0, [sp, #42]	@ movhi
	add	r1, r1, r3
	mov	r0, r1
	strd	r3, r1, [sp, #48]
	str	r1, [sp, #20]
	bl	get_special_data_from_oob
	ldrh	r3, [r4, #6]
	mov	r2, r0
	ldr	r1, [sp, #20]
	mov	r0, r5
	str	r3, [sp]
	ldr	r3, [r4, #8]
	bl	set_oob_special_page
	ldr	r3, [r5, #1984]
	add	r1, sp, #40
	mov	r0, r5
	blx	r3
.L1231:
	add	r10, r10, #1
.L1228:
	ldr	r0, [sp, #36]
	ldr	r2, [r0]
	cmp	r2, r10
	bhi	.L1232
	add	r2, r8, #1
	mov	r1, r6
	uxth	r2, r2
	mov	r0, r5
	bl	erase_block
	ldr	r0, [sp, #36]
	bl	free_nrc
	b	.L1219
.L1230:
	mov	r1, r10
	mov	r0, fp
	bl	NAND_Print
	b	.L1231
.L1234:
	mov	r7, r0
	mov	r10, r0
	ldr	fp, .L1238+36
	b	.L1228
.L1239:
	.align	2
.L1238:
	.word	.LC229
	.word	.LC230
	.word	.LC231
	.word	.LC232
	.word	.LC233
	.word	.LC234
	.word	.LC237
	.word	.LC236
	.word	.LC235
	.word	.LC238
	.size	cross_talk_rebuild_current_block, .-cross_talk_rebuild_current_block
	.section	.text.no_cross_talk_rebuild_current_block,"ax",%progbits
	.align	1
	.global	no_cross_talk_rebuild_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	no_cross_talk_rebuild_current_block, %function
no_cross_talk_rebuild_current_block:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #72
	mov	r6, r1
	movs	r7, #0
	add	r1, sp, #32
	mov	r5, r0
	mov	r4, r2
	strd	r7, r7, [sp, #32]
	bl	init_nrc
	cbz	r0, .L1241
	ldr	r0, .L1274
	bl	NAND_Print
	ldr	r0, [sp, #32]
	bl	free_nrc
.L1272:
	movs	r4, #0
	b	.L1242
.L1241:
	ldr	r3, [sp, #32]
	add	r2, sp, #24
	mov	r1, r6
	mov	r0, r5
	bl	get_used_page_num_no_crosstalk
	mov	r8, r0
	cbnz	r4, .L1243
	ldr	r3, [r6, #8]
	mov	r2, r0
	ldrh	r1, [r6]
	ldr	r0, .L1274+4
	bl	NAND_Print
	ldr	r7, [sp, #32]
	ldr	r3, [r7]
	cbz	r3, .L1271
	ldr	r8, .L1274+40
.L1244:
	mov	r0, r5
	bl	out_phy_block_from_free_list
	mov	r4, r0
	cbnz	r0, .L1245
.L1253:
	ldr	r0, .L1274+8
.L1273:
	bl	NAND_Print
	b	.L1272
.L1271:
	mov	r0, r7
	bl	free_nrc
	ldr	r0, .L1274+12
	bl	NAND_Print
	ldrh	r2, [r6, #6]
	mov	r1, r6
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
.L1242:
	mov	r0, r4
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1245:
	ldr	r2, [r6, #8]
	mov	r1, r0
	str	r2, [r0, #8]
	mov	r0, r5
	bl	new_block_init_for_write
	cmp	r0, #0
	beq	.L1246
	mov	r0, r8
	bl	NAND_Print
	b	.L1244
.L1243:
	add	r1, sp, #36
	mov	r0, r5
	bl	init_nrc
	cbz	r0, .L1247
	ldr	r0, [sp, #32]
	bl	free_nrc
	ldr	r0, [sp, #36]
	bl	free_nrc
	ldr	r0, .L1274+16
	b	.L1273
.L1247:
	ldr	r3, [sp, #36]
	add	r2, sp, #28
	mov	r1, r4
	mov	r0, r5
	bl	get_used_page_num_no_crosstalk
	ldr	r3, [r4, #8]
	mov	r10, r0
	ldrh	r1, [r6]
	mov	r2, r8
	strd	r0, r3, [sp, #4]
	ldrh	r3, [r4]
	ldr	r0, .L1274+20
	str	r3, [sp]
	ldr	r3, [r6, #8]
	bl	NAND_Print
	ldr	r7, [sp, #36]
	ldr	fp, [r7]
	cmp	fp, #0
	bne	.L1248
	ldr	r0, [sp, #32]
	bl	free_nrc
	ldr	r0, [sp, #36]
	bl	free_nrc
	ldr	r0, .L1274+24
	bl	NAND_Print
	ldrh	r2, [r6, #6]
	mov	r1, r6
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	ldrh	r2, [r4, #6]
	mov	r1, r4
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	b	.L1272
.L1248:
	cmp	r8, r10
	bcs	.L1249
	mov	r3, fp
	mov	r2, r10
	mov	r1, r8
	ldr	r0, .L1274+28
	bl	NAND_Print
	mov	r3, r6
	mov	r6, r4
	mov	r4, r3
.L1250:
	ldr	r3, [r5, #4]
	mov	r8, #0
	ldrh	r2, [r4]
	add	r1, sp, #40
	strh	r8, [sp, #40]	@ movhi
	mov	r0, r5
	ldrh	r3, [r3, #28]
	strh	r2, [sp, #42]	@ movhi
	strd	r8, r8, [sp, #48]
	strh	r3, [sp, #44]	@ movhi
	ldr	r3, [r5, #1976]
	blx	r3
	cbz	r0, .L1251
	ldrh	r1, [r4]
	ldr	r0, .L1274+32
	bl	NAND_Print
	ldr	r3, [r5, #1996]
	add	r1, sp, #40
	mov	r0, r5
	blx	r3
	movs	r3, #255
	strh	r8, [r6, #4]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	ldr	r8, .L1274+40
	ldrh	r3, [r5, #20]
	adds	r3, r3, #1
	strh	r3, [r5, #20]	@ movhi
.L1252:
	mov	r0, r5
	bl	out_phy_block_from_free_list
	mov	r4, r0
	cmp	r0, #0
	beq	.L1253
	ldr	r2, [r0, #8]
	mov	r1, r0
	mov	r0, r5
	bl	new_block_init_for_write
	cbz	r0, .L1251
	mov	r0, r8
	bl	NAND_Print
	b	.L1252
.L1249:
	ldr	r7, [sp, #32]
	mov	r2, r10
	mov	r1, r8
	ldr	r0, .L1274+36
	ldr	r3, [r7]
	bl	NAND_Print
	b	.L1250
.L1251:
	ldr	r3, [r6, #8]
	str	r3, [r4, #8]
.L1246:
	ldr	fp, .L1274+44
	mov	r10, #0
	mov	r8, r10
.L1254:
	ldr	r2, [r7]
	cmp	r2, r8
	bhi	.L1257
	ldrh	r2, [r6, #6]
	mov	r1, r6
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	ldr	r2, [r7]
	ldr	r1, [r7, #12]
	ldr	r0, [r5, #304]
	strh	r2, [r5, #320]	@ movhi
	str	r4, [r5, #292]
	lsls	r2, r2, #2
	bl	NAND_Memcpy
	ldr	r0, [sp, #32]
	bl	free_nrc
	ldr	r0, [sp, #36]
	bl	free_nrc
	b	.L1242
.L1257:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, r8]	@ zero_extendqisi2
	cbz	r3, .L1255
	ldr	r2, [r5, #4]
	ldr	r0, [r7, #8]
	ldrh	r1, [r2, #26]
	ldrh	r2, [r2, #28]
	add	r3, r1, #64
	mla	r3, r8, r3, r0
	ldrh	r0, [r4]
	strh	r10, [sp, #56]	@ movhi
	strh	r2, [sp, #60]	@ movhi
	add	r10, r10, #1
	strh	r0, [sp, #58]	@ movhi
	add	r1, r1, r3
	mov	r0, r1
	strd	r3, r1, [sp, #64]
	str	r1, [sp, #20]
	bl	get_special_data_from_oob
	ldrh	r3, [r4, #6]
	mov	r2, r0
	ldr	r1, [sp, #20]
	mov	r0, r5
	str	r3, [sp]
	ldr	r3, [r4, #8]
	bl	set_oob_special_page
	ldr	r3, [r5, #1984]
	add	r1, sp, #56
	mov	r0, r5
	blx	r3
.L1256:
	add	r8, r8, #1
	b	.L1254
.L1255:
	mov	r1, r8
	mov	r0, fp
	bl	NAND_Print
	b	.L1256
.L1275:
	.align	2
.L1274:
	.word	.LC229
	.word	.LC239
	.word	.LC236
	.word	.LC240
	.word	.LC233
	.word	.LC241
	.word	.LC242
	.word	.LC234
	.word	.LC243
	.word	.LC235
	.word	.LC237
	.word	.LC238
	.size	no_cross_talk_rebuild_current_block, .-no_cross_talk_rebuild_current_block
	.section	.text.current_block_ecc_error,"ax",%progbits
	.align	1
	.global	current_block_ecc_error
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	current_block_ecc_error, %function
current_block_ecc_error:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r5, .L1296
	sub	sp, sp, #48
	mov	r8, r1
.L1277:
	mov	r0, r4
	bl	out_phy_block_from_free_list
	mov	r7, r0
	cbnz	r0, .L1278
	ldr	r0, .L1296+4
	bl	NAND_Print
.L1276:
	mov	r0, r7
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1278:
	ldr	r2, [r8, #8]
	mov	r1, r0
	str	r2, [r0, #8]
	mov	r0, r4
	bl	new_block_init_for_write
	mov	r6, r0
	cbz	r0, .L1280
	mov	r0, r5
	bl	NAND_Print
	b	.L1277
.L1280:
	ldr	fp, .L1296+32
	mov	r5, r6
	ldrh	r1, [r8]
	ldr	r0, .L1296+8
	bl	NAND_Print
.L1281:
	ldr	r3, [r4, #4]
	ldrh	r2, [r3, #20]
	cmp	r2, r5
	bgt	.L1288
	ldrh	r2, [r8, #6]
	mov	r1, r8
	mov	r0, r4
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L1296+12
	bl	NAND_Print_DBG
	b	.L1276
.L1288:
	ldrh	r2, [r3, #28]
	mov	r0, r4
	ldrh	r1, [r8]
	ldr	r3, [r4, #284]
	strh	r2, [sp, #20]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	add	r1, sp, #16
	str	r3, [sp, #24]
	strh	r5, [sp, #16]	@ movhi
	ldr	r3, [r4, #1980]
	str	sp, [sp, #28]
	blx	r3
	mov	r10, r0
	mov	r0, sp
	bl	is_ftl_logic_page_data
	cmp	r0, #1
	bne	.L1282
	cmp	r10, #0
	beq	.L1283
	cmp	r10, #10
	bne	.L1284
.L1283:
	mov	r2, sp
	ldr	r1, [r4, #284]
	mov	r0, r4
	bl	nand_power_off_ecc_error
	cbz	r0, .L1285
	ldr	r0, .L1296+16
	bl	NAND_Print
.L1286:
	adds	r5, r5, #1
	b	.L1281
.L1285:
	mov	r2, r10
	mov	r1, r5
	ldr	r0, .L1296+20
	bl	NAND_Print
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r7]
	strh	r6, [sp, #32]	@ movhi
	adds	r6, r6, #1
	ldrh	r2, [r3, #28]
	ldr	r3, [r4, #284]
	strh	r1, [sp, #34]	@ movhi
	add	r1, sp, #32
	strh	r2, [sp, #36]	@ movhi
	str	r3, [sp, #40]
	str	sp, [sp, #44]
	ldr	r3, [r4, #1984]
	blx	r3
	b	.L1286
.L1284:
	ldr	r0, .L1296+24
	mov	r1, r5
.L1295:
	bl	NAND_Print
	b	.L1286
.L1282:
	ldrb	r3, [sp, #1]	@ zero_extendqisi2
	cmp	r3, #170
	bne	.L1287
	mov	r1, r5
	mov	r0, fp
	b	.L1295
.L1287:
	mov	r0, sp
	bl	is_nouse_page
	cmp	r0, #1
	beq	.L1286
	mov	r1, r5
	ldr	r0, .L1296+28
	b	.L1295
.L1297:
	.align	2
.L1296:
	.word	.LC245
	.word	.LC244
	.word	.LC246
	.word	.LC252
	.word	.LC247
	.word	.LC248
	.word	.LC249
	.word	.LC251
	.word	.LC250
	.size	current_block_ecc_error, .-current_block_ecc_error
	.section	.text.block_last_page_ecc_error,"ax",%progbits
	.align	1
	.global	block_last_page_ecc_error
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	block_last_page_ecc_error, %function
block_last_page_ecc_error:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r10, r0
	sub	sp, sp, #32
	ldr	r0, .L1330
	mov	r4, r1
	bl	NAND_Print
	mov	r0, #4096
	bl	NAND_Malloc
	mov	r5, r0
	cbnz	r0, .L1299
	ldr	r1, .L1330+4
	ldr	r0, .L1330+8
	bl	NAND_Print
.L1299:
	ldr	r7, .L1330+4
	movs	r6, #0
	ldr	r8, .L1330+28
.L1300:
	ldr	r2, [r10, #4]
	ldrh	r1, [r2, #20]
	cmp	r1, r6
	bgt	.L1302
	movs	r6, #0
	mov	r7, r6
.L1303:
	ldr	r2, [r10, #4]
	uxth	r8, r7
	ldrh	ip, [r4]
	ldr	r1, [r10, #284]
	ldrh	r0, [r2, #28]
	ldrh	r2, [r2, #20]
	cmp	r2, r7
	ble	.L1315
	strh	ip, [sp, #18]	@ movhi
	strh	r0, [sp, #20]	@ movhi
	mov	r0, r10
	str	r1, [sp, #24]
	add	r1, sp, #16
	ldr	r2, [r10, #1980]
	strh	r8, [sp, #16]	@ movhi
	str	sp, [sp, #28]
	blx	r2
	mov	fp, r0
	mov	r0, sp
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L1304
.L1315:
	ldr	r2, [r10, #4]
	ldrh	r0, [r4]
	strh	r8, [sp, #16]	@ movhi
	ldrh	r1, [r2, #28]
	ldr	r2, [r10, #284]
	strh	r0, [sp, #18]	@ movhi
	mov	r0, r10
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	str	r2, [sp, #24]
	str	sp, [sp, #28]
	ldr	r2, [r10, #1976]
	blx	r2
	cmp	r0, #0
	bne	.L1305
.L1306:
	movs	r7, #0
.L1318:
	cmp	r7, r6
	ldr	r2, [r10, #4]
	beq	.L1317
	ldrh	r0, [r4]
	ldrh	r1, [r2, #28]
	ldr	r2, [r5, r7, lsl #2]
	strh	r7, [sp, #16]	@ movhi
	adds	r7, r7, #1
	strh	r0, [sp, #18]	@ movhi
	mov	r0, r10
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	str	r2, [sp, #24]
	str	sp, [sp, #28]
	ldr	r2, [r10, #1984]
	blx	r2
	b	.L1318
.L1302:
	ldrh	r0, [r2, #26]
	bl	nftl_malloc
	str	r0, [r5, r6, lsl #2]
	cbnz	r0, .L1301
	mov	r1, r7
	mov	r0, r8
	bl	NAND_Print
.L1301:
	adds	r6, r6, #1
	b	.L1300
.L1304:
	mov	r0, sp
	bl	is_ftl_logic_page_data
	cmp	r0, #1
	bne	.L1307
	cmp	fp, #0
	beq	.L1308
	cmp	fp, #10
	bne	.L1309
.L1308:
	ldr	r2, [r10, #4]
	adds	r6, r6, #1
	ldr	r1, [r10, #284]
	ldr	r0, [r5, r7, lsl #2]
	ldrh	r2, [r2, #26]
	bl	NAND_Memcpy
.L1309:
	adds	r7, r7, #1
	b	.L1303
.L1307:
	ldrb	r1, [sp, #1]	@ zero_extendqisi2
	cmp	r1, #170
	bne	.L1310
	cmp	fp, #0
	bne	.L1328
.L1311:
	ldr	r2, [r10, #4]
	adds	r6, r6, #1
	ldr	r1, [r10, #284]
	ldr	r0, [r5, r7, lsl #2]
	ldrh	r2, [r2, #26]
	bl	NAND_Memcpy
	b	.L1313
.L1310:
	ldr	r0, .L1330+12
.L1329:
	bl	NAND_Print
	b	.L1309
.L1328:
	cmp	fp, #10
	beq	.L1311
.L1313:
	ldr	r0, .L1330+16
	b	.L1329
.L1305:
	ldr	r2, [r10, #1996]
	add	r1, sp, #16
	mov	r0, r10
	blx	r2
	mov	r0, r10
	bl	out_phy_block_from_free_list
	mov	r4, r0
	cbnz	r0, .L1316
	ldr	r0, .L1330+20
	bl	NAND_Print
.L1317:
	movs	r6, #0
.L1320:
	ldr	r2, [r10, #4]
	ldrh	r2, [r2, #20]
	cmp	r2, r6
	bgt	.L1321
	mov	r0, r5
	bl	nftl_free
	ldr	r0, .L1330+24
	bl	NAND_Print
	mov	r0, r4
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1316:
	ldr	r2, [r10, #4]
	ldrh	r0, [r0]
	strh	r8, [sp, #16]	@ movhi
	ldrh	r1, [r2, #28]
	ldr	r2, [r10, #284]
	strh	r0, [sp, #18]	@ movhi
	mov	r0, r10
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	str	r2, [sp, #24]
	str	sp, [sp, #28]
	ldr	r2, [r10, #1976]
	blx	r2
	b	.L1306
.L1321:
	ldr	r0, [r5, r6, lsl #2]
	adds	r6, r6, #1
	bl	nftl_free
	b	.L1320
.L1331:
	.align	2
.L1330:
	.word	.LC253
	.word	.LANCHOR21
	.word	.LC254
	.word	.LC256
	.word	.LC257
	.word	.LC244
	.word	.LC258
	.word	.LC255
	.size	block_last_page_ecc_error, .-block_last_page_ecc_error
	.section	.text.do_write_error,"ax",%progbits
	.align	1
	.global	do_write_error
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_write_error, %function
do_write_error:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r10, .L1354+4
	sub	sp, sp, #24
	mov	r6, r1
	ldr	fp, .L1354+8
.L1333:
	mov	r0, r4
	bl	out_phy_block_from_free_list
	mov	r5, r0
	cbnz	r0, .L1334
.L1338:
	ldr	r0, .L1354
	bl	NAND_Print
	movs	r0, #1
.L1332:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1334:
	ldr	r3, [r4, #4]
	movs	r7, #0
	ldrh	r2, [r0]
	add	r1, sp, #8
	strh	r7, [sp, #8]	@ movhi
	mov	r0, r4
	ldrh	r3, [r3, #28]
	strh	r2, [sp, #10]	@ movhi
	strd	r7, r7, [sp, #16]
	strh	r3, [sp, #12]	@ movhi
	ldr	r3, [r4, #1976]
	blx	r3
	ldrh	r3, [r5, #6]
	strh	r7, [r5, #4]	@ movhi
	adds	r3, r3, #1
	strh	r3, [r5, #6]	@ movhi
	cbz	r0, .L1336
	ldr	r3, [r4, #1996]
	add	r1, sp, #8
	mov	r0, r4
	blx	r3
	ldrh	r1, [r5]
	mov	r0, fp
	bl	NAND_Print
	ldrh	r2, [r4, #380]
	ldrh	r3, [r4, #22]
	cmp	r3, r2, lsr #2
	bhi	.L1333
	b	.L1338
.L1336:
	ldr	r3, [r6]
	mov	r8, r0
	ldr	r3, [r3, #8]
	adds	r3, r3, #1
	str	r3, [r5, #8]
.L1339:
	ldrh	r3, [r6, #28]
	ldr	r1, [r6]
	cmp	r3, r8
	bhi	.L1342
.L1340:
	ldrh	r3, [r1, #4]
	movs	r7, #0
	ldrh	r2, [r1]
	mov	r0, r4
	strh	r7, [sp, #8]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	ldr	r3, [r4, #4]
	strh	r2, [sp, #10]	@ movhi
	ldrh	r2, [r1, #6]
	ldrh	r3, [r3, #28]
	strd	r7, r7, [sp, #16]
	adds	r2, r2, #1
	uxth	r2, r2
	strh	r3, [sp, #12]	@ movhi
	bl	erase_block
	ldr	r3, [r6]
	ldrh	r3, [r3, #2]
	strh	r3, [r5, #2]	@ movhi
	str	r5, [r6]
.L1343:
	ldrh	r3, [r6, #28]
	cmp	r3, r7
	bhi	.L1347
	movs	r0, #0
	b	.L1332
.L1342:
	ldr	r3, [r6, #12]
	ldr	r3, [r3, r8, lsl #2]
	adds	r3, r3, #1
	beq	.L1340
	uxth	r3, r8
	ldr	r7, [r4, #1988]
	mov	r2, r5
	str	r3, [sp]
	mov	r0, r4
	ldr	r3, [r4, #284]
	blx	r7
	cbz	r0, .L1341
	ldrh	r1, [r5]
	mov	r0, r10
	bl	NAND_Print
	ldr	r3, [r4, #4]
	mov	r0, r4
	ldrh	r1, [r5]
	ldrh	r2, [r3, #28]
	movs	r3, #0
	strh	r3, [sp, #8]	@ movhi
	strh	r1, [sp, #10]	@ movhi
	add	r1, sp, #8
	strd	r3, r3, [sp, #16]
	strh	r2, [sp, #12]	@ movhi
	ldr	r3, [r4, #1996]
	blx	r3
	b	.L1333
.L1341:
	add	r8, r8, #1
	b	.L1339
.L1347:
	ldr	r3, [r6, #12]
	ldr	r1, [r3, r7, lsl #2]
	adds	r3, r1, #1
	beq	.L1345
	mov	r0, r4
	bl	get_logic_page_map
	cbz	r0, .L1345
	ldr	r3, [r6]
	ldrh	r3, [r3]
	strh	r3, [r0, #2]	@ movhi
	ldrh	r3, [r0]
	bfi	r3, r7, #0, #12
	strh	r3, [r0]	@ movhi
.L1345:
	adds	r7, r7, #1
	b	.L1343
.L1355:
	.align	2
.L1354:
	.word	.LC259
	.word	.LC261
	.word	.LC260
	.size	do_write_error, .-do_write_error
	.section	.text.write_phy_data_to_current_block,"ax",%progbits
	.align	1
	.global	write_phy_data_to_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_phy_data_to_current_block, %function
write_phy_data_to_current_block:
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #48
	add	r7, sp, #16
	mov	r4, r0
	mov	fp, r2
	mov	r0, r7
	movs	r2, #16
	mov	r5, r1
	movs	r1, #165
	str	r3, [sp, #12]
	ldr	r6, [sp, #80]
	mov	r8, #3
	bl	NAND_Memset
	ldr	r3, [r4, #4]
	mov	r1, fp
	movw	r0, #65535
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	ldr	r3, .L1373
	cmp	r6, r3
	itet	ne
	lslne	r2, r2, #9
	ldrheq	r2, [r4, #308]
	uxthne	r2, r2
	bl	nand_crc16
	lsrs	r3, r0, #8
	strb	r0, [sp, #29]
	strb	r3, [sp, #28]
.L1359:
	ldr	r0, [r5]
	ldr	lr, [r4, #4]
	ldr	r3, .L1373
	ldrh	r1, [r0]
	ldrh	r2, [r5, #28]
	ldrh	ip, [lr, #28]
	cmp	r6, r3
	strh	r1, [sp, #34]	@ movhi
	strh	r2, [sp, #32]	@ movhi
	strh	ip, [sp, #36]	@ movhi
	strd	fp, r7, [sp, #40]
	bne	.L1360
	ldrh	r3, [r0, #6]
	mov	r2, r6
	str	r3, [sp]
	ldr	r3, [r0, #8]
.L1372:
	mov	r1, r7
	mov	r0, r4
	bl	set_oob_special_page
	b	.L1361
.L1360:
	cmp	r6, #192
	bne	.L1362
	ldrh	r3, [lr, #20]
	subs	r3, r3, #1
	cmp	r2, r3
	bne	.L1363
	ldr	r0, .L1373+4
	bl	NAND_Print_DBG
.L1363:
	ldr	r3, [r5]
	mov	r1, r7
	mov	r0, r4
	ldrh	r2, [r3, #6]
	str	r2, [sp]
	ldr	r2, [sp, #12]
	ldr	r3, [r3, #8]
	bl	set_oob_logic_page
.L1361:
	ldr	r3, [r5]
	mov	r10, #1
	add	r1, sp, #32
	mov	r0, r4
	strh	r10, [r3, #2]	@ movhi
	ldr	r3, [r4, #1984]
	blx	r3
	cbz	r0, .L1356
	subs	r8, r8, #1
	beq	.L1366
	ldrh	r1, [sp, #34]
	ldr	r0, .L1373+8
	bl	NAND_Print_DBG
	mov	r1, r5
	mov	r0, r4
	bl	do_write_error
	cmp	r0, #0
	beq	.L1359
	ldr	r0, .L1373+12
	bl	NAND_Print
	mov	r0, r10
.L1356:
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1362:
	ldr	r3, .L1373+16
	cmp	r6, r3
	bne	.L1361
	ldrh	r3, [lr, #20]
	subs	r3, r3, #1
	cmp	r2, r3
	bne	.L1364
	ldr	r0, .L1373+20
	bl	NAND_Print_DBG
.L1364:
	ldr	r3, [r5]
	ldrh	r2, [r3, #6]
	str	r2, [sp]
	ldr	r2, .L1373+16
	ldr	r3, [r3, #8]
	b	.L1372
.L1366:
	mov	r0, r8
	b	.L1356
.L1374:
	.align	2
.L1373:
	.word	-1431633921
	.word	.LC262
	.word	.LC264
	.word	.LC265
	.word	-1441713357
	.word	.LC263
	.size	write_phy_data_to_current_block, .-write_phy_data_to_current_block
	.section	.text.get_max_erase_time_from_free_list,"ax",%progbits
	.align	1
	.global	get_max_erase_time_from_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_max_erase_time_from_free_list, %function
get_max_erase_time_from_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #172]
	movs	r0, #0
	mov	r2, r0
	push	{r4, lr}
.L1376:
	cbnz	r3, .L1378
	cbz	r2, .L1380
	ldrh	r0, [r2, #6]
.L1379:
	pop	{r4, pc}
.L1378:
	ldrh	r4, [r3, #6]
	cmp	r4, r1
	bcs	.L1377
	cmp	r4, r0
	itt	cs
	movcs	r0, r4
	movcs	r2, r3
.L1377:
	ldr	r3, [r3, #20]
	b	.L1376
.L1380:
	movw	r0, #65535
	b	.L1379
	.size	get_max_erase_time_from_free_list, .-get_max_erase_time_from_free_list
	.section	.text.get_block_max_erase_time_from_free_list,"ax",%progbits
	.align	1
	.global	get_block_max_erase_time_from_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_max_erase_time_from_free_list, %function
get_block_max_erase_time_from_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	ldr	r3, [r0, #172]
	mov	r0, r2
	push	{r4, lr}
.L1382:
	cbnz	r3, .L1384
	pop	{r4, pc}
.L1384:
	ldrh	r4, [r3, #6]
	cmp	r4, r1
	bcs	.L1383
	cmp	r4, r2
	itt	cs
	movcs	r2, r4
	movcs	r0, r3
.L1383:
	ldr	r3, [r3, #20]
	b	.L1382
	.size	get_block_max_erase_time_from_free_list, .-get_block_max_erase_time_from_free_list
	.section	.text.get_block_max_erase_time_from_invalid_list,"ax",%progbits
	.align	1
	.global	get_block_max_erase_time_from_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_max_erase_time_from_invalid_list, %function
get_block_max_erase_time_from_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	ldr	r3, [r0, #200]
	mov	r0, r2
	push	{r4, lr}
.L1386:
	cbnz	r3, .L1388
	pop	{r4, pc}
.L1388:
	ldrh	r4, [r3, #6]
	cmp	r4, r1
	bcs	.L1387
	cmp	r4, r2
	itt	cs
	movcs	r2, r4
	movcs	r0, r3
.L1387:
	ldr	r3, [r3, #12]
	b	.L1386
	.size	get_block_max_erase_time_from_invalid_list, .-get_block_max_erase_time_from_invalid_list
	.section	.text.get_block_min_erase_time_from_invalid_list,"ax",%progbits
	.align	1
	.global	get_block_min_erase_time_from_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_min_erase_time_from_invalid_list, %function
get_block_min_erase_time_from_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	push	{r4, r5, r6, lr}
	ldrh	r5, [r3, #16]
	ldr	r3, [r0, #200]
	movs	r0, #0
.L1390:
	cbnz	r3, .L1392
	pop	{r4, r5, r6, pc}
.L1392:
	ldrh	r4, [r3, #6]
	cmp	r4, r1
	bcs	.L1391
	ldr	r6, [r3, #8]
	cmp	r6, r2
	bcs	.L1391
	cmp	r4, r5
	itt	ls
	movls	r5, r4
	movls	r0, r3
.L1391:
	ldr	r3, [r3, #12]
	b	.L1390
	.size	get_block_min_erase_time_from_invalid_list, .-get_block_min_erase_time_from_invalid_list
	.section	.text.check_static_wear_leveling,"ax",%progbits
	.align	1
	.global	check_static_wear_leveling
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_static_wear_leveling, %function
check_static_wear_leveling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r0
	ldr	r3, [r0, #580]
	cbz	r3, .L1394
.L1396:
	movs	r0, #1
.L1393:
	pop	{r3, r4, r5, r6, r7, r8, r10, pc}
.L1394:
	ldr	r3, [r0, #200]
	cmp	r3, #0
	beq	.L1396
	ldr	r3, [r0, #172]
	cmp	r3, #0
	beq	.L1396
	ldr	r3, [r0, #292]
	ldrh	r7, [r0, #18]
	ldr	r8, [r3, #8]
	cmp	r8, r7
	blt	.L1396
	ldr	r3, [r0, #4]
	ldrh	r5, [r3, #16]
	mov	r1, r5
	bl	get_block_max_erase_time_from_free_list
	cmp	r0, #0
	beq	.L1396
	ldrh	r6, [r0, #6]
	ldr	r0, .L1414
	umull	r0, r1, r5, r0
	ubfx	r10, r1, #2, #16
	cmp	r6, r10
	bcc	.L1396
	sub	r2, r8, r7
	mov	r1, r5
	mov	r0, r4
	bl	get_block_min_erase_time_from_invalid_list
	mov	r7, r0
	cmp	r0, #0
	beq	.L1396
	ldrh	r8, [r0, #6]
	cmp	r6, r8
	bls	.L1396
	lsls	r2, r6, #1
	adds	r3, r2, r6
	cmp	r3, r5, lsl #1
	ble	.L1397
	ldr	r2, .L1414+4
.L1413:
	umull	r2, r3, r5, r2
	lsrs	r3, r3, #3
	strh	r3, [r4, #574]	@ movhi
.L1398:
	ldrh	r2, [r4, #574]
	sub	r3, r6, r8
	cmp	r3, r2
	blt	.L1396
	mov	r2, r8
	mov	r1, r6
	ldr	r0, .L1414+8
	bl	NAND_Print_DBG
	ldrh	r1, [r7]
	ldr	r0, .L1414+12
	bl	NAND_Print_DBG
	ldrh	r1, [r4, #18]
	ldr	r0, .L1414+16
	bl	NAND_Print_DBG
	str	r7, [r4, #580]
	movs	r0, #0
	b	.L1393
.L1397:
	cmp	r5, r2
	bge	.L1399
	ldr	r2, .L1414
	b	.L1413
.L1399:
	cmp	r5, r3
	bge	.L1400
	movs	r1, #7
	mov	r0, r5
	bl	__aeabi_uidiv
	strh	r0, [r4, #574]	@ movhi
	b	.L1398
.L1400:
	strh	r10, [r4, #574]	@ movhi
	b	.L1398
.L1415:
	.align	2
.L1414:
	.word	-858993459
	.word	-1431655765
	.word	.LC266
	.word	.LC267
	.word	.LC268
	.size	check_static_wear_leveling, .-check_static_wear_leveling
	.section	.text.get_block_max_count_from_invalid_list,"ax",%progbits
	.align	1
	.global	get_block_max_count_from_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_max_count_from_invalid_list, %function
get_block_max_count_from_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #0
	ldr	r3, [r0, #200]
	mov	r0, r2
.L1417:
	cbnz	r3, .L1419
	bx	lr
.L1419:
	ldr	r1, [r3, #8]
	cmp	r1, r2
	itt	cs
	movcs	r0, r3
	movcs	r2, r1
	ldr	r3, [r3, #12]
	b	.L1417
	.size	get_block_max_count_from_invalid_list, .-get_block_max_count_from_invalid_list
	.section	.text.get_block_min_count_from_invalid_list,"ax",%progbits
	.align	1
	.global	get_block_min_count_from_invalid_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_block_min_count_from_invalid_list, %function
get_block_min_count_from_invalid_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #200]
	mov	r2, #-1
	movs	r0, #0
.L1421:
	cbnz	r3, .L1423
	bx	lr
.L1423:
	ldr	r1, [r3, #8]
	cmp	r1, r2
	itt	ls
	movls	r0, r3
	movls	r2, r1
	ldr	r3, [r3, #12]
	b	.L1421
	.size	get_block_min_count_from_invalid_list, .-get_block_min_count_from_invalid_list
	.section	.text.static_wear_leveling,"ax",%progbits
	.align	1
	.global	static_wear_leveling
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	static_wear_leveling, %function
static_wear_leveling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r2, [r0, #22]
	ldrh	r3, [r0, #380]
	push	{r4, lr}
	mov	r4, r0
	cmp	r2, r3
	bls	.L1426
	ldr	r3, [r0, #368]
	cmp	r3, #19
	bls	.L1426
	ldr	r2, [r0, #1968]
	ldr	r3, [r2, #180]
	adds	r3, r3, #1
	str	r3, [r2, #180]
	bl	get_block_min_count_from_invalid_list
	movs	r2, #5
	mov	r1, r0
	mov	r0, r4
	bl	add_prio_gc
	cbnz	r0, .L1428
	ldr	r3, [r4, #372]
	adds	r3, r3, #4
	str	r3, [r4, #372]
.L1428:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #372]
	ldrh	r3, [r3, #20]
	cmp	r2, r3
	itt	cs
	movcs	r3, #0
	strdcs	r3, r3, [r4, #368]
.L1426:
	movs	r0, #0
	pop	{r4, pc}
	.size	static_wear_leveling, .-static_wear_leveling
	.section	.text.out_phy_block_from_free_list_by_block,"ax",%progbits
	.align	1
	.global	out_phy_block_from_free_list_by_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	out_phy_block_from_free_list_by_block, %function
out_phy_block_from_free_list_by_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	del_free_list_by_block
	cbz	r0, .L1429
	movs	r3, #0
	strd	r3, r3, [r0, #20]
	ldrh	r3, [r4, #22]
	cbz	r3, .L1429
	subs	r3, r3, #1
	strh	r3, [r4, #22]	@ movhi
.L1429:
	pop	{r4, pc}
	.size	out_phy_block_from_free_list_by_block, .-out_phy_block_from_free_list_by_block
	.section	.text.adjust_free_list,"ax",%progbits
	.align	1
	.global	adjust_free_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	adjust_free_list, %function
adjust_free_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	bl	out_phy_block_from_free_list
	mov	r4, r0
	cbnz	r0, .L1437
	ldr	r0, .L1438
	bl	NAND_Print
.L1437:
	ldrh	r2, [r4, #6]
	mov	r1, r4
	mov	r0, r5
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	mov	r1, r4
	mov	r0, r5
	bl	out_phy_block_from_free_list_by_block
	str	r0, [r5, #48]
	ldrh	r2, [r0, #6]
	ldrh	r1, [r0]
	ldr	r0, .L1438+4
	bl	NAND_Print
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L1439:
	.align	2
.L1438:
	.word	.LC269
	.word	.LC270
	.size	adjust_free_list, .-adjust_free_list
	.section	.text.nand_dbg_zone_erase,"ax",%progbits
	.align	1
	.global	nand_dbg_zone_erase
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_dbg_zone_erase, %function
nand_dbg_zone_erase:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r2
	ldr	r3, [r0, #4]
	movs	r2, #36
	mov	r4, r0
	ldr	r3, [r3, #32]
	mla	r1, r2, r1, r3
	bl	out_phy_block_from_free_list_by_block
	mov	r2, r5
	mov	r1, r0
	mov	r0, r4
	pop	{r3, r4, r5, lr}
	b	erase_block
	.size	nand_dbg_zone_erase, .-nand_dbg_zone_erase
	.section	.text.out_phy_block_from_free_list_by_erase_time,"ax",%progbits
	.align	1
	.global	out_phy_block_from_free_list_by_erase_time
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	out_phy_block_from_free_list_by_erase_time, %function
out_phy_block_from_free_list_by_erase_time:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #172]
	push	{r4, r5}
	movs	r4, #0
	mov	r2, r4
.L1442:
	cbnz	r3, .L1444
	cbz	r2, .L1441
	mov	r1, r2
	pop	{r4, r5}
	b	out_phy_block_from_free_list_by_block
.L1444:
	ldrh	r5, [r3, #6]
	cmp	r5, r1
	bcs	.L1443
	cmp	r5, r4
	itt	cs
	movcs	r4, r5
	movcs	r2, r3
.L1443:
	ldr	r3, [r3, #20]
	b	.L1442
.L1441:
	mov	r0, r2
	pop	{r4, r5}
	bx	lr
	.size	out_phy_block_from_free_list_by_erase_time, .-out_phy_block_from_free_list_by_erase_time
	.section	.text.get_new_current_block,"ax",%progbits
	.align	1
	.global	get_new_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_new_current_block, %function
get_new_current_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1]
	mov	r6, r0
	ldr	r2, [r1, #16]
	movs	r1, #255
	ldr	r0, [r4, #12]
	ldr	r5, [r3, #8]
	bl	NAND_Memset
	ldrh	r3, [r6, #578]
	cbz	r3, .L1447
	ldr	r3, [r6, #4]
	mov	r0, r6
	ldrh	r1, [r3, #16]
	bl	out_phy_block_from_free_list_by_erase_time
	str	r0, [r4]
	cbz	r0, .L1448
	ldrh	r2, [r0, #6]
	ldrh	r1, [r0]
	ldr	r0, .L1455
	bl	NAND_Print_DBG
.L1448:
	ldr	r1, [r4]
	cbnz	r1, .L1449
	ldr	r0, .L1455+4
	bl	NAND_Print
	movs	r0, #1
.L1446:
	pop	{r3, r4, r5, r6, r7, pc}
.L1447:
	mov	r0, r6
	bl	out_phy_block_from_free_list
	str	r0, [r4]
	b	.L1448
.L1449:
	adds	r2, r5, #1
	movs	r7, #0
	strh	r7, [r4, #28]	@ movhi
	str	r2, [r1, #8]
	ldrb	r3, [r6, #17]	@ zero_extendqisi2
	ands	r0, r3, #1
	ittt	ne
	addne	r2, r5, #2
	movne	r0, r7
	strne	r2, [r1, #8]
	b	.L1446
.L1456:
	.align	2
.L1455:
	.word	.LC271
	.word	.LC272
	.size	get_new_current_block, .-get_new_current_block
	.section	.text.do_before_write,"ax",%progbits
	.align	1
	.global	do_before_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_before_write, %function
do_before_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	add	r5, r0, #292
.L1458:
	ldrh	r3, [r4, #320]
	cbz	r3, .L1461
.L1465:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r0, r3, #31
	bpl	.L1463
	add	r5, r4, #324
.L1462:
	ldrh	r3, [r4, #352]
	cbnz	r3, .L1463
	ldr	r1, [r4, #324]
	mov	r0, r4
	ldr	r2, [r1, #8]
	bl	new_block_init_for_write
	cbnz	r0, .L1467
.L1463:
	movs	r0, #0
.L1457:
	pop	{r3, r4, r5, pc}
.L1461:
	ldr	r1, [r4, #292]
	mov	r0, r4
	ldr	r2, [r1, #8]
	bl	new_block_init_for_write
	cmp	r0, #0
	beq	.L1465
	ldr	r2, [r4, #292]
	mov	r0, r4
	ldr	r3, [r2, #8]
	subs	r1, r3, #1
	str	r1, [r2, #8]
	ldrb	r1, [r4, #17]	@ zero_extendqisi2
	lsls	r1, r1, #31
	mov	r1, r5
	itt	mi
	submi	r3, r3, #2
	strmi	r3, [r2, #8]
	bl	get_new_current_block
	cmp	r0, #0
	beq	.L1458
	ldr	r0, .L1480
.L1479:
	bl	NAND_Print
	movs	r0, #1
	b	.L1457
.L1467:
	ldr	r2, [r4, #324]
	mov	r0, r4
	ldr	r3, [r2, #8]
	subs	r1, r3, #1
	str	r1, [r2, #8]
	ldrb	r1, [r4, #17]	@ zero_extendqisi2
	lsls	r1, r1, #31
	mov	r1, r5
	itt	mi
	submi	r3, r3, #2
	strmi	r3, [r2, #8]
	bl	get_new_current_block
	cmp	r0, #0
	beq	.L1462
	ldr	r0, .L1480+4
	b	.L1479
.L1481:
	.align	2
.L1480:
	.word	.LC273
	.word	.LC274
	.size	do_before_write, .-do_before_write
	.section	.text.put_phy_block_to_invalid_page_list,"ax",%progbits
	.align	1
	.global	put_phy_block_to_invalid_page_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	put_phy_block_to_invalid_page_list, %function
put_phy_block_to_invalid_page_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r4, lr}
	strd	r2, r2, [r1, #12]
	bl	add_block_invalid_list
	mov	r4, r0
	cbz	r0, .L1482
	ldr	r0, .L1487
	bl	NAND_Print_DBG
.L1482:
	mov	r0, r4
	pop	{r4, pc}
.L1488:
	.align	2
.L1487:
	.word	.LC275
	.size	put_phy_block_to_invalid_page_list, .-put_phy_block_to_invalid_page_list
	.section	.text.out_phy_block_from_invalid_page_list,"ax",%progbits
	.align	1
	.global	out_phy_block_from_invalid_page_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	out_phy_block_from_invalid_page_list, %function
out_phy_block_from_invalid_page_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	del_block_invalid_list
	cbz	r0, .L1489
	movs	r3, #0
	strd	r3, r3, [r0, #12]
.L1489:
	pop	{r3, pc}
	.size	out_phy_block_from_invalid_page_list, .-out_phy_block_from_invalid_page_list
	.section	.text.clean_block_list,"ax",%progbits
	.align	1
	.global	clean_block_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	clean_block_list, %function
clean_block_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	movs	r4, #0
	mov	r6, #-1
.L1496:
	mov	r0, r5
	bl	out_phy_block_from_free_list
	cbnz	r0, .L1499
	mov	r1, r0
	mov	r4, #-1
.L1495:
	mov	r0, r5
	bl	out_phy_block_from_invalid_page_list
	cbz	r0, .L1494
	strh	r1, [r0, #4]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strd	r4, r1, [r0, #8]
	strd	r1, r1, [r0, #16]
	strd	r1, r1, [r0, #24]
	str	r1, [r0, #32]
	b	.L1495
.L1499:
	strh	r4, [r0, #4]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strd	r6, r4, [r0, #8]
	strd	r4, r4, [r0, #16]
	strd	r4, r4, [r0, #24]
	str	r4, [r0, #32]
	b	.L1496
.L1494:
	pop	{r4, r5, r6, pc}
	.size	clean_block_list, .-clean_block_list
	.section	.text.nand_clean_zone_table,"ax",%progbits
	.align	1
	.global	nand_clean_zone_table
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_clean_zone_table, %function
nand_clean_zone_table:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #1000
	mov	r4, r0
	bl	__nand_flush_write_cache
	mov	r0, r4
	bl	clean_block_list
	mov	r0, r4
	bl	nand_clean_zone_table2
	mov	r0, r4
	bl	nftl_cache_exit
	movs	r0, #0
	pop	{r4, pc}
	.size	nand_clean_zone_table, .-nand_clean_zone_table
	.section	.text.out_phy_block_from_invalid_page_list_by_block,"ax",%progbits
	.align	1
	.global	out_phy_block_from_invalid_page_list_by_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	out_phy_block_from_invalid_page_list_by_block, %function
out_phy_block_from_invalid_page_list_by_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	del_block_invalid_list_by_block
	cbz	r0, .L1501
	movs	r3, #0
	strd	r3, r3, [r0, #12]
.L1501:
	pop	{r3, pc}
	.size	out_phy_block_from_invalid_page_list_by_block, .-out_phy_block_from_invalid_page_list_by_block
	.section	.text.phy_block_from_invalid_page_incr,"ax",%progbits
	.align	1
	.global	phy_block_from_invalid_page_incr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	phy_block_from_invalid_page_incr, %function
phy_block_from_invalid_page_incr:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r1
	ldrh	r2, [r1, #4]
	mov	r5, r0
	ldr	r1, [r1, #12]
	ldr	r3, [r0, #4]
	adds	r2, r2, #1
	uxth	r2, r2
	ldrh	r3, [r3, #20]
	cbnz	r1, .L1507
	ldr	r1, [r4, #16]
	cbnz	r1, .L1507
	cmp	r2, r3
	strh	r2, [r4, #4]	@ movhi
	bls	.L1509
	ldrh	r1, [r4]
	ldr	r0, .L1521
	bl	NAND_Print_DBG
.L1509:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L1507:
	cmp	r2, r3
	strh	r2, [r4, #4]	@ movhi
	bls	.L1510
	ldr	r0, .L1521+4
	bl	NAND_Print_DBG
.L1510:
	ldr	r3, [r4, #16]
	adds	r5, r5, #188
	cmp	r3, r5
	beq	.L1509
	ldrh	r1, [r4, #4]
.L1512:
	ldrh	r2, [r3, #4]
	cmp	r2, r1
	bcs	.L1509
	ldr	r2, [r3, #16]
	str	r2, [r4, #16]
	ldr	r2, [r3, #16]
	str	r4, [r2, #12]
	ldr	r2, [r4, #12]
	str	r2, [r3, #12]
	ldr	r2, [r4, #12]
	cbz	r2, .L1513
	str	r3, [r2, #16]
.L1513:
	str	r3, [r4, #12]
	str	r4, [r3, #16]
	ldr	r3, [r4, #16]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L1512
	b	.L1509
.L1522:
	.align	2
.L1521:
	.word	.LC276
	.word	.LC277
	.size	phy_block_from_invalid_page_incr, .-phy_block_from_invalid_page_incr
	.section	.text.recover_logic_page_mapping,"ax",%progbits
	.align	1
	.global	recover_logic_page_mapping
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	recover_logic_page_mapping, %function
recover_logic_page_mapping:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r0
	mov	r4, r1
	mov	fp, r2
	mov	r10, r3
	movs	r5, #0
.L1524:
	cmp	r5, r10
	bne	.L1534
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1534:
	ldr	r3, [fp, r5, lsl #2]
	ldr	r2, [r6, #28]
	cmp	r2, r3
	bls	.L1525
	mov	r1, r3
	mov	r0, r6
	bl	get_logic_page_map
	mov	r7, r0
	cbnz	r0, .L1526
	ldr	r0, .L1538
	bl	NAND_Print
	ldrh	r3, [r4, #4]
	adds	r3, r3, #1
	strh	r3, [r4, #4]	@ movhi
.L1527:
	adds	r5, r5, #1
	b	.L1524
.L1526:
	ldrh	r3, [r0, #2]
	movw	r2, #65535
	cmp	r3, r2
	beq	.L1529
	ldr	r2, [r6, #4]
	mov	r8, #36
	mul	r8, r8, r3
	ldr	r2, [r2, #32]
	add	r3, r2, r8
	cmp	r4, r3
	beq	.L1530
	mov	r1, r3
	mov	r0, r6
	str	r2, [sp, #4]
	str	r3, [sp]
	bl	phy_block_from_invalid_page_incr
	ldrd	r3, r2, [sp]
.L1531:
	ldr	r0, [r6, #4]
	ldrh	r1, [r3, #4]
	ldrh	r3, [r0, #20]
	cmp	r1, r3
	bls	.L1529
	ldrh	r1, [r2, r8]
	ldr	r0, .L1538+4
	bl	NAND_Print
.L1529:
	ldrh	r3, [r7]
	bfi	r3, r5, #0, #12
	strh	r3, [r7]	@ movhi
	ldrh	r3, [r4]
	strh	r3, [r7, #2]	@ movhi
	b	.L1527
.L1530:
	ldrh	r1, [r4, #4]
	adds	r1, r1, #1
	strh	r1, [r4, #4]	@ movhi
	b	.L1531
.L1525:
	adds	r2, r3, #1
	beq	.L1533
	mov	r2, r5
	ldrh	r1, [r4]
	ldr	r0, .L1538+8
	bl	NAND_Print
.L1533:
	ldrh	r3, [r4, #4]
	ldr	r2, [r6, #4]
	adds	r3, r3, #1
	ldrh	r2, [r2, #20]
	uxth	r3, r3
	strh	r3, [r4, #4]	@ movhi
	cmp	r2, r3
	bcs	.L1527
	ldr	r0, .L1538+12
	bl	NAND_Print
	b	.L1527
.L1539:
	.align	2
.L1538:
	.word	.LC278
	.word	.LC279
	.word	.LC280
	.word	.LC281
	.size	recover_logic_page_mapping, .-recover_logic_page_mapping
	.section	.text.get_current_used_block,"ax",%progbits
	.align	1
	.global	get_current_used_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_current_used_block, %function
get_current_used_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r0
	mov	r5, r2
	mov	r6, r1
	cmp	r1, #0
	beq	.L1541
	ldr	r3, [r0, #292]
	cmp	r3, r1
	beq	.L1542
	movw	r2, #1013
	ldr	r1, .L1575
	ldr	r0, .L1575+4
	bl	NAND_Print
.L1542:
	ldr	r3, [r4, #292]
	ldrh	r2, [r4, #320]
	ldr	r0, .L1575+8
	ldrh	r1, [r3]
	bl	NAND_Print_DBG
	ldrh	r3, [r4, #320]
	mov	r0, r4
	ldr	r2, [r4, #304]
	ldr	r1, [r4, #292]
	bl	recover_logic_page_mapping
	ldr	r3, [r4, #292]
	ldrh	r1, [r4, #320]
	ldrh	r2, [r3, #4]
	cmp	r1, r2
	bcs	.L1543
	ldr	r0, .L1575+12
	bl	NAND_Print
.L1543:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L1573
	ldr	r6, .L1575+16
	ldr	r8, .L1575+44
.L1544:
	ldr	r7, [r4, #324]
	cbz	r7, .L1546
.L1555:
	ldr	r2, [r4, #336]
	mov	r0, r4
	ldr	r1, [r4, #324]
	bl	recover_phy_page_mapping
	uxth	r3, r0
	movw	r2, #65535
	cmp	r3, r2
	strh	r3, [r4, #352]	@ movhi
	bne	.L1571
	ldr	r0, .L1575+20
.L1572:
	bl	NAND_Print
	ldr	r1, [r4, #324]
	mov	r0, r4
	ldrh	r2, [r1, #6]
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	movs	r3, #0
	str	r3, [r4, #324]
	b	.L1544
.L1546:
	mov	r0, r4
	bl	out_phy_block_from_free_list
	mov	r1, r0
	str	r0, [r4, #324]
	cbnz	r0, .L1549
.L1574:
	movs	r0, #1
	b	.L1540
.L1549:
	ldr	r3, [r4, #292]
	strh	r7, [r4, #352]	@ movhi
	ldr	r2, [r3, #8]
	adds	r2, r2, #1
	str	r2, [r0, #8]
	mov	r0, r4
	bl	new_block_init_for_write
	cbz	r0, .L1550
	mov	r0, r8
	bl	NAND_Print
	str	r7, [r4, #324]
	b	.L1544
.L1550:
	ldrh	r10, [r4, #320]
	mov	r5, r0
.L1552:
	cmp	r5, r10
	ldr	r2, [r4, #324]
	bcs	.L1555
	uxth	r3, r5
	ldr	r7, [r4, #1988]
	ldr	r1, [r4, #292]
	mov	r0, r4
	str	r3, [sp]
	ldr	r3, [r4, #284]
	blx	r7
	cbz	r0, .L1553
	mov	r0, r6
	bl	NAND_Print
.L1553:
	adds	r5, r5, #1
	b	.L1552
.L1571:
	ldr	r3, [r4, #292]
	ldr	r1, [r4, #324]
	ldr	r2, [r3, #8]
	uxth	r3, r0
	mov	r0, r4
	adds	r2, r2, #1
	str	r2, [r1, #8]
	ldr	r2, [r4, #336]
	bl	recover_logic_page_mapping
	ldrh	r1, [r4, #352]
	ldrh	r2, [r4, #320]
	cmp	r1, r2
	bls	.L1556
	ldr	r0, .L1575+24
	bl	NAND_Print
	ldrh	r2, [r4, #320]
	ldrh	r1, [r4, #352]
	ldr	r0, .L1575+28
	bl	NAND_Print
.L1573:
	movs	r0, #0
.L1540:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L1556:
	bcs	.L1573
	ldr	r0, .L1575+32
	b	.L1572
.L1541:
	ldr	r0, .L1575+36
	bl	NAND_Print_DBG
	ldr	r3, [r4, #172]
	cbz	r3, .L1558
	mov	r0, r4
	bl	out_phy_block_from_free_list
	str	r0, [r4, #292]
	cmp	r0, #0
	beq	.L1574
	adds	r5, r5, #1
	strh	r6, [r4, #320]	@ movhi
	str	r5, [r0, #8]
	ldrb	r0, [r4, #17]	@ zero_extendqisi2
	ands	r0, r0, #1
	beq	.L1560
	mov	r0, r4
	bl	out_phy_block_from_free_list
	str	r0, [r4, #324]
	cmp	r0, #0
	beq	.L1574
	ldr	r3, [r4, #292]
	strh	r6, [r4, #352]	@ movhi
	ldr	r3, [r3, #8]
	adds	r3, r3, #1
	str	r3, [r0, #8]
	b	.L1573
.L1560:
	str	r0, [r4, #324]
	b	.L1540
.L1558:
	ldr	r0, .L1575+40
	bl	NAND_Print
	mov	r0, r4
	bl	print_free_list
	mov	r0, r4
	bl	print_block_invalid_list
	b	.L1574
.L1576:
	.align	2
.L1575:
	.word	.LANCHOR22
	.word	.LC282
	.word	.LC283
	.word	.LC284
	.word	.LC286
	.word	.LC287
	.word	.LC288
	.word	.LC289
	.word	.LC245
	.word	.LC290
	.word	.LC291
	.word	.LC285
	.size	get_current_used_block, .-get_current_used_block
	.section	.text.adjust_invaild_list,"ax",%progbits
	.align	1
	.global	adjust_invaild_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	adjust_invaild_list, %function
adjust_invaild_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
.L1578:
	ldr	r3, [r4, #200]
	cbnz	r3, .L1580
.L1579:
	movs	r0, #0
	pop	{r4, pc}
.L1580:
	ldr	r1, [r4, #4]
	ldrh	r2, [r3, #4]
	ldrh	r3, [r1, #20]
	cmp	r2, r3
	bne	.L1579
	mov	r0, r4
	bl	out_phy_block_from_invalid_page_list
	mov	r1, r0
	mov	r0, r4
	bl	put_phy_block_to_free_list
	b	.L1578
	.size	adjust_invaild_list, .-adjust_invaild_list
	.section	.text.second_scan_all_blocks,"ax",%progbits
	.align	1
	.global	second_scan_all_blocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	second_scan_all_blocks, %function
second_scan_all_blocks:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1664
	ldr	r2, .L1664+4
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r3, [r3]
	sub	sp, sp, #104
	ldr	r3, [r3, #752]
	cmp	r3, r2
	beq	.L1582
	subs	r3, r3, #1
	cmp	r3, #1
	bhi	.L1617
.L1582:
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #24]
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	bl	__aeabi_uidiv
	ldr	r5, [r4, #252]
	mov	r3, #-1
	str	r0, [r4, #28]
	str	r3, [sp, #64]
	mov	r10, r5
.L1584:
	cmp	r10, #0
	bne	.L1585
	cmp	r5, #0
	beq	.L1618
	ldr	r3, [r4, #1968]
	mov	r7, r10
	ldr	r2, [r5, #8]
	mov	r6, r10
	mov	r8, r10
	str	r10, [sp, #68]
	str	r2, [r3, #160]
.L1601:
	ldr	r2, [r4, #308]
	lsrs	r3, r2, #9
	ubfx	r2, r2, #0, #9
	cbz	r2, .L1588
	adds	r3, r3, #1
.L1588:
	ldr	r2, [r4, #4]
	ldrh	r0, [r5]
	ldr	r1, [r4, #284]
	ldrh	r2, [r2, #20]
	strh	r3, [sp, #92]	@ movhi
	add	r3, sp, #72
	strh	r0, [sp, #90]	@ movhi
	mov	r0, r4
	subs	r2, r2, #1
	str	r1, [sp, #96]
	str	r3, [sp, #100]
	add	r1, sp, #88
	ldr	r3, [r4, #1980]
	strh	r2, [sp, #88]	@ movhi
	blx	r3
	ldr	r3, [r4, #1972]
	mov	fp, r0
	ldrh	r3, [r3, #28]
	cbz	r3, .L1589
	add	r2, sp, #72
	ldr	r1, [r4, #284]
	mov	r0, r4
	bl	crc_wrong
	cmp	r0, #0
	it	ne
	mvnne	fp, #1
.L1589:
	ldr	r3, [r5, #8]
	ldr	r1, [r4, #376]
	ldr	r2, [r4, #1968]
	str	r3, [sp, #60]
	ldrh	r3, [r5, #6]
	cmp	r3, r1
	bls	.L1590
	movw	r1, #49999
	cmp	r3, r1
	itt	ls
	strls	r3, [r4, #376]
	strls	r3, [r2, #148]
.L1590:
	ldr	r1, [r2, #152]
	add	r0, sp, #72
	cmp	r3, r1
	it	cc
	strcc	r3, [r2, #152]
	bl	is_phy_mapping_page
	cmp	r0, #1
	bne	.L1592
	cmp	fp, #0
	beq	.L1593
	cmp	fp, #10
	bne	.L1592
.L1593:
	ldrh	r3, [r5, #4]
	mov	r10, r5
	ldr	r2, [r4, #284]
	mov	r1, r5
	mov	r0, r4
	adds	r3, r3, #1
	strh	r3, [r5, #4]	@ movhi
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	bl	recover_logic_page_mapping
.L1658:
	mov	r8, r5
	b	.L1594
.L1585:
	ldr	r3, [r10, #8]
	ldr	r10, [r10, #28]
	str	r3, [sp, #64]
	ldr	r2, [sp, #64]
	ldr	r3, [r4, #1968]
	str	r2, [r3, #156]
	b	.L1584
.L1592:
	add	r0, sp, #72
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L1595
	cbz	r6, .L1620
	ldrh	r1, [r6]
	cbnz	r7, .L1596
	ldrh	r2, [r5]
	ldr	r0, .L1664+8
	bl	NAND_Print
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r0, r3, #31
	bmi	.L1622
	ldr	r3, [r6, #8]
	ldr	r0, [r5, #8]
	cmp	r3, r0
	beq	.L1622
	ldrh	r2, [r5]
	ldrh	r1, [r6]
	str	r0, [sp]
	ldr	r0, .L1664+12
	bl	NAND_Print
	ldr	r2, [r4, #304]
	mov	r1, r6
	mov	r0, r4
	bl	recover_phy_page_mapping
	ldr	r3, [r4, #4]
	mov	r1, r6
	ldr	r2, [r4, #304]
	mov	r0, r4
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	bl	recover_logic_page_mapping
	movs	r2, #3
	mov	r1, r6
	mov	r0, r4
	bl	add_prio_gc
.L1620:
	mov	r6, r5
	b	.L1594
.L1596:
	ldr	r2, [r6, #8]
	ldr	r0, .L1664+16
	bl	NAND_Print
	ldr	r2, [r7, #8]
	ldrh	r1, [r7]
	ldr	r0, .L1664+20
	bl	NAND_Print
	ldr	r2, [sp, #60]
	ldrh	r1, [r5]
	ldr	r0, .L1664+24
	bl	NAND_Print
	mov	r1, r6
	mov	r6, r7
	movs	r2, #3
	mov	r0, r4
	bl	add_prio_gc
.L1622:
	mov	r7, r5
	b	.L1594
.L1595:
	ldrb	r0, [sp, #87]	@ zero_extendqisi2
	ldrb	r2, [sp, #73]	@ zero_extendqisi2
	ldrb	r1, [sp, #72]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #86]	@ zero_extendqisi2
	ldrb	r3, [sp, #74]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #85]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #84]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #83]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #82]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #81]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #80]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #79]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #78]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #77]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #76]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #75]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L1664+28
	bl	NAND_Print
	ldrh	r2, [r5]
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L1597
	cmp	fp, #10
	bne	.L1598
.L1597:
	ldr	r0, .L1664+32
.L1657:
	bl	NAND_Print
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L1600
	ldrd	r2, r3, [sp, #60]
	cmp	r3, r2
	bne	.L1600
	ldrh	r2, [r5, #6]
	mov	r1, r5
	mov	r0, r4
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	str	r5, [sp, #68]
.L1594:
	ldr	r5, [r5, #28]
	cmp	r5, #0
	bne	.L1601
.L1586:
	mov	r1, r10
	mov	r0, r4
	bl	init_smart_info
	ldr	r5, [r4, #252]
.L1602:
	cmp	r5, #0
	bne	.L1604
	mov	r0, r4
	bl	adjust_invaild_list
	cmp	r8, #0
	beq	.L1605
	cbz	r6, .L1605
	ldr	r1, [r8, #8]
	ldr	r2, [r6, #8]
	adds	r3, r1, #1
	cmp	r3, r2
	beq	.L1605
	ldr	r0, .L1664+36
	bl	NAND_Print
.L1605:
	movs	r3, #0
	str	r3, [r4, #292]
	cmp	r6, #0
	bne	.L1606
	cmp	r7, #0
	bne	.L1607
	ldr	r0, .L1664+40
	bl	NAND_Print
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L1608
	cmp	r8, #0
	beq	.L1609
.L1662:
	movs	r2, #3
	mov	r1, r8
	mov	r0, r4
	bl	add_prio_gc
	b	.L1609
.L1598:
	ldr	r0, .L1664+44
	b	.L1657
.L1600:
	movs	r3, #170
	ldr	r2, [r4, #304]
	strh	r3, [r5, #2]	@ movhi
	mov	r1, r5
	ldrh	r3, [r5, #4]
	mov	r0, r4
	adds	r3, r3, #1
	strh	r3, [r5, #4]	@ movhi
	bl	recover_block_phy_page_mapping
	ldr	r3, [r4, #4]
	mov	r1, r5
	ldr	r2, [r4, #304]
	mov	r0, r4
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	bl	recover_logic_page_mapping
	movs	r2, #3
	mov	r1, r5
	mov	r0, r4
	bl	add_prio_gc
	b	.L1658
.L1665:
	.align	2
.L1664:
	.word	g_nreg_base
	.word	196609
	.word	.LC292
	.word	.LC293
	.word	.LC294
	.word	.LC295
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.word	.LC300
	.word	.LC301
	.word	.LC299
.L1618:
	mov	r3, #-1
	mov	r7, r10
	mov	r6, r10
	mov	r8, r10
	str	r10, [sp, #68]
	str	r3, [sp, #60]
	b	.L1586
.L1604:
	cmp	r6, r5
	beq	.L1603
	cmp	r7, r5
	beq	.L1603
	ldr	r3, [sp, #68]
	cmp	r3, r5
	beq	.L1603
	mov	r1, r5
	mov	r0, r4
	bl	put_phy_block_to_invalid_page_list
.L1603:
	ldr	r5, [r5, #28]
	b	.L1602
.L1608:
	cmp	r8, #0
	beq	.L1609
	ldrh	r3, [r8, #2]
	cmp	r3, #170
	beq	.L1662
.L1609:
	ldr	r2, [sp, #60]
	mov	r1, r7
	mov	r0, r4
	bl	get_current_used_block
	mov	r5, r0
	cmp	r0, #0
	beq	.L1616
	ldr	r0, .L1666
	bl	NAND_Print
	b	.L1663
.L1606:
	cbnz	r7, .L1607
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L1610
	ldr	r2, [r6, #8]
	ldrh	r1, [r6]
	ldr	r0, .L1666+4
	bl	NAND_Print_DBG
	cmp	r8, #0
	beq	.L1611
	ldrh	r3, [r8, #2]
	cmp	r3, #170
	bne	.L1611
	movs	r2, #3
	mov	r1, r8
	mov	r0, r4
	bl	add_prio_gc
.L1611:
	movs	r2, #0
.L1660:
	mov	r1, r6
	mov	r0, r4
	bl	cross_talk_rebuild_current_block
	mov	r7, r0
	cmp	r0, #0
	bne	.L1609
.L1663:
	movs	r5, #1
.L1581:
	mov	r0, r5
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1610:
	cmp	r8, #0
	beq	.L1612
	ldrh	r3, [r8, #2]
	cmp	r3, #170
	bne	.L1612
	movs	r2, #3
	mov	r1, r8
	mov	r0, r4
	bl	add_prio_gc
.L1612:
	movs	r2, #0
.L1661:
	mov	r1, r6
	mov	r0, r4
	bl	no_cross_talk_rebuild_current_block
	mov	r7, r0
	b	.L1609
.L1607:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	ands	r5, r3, #1
	beq	.L1613
	mov	r2, r7
	b	.L1660
.L1613:
	ldr	r2, [r6, #8]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.L1615
	ldrh	r1, [r6]
	ldr	r0, .L1666+8
	bl	NAND_Print
	ldr	r2, [r7, #8]
	ldrh	r1, [r7]
	ldr	r0, .L1666+12
	bl	NAND_Print_DBG
	mov	r2, r7
	b	.L1661
.L1615:
	ldr	r0, .L1666+16
	bl	NAND_Print
	ldr	r2, [r8, #8]
	ldrh	r1, [r8]
	ldr	r0, .L1666+20
	bl	NAND_Print
	ldr	r2, [r6, #8]
	ldrh	r1, [r6]
	ldr	r0, .L1666+8
	bl	NAND_Print
	ldr	r2, [r7, #8]
	ldrh	r1, [r7]
	ldr	r0, .L1666+12
	bl	NAND_Print_DBG
	ldr	r2, [r4, #304]
	mov	r1, r6
	mov	r0, r4
	bl	recover_block_phy_page_mapping
	ldr	r3, [r4, #4]
	mov	r1, r6
	ldr	r2, [r4, #304]
	mov	r0, r4
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	bl	recover_logic_page_mapping
	movs	r2, #3
	mov	r1, r6
	mov	r0, r4
	bl	add_prio_gc
	mov	r1, r7
	ldr	r2, [r4, #304]
	mov	r0, r4
	bl	recover_block_phy_page_mapping
	ldr	r3, [r4, #4]
	mov	r1, r7
	ldr	r2, [r4, #304]
	mov	r0, r4
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	bl	recover_logic_page_mapping
	mov	r1, r7
	movs	r2, #3
	mov	r0, r4
	mov	r7, r5
	bl	add_prio_gc
	b	.L1609
.L1616:
	mov	r0, r4
	bl	adjust_invaild_list
	ldr	r2, [r4, #1968]
	ldr	r3, [r4, #292]
	ldrh	r1, [r4, #22]
	ldr	r0, .L1666+24
	str	r3, [r4, #48]
	ldr	r3, [r2, #160]
	str	r3, [sp, #4]
	ldr	r3, [r2, #156]
	str	r3, [sp]
	ldrd	r2, r3, [r2, #148]
	bl	NAND_Print_DBG
	b	.L1581
.L1617:
	mov	r5, #-1
	b	.L1581
.L1667:
	.align	2
.L1666:
	.word	.LC307
	.word	.LC302
	.word	.LC303
	.word	.LC304
	.word	.LC305
	.word	.LC306
	.word	.LC308
	.size	second_scan_all_blocks, .-second_scan_all_blocks
	.section	.text.write_phy_page_map_to_current_block,"ax",%progbits
	.align	1
	.global	write_phy_page_map_to_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_phy_page_map_to_current_block, %function
write_phy_page_map_to_current_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, #324
	push	{r0, r1, r4, r5, r6, lr}
	cmp	r1, r3
	mov	r4, r0
	mov	r5, r1
	bne	.L1669
	ldr	r1, [r0, #312]
	mov	r2, #320
	ldr	r0, [r0, #344]
	bl	NAND_Memcpy
.L1669:
	ldr	r3, .L1672
	mov	r1, r5
	ldr	r2, [r5, #4]
	mov	r0, r4
	str	r3, [sp]
	movs	r3, #0
	bl	write_phy_data_to_current_block
	mov	r6, r0
	cbz	r0, .L1670
	ldr	r0, .L1672+4
	bl	NAND_Print
.L1668:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L1670:
	mov	r1, r5
	ldrh	r3, [r5, #28]
	ldr	r2, [r1], #4
	adds	r3, r3, #1
	ldrh	r0, [r2, #4]
	uxth	r3, r3
	strh	r3, [r5, #28]	@ movhi
	adds	r0, r0, #1
	strh	r0, [r2, #4]	@ movhi
	mov	r0, r4
	bl	check_invalid_page_right
	ldr	r3, [r4, #4]
	ldrh	r2, [r5, #28]
	ldrh	r3, [r3, #20]
	cmp	r2, r3
	bne	.L1668
	ldr	r1, [r5]
	mov	r0, r4
	bl	put_phy_block_to_invalid_page_list
	mov	r0, r4
	bl	adjust_invaild_list
	b	.L1668
.L1673:
	.align	2
.L1672:
	.word	-1431633921
	.word	.LC309
	.size	write_phy_page_map_to_current_block, .-write_phy_page_map_to_current_block
	.section	.text.do_after_write,"ax",%progbits
	.align	1
	.global	do_after_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_after_write, %function
do_after_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r6, r0, #292
	mov	r1, r6
	mov	r4, r0
	bl	current_block_at_last_page
	cmp	r0, #1
	mov	r5, r0
	bne	.L1682
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cbz	r0, .L1676
	ldr	r0, .L1693
.L1692:
	bl	NAND_Print
.L1674:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L1676:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L1678
	add	r1, r4, #324
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cbz	r0, .L1678
	ldr	r0, .L1693
	bl	NAND_Print
.L1678:
	mov	r1, r6
	mov	r0, r4
	bl	get_new_current_block
	cbz	r0, .L1680
	ldr	r0, .L1693+4
	b	.L1692
.L1680:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L1681
	add	r1, r4, #324
	mov	r0, r4
	bl	get_new_current_block
	cbz	r0, .L1681
	ldr	r0, .L1693+8
	b	.L1692
.L1681:
	ldr	r3, [r4, #368]
	adds	r3, r3, #1
	str	r3, [r4, #368]
.L1682:
	movs	r5, #0
	b	.L1674
.L1694:
	.align	2
.L1693:
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.size	do_after_write, .-do_after_write
	.section	.text.fill_no_use_data_to_page,"ax",%progbits
	.align	1
	.global	fill_no_use_data_to_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fill_no_use_data_to_page, %function
fill_no_use_data_to_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	add	r5, r0, #292
	mov	r1, r5
	mov	r4, r0
	bl	current_block_at_last_page
	cbz	r0, .L1696
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cbz	r0, .L1697
	ldr	r0, .L1725
.L1723:
	bl	NAND_Print
	movs	r0, #1
	b	.L1695
.L1697:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L1700
	add	r1, r4, #324
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cbz	r0, .L1700
	ldr	r0, .L1725
	bl	NAND_Print
.L1700:
	mov	r1, r5
	mov	r0, r4
	bl	get_new_current_block
	cbz	r0, .L1702
	ldr	r0, .L1725+4
	b	.L1723
.L1702:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bmi	.L1703
.L1704:
	movs	r0, #0
.L1695:
	pop	{r3, r4, r5, pc}
.L1703:
	add	r1, r4, #324
	mov	r0, r4
	bl	get_new_current_block
	cmp	r0, #0
	beq	.L1704
	ldr	r0, .L1725+8
	b	.L1723
.L1696:
	ldrh	r3, [r4, #320]
	cmp	r3, #0
	beq	.L1704
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cbz	r0, .L1705
	ldr	r0, .L1725
	bl	NAND_Print
.L1705:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bmi	.L1706
.L1724:
	movs	r0, #8
	b	.L1695
.L1706:
	add	r1, r4, #324
	mov	r0, r4
	bl	write_phy_page_map_to_current_block
	cmp	r0, #0
	beq	.L1724
	ldr	r0, .L1725
	bl	NAND_Print
	b	.L1724
.L1726:
	.align	2
.L1725:
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.size	fill_no_use_data_to_page, .-fill_no_use_data_to_page
	.section	.text.fill_no_use_data_to_current_block,"ax",%progbits
	.align	1
	.global	fill_no_use_data_to_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fill_no_use_data_to_current_block, %function
fill_no_use_data_to_current_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	movs	r4, #0
.L1728:
	ldr	r3, [r5, #4]
	ldrh	r3, [r3, #20]
	cmp	r3, r4
	bgt	.L1730
	movs	r0, #1
.L1727:
	pop	{r3, r4, r5, pc}
.L1730:
	mov	r0, r5
	bl	fill_no_use_data_to_page
	cmp	r0, #0
	beq	.L1727
	adds	r4, r4, #1
	b	.L1728
	.size	fill_no_use_data_to_current_block, .-fill_no_use_data_to_current_block
	.section	.text.fill_no_use_page_to_current_block,"ax",%progbits
	.align	1
	.global	fill_no_use_page_to_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fill_no_use_page_to_current_block, %function
fill_no_use_page_to_current_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r0
	mov	r5, r1
	movs	r4, #0
.L1735:
	cmp	r4, r5
	blt	.L1737
	movs	r0, #1
.L1734:
	pop	{r4, r5, r6, pc}
.L1737:
	mov	r0, r6
	bl	fill_no_use_data_to_page
	cmp	r0, #0
	beq	.L1734
	adds	r4, r4, #1
	b	.L1735
	.size	fill_no_use_page_to_current_block, .-fill_no_use_page_to_current_block
	.section	.text.nftl_write_end,"ax",%progbits
	.align	1
	.global	nftl_write_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_write_end, %function
nftl_write_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1744
	push	{r4, lr}
	ldr	r4, [r3, #8]
.L1742:
	cbnz	r4, .L1743
	mov	r0, r4
	pop	{r4, pc}
.L1743:
	ldr	r0, [r4, #12]
	movs	r1, #8
	bl	fill_no_use_page_to_current_block
	ldr	r4, [r4, #8]
	b	.L1742
.L1745:
	.align	2
.L1744:
	.word	.LANCHOR4
	.size	nftl_write_end, .-nftl_write_end
	.section	.text.nand_before_shutdown,"ax",%progbits
	.align	1
	.global	nand_before_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_before_shutdown, %function
nand_before_shutdown:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #8
	b	fill_no_use_page_to_current_block
	.size	nand_before_shutdown, .-nand_before_shutdown
	.section	.text.write_logic_data_to_current_block,"ax",%progbits
	.align	1
	.global	write_logic_data_to_current_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_logic_data_to_current_block, %function
write_logic_data_to_current_block:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #192
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r8, r0
	mov	r4, r1
	mov	fp, r3
	bne	.L1748
	mov	r1, r3
	bl	get_logic_page_map
	mov	r10, r0
	cbnz	r0, .L1749
.L1755:
	movs	r7, #1
	ldr	r0, .L1771
	bl	NAND_Print_DBG
.L1747:
	mov	r0, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1749:
	ldrh	r3, [r0, #2]
	movw	r2, #65535
	cmp	r3, r2
	beq	.L1763
	ldr	r2, [r8, #4]
	movs	r5, #36
	ldr	r1, [r2, #32]
	mla	r5, r5, r3, r1
	ldr	r3, [r4]
	cmp	r3, r5
	bne	.L1762
	ldrh	r3, [r5, #4]
	ldrh	r2, [r2, #20]
	adds	r3, r3, #1
	uxth	r3, r3
	cmp	r2, r3
	strh	r3, [r5, #4]	@ movhi
	bcs	.L1763
	ldrh	r1, [r4, #28]
	ldr	r0, .L1771+4
	bl	NAND_Print_DBG
.L1763:
	movs	r6, #0
	b	.L1751
.L1762:
	movs	r6, #1
.L1751:
	movs	r3, #192
	ldr	r2, [sp, #40]
	str	r3, [sp]
	mov	r1, r4
	mov	r3, fp
	mov	r0, r8
	bl	write_phy_data_to_current_block
	mov	r7, r0
	cbz	r0, .L1752
	ldr	r0, .L1771+8
.L1770:
	bl	NAND_Print
	b	.L1747
.L1752:
	ldr	r3, [r4]
	ldrh	r1, [r4, #28]
	ldr	r2, [r8, #364]
	ldrh	r3, [r3]
	ubfx	r0, r1, #0, #12
	adds	r1, r1, #1
	clz	r2, r2
	strh	r3, [r10, #2]	@ movhi
	lsrs	r2, r2, #5
	ldrh	r3, [r10]
	bfi	r3, r0, #0, #12
	strh	r3, [r10]	@ movhi
	ubfx	r3, r3, #8, #8
	bfi	r3, r2, #4, #1
	strb	r3, [r10, #1]
	ldr	r3, [r4, #12]
	str	fp, [r3, r0, lsl #2]
	strh	r1, [r4, #28]	@ movhi
.L1753:
	cmp	r6, #0
	beq	.L1758
	mov	r1, r5
	mov	r0, r8
	bl	phy_block_from_invalid_page_incr
	b	.L1758
.L1748:
	ldr	r6, .L1771+12
	cmp	r2, r6
	bne	.L1754
	mov	r1, r3
	bl	get_logic_page_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L1755
	ldrh	r3, [r0, #2]
	movw	r2, #65535
	cmp	r3, r2
	beq	.L1766
	ldr	r2, [r8, #4]
	movs	r5, #36
	ldr	r1, [r2, #32]
	mla	r5, r5, r3, r1
	ldr	r3, [r4]
	cmp	r3, r5
	bne	.L1765
	ldrh	r3, [r0]
	mov	r0, #-1
	ldr	r1, [r4, #12]
	ldrh	r2, [r2, #20]
	ubfx	r3, r3, #0, #12
	str	r0, [r1, r3, lsl #2]
	ldrh	r3, [r5, #4]
	adds	r3, r3, #1
	uxth	r3, r3
	cmp	r2, r3
	strh	r3, [r5, #4]	@ movhi
	bcs	.L1766
	ldrh	r1, [r4, #28]
	ldr	r0, .L1771+16
	bl	NAND_Print
.L1766:
	movs	r6, #0
	b	.L1756
.L1765:
	movs	r6, #1
.L1756:
	movw	r3, #65535
	movw	r2, #4095
	strh	r3, [r7, #2]	@ movhi
	ldrh	r3, [r7]
	bfi	r3, r2, #0, #12
	strh	r3, [r7]	@ movhi
	ubfx	r3, r3, #8, #8
	orr	r3, r3, #16
	strb	r3, [r7, #1]
	b	.L1753
.L1754:
	ldr	r5, .L1771+20
	cmp	r2, r5
	bne	.L1758
	ldr	r6, [r1]
	ldrh	r5, [r6, #4]
	adds	r5, r5, #1
	strh	r5, [r6, #4]	@ movhi
	str	r2, [sp]
	ldr	r2, [sp, #40]
	bl	write_phy_data_to_current_block
	mov	r7, r0
	cbz	r0, .L1759
	ldr	r0, .L1771+24
	b	.L1770
.L1759:
	ldrh	r3, [r4, #28]
	adds	r3, r3, #1
	strh	r3, [r4, #28]	@ movhi
.L1758:
	mov	r0, r8
	movs	r7, #0
	bl	adjust_invaild_list
	b	.L1747
.L1772:
	.align	2
.L1771:
	.word	.LC313
	.word	.LC314
	.word	.LC315
	.word	-1441722095
	.word	.LC316
	.word	-1441713357
	.word	.LC317
	.size	write_logic_data_to_current_block, .-write_logic_data_to_current_block
	.section	.text.write_data_to_page,"ax",%progbits
	.align	1
	.global	write_data_to_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_data_to_page, %function
write_data_to_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	str	r3, [sp]
	mov	r7, r2
	mov	r8, r3
	mov	r3, r2
	mov	r2, r1
	add	r1, r0, #292
	mov	r4, r0
	bl	write_logic_data_to_current_block
	mov	r5, r0
	cbz	r0, .L1774
.L1777:
	movs	r5, #1
	ldr	r0, .L1779
	bl	NAND_Print
.L1773:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L1774:
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L1773
	str	r8, [sp]
	mov	r3, r7
	mov	r2, r6
	add	r1, r4, #324
	mov	r0, r4
	bl	write_logic_data_to_current_block
	cmp	r0, #0
	beq	.L1773
	b	.L1777
.L1780:
	.align	2
.L1779:
	.word	.LC318
	.size	write_data_to_page, .-write_data_to_page
	.section	.text._nftl_discard_logic_page,"ax",%progbits
	.align	1
	.global	_nftl_discard_logic_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_discard_logic_page, %function
_nftl_discard_logic_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r1
	movs	r3, #0
	ldr	r1, .L1782
	b	write_data_to_page
.L1783:
	.align	2
.L1782:
	.word	-1441722095
	.size	_nftl_discard_logic_page, .-_nftl_discard_logic_page
	.section	.text.nand_write_data_page,"ax",%progbits
	.align	1
	.global	nand_write_data_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_write_data_page, %function
nand_write_data_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	add	r1, r0, #292
	mov	r5, r0
	mov	r7, r2
	mov	r8, r3
	bl	current_block_at_last_page
	cmp	r0, #1
	mov	r4, r0
	bne	.L1785
	mov	r0, r5
	bl	do_after_write
	cbz	r0, .L1785
	ldr	r0, .L1796
	bl	NAND_Print
.L1784:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L1785:
	mov	r0, r5
	bl	do_before_write
	cbz	r0, .L1787
	ldr	r0, .L1796+4
.L1795:
	bl	NAND_Print
	movs	r4, #1
	b	.L1784
.L1787:
	mov	r3, r8
	mov	r2, r7
	mov	r1, r6
	mov	r0, r5
	bl	write_data_to_page
	cbz	r0, .L1788
	ldr	r0, .L1796+8
	b	.L1795
.L1788:
	mov	r0, r5
	bl	do_after_write
	mov	r4, r0
	cmp	r0, #0
	beq	.L1784
	ldr	r0, .L1796+12
	b	.L1795
.L1797:
	.align	2
.L1796:
	.word	.LC319
	.word	.LC320
	.word	.LC321
	.word	.LC322
	.size	nand_write_data_page, .-nand_write_data_page
	.section	.text.nand_write_logic_page_no_gc,"ax",%progbits
	.align	1
	.global	nand_write_logic_page_no_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_write_logic_page_no_gc, %function
nand_write_logic_page_no_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r2
	mov	r2, r1
	movs	r1, #192
	b	nand_write_data_page
	.size	nand_write_logic_page_no_gc, .-nand_write_logic_page_no_gc
	.section	.text.garbage_collect_first,"ax",%progbits
	.align	1
	.global	garbage_collect_first
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	garbage_collect_first, %function
garbage_collect_first:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #96
	mov	r5, r1
	add	r7, sp, #64
	mov	r4, r0
	mov	r6, r2
	movs	r1, #90
	movs	r2, #16
	mov	r0, r7
	bl	NAND_Memset
	cbnz	r5, .L1800
	mov	r0, r4
	bl	out_phy_block_from_invalid_page_list
.L1840:
	mov	r5, r0
	cbnz	r0, .L1803
	ldr	r0, .L1841
	bl	NAND_Print
	movs	r0, #8
.L1799:
	add	sp, sp, #96
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1800:
	mov	r1, r5
	mov	r0, r4
	bl	is_current_blcok
	cmp	r0, #1
	beq	.L1818
	mov	r0, r4
	bl	out_phy_block_from_invalid_page_list_by_block
	b	.L1840
.L1803:
	ldr	r2, [r4, #1968]
	ldrh	r0, [r0]
	ldr	r3, [r2, #120]
	strh	r0, [sp, #82]	@ movhi
	mov	r0, r4
	adds	r3, r3, #1
	str	r3, [r2, #120]
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #284]
	ldrh	r1, [r3, #28]
	ldrh	r3, [r3, #20]
	strd	r2, r7, [sp, #88]
	strh	r1, [sp, #84]	@ movhi
	add	r1, sp, #80
	subs	r3, r3, #1
	strh	r3, [sp, #80]	@ movhi
	ldr	r3, [r4, #1980]
	blx	r3
	mov	r10, r0
	mov	r0, r7
	bl	is_phy_mapping_page
	cmp	r0, #1
	mov	r8, r0
	beq	.L1804
	ldr	r0, .L1841+4
	mov	r8, #1
	bl	NAND_Print_DBG
	ldr	r3, [r4, #4]
	ldrh	r1, [r5]
	ldr	r0, .L1841+8
	ldrh	r2, [r3, #20]
	ldrh	r3, [r3, #28]
	subs	r2, r2, #1
	str	r3, [sp]
	movs	r3, #0
	bl	NAND_Print_DBG
	ldrb	r0, [sp, #79]	@ zero_extendqisi2
	ldrb	r3, [sp, #67]	@ zero_extendqisi2
	ldrb	r2, [sp, #66]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #78]	@ zero_extendqisi2
	ldrb	r1, [sp, #65]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #77]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #76]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #75]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #74]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #73]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #72]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #71]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #70]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #68]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L1841+12
	bl	NAND_Print_DBG
	ldrh	r2, [r5]
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	ldr	r0, .L1841+16
	bl	NAND_Print_DBG
	ldr	r2, [r4, #268]
	mov	r1, r5
	mov	r0, r4
	bl	recover_block_phy_page_mapping
.L1805:
	ldr	r3, [r4, #4]
	mov	r2, r5
	add	r1, r4, #260
	mov	r0, r4
	ldrh	r3, [r3, #20]
	bl	check_invalid_page_right
	cmp	r0, #0
	beq	.L1807
	mov	r8, #1
	movw	r6, #65535
	ldr	r0, .L1841+20
	bl	NAND_Print
.L1809:
	mov	r10, #0
.L1808:
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	cmp	r3, r10
	bhi	.L1816
.L1815:
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	subs	r3, r3, #1
	cmp	r3, r10
	bne	.L1817
	movs	r6, #0
	strh	r6, [r4, #386]	@ movhi
	cmp	r8, #0
	beq	.L1817
	ldr	r0, .L1841+24
	bl	NAND_Print
	ldrh	r2, [r5, #6]
	mov	r1, r5
	mov	r0, r4
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
.L1818:
	movs	r0, #0
	b	.L1799
.L1804:
	cmp	r10, #0
	beq	.L1806
	cmp	r10, #10
	beq	.L1806
	ldrh	r1, [r5]
	ldr	r0, .L1841+28
	bl	NAND_Print_DBG
	ldr	r2, [r4, #268]
	mov	r1, r5
	mov	r0, r4
	bl	recover_block_phy_page_mapping
	b	.L1805
.L1806:
	ldr	r2, [r4, #272]
	mov	r8, #0
	ldr	r1, [r4, #284]
	ldr	r0, [r4, #268]
	bl	NAND_Memcpy
	b	.L1805
.L1807:
	movw	r3, #65535
	cmp	r8, #0
	it	ne
	movne	r6, r3
	b	.L1809
.L1816:
	ldr	r3, [r4, #268]
	ldr	r3, [r3, r10, lsl #2]
	adds	r2, r3, #1
	beq	.L1810
	mov	r1, r3
	mov	r0, r4
	str	r3, [sp, #60]
	bl	get_logic_page_map
	mov	fp, r0
	cmp	r0, #0
	beq	.L1810
	ldrh	r2, [r0, #2]
	ldrh	r1, [r5]
	cmp	r1, r2
	bne	.L1810
	ldrh	r2, [r0]
	ubfx	r2, r2, #0, #12
	cmp	r2, r10
	bne	.L1810
	ldr	r0, [r4, #1968]
	ldr	ip, [r4, #4]
	strh	r1, [sp, #82]	@ movhi
	add	r1, sp, #80
	ldr	r2, [r0, #124]
	strh	r10, [sp, #80]	@ movhi
	adds	r2, r2, #1
	str	r2, [r0, #124]
	ldrh	r0, [ip, #28]
	ldr	r2, [r4, #288]
	strh	r0, [sp, #84]	@ movhi
	mov	r0, r4
	strd	r2, r7, [sp, #88]
	ldr	r2, [r4, #1980]
	blx	r2
	str	r0, [sp, #56]
	mov	r0, r7
	bl	get_logic_page_from_oob
	ldrd	r2, r3, [sp, #56]
	cbz	r2, .L1811
	cmp	r2, #10
	bne	.L1812
.L1811:
	cmp	r3, r0
	beq	.L1813
	ldrh	r1, [r5]
	mov	r2, r10
	str	r3, [sp]
	mov	r3, r0
	ldr	r0, .L1841+32
	mov	r8, #1
	bl	NAND_Print_DBG
	ldrb	r0, [sp, #79]	@ zero_extendqisi2
	movw	r6, #65535
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	ldrb	r2, [sp, #65]	@ zero_extendqisi2
	str	r0, [sp, #48]
	ldrb	r0, [sp, #78]	@ zero_extendqisi2
	ldrb	r1, [sp, #64]	@ zero_extendqisi2
	str	r0, [sp, #44]
	ldrb	r0, [sp, #77]	@ zero_extendqisi2
	str	r0, [sp, #40]
	ldrb	r0, [sp, #76]	@ zero_extendqisi2
	str	r0, [sp, #36]
	ldrb	r0, [sp, #75]	@ zero_extendqisi2
	str	r0, [sp, #32]
	ldrb	r0, [sp, #74]	@ zero_extendqisi2
	str	r0, [sp, #28]
	ldrb	r0, [sp, #73]	@ zero_extendqisi2
	str	r0, [sp, #24]
	ldrb	r0, [sp, #72]	@ zero_extendqisi2
	str	r0, [sp, #20]
	ldrb	r0, [sp, #71]	@ zero_extendqisi2
	str	r0, [sp, #16]
	ldrb	r0, [sp, #70]	@ zero_extendqisi2
	str	r0, [sp, #12]
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	str	r0, [sp, #8]
	ldrb	r0, [sp, #68]	@ zero_extendqisi2
	str	r0, [sp, #4]
	ldrb	r0, [sp, #67]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L1841+36
	bl	NAND_Print
	ldrh	r3, [fp]
	movw	r2, #4095
	strh	r6, [fp, #2]	@ movhi
	bfi	r3, r2, #0, #12
	strh	r3, [fp]	@ movhi
	ldrh	r3, [r5, #4]
	adds	r3, r3, #1
	strh	r3, [r5, #4]	@ movhi
.L1814:
	subs	r6, r6, #1
	uxth	r6, r6
	cmp	r6, #0
	beq	.L1815
.L1810:
	add	r10, r10, #1
	b	.L1808
.L1813:
	ldr	r2, [r4, #288]
	mov	r1, r3
	mov	r0, r4
	bl	nand_write_logic_page_no_gc
	cmp	r0, #0
	beq	.L1814
	ldr	r0, .L1841+40
	bl	NAND_Print
	movs	r0, #1
	b	.L1799
.L1812:
	ldrh	r3, [r5, #4]
	mov	r8, #1
	movw	r6, #65535
	adds	r3, r3, #1
	strh	r3, [r5, #4]	@ movhi
	b	.L1814
.L1817:
	mov	r1, r5
	mov	r0, r4
	bl	put_phy_block_to_invalid_page_list
	mov	r0, r4
	bl	adjust_invaild_list
	b	.L1818
.L1842:
	.align	2
.L1841:
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC329
	.word	.LC333
	.word	.LC328
	.word	.LC330
	.word	.LC331
	.word	.LC332
	.size	garbage_collect_first, .-garbage_collect_first
	.section	.text.do_prio_gc,"ax",%progbits
	.align	1
	.global	do_prio_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_prio_gc, %function
do_prio_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #564]
	push	{r3, r4, r5, r6, r7, lr}
	mov	r6, r0
	cmp	r1, #0
	beq	.L1856
	add	r4, r0, #392
	mov	r0, r4
	bl	del_from_gc_list
	ldr	r7, [r0, #4]
	mov	r5, r0
	mov	r0, r6
	mov	r1, r7
	bl	is_current_blcok
	cmp	r0, #1
	bne	.L1845
	mov	r1, r5
	mov	r0, r4
	bl	add_to_gc_list_tail
.L1857:
	movs	r4, #0
.L1843:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L1845:
	cbnz	r7, .L1846
	ldr	r0, .L1860
	bl	NAND_Print_DBG
	strh	r7, [r5, #2]	@ movhi
	strh	r7, [r6, #394]	@ movhi
	str	r7, [r5, #4]
	b	.L1857
.L1846:
	mov	r0, r6
	bl	is_block_in_invalid_list
	ldrh	r2, [r5, #2]
	mov	r4, r0
	cbnz	r0, .L1847
	ldrh	r1, [r7]
	ldr	r0, .L1860+4
.L1858:
	bl	NAND_Print_DBG
	b	.L1859
.L1847:
	cmp	r2, #5
	strh	r2, [r6, #394]	@ movhi
	bne	.L1848
	movs	r4, #0
	movs	r2, #4
	mov	r0, r6
	bl	garbage_collect_first
.L1859:
	strh	r4, [r5, #2]	@ movhi
	strh	r4, [r6, #394]	@ movhi
	str	r4, [r5, #4]
	b	.L1843
.L1848:
	movw	r2, #65535
	mov	r0, r6
	bl	garbage_collect_first
	ldr	r3, [r5, #4]
	mov	r4, r0
	cbz	r0, .L1849
	ldrh	r1, [r3]
	movs	r4, #1
	ldrh	r2, [r5, #2]
	ldr	r0, .L1860+8
	bl	NAND_Print
	movs	r3, #0
	strh	r3, [r5, #2]	@ movhi
	strh	r3, [r6, #394]	@ movhi
	str	r3, [r5, #4]
	b	.L1843
.L1849:
	mov	r1, r3
	mov	r0, r6
	bl	is_block_in_free_list
	cbnz	r0, .L1850
	ldrh	r2, [r5, #2]
	ldrh	r1, [r3]
	ldr	r0, .L1860+12
	b	.L1858
.L1850:
	mov	r0, r6
	bl	out_phy_block_from_free_list_by_block
	mov	r1, r0
	cbnz	r0, .L1851
	ldr	r3, [r5, #4]
	ldrh	r2, [r5, #2]
	ldr	r0, .L1860+16
	ldrh	r1, [r3]
	b	.L1858
.L1851:
	ldrh	r2, [r0, #6]
	mov	r0, r6
	adds	r2, r2, #1
	uxth	r2, r2
	bl	erase_block
	movs	r3, #0
	strh	r3, [r5, #2]	@ movhi
	strh	r3, [r6, #394]	@ movhi
	str	r3, [r5, #4]
	b	.L1843
.L1856:
	mov	r4, r1
	b	.L1843
.L1861:
	.align	2
.L1860:
	.word	.LC334
	.word	.LC335
	.word	.LC336
	.word	.LC337
	.word	.LC338
	.size	do_prio_gc, .-do_prio_gc
	.section	.text.prio_gc_all,"ax",%progbits
	.align	1
	.global	prio_gc_all
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	prio_gc_all, %function
prio_gc_all:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r0
	movs	r5, #10
	movs	r4, #0
.L1863:
	mov	r0, r6
	bl	do_prio_gc
	subs	r5, r5, #1
	orr	r4, r4, r0
	bne	.L1863
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.size	prio_gc_all, .-prio_gc_all
	.section	.text._nftl_nand_read_logic_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_read_logic_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_read_logic_page, %function
_nftl_nand_read_logic_page:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #36
	mov	r4, r0
	mov	r7, r1
	mov	r6, r2
	bl	get_logic_page_map
	mov	r5, r0
	cbnz	r0, .L1866
	movs	r6, #1
	ldr	r0, .L1870
	bl	NAND_Print_DBG
.L1865:
	mov	r0, r6
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1866:
	ldrh	r2, [r0, #2]
	movw	r1, #65535
	ldr	r3, [r4, #4]
	cmp	r2, r1
	bne	.L1868
	mov	r0, r6
	ldrh	r2, [r3, #26]
	movs	r1, #255
	movs	r6, #0
	bl	NAND_Memset
	b	.L1865
.L1868:
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	ldr	r0, [r4, #364]
	bfi	r1, r0, #4, #1
	mov	r0, r4
	strb	r1, [r5, #1]
	ldrh	r1, [r3, #28]
	ldrh	r3, [r5]
	str	r6, [sp, #24]
	strh	r1, [sp, #20]	@ movhi
	add	r1, sp, #16
	ubfx	r3, r3, #0, #12
	strh	r2, [sp, #18]	@ movhi
	strh	r3, [sp, #16]	@ movhi
	str	sp, [sp, #28]
	ldr	r3, [r4, #1980]
	blx	r3
	adds	r3, r0, #2
	mov	r6, r0
	bne	.L1869
	ldr	r3, [r4, #4]
	movs	r0, #36
	ldrh	r1, [r5, #2]
	movs	r2, #1
	ldr	r3, [r3, #32]
	mla	r1, r0, r1, r3
	mov	r0, r4
	bl	add_prio_gc
	mov	r1, r7
	ldr	r0, .L1870+4
	bl	NAND_Print
.L1869:
	mov	r0, r4
	bl	do_prio_gc
	b	.L1865
.L1871:
	.align	2
.L1870:
	.word	.LC107
	.word	.LC339
	.size	_nftl_nand_read_logic_page, .-_nftl_nand_read_logic_page
	.section	.text.done_static_wear_leveling,"ax",%progbits
	.align	1
	.global	done_static_wear_leveling
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	done_static_wear_leveling, %function
done_static_wear_leveling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, [r0, #580]
	cbz	r5, .L1878
	mov	r1, r5
	bl	is_current_blcok
	cmp	r0, #1
	bne	.L1874
	movs	r3, #0
	str	r3, [r4, #580]
.L1878:
	movs	r5, #2
	b	.L1872
.L1874:
	mov	r0, r4
	bl	is_block_in_invalid_list
	ldrh	r1, [r5]
	mov	r6, r0
	cbnz	r0, .L1875
	ldr	r0, .L1879
	bl	NAND_Print_DBG
	str	r6, [r4, #580]
	b	.L1878
.L1875:
	ldrh	r2, [r5, #6]
	movs	r5, #1
	ldr	r0, .L1879+4
	bl	NAND_Print_DBG
	ldr	r2, [r4, #1968]
	mov	r0, r4
	strh	r5, [r4, #578]	@ movhi
	ldr	r3, [r2, #128]
	add	r3, r3, r5
	str	r3, [r2, #128]
	bl	fill_no_use_data_to_current_block
	movw	r2, #65535
	ldr	r1, [r4, #580]
	mov	r0, r4
	bl	garbage_collect_first
	ldr	r2, [r4, #580]
	mov	r3, r0
	cbz	r0, .L1876
	ldrh	r1, [r2]
	ldr	r0, .L1879+8
	bl	NAND_Print
	movs	r3, #0
	str	r3, [r4, #580]
.L1872:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L1876:
	strh	r0, [r4, #578]	@ movhi
	mov	r1, r2
	mov	r0, r4
	bl	is_block_in_free_list
	mov	r5, r0
	cbnz	r0, .L1877
	ldrh	r1, [r2]
	ldr	r0, .L1879+12
	bl	NAND_Print
	str	r5, [r4, #580]
	b	.L1872
.L1877:
	str	r3, [r4, #580]
	mov	r5, r3
	b	.L1872
.L1880:
	.align	2
.L1879:
	.word	.LC340
	.word	.LC341
	.word	.LC342
	.word	.LC343
	.size	done_static_wear_leveling, .-done_static_wear_leveling
	.section	.text.do_static_wear_leveling,"ax",%progbits
	.align	1
	.global	do_static_wear_leveling
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	do_static_wear_leveling, %function
do_static_wear_leveling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #1972]
	push	{r4, lr}
	mov	r4, r0
	ldrh	r3, [r3, #6]
	cbnz	r3, .L1882
.L1884:
	movs	r0, #0
.L1881:
	pop	{r4, pc}
.L1882:
	ldrh	r3, [r0, #384]
	cbz	r3, .L1885
	bl	check_static_wear_leveling
	cmp	r0, #0
	bne	.L1884
	mov	r0, r4
	pop	{r4, lr}
	b	done_static_wear_leveling
.L1885:
	movs	r0, #1
	b	.L1881
	.size	do_static_wear_leveling, .-do_static_wear_leveling
	.section	.text.gc_one,"ax",%progbits
	.align	1
	.global	gc_one
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_one, %function
gc_one:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #200]
	push	{r4, lr}
	cbnz	r3, .L1887
.L1889:
	movs	r4, #8
.L1886:
	mov	r0, r4
	pop	{r4, pc}
.L1887:
	ldrh	r3, [r3, #4]
	cmp	r3, r1
	bls	.L1889
	movw	r2, #65535
	movs	r1, #0
	bl	garbage_collect_first
	cmp	r0, #8
	mov	r4, r0
	beq	.L1889
	cbnz	r0, .L1890
	ldr	r0, .L1894
	bl	NAND_Print_DBG
	b	.L1886
.L1890:
	ldr	r0, .L1894+4
	movs	r4, #1
	bl	NAND_Print
	b	.L1886
.L1895:
	.align	2
.L1894:
	.word	.LC344
	.word	.LC345
	.size	gc_one, .-gc_one
	.section	.text.gc_all_cnt,"ax",%progbits
	.align	1
	.global	gc_all_cnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_all_cnt, %function
gc_all_cnt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r6, r1
	mov	r4, r2
.L1897:
	cbz	r4, .L1901
	mov	r1, r6
	mov	r0, r5
	bl	gc_one
	cmp	r0, #8
	add	r4, r4, #-1
	bne	.L1897
.L1901:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
	.size	gc_all_cnt, .-gc_all_cnt
	.section	.text.gc_all_base_on_free_blks,"ax",%progbits
	.align	1
	.global	gc_all_base_on_free_blks
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_all_base_on_free_blks, %function
gc_all_base_on_free_blks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r3, [r0, #22]
	ldrh	r1, [r0, #380]
	push	{r4, r5, r6, lr}
	mov	r5, r0
	cmp	r3, r1
	bcc	.L1902
	ldrh	r2, [r0, #382]
	add	r2, r2, r2, lsl #1
	cmp	r2, r3
	bcc	.L1902
	ldr	r6, .L1907
	ldrb	r0, [r6, #10]	@ zero_extendqisi2
	ldrh	r4, [r6, #8]
	muls	r4, r0, r4
	ldr	r0, [r6, #4]
	muls	r0, r4, r0
	cmp	r0, #264192
	bcs	.L1902
	ldr	r0, [r5, #4]
	subs	r3, r3, r1
	subs	r1, r2, r1
	ldrh	r4, [r0, #20]
	lsrs	r4, r4, #1
	subs	r0, r4, #3
	muls	r0, r3, r0
	bl	__aeabi_uidiv
	adds	r1, r4, r0
	movs	r2, #3
	mov	r0, r5
	uxth	r1, r1
	pop	{r4, r5, r6, lr}
	b	gc_all_cnt
.L1902:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L1908:
	.align	2
.L1907:
	.word	.LANCHOR23
	.size	gc_all_base_on_free_blks, .-gc_all_base_on_free_blks
	.section	.text.gc_all,"ax",%progbits
	.align	1
	.global	gc_all
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_all, %function
gc_all:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
.L1910:
	mov	r1, r5
	mov	r0, r4
	bl	gc_one
	cmp	r0, #0
	beq	.L1910
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.size	gc_all, .-gc_all
	.section	.text.gc_all_enhance,"ax",%progbits
	.align	1
	.global	gc_all_enhance
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_all_enhance, %function
gc_all_enhance:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r1, [r0, #22]
	ldrh	r2, [r0, #380]
	push	{r4}
	cmp	r2, r1
	bhi	.L1913
	ldrh	r2, [r0, #382]
	add	r2, r2, r2, lsl #1
	cmp	r2, r1
	bcc	.L1913
	ldr	r4, .L1918
	ldrb	r2, [r4, #10]	@ zero_extendqisi2
	ldrh	r1, [r4, #8]
	muls	r1, r2, r1
	ldr	r2, [r4, #4]
	muls	r2, r1, r2
	cmp	r2, #264192
	bcs	.L1913
	ldr	r3, [r0, #4]
	pop	{r4}
	ldrh	r1, [r3, #20]
	lsrs	r1, r1, #1
	b	gc_all
.L1913:
	movs	r0, #0
	pop	{r4}
	bx	lr
.L1919:
	.align	2
.L1918:
	.word	.LANCHOR23
	.size	gc_all_enhance, .-gc_all_enhance
	.section	.text.gc_win_block,"ax",%progbits
	.align	1
	.global	gc_win_block
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	gc_win_block, %function
gc_win_block:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	ldr	r3, [r0, #4]
	movs	r5, #0
	ldrh	r6, [r3, #20]
	muls	r6, r1, r6
.L1921:
	cmp	r5, r6
	blt	.L1923
	movs	r4, #0
	b	.L1920
.L1923:
	ldr	r4, [r7, #200]
	cbz	r4, .L1920
	ldrh	r3, [r4, #4]
	movs	r1, #1
	mov	r0, r7
	add	r5, r5, r3
	subs	r5, r5, #1
	bl	gc_one
	mov	r4, r0
	cmp	r0, #0
	beq	.L1921
	cmp	r0, #1
	bne	.L1920
	ldr	r0, .L1927
	bl	NAND_Print_DBG
.L1920:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L1928:
	.align	2
.L1927:
	.word	.LC346
	.size	gc_win_block, .-gc_win_block
	.section	.text.power_on_gc,"ax",%progbits
	.align	1
	.global	power_on_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	power_on_gc, %function
power_on_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r0
	ldrh	r6, [r0, #22]
	sub	sp, sp, #20
	ldrh	r7, [r0, #380]
	ldr	r3, [r0, #4]
	cmp	r6, r7
	ldrh	r5, [r3, #20]
	bcc	.L1930
	ldrb	r8, [r3, #8]	@ zero_extendqisi2
	ldrh	r10, [r0, #382]
	ldr	r0, [r0, #32]
	mov	r1, r8
	bl	__aeabi_uidiv
	mov	r1, r5
	bl	__aeabi_uidiv
	mov	r1, r8
	str	r0, [sp, #8]
	ldr	r0, [r4, #24]
	bl	__aeabi_uidiv
	mov	r1, r5
	bl	__aeabi_uidiv
	ldrh	r3, [r4, #18]
	mov	r2, r7
	str	r0, [sp, #4]
	mov	r1, r6
	ldr	r0, .L1940
	str	r3, [sp]
	mov	r3, r10
	bl	NAND_Print_DBG
.L1931:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L1930:
	subs	r5, r5, #10
	movs	r7, #0
	uxth	r5, r5
.L1932:
	ldrh	r2, [r4, #22]
	uxth	r6, r7
	ldrh	r3, [r4, #380]
	cmp	r2, r3
	bcs	.L1935
	mov	r1, r5
	mov	r0, r4
	bl	gc_one
	cmp	r0, #8
	add	r7, r7, #1
	bne	.L1932
.L1935:
	ldr	r3, [r4, #4]
	ldr	r7, .L1940+4
	ldrh	r5, [r3, #20]
	lsrs	r5, r5, #3
.L1933:
	ldrh	r1, [r4, #22]
	cmp	r1, #4
	bhi	.L1938
	mov	r0, r7
	bl	NAND_Print_DBG
	mov	r1, r5
	mov	r0, r4
	bl	gc_one
	cmp	r0, #8
	bne	.L1936
.L1938:
	mov	r1, r6
	ldr	r0, .L1940+8
	bl	NAND_Print_DBG
	b	.L1931
.L1936:
	adds	r6, r6, #1
	uxth	r6, r6
	b	.L1933
.L1941:
	.align	2
.L1940:
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.size	power_on_gc, .-power_on_gc
	.section	.text.build_zone_list,"ax",%progbits
	.align	1
	.global	build_zone_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	build_zone_list, %function
build_zone_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	ldr	r0, .L1947
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	first_scan_all_blocks
	ldrh	r1, [r4, #18]
	mov	r0, r4
	bl	init_zone_after_first_scan
	cbz	r0, .L1943
	ldr	r0, .L1947+4
.L1946:
	movs	r5, #1
	bl	NAND_Print
.L1942:
	mov	r0, r5
	pop	{r3, r4, r5, pc}
.L1943:
	mov	r0, r4
	bl	second_scan_all_blocks
	mov	r5, r0
	cbz	r0, .L1945
	ldr	r0, .L1947+8
	b	.L1946
.L1945:
	mov	r0, r4
	bl	power_on_gc
	mov	r0, r4
	bl	print_nftl_zone
	ldr	r0, .L1947+12
	bl	NAND_Print
	mov	r0, r4
	bl	panic_backup_block
	b	.L1942
.L1948:
	.align	2
.L1947:
	.word	.LC350
	.word	.LC351
	.word	.LC352
	.word	.LC353
	.size	build_zone_list, .-build_zone_list
	.section	.text.nand_find_zone_table,"ax",%progbits
	.align	1
	.global	nand_find_zone_table
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_find_zone_table, %function
nand_find_zone_table:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	bl	clean_block_list
	mov	r0, r4
	bl	nand_clean_zone_table2
	ldr	r0, .L1950
	bl	NAND_Print_DBG
	ldr	r5, .L1950+4
	mov	r0, r4
	bl	build_zone_list
	ldr	r0, .L1950+8
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	nftl_cache_init
	mov	r0, r5
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	print_block_invalid_list
	mov	r0, r4
	bl	print_free_list
	mov	r0, r5
	bl	NAND_Print_DBG
	ldr	r0, .L1950+12
	bl	NAND_Print_DBG
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L1951:
	.align	2
.L1950:
	.word	.LC354
	.word	.LC356
	.word	.LC355
	.word	.LC357
	.size	nand_find_zone_table, .-nand_find_zone_table
	.section	.text.nand_check_table,"ax",%progbits
	.align	1
	.global	nand_check_table
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_check_table, %function
nand_check_table:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r1, #1000
	ldr	r4, .L1953
	mov	r5, r0
	bl	__nand_flush_write_cache
	mov	r0, r4
	bl	NAND_Print_DBG
	mov	r0, r5
	bl	print_nftl_zone
	mov	r0, r4
	bl	NAND_Print_DBG
	mov	r0, r5
	bl	nand_clean_zone_table
	mov	r0, r4
	bl	NAND_Print_DBG
	mov	r0, r5
	bl	nand_find_zone_table
	mov	r0, r5
	bl	write_data_to_nand
	mov	r0, r4
	bl	NAND_Print_DBG
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L1954:
	.align	2
.L1953:
	.word	.LC358
	.size	nand_check_table, .-nand_check_table
	.global	__aeabi_idiv
	.section	.text.nftl_start,"ax",%progbits
	.align	1
	.global	nftl_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_start, %function
nftl_start:
	@ args = 40, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #40
	ldr	r3, [sp, #92]
	mov	r6, r2
	ldr	r2, [sp, #76]
	ldr	r7, [sp, #88]
	lsr	r10, r3, #9
	ldr	r3, [sp, #72]
	strd	r0, r1, [sp, #28]
	mov	r0, #2016
	lsrs	r7, r7, #9
	lsrs	r3, r3, #9
	orr	r3, r3, r2, lsl #23
	ldr	r2, [sp, #84]
	str	r3, [sp, #20]
	ldr	r3, [sp, #80]
	lsrs	r3, r3, #9
	orr	r3, r3, r2, lsl #23
	str	r3, [sp, #24]
	bl	NAND_Malloc
	mov	r4, r0
	str	r0, [r6]
	cbz	r0, .L1956
	lsl	r3, r10, #9
	uxth	r3, r3
	str	r3, [sp, #16]
	movs	r3, #2
.L1979:
.L1957:
	mov	r2, #2016
	movs	r1, #0
	mov	r0, r4
	str	r3, [sp, #12]
	bl	NAND_Memset
	ldr	r3, [sp, #28]
	movs	r0, #36
	str	r3, [r4]
	ldr	r3, [sp, #32]
	str	r3, [r4, #1972]
	bl	NAND_Malloc
	str	r0, [r4, #4]
	cbnz	r0, .L1959
	ldr	r1, .L1981
	ldr	r0, .L1981+4
	b	.L1980
.L1956:
	ldr	r1, .L1981
	ldr	r0, .L1981+8
.L1980:
	mvn	r5, #1
	bl	NAND_Print
.L1955:
	mov	r0, r5
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L1959:
	movs	r2, #4
	movs	r1, #0
	bl	NAND_Memset
	ldr	r3, .L1981+12
	movs	r2, #8
	ldr	r0, [r4, #4]
	ldr	r3, [r3]
	ldr	r1, [r3, #8]
	add	r1, r1, r2
	bl	NAND_Memcpy
	ldr	r5, [r4, #4]
	mov	r1, r7
	ldrh	r3, [sp, #16]
	ldr	r0, [sp, #24]
	strh	r3, [r5, #26]	@ movhi
	ldr	r3, [sp, #96]
	strb	r3, [r5, #10]
	bl	__aeabi_uidiv
	ldr	r2, [r4, #1972]
	mov	r8, r0
	ldrh	r2, [r2, #12]
	cmp	r2, r0
	bcs	.L1969
	uxth	r3, r0
	mov	r1, r10
	mov	r0, r7
	str	r3, [sp, #4]
	mov	fp, #36
	ldrh	r3, [sp, #4]
	strh	r3, [r5, #24]	@ movhi
	bl	__aeabi_uidiv
	uxtb	r2, r10
	add	r3, r8, #1
	strh	r0, [r5, #20]	@ movhi
	strb	r2, [r5, #8]
	strh	r2, [r5, #28]	@ movhi
	movw	r2, #3000
	strh	r2, [r5, #16]	@ movhi
	mul	r2, fp, r3
	str	r3, [sp, #8]
	mov	r0, r2
	str	r2, [sp, #36]
	bl	nftl_malloc
	ldr	r3, [r4, #4]
	str	r0, [r5, #32]
	ldr	r2, [sp, #36]
	ldr	r0, [r3, #32]
	cbnz	r0, .L1960
	ldr	r1, .L1981
	ldr	r0, .L1981+16
	b	.L1980
.L1960:
	subs	r2, r2, #36
	movs	r1, #255
	bl	NAND_Memset
	movs	r1, #0
	mov	ip, #-1
	mov	r2, r1
.L1961:
	ldr	r3, [sp, #8]
	cmp	r3, r1
	bhi	.L1962
	ldr	r0, [r6]
	bl	nftl_ops_init
	mov	r1, r7
	ldr	r0, [sp, #20]
	bl	__aeabi_uidiv
	ldr	r3, [sp, #4]
	subs	r0, r3, r0
	ldr	r3, [r4, #1972]
	uxth	r2, r0
	ldrh	r3, [r3, #12]
	strh	r2, [r4, #22]	@ movhi
	cmp	r3, r2
	bls	.L1963
	mov	r1, r2
	ldr	r0, .L1981+20
	b	.L1980
.L1962:
	ldr	r3, [r4, #4]
	mul	r0, fp, r1
	ldr	lr, [r3, #32]
	add	r3, lr, r0
	strh	r1, [lr, r0]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	adds	r1, r1, #1
	strh	r2, [r3, #2]	@ movhi
	str	ip, [r3, #8]
	strh	r2, [r3, #6]	@ movhi
	strd	r2, r2, [r3, #12]
	strd	r2, r2, [r3, #20]
	strd	r2, r2, [r3, #28]
	b	.L1961
.L1963:
	mov	r1, r8
	ldr	r0, .L1981+24
	bl	NAND_Print_DBG
	ldrh	r3, [r4, #22]
	movs	r1, #0
	ldr	r0, [r6]
	sub	r2, r8, r3
	muls	r2, r7, r2
	muls	r3, r7, r3
	bl	zone_param_init
	mov	r5, r0
	cbz	r0, .L1964
	ldr	r0, .L1981+28
	bl	NAND_Print
	b	.L1955
.L1964:
	ldr	r3, [sp, #104]
	ldr	r2, [r4, #1972]
	strb	r3, [r4, #16]
	ldrh	r3, [r2, #26]
	cbz	r3, .L1965
	ldrb	r3, [r4, #17]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #17]
.L1965:
	ldrh	r3, [r2, #10]
	cbz	r3, .L1966
	mov	r1, r8
	ldr	r0, [r6]
	bl	is_no_use_device
	cmp	r0, #1
	bne	.L1966
	mov	r1, r8
	ldr	r0, [r6]
	bl	build_zone_list_first
	mov	r8, r0
	cbz	r0, .L1966
	ldr	r0, .L1981+32
	bl	NAND_Print
.L1968:
	mov	r5, r8
	b	.L1955
.L1966:
	ldr	r0, [r6]
	bl	build_zone_list
	mov	r8, r0
	cbz	r0, .L1967
	ldr	r0, .L1981+36
	bl	NAND_Print
	ldr	r3, [sp, #12]
	cmp	r3, #1
	beq	.L1968
	ldr	r0, .L1981+40
	bl	NAND_Print
	movs	r3, #1
	b	.L1979
.L1967:
	ldr	r0, [r6]
	bl	nftl_cache_init
	b	.L1955
.L1969:
	mov	r5, #-1
	b	.L1955
.L1982:
	.align	2
.L1981:
	.word	.LANCHOR24
	.word	.LC360
	.word	.LC359
	.word	g_nsi
	.word	.LC361
	.word	.LC362
	.word	.LC363
	.word	.LC364
	.word	.LC365
	.word	.LC366
	.word	.LC367
	.size	nftl_start, .-nftl_start
	.section	.text.nftl_initialize,"ax",%progbits
	.align	1
	.global	nftl_initialize
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_initialize, %function
nftl_initialize:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #60
	ldr	r5, [r0, #4]
	mov	r4, r0
	mov	r6, r1
	movs	r2, #9
	ldr	r1, .L2005
	add	r0, sp, #44
	bl	memcpy
	add	r0, sp, #56
	movs	r3, #47
	strh	r3, [r0, #-16]!	@ movhi
	ldr	r1, .L2005+4
	bl	nand_fdt_get_string
	cbz	r0, .L1997
	movs	r2, #9
	add	r1, sp, #44
	bl	NAND_Memcmp
	mov	r7, r0
	cbnz	r0, .L1997
	ldr	r3, .L2005+8
	ldr	r2, .L2005+12
	ldr	r1, .L2005+16
	str	r3, [sp, #4]
	ldr	r3, .L2005+20
	ldr	r0, .L2005+24
	str	r3, [sp]
	ldr	r3, .L2005+28
	bl	NAND_Print
	ldr	r0, .L2005+32
	bl	nftl_get_nand_phyinfo
	ldrh	r3, [r5, #34]
	cmp	r3, #15
	bhi	.L2001
.L1997:
	mov	r6, #-1
	b	.L1983
.L2001:
	movs	r0, #36
	bl	NAND_Malloc
	str	r0, [r4, #16]
	cbnz	r0, .L1987
	movs	r6, #1
	ldr	r1, .L2005+36
	ldr	r0, .L2005+40
	bl	NAND_Print
.L1983:
	mov	r0, r6
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L1987:
	str	r7, [r0, #8]
	mov	r2, #65536
	ldr	r7, [r5, #80]
	mov	r3, #65537
	strd	r2, r3, [r0]
	movs	r1, #3
	ldr	r2, [r7, #36]
	ldrh	r3, [r2, #2478]
	strh	r3, [r0, #12]	@ movhi
	ldrh	r3, [r2, #2480]
	strh	r1, [r0, #20]	@ movhi
	strh	r3, [r0, #16]	@ movhi
	movs	r3, #8
	strh	r3, [r0, #14]	@ movhi
	movs	r3, #2
	strh	r3, [r0, #18]	@ movhi
	ldr	r3, .L2005+44
	str	r3, [r0, #32]
	ldrh	r3, [r2, #2474]
	cmp	r3, #0
	bne	.L1988
.L2002:
	movs	r3, #30
	strh	r1, [r0, #24]	@ movhi
	strh	r3, [r0, #22]	@ movhi
.L1989:
	ldrh	r3, [r7, #2]
	strh	r3, [r0, #26]	@ movhi
	cmp	r3, #0
	beq	.L1992
	movs	r3, #3
.L2004:
	ldr	r1, [r2, #2492]
	strh	r3, [r0, #24]	@ movhi
	ldrh	r3, [r0, #22]
	ldr	r7, .L2005+48
	sub	r2, r1, #86016
	sub	r2, r2, #384
	cmp	r3, #30
	itt	hi
	movhi	r3, #30
	strhhi	r3, [r0, #22]	@ movhi
	movs	r3, #1
	cmp	r2, r7
	strh	r3, [r0, #24]	@ movhi
	it	ls
	strls	r1, [r0, #32]
	strh	r3, [r0, #28]	@ movhi
	bl	nftl_support_boot_check_crc_from_dts
	cbnz	r0, .L1996
	ldr	r3, [r4, #16]
	strh	r0, [r3, #28]	@ movhi
.L1996:
	movs	r3, #0
	str	r5, [sp, #28]
	strd	r6, r3, [sp, #32]
	mov	r0, r4
	ldrh	r3, [r5, #34]
	ldr	r1, [r4, #16]
	str	r3, [sp, #24]
	ldrh	r3, [r5, #40]
	str	r3, [sp, #20]
	ldr	r3, [r5, #44]
	str	r3, [sp, #16]
	ldrd	r2, [r5, #72]
	strd	r2, [sp, #8]
	ldrd	r2, [r5, #64]
	strd	r2, [sp]
	add	r2, r4, #12
	bl	nftl_start
	mov	r6, r0
	cmp	r0, #0
	bne	.L1983
	ldr	r3, [r5, #80]
	ldr	r0, .L2005+52
	ldr	r2, [r3, #36]
	ldr	r3, [r4, #12]
	ldr	r1, [r2, #2484]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #2488]
	strh	r1, [r3, #16]	@ movhi
	uxth	r1, r1
	strh	r2, [r3, #30]	@ movhi
	bl	NAND_Print_DBG
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #24]
	str	r6, [r4, #8]
	str	r3, [r4]
	ldr	r3, .L2005+56
	str	r3, [r4, #44]
	ldr	r3, .L2005+60
	str	r3, [r4, #40]
	ldr	r3, .L2005+64
	str	r3, [r4, #48]
	ldr	r3, .L2005+68
	str	r3, [r4, #56]
	ldr	r3, .L2005+72
	str	r3, [r4, #52]
	ldr	r3, .L2005+76
	str	r3, [r4, #60]
	ldr	r3, .L2005+80
	str	r3, [r4, #64]
	ldr	r3, .L2005+84
	str	r3, [r4, #68]
	ldr	r3, .L2005+88
	str	r3, [r4, #72]
	b	.L1983
.L1988:
	cmp	r3, #255
	bne	.L1990
	movs	r3, #1
	strh	r3, [r0]	@ movhi
	movs	r3, #50
	strh	r3, [r0, #22]	@ movhi
	movs	r3, #40
.L2003:
	strh	r3, [r0, #24]	@ movhi
	b	.L1989
.L1990:
	cmp	r3, #10
	bls	.L1991
	movs	r3, #10
	strh	r3, [r2, #2474]	@ movhi
	b	.L2002
.L1991:
	add	r3, r3, r3, lsl #2
	add	r1, r3, r3, lsl #2
	lsls	r3, r3, #3
	lsls	r1, r1, #1
	strh	r1, [r0, #22]	@ movhi
	b	.L2003
.L1992:
	movs	r3, #1
	b	.L2004
.L2006:
	.align	2
.L2005:
	.word	.LANCHOR15+21
	.word	.LANCHOR25
	.word	.LC372
	.word	.LC369
	.word	.LC370
	.word	.LC373
	.word	.LC371
	.word	.LC368
	.word	.LANCHOR23
	.word	.LANCHOR26
	.word	.LC374
	.word	1296000
	.word	7692600
	.word	.LC375
	.word	_nand_read
	.word	_nand_read_history
	.word	_nand_write
	.word	_nand_discard
	.word	_nand_flush_write_cache
	.word	_shutdown_op
	.word	_nand_sector_read
	.word	_nand_sector_write
	.word	_nand_flush_sector_write_cache
	.size	nftl_initialize, .-nftl_initialize
	.section	.text.nftl_add,"ax",%progbits
	.align	1
	.global	nftl_add
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_add, %function
nftl_add:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	movs	r0, #76
	bl	NAND_Malloc
	mov	r4, r0
	cbnz	r0, .L2008
	ldr	r1, .L2011
	ldr	r0, .L2011+4
	bl	NAND_Print
.L2007:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2008:
	mov	r0, r5
	bl	build_nand_partition
	ldrh	r1, [r5]
	str	r0, [r4, #4]
	mov	r0, r4
	bl	nftl_initialize
	cbz	r0, .L2010
	ldr	r0, .L2011+8
	movs	r4, #0
	bl	NAND_Print
	b	.L2007
.L2010:
	mov	r1, r4
	ldr	r0, .L2011+12
	bl	add_nftl_blk_list
	mov	r0, r4
	bl	panic_recover_data
	ldr	r0, .L2011+16
	bl	NAND_Print_DBG
	b	.L2007
.L2012:
	.align	2
.L2011:
	.word	.LANCHOR27
	.word	.LC376
	.word	.LC377
	.word	.LANCHOR4
	.word	.LC378
	.size	nftl_add, .-nftl_add
	.section	.text.nftl_build_all,"ax",%progbits
	.align	1
	.global	nftl_build_all
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_build_all, %function
nftl_build_all:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r2, #0
	ldr	r4, [r0, #56]
	ldr	r3, .L2018
	str	r2, [r3, #8]
.L2014:
	mov	r0, r4
	cbz	r4, .L2013
	bl	nftl_add
	cbnz	r0, .L2015
	ldr	r0, .L2018+4
	bl	NAND_Print
	movs	r0, #1
.L2013:
	pop	{r4, pc}
.L2015:
	ldr	r4, [r4, #48]
	b	.L2014
.L2019:
	.align	2
.L2018:
	.word	.LANCHOR4
	.word	.LC379
	.size	nftl_build_all, .-nftl_build_all
	.section	.text.nftl_build_one,"ax",%progbits
	.align	1
	.global	nftl_build_one
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_build_one, %function
nftl_build_one:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r1
	ldr	r4, [r0, #56]
	cbnz	r1, .L2022
	ldr	r3, .L2026
	str	r1, [r3, #8]
.L2022:
	cbnz	r4, .L2025
	mov	r0, r4
	b	.L2020
.L2025:
	ldrh	r3, [r4]
	cmp	r3, r5
	bne	.L2023
	mov	r0, r4
	bl	nftl_add
	cbnz	r0, .L2023
	ldr	r0, .L2026+4
	bl	NAND_Print
	movs	r0, #1
.L2020:
	pop	{r3, r4, r5, pc}
.L2023:
	ldr	r4, [r4, #48]
	b	.L2022
.L2027:
	.align	2
.L2026:
	.word	.LANCHOR4
	.word	.LC379
	.size	nftl_build_one, .-nftl_build_one
	.section	.text.all_time_gc,"ax",%progbits
	.align	1
	.global	all_time_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	all_time_gc, %function
all_time_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r1, [r0, #22]
	ldrh	r2, [r0, #382]
	push	{r3, lr}
	cmp	r1, r2
	bcs	.L2029
	ldrh	r2, [r0, #384]
	cbz	r2, .L2029
	ldr	r3, [r0, #4]
	ldrh	r1, [r3, #20]
	subs	r1, r1, #3
	uxth	r1, r1
	bl	gc_one
.L2029:
	movs	r0, #0
	pop	{r3, pc}
	.size	all_time_gc, .-all_time_gc
	.section	.text.shutdown_on_gc,"ax",%progbits
	.align	1
	.global	shutdown_on_gc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	shutdown_on_gc, %function
shutdown_on_gc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r2, [r0, #382]
	push	{r4, r5, lr}
	sub	sp, sp, #20
	ldrh	r3, [r0, #384]
	mov	r4, r0
	str	r2, [sp, #8]
	ldrh	r2, [r0, #380]
	ldr	r5, .L2041
	ldr	r1, .L2041+4
	str	r2, [sp, #4]
	ldrh	r2, [r0, #22]
	str	r2, [sp]
	ldr	r2, [r0, #200]
	ldr	r0, .L2041+8
	bl	NAND_Print_DBG
.L2034:
	ldrh	r1, [r4, #22]
	ldrh	r3, [r4, #382]
.L2037:
	cmp	r1, r3
	bhi	.L2036
	ldr	r2, [r4, #200]
	cbnz	r2, .L2035
	ldrh	r2, [r4, #380]
	ldr	r0, .L2041+12
	bl	NAND_Print
.L2036:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L2035:
	ldrh	r2, [r4, #384]
	cmp	r2, #0
	beq	.L2037
	movs	r1, #0
	mov	r0, r4
	bl	gc_one
	ldrh	r3, [r4, #382]
	mov	r0, r5
	ldrh	r2, [r4, #380]
	ldrh	r1, [r4, #22]
	bl	NAND_Print_DBG
	b	.L2034
.L2042:
	.align	2
.L2041:
	.word	.LC382
	.word	.LANCHOR28
	.word	.LC380
	.word	.LC381
	.size	shutdown_on_gc, .-shutdown_on_gc
	.section	.text.garbage_collect,"ax",%progbits
	.align	1
	.global	garbage_collect
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	garbage_collect, %function
garbage_collect:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r3, [r0, #380]
	ldrh	r1, [r0, #22]
	push	{r4, lr}
	mov	r4, r0
	cmp	r3, r1
	itt	cs
	movcs	r3, #0
	strhcs	r3, [r0, #384]	@ movhi
	ldrh	r0, [r0, #384]
	cbz	r0, .L2045
.L2062:
	movs	r0, #0
	b	.L2043
.L2045:
	ldrh	r3, [r4, #382]
	cmp	r3, r1
	bls	.L2047
	ldrh	r3, [r4, #386]
	cbnz	r3, .L2049
	ldr	r3, [r4, #200]
	cbnz	r3, .L2050
	ldr	r0, .L2064
	bl	NAND_Print
.L2063:
	movs	r0, #1
.L2043:
	pop	{r4, pc}
.L2050:
	ldrh	r2, [r3, #4]
	ldr	r3, [r4, #4]
	ldrh	r3, [r3, #20]
	cmp	r2, r3, lsr #1
	bcc	.L2051
	movs	r3, #4
.L2061:
	strh	r3, [r4, #388]	@ movhi
	ldr	r3, [r4, #1972]
	ldrh	r2, [r4, #22]
	ldrh	r3, [r3, #16]
	cmp	r2, r3
	itt	ls
	movwls	r3, #65535
	strhls	r3, [r4, #388]	@ movhi
.L2049:
	ldrh	r2, [r4, #388]
	movw	r3, #65535
	cmp	r2, r3
	beq	.L2056
	movs	r1, #0
	mov	r0, r4
	bl	garbage_collect_first
	cmp	r0, #0
	beq	.L2062
	ldrh	r1, [r4, #22]
	ldr	r0, .L2064+4
	bl	NAND_Print
	b	.L2063
.L2051:
	cmp	r2, r3, lsr #2
	bcc	.L2053
	movs	r3, #8
	b	.L2061
.L2053:
	cmp	r2, r3, lsr #3
	bcc	.L2054
	movs	r3, #16
	b	.L2061
.L2054:
	ldr	r0, .L2064+8
	bl	NAND_Print_DBG
	movw	r3, #65535
	b	.L2061
.L2056:
	movs	r1, #1
	mov	r0, r4
	bl	gc_win_block
	b	.L2062
.L2047:
	movs	r3, #1
	strh	r0, [r4, #388]	@ movhi
	str	r3, [r4, #384]
	b	.L2043
.L2065:
	.align	2
.L2064:
	.word	.LC383
	.word	.LC385
	.word	.LC384
	.size	garbage_collect, .-garbage_collect
	.section	.text._nftl_nand_write_logic_page,"ax",%progbits
	.align	1
	.global	_nftl_nand_write_logic_page
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_nftl_nand_write_logic_page, %function
_nftl_nand_write_logic_page:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	mov	r6, r1
	bl	nand_write_logic_page_no_gc
	mov	r4, r0
	cbz	r0, .L2067
	movs	r4, #1
	mov	r1, r6
	ldr	r0, .L2069
	bl	NAND_Print
.L2066:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L2067:
	mov	r0, r5
	bl	garbage_collect
	mov	r0, r5
	bl	all_time_gc
	mov	r0, r5
	bl	do_prio_gc
	b	.L2066
.L2070:
	.align	2
.L2069:
	.word	.LC386
	.size	_nftl_nand_write_logic_page, .-_nftl_nand_write_logic_page
	.section	.text.nftl_sector_cache_init,"ax",%progbits
	.align	1
	.global	nftl_sector_cache_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_sector_cache_init, %function
nftl_sector_cache_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r3, #16
	movs	r5, #0
	mov	r4, r0
	str	r3, [r0, #1620]
	str	r5, [r0, #1624]
	mov	r0, #8192
	bl	NAND_Malloc
	str	r0, [r4, #1624]
	cbnz	r0, .L2072
	ldr	r1, .L2076
	ldr	r0, .L2076+4
	bl	NAND_Print
	movs	r0, #1
.L2071:
	pop	{r4, r5, r6, pc}
.L2072:
	mov	r2, r5
	str	r5, [r4, #1960]
	str	r5, [r4, #1964]
	mov	r3, r4
	movs	r6, #255
	mov	r5, #-1
	mov	r1, r2
.L2074:
	strh	r2, [r3, #1628]	@ movhi
	add	r4, r0, r2, lsl #9
	adds	r2, r2, #1
	strh	r6, [r3, #1630]	@ movhi
	cmp	r2, #16
	str	r5, [r3, #1632]
	str	r1, [r3, #1640]
	add	r3, r3, #20
	str	r1, [r3, #1624]
	str	r4, [r3, #1616]
	bne	.L2074
	movs	r0, #0
	b	.L2071
.L2077:
	.align	2
.L2076:
	.word	.LANCHOR29
	.word	.LC387
	.size	nftl_sector_cache_init, .-nftl_sector_cache_init
	.section	.text.nftl_sector_cache_exit,"ax",%progbits
	.align	1
	.global	nftl_sector_cache_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nftl_sector_cache_exit, %function
nftl_sector_cache_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, [r0, #1624]
	bl	nftl_free
	movs	r0, #0
	pop	{r3, pc}
	.size	nftl_sector_cache_exit, .-nftl_sector_cache_exit
	.section	.text.search_from_sector_cache_write_list,"ax",%progbits
	.align	1
	.global	search_from_sector_cache_write_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	search_from_sector_cache_write_list, %function
search_from_sector_cache_write_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #340]
.L2080:
	cbnz	r0, .L2082
.L2079:
	bx	lr
.L2082:
	ldr	r3, [r0, #4]
	cmp	r3, r1
	beq	.L2079
	ldr	r0, [r0, #12]
	b	.L2080
	.size	search_from_sector_cache_write_list, .-search_from_sector_cache_write_list
	.section	.text.get_empty_sector_cahce_node,"ax",%progbits
	.align	1
	.global	get_empty_sector_cahce_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_empty_sector_cahce_node, %function
get_empty_sector_cahce_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	movs	r1, #20
	push	{r4, lr}
.L2086:
	mul	r2, r1, r3
	adds	r4, r0, r2
	ldrh	r4, [r4, #10]
	cmp	r4, #255
	bne	.L2084
	adds	r2, r2, #8
	add	r0, r0, r2
.L2083:
	pop	{r4, pc}
.L2084:
	adds	r3, r3, #1
	cmp	r3, #16
	bne	.L2086
	movs	r0, #0
	b	.L2083
	.size	get_empty_sector_cahce_node, .-get_empty_sector_cahce_node
	.section	.text.add_to_sector_cache_write_list_tail,"ax",%progbits
	.align	1
	.global	add_to_sector_cache_write_list_tail
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	add_to_sector_cache_write_list_tail, %function
add_to_sector_cache_write_list_tail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r0, #328
.L2089:
	ldr	r3, [r2, #12]
	cbnz	r3, .L2090
	str	r1, [r2, #12]
	strd	r3, r2, [r1, #12]
	movs	r2, #1
	strh	r2, [r1, #2]	@ movhi
	ldrh	r2, [r0, #2]
	adds	r2, r2, #1
	strh	r2, [r0, #2]	@ movhi
	mov	r0, r3
	bx	lr
.L2090:
	mov	r2, r3
	b	.L2089
	.size	add_to_sector_cache_write_list_tail, .-add_to_sector_cache_write_list_tail
	.section	.text.del_from_sector_cache_write_list,"ax",%progbits
	.align	1
	.global	del_from_sector_cache_write_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	del_from_sector_cache_write_list, %function
del_from_sector_cache_write_list:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r3, r2, [r1, #12]
	str	r3, [r2, #12]
	ldr	r3, [r1, #12]
	cbz	r3, .L2092
	str	r2, [r3, #16]
.L2092:
	movs	r3, #0
	strd	r3, r3, [r1, #12]
	movs	r3, #255
	strh	r3, [r1, #2]	@ movhi
	ldrh	r3, [r0, #2]
	subs	r3, r3, #1
	strh	r3, [r0, #2]	@ movhi
	mov	r0, r1
	bx	lr
	.size	del_from_sector_cache_write_list, .-del_from_sector_cache_write_list
	.section	.text.nand_sector_cache_read,"ax",%progbits
	.align	1
	.global	nand_sector_cache_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_sector_cache_read, %function
nand_sector_cache_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	addw	r0, r0, #1620
	mov	r5, r2
	bl	search_from_sector_cache_write_list
	cbz	r0, .L2097
	ldr	r1, [r0, #8]
	mov	r2, #512
	mov	r0, r5
	bl	NAND_Memcpy
	movs	r0, #0
.L2096:
	pop	{r4, r5, r6, pc}
.L2097:
	mov	r3, r2
	mov	r0, r4
	movs	r2, #1
	bl	__nand_read
	cmp	r0, #0
	beq	.L2096
	ldr	r0, .L2102
	bl	NAND_Print
	movs	r0, #1
	b	.L2096
.L2103:
	.align	2
.L2102:
	.word	.LC388
	.size	nand_sector_cache_read, .-nand_sector_cache_read
	.section	.text.__nand_sector_read,"ax",%progbits
	.align	1
	.global	__nand_sector_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_sector_read, %function
__nand_sector_read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, r0
	mov	r4, r1
	mov	r6, r3
	adds	r7, r1, r2
	movs	r5, #0
.L2105:
	cmp	r4, r7
	bne	.L2106
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L2106:
	mov	r2, r6
	mov	r1, r4
	mov	r0, r8
	adds	r4, r4, #1
	bl	nand_sector_cache_read
	add	r6, r6, #512
	orrs	r5, r5, r0
	b	.L2105
	.size	__nand_sector_read, .-__nand_sector_read
	.section	.text.nand_sector_cache_write,"ax",%progbits
	.align	1
	.global	nand_sector_cache_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	nand_sector_cache_write, %function
nand_sector_cache_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	addw	r5, r0, #1620
	mov	r6, r0
	mov	r0, r5
	mov	r8, r1
	mov	r7, r2
	bl	search_from_sector_cache_write_list
	mov	r4, r0
	cbz	r0, .L2108
	mov	r1, r0
	mov	r0, r5
	bl	del_from_sector_cache_write_list
.L2116:
	mov	r2, #512
	mov	r1, r7
	ldr	r0, [r4, #8]
	bl	NAND_Memcpy
	mov	r1, r4
	mov	r0, r5
	bl	add_to_sector_cache_write_list_tail
	movs	r0, #0
	b	.L2107
.L2108:
	ldrh	r3, [r6, #1622]
	cmp	r3, #7
	bls	.L2110
	ldr	r1, [r6, #1960]
	mov	r0, r5
	bl	del_from_sector_cache_write_list
	movs	r2, #1
	mov	r4, r0
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #4]
	mov	r0, r6
	bl	__nand_write
	cbz	r0, .L2111
	ldr	r0, .L2117
.L2115:
	bl	NAND_Print
	movs	r0, #1
.L2107:
	pop	{r4, r5, r6, r7, r8, pc}
.L2110:
	mov	r0, r5
	bl	get_empty_sector_cahce_node
	mov	r4, r0
	cbnz	r0, .L2111
	ldr	r0, .L2117+4
	b	.L2115
.L2111:
	str	r8, [r4, #4]
	b	.L2116
.L2118:
	.align	2
.L2117:
	.word	.LC389
	.word	.LC390
	.size	nand_sector_cache_write, .-nand_sector_cache_write
	.section	.text.__nand_sector_write,"ax",%progbits
	.align	1
	.global	__nand_sector_write
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_sector_write, %function
__nand_sector_write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, r0
	mov	r4, r1
	mov	r6, r3
	adds	r7, r1, r2
	movs	r5, #0
.L2120:
	cmp	r4, r7
	bne	.L2121
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L2121:
	mov	r2, r6
	mov	r1, r4
	mov	r0, r8
	adds	r4, r4, #1
	bl	nand_sector_cache_write
	add	r6, r6, #512
	orrs	r5, r5, r0
	b	.L2120
	.size	__nand_sector_write, .-__nand_sector_write
	.section	.text.__nand_flush_sector_write_cache,"ax",%progbits
	.align	1
	.global	__nand_flush_sector_write_cache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__nand_flush_sector_write_cache, %function
__nand_flush_sector_write_cache:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	mov	r6, r1
	addw	r7, r0, #1620
	movs	r4, #0
.L2123:
	ldr	r1, [r5, #1960]
	cbz	r1, .L2124
	mov	r0, r7
	bl	del_from_sector_cache_write_list
	movs	r2, #1
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #4]
	mov	r0, r5
	bl	__nand_write
	subs	r6, r6, #1
	mov	r4, r0
	bne	.L2123
.L2124:
	cbz	r4, .L2122
	ldr	r0, .L2133
	bl	NAND_Print
.L2122:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L2134:
	.align	2
.L2133:
	.word	.LC74
	.size	__nand_flush_sector_write_cache, .-__nand_flush_sector_write_cache
	.section	.text.toshiba_read_retry_clock_save,"ax",%progbits
	.align	1
	.global	toshiba_read_retry_clock_save
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_read_retry_clock_save, %function
toshiba_read_retry_clock_save:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L2136
	ldr	r0, [r0, #260]
	ldr	r3, [r3]
	ldr	r2, .L2136+4
	ldr	r1, .L2136+8
	ldr	r0, [r0, #8]
	blx	r3
	ldr	r0, [r4, #260]
	movs	r2, #20
	ldr	r3, .L2136+12
	movs	r1, #10
	ldr	r0, [r0, #8]
	ldr	r3, [r3]
	blx	r3
	movs	r0, #0
	pop	{r4, pc}
.L2137:
	.align	2
.L2136:
	.word	NAND_GetClk
	.word	.LANCHOR30
	.word	.LANCHOR31
	.word	NAND_SetClk
	.size	toshiba_read_retry_clock_save, .-toshiba_read_retry_clock_save
	.section	.text.toshiba_read_retry_clock_recover,"ax",%progbits
	.align	1
	.global	toshiba_read_retry_clock_recover
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_read_retry_clock_recover, %function
toshiba_read_retry_clock_recover:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, [r0, #260]
	ldr	r3, .L2139
	ldr	r2, .L2139+4
	ldr	r1, .L2139+8
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0, #8]
	blx	r3
	movs	r0, #0
	pop	{r3, pc}
.L2140:
	.align	2
.L2139:
	.word	NAND_SetClk
	.word	.LANCHOR30
	.word	.LANCHOR31
	.size	toshiba_read_retry_clock_recover, .-toshiba_read_retry_clock_recover
	.section	.text.toshiba_vender_set_param,"ax",%progbits
	.align	1
	.global	toshiba_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_vender_set_param, %function
toshiba_vender_set_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r10, r3
	ldr	r7, .L2150
	mov	r6, r0
	mov	r4, r1
	mov	r8, r2
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #18
	bne	.L2148
	mov	fp, #1
	mov	r3, r2
	strd	r1, fp, [sp]
	movs	r2, #0
	str	r10, [sp, #8]
	ldr	r1, .L2150+4
	bl	set_cmd_with_nand_bus
	ldrb	r3, [r4]	@ zero_extendqisi2
	mov	r5, r0
	cbnz	r3, .L2142
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cbnz	r3, .L2142
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cbnz	r3, .L2142
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cbnz	r3, .L2142
	ldr	r3, .L2150+8
	ldr	r3, [r3]
	cbnz	r3, .L2142
.L2149:
	ldr	r3, .L2150+12
	movs	r2, #1
	mov	r0, r6
	ldrb	r1, [r3]	@ zero_extendqisi2
	bl	set_one_cmd
	orrs	r5, r5, r0
.L2141:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2148:
	movs	r5, #0
.L2142:
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #17
	bne	.L2144
	mov	fp, #1
	mov	r3, r8
	str	r10, [sp, #8]
	movs	r2, #0
	strd	r4, fp, [sp]
	mov	r0, r6
	ldr	r1, .L2150+4
	bl	set_cmd_with_nand_bus
	ldrb	r3, [r4]	@ zero_extendqisi2
	orrs	r5, r5, r0
	cmp	r3, #0
	bne	.L2145
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cbnz	r3, .L2144
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cbnz	r3, .L2144
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2149
.L2144:
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #16
	bne	.L2146
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2147
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2147
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L2147
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L2149
.L2147:
	movs	r3, #1
	str	r10, [sp, #8]
	strd	r4, r3, [sp]
	movs	r2, #0
	mov	r3, r8
	ldr	r1, .L2150+16
	mov	r0, r6
	bl	set_cmd_with_nand_bus
	orrs	r5, r5, r0
.L2146:
	ldr	r7, .L2150+20
	movs	r2, #0
	mov	r0, r6
	ldrb	r1, [r7]	@ zero_extendqisi2
	bl	set_one_cmd
	ldrb	r1, [r7, #1]	@ zero_extendqisi2
	orrs	r5, r5, r0
	movs	r2, #0
	mov	r0, r6
	bl	set_one_cmd
	orrs	r5, r5, r0
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	str	r0, [sp]
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r0, .L2150+24
	bl	NAND_Print_DBG
	b	.L2141
.L2145:
	cmp	r3, #2
	bne	.L2144
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L2144
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	cmp	r3, #126
	bne	.L2144
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	cmp	r3, #124
	bne	.L2144
	ldr	r3, .L2150+28
	mov	r0, r6
	ldrb	r1, [r3]	@ zero_extendqisi2
	bl	set_one_cmd
	orrs	r5, r5, r0
	b	.L2144
.L2151:
	.align	2
.L2150:
	.word	.LANCHOR32
	.word	.LANCHOR33
	.word	.LANCHOR34
	.word	.LANCHOR35
	.word	.LANCHOR37
	.word	.LANCHOR38
	.word	.LC391
	.word	.LANCHOR36
	.size	toshiba_vender_set_param, .-toshiba_vender_set_param
	.section	.text.toshiba_vender_pre_condition,"ax",%progbits
	.align	1
	.global	toshiba_vender_pre_condition
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_vender_pre_condition, %function
toshiba_vender_pre_condition:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	movs	r3, #0
	movs	r2, #2
	str	r3, [sp]
	strd	r3, r2, [sp, #4]
	mov	r2, r3
	ldr	r1, .L2157
	bl	set_cmd_with_nand_bus
	mov	r4, r0
	cbz	r0, .L2152
	ldr	r0, .L2157+4
	bl	NAND_Print
.L2152:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L2158:
	.align	2
.L2157:
	.word	.LANCHOR39
	.word	.LC392
	.size	toshiba_vender_pre_condition, .-toshiba_vender_pre_condition
	.section	.text.toshiba_set_readretry,"ax",%progbits
	.align	1
	.global	toshiba_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_set_readretry, %function
toshiba_set_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L2172
	ldrb	r2, [r6]	@ zero_extendqisi2
	subs	r2, r2, #16
	cmp	r2, #2
	bhi	.L2167
	bl	toshiba_read_retry_clock_save
	mov	r0, r4
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r3, [r4, #176]
	cbnz	r3, .L2161
	mov	r0, r4
	bl	toshiba_vender_pre_condition
.L2161:
	ldr	r0, [r4, #260]
	bl	ndfc_is_toggle_interface
	ldr	r5, .L2172+4
	cbz	r0, .L2162
	ldr	r0, [r4, #260]
	bl	ndfc_set_legacy_interface
	movs	r3, #1
	str	r3, [r5]
.L2162:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r1, [r4, #176]
	cmp	r2, #17
	lsl	r3, r1, #2
	bne	.L2163
	add	r3, r3, r1
	ldr	r1, .L2172+8
.L2171:
	ldr	r2, .L2172+12
	add	r1, r1, r3
	movs	r3, #5
.L2164:
	mov	r0, r4
	bl	toshiba_vender_set_param
	ldr	r3, [r5]
	mov	r6, r0
	cmp	r3, #1
	bne	.L2166
	ldr	r0, [r4, #260]
	bl	ndfc_set_toggle_interface
.L2166:
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r4
	bl	toshiba_read_retry_clock_recover
.L2159:
	mov	r0, r6
	pop	{r4, r5, r6, pc}
.L2163:
	cmp	r2, #18
	bne	.L2165
	add	r3, r3, r1
	ldr	r1, .L2172+16
	b	.L2171
.L2165:
	ldr	r1, .L2172+20
	ldr	r2, .L2172+24
	add	r1, r1, r3
	movs	r3, #4
	b	.L2164
.L2167:
	mvn	r6, #88
	b	.L2159
.L2173:
	.align	2
.L2172:
	.word	.LANCHOR32
	.word	.LANCHOR42
	.word	.LANCHOR43
	.word	.LANCHOR40
	.word	.LANCHOR44
	.word	.LANCHOR45
	.word	.LANCHOR41
	.size	toshiba_set_readretry, .-toshiba_set_readretry
	.section	.text.toshiba_readretry_init,"ax",%progbits
	.align	1
	.global	toshiba_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_readretry_init, %function
toshiba_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	ldr	r2, .L2175
	push	{r4, lr}
	movs	r4, #0
	ldr	r3, [r3, #52]
	str	r4, [r0, #176]
	ldr	r0, .L2175+4
	lsrs	r1, r3, #16
	strb	r1, [r2]
	lsrs	r1, r3, #8
	ldr	r2, .L2175+8
	strb	r1, [r2]
	uxtb	r1, r1
	ldr	r2, .L2175+12
	strb	r3, [r2]
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2176:
	.align	2
.L2175:
	.word	.LANCHOR32
	.word	.LC393
	.word	.LANCHOR46
	.word	.LANCHOR47
	.size	toshiba_readretry_init, .-toshiba_readretry_init
	.section	.text.toshiba_readretry_exit,"ax",%progbits
	.align	1
	.global	toshiba_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_readretry_exit, %function
toshiba_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	toshiba_readretry_exit, .-toshiba_readretry_exit
	.section	.text.toshiba_exit_readretry,"ax",%progbits
	.align	1
	.global	toshiba_exit_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_exit_readretry, %function
toshiba_exit_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L2189
	ldrb	r2, [r5]	@ zero_extendqisi2
	subs	r2, r2, #16
	cmp	r2, #2
	bhi	.L2183
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r4, #260]
	bl	ndfc_is_toggle_interface
	ldr	r6, .L2189+4
	cbz	r0, .L2180
	ldr	r0, [r4, #260]
	bl	ndfc_set_legacy_interface
	movs	r3, #1
	str	r3, [r6]
.L2180:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #17
	beq	.L2184
	ldr	r1, .L2189+8
	cmp	r3, #18
	ldr	r0, .L2189+12
	it	eq
	moveq	r3, #5
	ldr	r2, .L2189+16
	itt	ne
	movne	r3, #0
	movne	r2, r1
	ldr	r1, .L2189+20
	it	ne
	movne	r1, r0
.L2181:
	mov	r0, r4
	bl	toshiba_vender_set_param
	ldr	r3, [r6]
	mov	r5, r0
	cmp	r3, #1
	bne	.L2182
	ldr	r0, [r4, #260]
	bl	ndfc_set_toggle_interface
.L2182:
	mov	r0, r4
	bl	nand_disable_chip
.L2178:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L2184:
	movs	r3, #5
	ldr	r2, .L2189+16
	ldr	r1, .L2189+24
	b	.L2181
.L2183:
	mvn	r5, #87
	b	.L2178
.L2190:
	.align	2
.L2189:
	.word	.LANCHOR32
	.word	.LANCHOR42
	.word	.LANCHOR41
	.word	.LANCHOR45+24
	.word	.LANCHOR40
	.word	.LANCHOR44+50
	.word	.LANCHOR43+35
	.size	toshiba_exit_readretry, .-toshiba_exit_readretry
	.section	.text.toshiba_read_page_end,"ax",%progbits
	.align	1
	.global	toshiba_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_read_page_end, %function
toshiba_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2201
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2191
	ldr	r0, .L2201+4
	movs	r7, #0
	bl	NAND_Print_DBG
	ldr	r3, .L2201+8
	movs	r2, #1
	ldr	r10, .L2201+16
	mov	r8, r3
	str	r2, [r3]
.L2193:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, r7
	ble	.L2196
	str	r7, [r5, #176]
	mov	r0, r5
	bl	toshiba_set_readretry
	mov	r4, r0
	cbnz	r0, .L2194
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	cmp	r4, #10
	beq	.L2195
	cbnz	r4, .L2194
.L2195:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2201+12
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2196:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	str	r3, [r8]
	bl	toshiba_exit_readretry
.L2191:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2194:
	adds	r7, r7, #1
	b	.L2193
.L2202:
	.align	2
.L2201:
	.word	g_nsi
	.word	.LC394
	.word	.LANCHOR34
	.word	.LC395
	.word	.LANCHOR46
	.size	toshiba_read_page_end, .-toshiba_read_page_end
	.section	.text.toshiba_special_init,"ax",%progbits
	.align	1
	.global	toshiba_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_special_init, %function
toshiba_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2208
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2204:
	cbnz	r5, .L2205
	ldr	r3, .L2208+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2208+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2208+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2206
	ldr	r0, .L2208+16
	ldr	r5, .L2208+20
	str	r5, [r0]
	ldr	r0, .L2208+24
	bl	NAND_Print_DBG
.L2203:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2205:
	mov	r0, r5
	bl	toshiba_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2204
.L2206:
	ldr	r0, .L2208+28
	bl	NAND_Print
	b	.L2203
.L2209:
	.align	2
.L2208:
	.word	g_nsi
	.word	.LANCHOR32
	.word	.LANCHOR46
	.word	.LANCHOR47
	.word	df_read_page_end
	.word	toshiba_read_page_end
	.word	.LC396
	.word	.LC397
	.size	toshiba_special_init, .-toshiba_special_init
	.section	.text.toshiba_special_exit,"ax",%progbits
	.align	1
	.global	toshiba_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	toshiba_special_exit, %function
toshiba_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2213
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2211:
	cbnz	r4, .L2212
	ldr	r0, .L2213+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2212:
	ldr	r4, [r4]
	b	.L2211
.L2214:
	.align	2
.L2213:
	.word	g_nsi
	.word	.LC398
	.size	toshiba_special_exit, .-toshiba_special_exit
	.section	.text.micron_intel_set_feature,"ax",%progbits
	.align	1
	.global	micron_intel_set_feature
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_intel_set_feature, %function
micron_intel_set_feature:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	movs	r4, #0
	mov	r7, r0
	mov	r6, r2
	mov	r5, r1
	strb	r1, [sp, #7]
	add	r1, sp, #7
	strb	r2, [sp, #8]
	add	r2, sp, #8
	strb	r4, [sp, #9]
	strb	r4, [sp, #10]
	strb	r4, [sp, #11]
	bl	nand_set_feature
	add	r2, sp, #12
	add	r1, sp, #7
	mov	r0, r7
	bl	nand_get_feature
	ldrb	r2, [sp, #12]	@ zero_extendqisi2
	ldrb	r3, [sp, #8]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L2217
	mov	r2, r6
	mov	r1, r5
	ldr	r0, .L2218
	bl	NAND_Print
	mvn	r0, #71
.L2215:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2217:
	mov	r0, r4
	b	.L2215
.L2219:
	.align	2
.L2218:
	.word	.LC399
	.size	micron_intel_set_feature, .-micron_intel_set_feature
	.section	.text.micron_set_readretry,"ax",%progbits
	.align	1
	.global	micron_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_set_readretry, %function
micron_set_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r3, .L2231
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r2, r3, #64
	cmp	r2, #2
	bls	.L2221
	cmp	r3, #80
	bne	.L2229
.L2221:
	ldrb	r6, [r4, #176]	@ zero_extendqisi2
	ldr	r7, .L2231+4
	cmp	r6, #255
	it	eq
	moveq	r6, #0
	cmp	r3, #80
	bne	.L2224
	ldr	r3, [r7]
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	cbz	r3, .L2225
.L2227:
	ldr	r3, [r4, #176]
	cmp	r3, #255
	bne	.L2224
	movs	r2, #0
	movs	r1, #137
	mov	r0, r4
	bl	micron_intel_set_feature
	movs	r2, #0
	mov	r5, r0
	movs	r1, #147
	mov	r0, r4
	bl	micron_intel_set_feature
	orrs	r5, r5, r0
	b	.L2222
.L2225:
	movs	r2, #1
	movs	r1, #147
	mov	r0, r4
	bl	micron_intel_set_feature
	mov	r5, r0
	cmp	r0, #0
	beq	.L2227
.L2222:
	ldr	r3, [r4, #176]
	mov	r0, r4
	cmp	r3, #255
	itt	eq
	moveq	r3, #0
	streq	r3, [r4, #176]
	bl	nand_disable_chip
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L2224:
	ldr	r3, [r7]
	movs	r1, #137
	mov	r0, r4
	ldrb	r2, [r3, r6]	@ zero_extendqisi2
	bl	micron_intel_set_feature
	mov	r5, r0
	b	.L2222
.L2229:
	movs	r5, #0
	b	.L2222
.L2232:
	.align	2
.L2231:
	.word	.LANCHOR48
	.word	.LANCHOR49
	.size	micron_set_readretry, .-micron_set_readretry
	.section	.text.micron_read_page_end,"ax",%progbits
	.align	1
	.global	micron_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_read_page_end, %function
micron_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2243
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2233
	ldr	r8, .L2243+12
	movs	r7, #0
	ldr	r0, .L2243+4
	bl	NAND_Print_DBG
.L2235:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, r7
	ble	.L2238
	str	r7, [r5, #176]
	mov	r0, r5
	bl	micron_set_readretry
	mov	r4, r0
	cbnz	r0, .L2236
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	cmp	r4, #10
	beq	.L2237
	cbnz	r4, .L2236
.L2237:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2243+8
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2238:
	movs	r3, #255
	mov	r0, r5
	str	r3, [r5, #176]
	bl	micron_set_readretry
.L2233:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2236:
	adds	r7, r7, #1
	b	.L2235
.L2244:
	.align	2
.L2243:
	.word	g_nsi
	.word	.LC400
	.word	.LC401
	.word	.LANCHOR50
	.size	micron_read_page_end, .-micron_read_page_end
	.section	.text.micron_readretry_init,"ax",%progbits
	.align	1
	.global	micron_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_readretry_init, %function
micron_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r10, lr}
	movs	r7, #0
	ldr	r3, [r0, #264]
	movs	r1, #137
	mov	r6, r0
	ldr	r10, .L2253+28
	ldr	r3, [r3, #52]
	ldr	r5, .L2253
	ldr	r8, .L2253+32
	ldr	r4, .L2253+4
	lsrs	r2, r3, #16
	lsrs	r3, r3, #8
	str	r7, [r0, #176]
	strb	r2, [r10]
	mov	r2, r7
	strb	r3, [r4]
	str	r8, [r5]
	bl	micron_intel_set_feature
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, #65
	bne	.L2246
	movs	r3, #12
	str	r8, [r5]
	strb	r3, [r4]
.L2247:
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r0, .L2253+8
	bl	NAND_Print_DBG
	movs	r0, #0
	b	.L2245
.L2246:
	cmp	r3, #64
	bne	.L2248
	ldr	r3, .L2253+12
	str	r3, [r5]
	movs	r3, #10
.L2252:
	strb	r3, [r4]
	b	.L2247
.L2248:
	cmp	r3, #80
	bne	.L2249
	ldr	r3, .L2253+16
	mov	r2, r7
	movs	r1, #147
	mov	r0, r6
	str	r3, [r5]
	movs	r3, #7
	strb	r3, [r4]
	bl	micron_intel_set_feature
	b	.L2247
.L2249:
	cmp	r3, #66
	bne	.L2250
	ldr	r3, .L2253+20
	str	r3, [r5]
	movs	r3, #18
	b	.L2252
.L2250:
	ldr	r0, .L2253+24
	bl	NAND_Print
	mvn	r0, #70
.L2245:
	pop	{r3, r4, r5, r6, r7, r8, r10, pc}
.L2254:
	.align	2
.L2253:
	.word	.LANCHOR49
	.word	.LANCHOR50
	.word	.LC403
	.word	.LANCHOR52
	.word	.LANCHOR53
	.word	.LANCHOR54
	.word	.LC402
	.word	.LANCHOR48
	.word	.LANCHOR51
	.size	micron_readretry_init, .-micron_readretry_init
	.section	.text.micron_readretry_exit,"ax",%progbits
	.align	1
	.global	micron_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_readretry_exit, %function
micron_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2256
	movs	r0, #0
	strb	r0, [r3]
	ldr	r3, .L2256+4
	strb	r0, [r3]
	bx	lr
.L2257:
	.align	2
.L2256:
	.word	.LANCHOR48
	.word	.LANCHOR50
	.size	micron_readretry_exit, .-micron_readretry_exit
	.section	.text.micron_special_init,"ax",%progbits
	.align	1
	.global	micron_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_special_init, %function
micron_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2263
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2259:
	cbnz	r5, .L2260
	ldr	r3, .L2263+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2263+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2261
	ldr	r0, .L2263+12
	ldr	r3, .L2263+16
	str	r0, [r3]
	ldr	r0, .L2263+20
	bl	NAND_Print_DBG
.L2258:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2260:
	mov	r0, r5
	bl	micron_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2259
.L2261:
	ldr	r0, .L2263+24
	bl	NAND_Print
	b	.L2258
.L2264:
	.align	2
.L2263:
	.word	g_nsi
	.word	.LANCHOR48
	.word	.LANCHOR50
	.word	micron_read_page_end
	.word	df_read_page_end
	.word	.LC404
	.word	.LC405
	.size	micron_special_init, .-micron_special_init
	.section	.text.micron_special_exit,"ax",%progbits
	.align	1
	.global	micron_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	micron_special_exit, %function
micron_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r5, #0
	ldr	r3, .L2272
	ldr	r2, .L2272+4
	ldr	r3, [r3]
	ldrb	r1, [r2]	@ zero_extendqisi2
	ldr	r0, [r3, #8]
	ldr	r3, .L2272+8
	ldrb	r4, [r3]	@ zero_extendqisi2
.L2266:
	cbnz	r0, .L2267
	cbz	r5, .L2268
	strb	r1, [r2]
	strb	r4, [r3]
.L2268:
	ldr	r0, .L2272+12
	bl	NAND_Print_DBG
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L2267:
	movs	r1, #0
	ldr	r0, [r0]
	movs	r5, #1
	mov	r4, r1
	b	.L2266
.L2273:
	.align	2
.L2272:
	.word	g_nsi
	.word	.LANCHOR48
	.word	.LANCHOR50
	.word	.LC406
	.size	micron_special_exit, .-micron_special_exit
	.section	.text.samsung_vender_set_param,"ax",%progbits
	.align	1
	.global	samsung_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_vender_set_param, %function
samsung_vender_set_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #20
	str	r3, [sp, #8]
	movs	r3, #1
	mov	r4, r1
	strd	r1, r3, [sp]
	mov	r3, r2
	ldr	r1, .L2275
	movs	r2, #0
	bl	set_cmd_with_nand_bus
	mov	r5, r0
	ldrb	r0, [r4, #3]	@ zero_extendqisi2
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	ldrb	r2, [r4, #1]	@ zero_extendqisi2
	str	r0, [sp]
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r0, .L2275+4
	bl	NAND_Print_DBG
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L2276:
	.align	2
.L2275:
	.word	.LANCHOR55
	.word	.LC407
	.size	samsung_vender_set_param, .-samsung_vender_set_param
	.section	.text.samsung_set_readretry,"ax",%progbits
	.align	1
	.global	samsung_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_set_readretry, %function
samsung_set_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r4, #176]
	movs	r3, #4
	ldr	r1, .L2282
	ldr	r2, .L2282+4
	add	r1, r1, r0, lsl #2
	mov	r0, r4
	bl	samsung_vender_set_param
	mov	r5, r0
	cbz	r0, .L2278
	ldr	r1, [r4, #176]
	ldr	r0, .L2282+8
	bl	NAND_Print
.L2278:
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r5
	pop	{r3, r4, r5, pc}
.L2283:
	.align	2
.L2282:
	.word	.LANCHOR57
	.word	.LANCHOR56
	.word	.LC408
	.size	samsung_set_readretry, .-samsung_set_readretry
	.section	.text.samsung_read_page_end,"ax",%progbits
	.align	1
	.global	samsung_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_read_page_end, %function
samsung_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2294
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2284
	ldr	r8, .L2294+12
	movs	r7, #1
	ldr	r0, .L2294+4
	bl	NAND_Print_DBG
.L2286:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, r7
	ble	.L2289
	str	r7, [r5, #176]
	mov	r0, r5
	bl	samsung_set_readretry
	mov	r4, r0
	cbnz	r0, .L2287
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	cmp	r4, #10
	beq	.L2288
	cbnz	r4, .L2287
.L2288:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2294+8
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2289:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	samsung_set_readretry
.L2284:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2287:
	adds	r7, r7, #1
	b	.L2286
.L2295:
	.align	2
.L2294:
	.word	g_nsi
	.word	.LC409
	.word	.LC410
	.word	.LANCHOR58
	.size	samsung_read_page_end, .-samsung_read_page_end
	.section	.text.samsung_readretry_init,"ax",%progbits
	.align	1
	.global	samsung_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_readretry_init, %function
samsung_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	str	r3, [r0, #176]
	movs	r1, #15
	ldr	r3, [r0, #264]
	ldr	r4, .L2299
	ldr	r0, .L2299+4
	ldrh	r3, [r3, #54]
	strb	r3, [r4]
	ldr	r3, .L2299+8
	strb	r1, [r3]
	bl	NAND_Print_DBG
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #32
	ite	ne
	mvnne	r0, #99
	moveq	r0, #0
	pop	{r4, pc}
.L2300:
	.align	2
.L2299:
	.word	.LANCHOR59
	.word	.LC411
	.word	.LANCHOR58
	.size	samsung_readretry_init, .-samsung_readretry_init
	.section	.text.samsung_readretry_exit,"ax",%progbits
	.align	1
	.global	samsung_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_readretry_exit, %function
samsung_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	samsung_readretry_exit, .-samsung_readretry_exit
	.section	.text.samsung_special_init,"ax",%progbits
	.align	1
	.global	samsung_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_special_init, %function
samsung_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2307
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2303:
	cbnz	r5, .L2304
	ldr	r3, .L2307+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2307+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2305
	ldr	r0, .L2307+12
	ldr	r3, .L2307+16
	str	r0, [r3]
	ldr	r0, .L2307+20
	bl	NAND_Print_DBG
.L2302:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2304:
	mov	r0, r5
	bl	samsung_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2303
.L2305:
	ldr	r0, .L2307+24
	bl	NAND_Print
	b	.L2302
.L2308:
	.align	2
.L2307:
	.word	g_nsi
	.word	.LANCHOR59
	.word	.LANCHOR58
	.word	samsung_read_page_end
	.word	df_read_page_end
	.word	.LC412
	.word	.LC413
	.size	samsung_special_init, .-samsung_special_init
	.section	.text.samsung_special_exit,"ax",%progbits
	.align	1
	.global	samsung_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	samsung_special_exit, %function
samsung_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2312
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2310:
	cbnz	r4, .L2311
	ldr	r0, .L2312+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2311:
	ldr	r4, [r4]
	b	.L2310
.L2313:
	.align	2
.L2312:
	.word	g_nsi
	.word	.LC414
	.size	samsung_special_exit, .-samsung_special_exit
	.section	.text.sandisk_read_retry_clock_save,"ax",%progbits
	.align	1
	.global	sandisk_read_retry_clock_save
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_read_retry_clock_save, %function
sandisk_read_retry_clock_save:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L2315
	ldr	r0, [r0, #260]
	ldr	r3, [r3]
	ldr	r2, .L2315+4
	ldr	r1, .L2315+8
	ldr	r0, [r0, #8]
	blx	r3
	ldr	r0, [r4, #260]
	movs	r2, #20
	ldr	r3, .L2315+12
	movs	r1, #10
	ldr	r0, [r0, #8]
	ldr	r3, [r3]
	blx	r3
	movs	r0, #0
	pop	{r4, pc}
.L2316:
	.align	2
.L2315:
	.word	NAND_GetClk
	.word	.LANCHOR60
	.word	.LANCHOR61
	.word	NAND_SetClk
	.size	sandisk_read_retry_clock_save, .-sandisk_read_retry_clock_save
	.section	.text.sandisk_vender_set_param,"ax",%progbits
	.align	1
	.global	sandisk_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_vender_set_param, %function
sandisk_vender_set_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r6, r2
	ldr	r2, .L2321
	sub	sp, sp, #20
	mov	r5, r0
	mov	r7, r1
	movs	r4, #0
	ldrb	r3, [r2]	@ zero_extendqisi2
	mov	r8, r2
	subs	r3, r3, #48
	cmp	r3, #1
	bhi	.L2320
	movs	r3, #2
	mov	r2, r4
	strd	r4, r3, [sp, #4]
	mov	r3, r4
	ldr	r1, .L2321+4
	str	r4, [sp]
	bl	set_cmd_with_nand_bus
	movs	r3, #1
	movs	r2, #3
	strd	r3, r2, [sp, #4]
	mov	r10, r0
	str	r7, [sp]
	mov	r3, r6
	mov	r2, r4
	ldr	r1, .L2321+8
	mov	r0, r5
	bl	set_cmd_with_nand_bus
	orr	r0, r10, r0
.L2318:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #50
	bne	.L2317
	movs	r3, #4
	movs	r2, #1
	strd	r3, r2, [sp, #4]
	mov	r0, r5
	str	r7, [sp]
	mov	r3, r6
	ldr	r1, .L2321+12
	bl	set_cmd_with_nand_bus
.L2317:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2320:
	mov	r0, r4
	b	.L2318
.L2322:
	.align	2
.L2321:
	.word	.LANCHOR62
	.word	.LANCHOR63
	.word	.LANCHOR64
	.word	.LANCHOR65
	.size	sandisk_vender_set_param, .-sandisk_vender_set_param
	.section	.text.sandisk_read_retry_clock_recover,"ax",%progbits
	.align	1
	.global	sandisk_read_retry_clock_recover
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_read_retry_clock_recover, %function
sandisk_read_retry_clock_recover:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, [r0, #260]
	ldr	r3, .L2324
	ldr	r2, .L2324+4
	ldr	r1, .L2324+8
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0, #8]
	blx	r3
	movs	r0, #0
	pop	{r3, pc}
.L2325:
	.align	2
.L2324:
	.word	NAND_SetClk
	.word	.LANCHOR60
	.word	.LANCHOR61
	.size	sandisk_read_retry_clock_recover, .-sandisk_read_retry_clock_recover
	.section	.text.sandisk_end_one_read_retry,"ax",%progbits
	.align	1
	.global	sandisk_end_one_read_retry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_end_one_read_retry, %function
sandisk_end_one_read_retry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2333
	push	{r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #20
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #1
	bhi	.L2327
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r4, #260]
	bl	ndfc_is_toggle_interface
	ldr	r5, .L2333+4
	cbz	r0, .L2328
	ldr	r0, [r4, #260]
	bl	ndfc_set_legacy_interface
	movs	r3, #1
	str	r3, [r5]
.L2328:
	movs	r3, #0
	movs	r2, #1
	strd	r3, r2, [sp, #4]
	mov	r0, r4
	str	r3, [sp]
	mov	r2, r3
	ldr	r1, .L2333+8
	bl	set_cmd_with_nand_bus
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L2329
	ldr	r0, [r4, #260]
	bl	ndfc_set_toggle_interface
.L2329:
	mov	r0, r4
	bl	nand_disable_chip
.L2327:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L2334:
	.align	2
.L2333:
	.word	.LANCHOR62
	.word	.LANCHOR66
	.word	.LANCHOR67
	.size	sandisk_end_one_read_retry, .-sandisk_end_one_read_retry
	.section	.text.sandisk_set_readretry,"ax",%progbits
	.align	1
	.global	sandisk_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_set_readretry, %function
sandisk_set_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r6, r1
	ldr	r5, .L2360
	bl	sandisk_read_retry_clock_save
	mov	r0, r4
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r4, #260]
	bl	ndfc_is_toggle_interface
	cbz	r0, .L2336
	ldr	r0, [r4, #260]
	bl	ndfc_set_legacy_interface
	movs	r3, #1
	str	r3, [r5]
.L2336:
	ldr	r3, .L2360+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L2337
	cmp	r6, #255
	ldr	r3, [r4, #176]
	ldr	r2, .L2360+8
	beq	.L2338
	cbz	r6, .L2339
	lsls	r1, r6, #31
	bpl	.L2338
.L2339:
	ldr	r1, .L2360+12
	add	r3, r3, r3, lsl #1
	add	r1, r1, r3
	movs	r3, #16
.L2357:
	strb	r3, [r2]
	movs	r3, #3
	ldr	r2, .L2360+16
.L2359:
	mov	r0, r4
	bl	sandisk_vender_set_param
	movs	r2, #0
	mov	r6, r0
	movs	r1, #182
.L2358:
	mov	r0, r4
	bl	set_one_cmd
.L2341:
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L2343
	ldr	r0, [r4, #260]
	bl	ndfc_set_toggle_interface
.L2343:
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r4
	bl	sandisk_read_retry_clock_recover
	mov	r0, r6
	pop	{r4, r5, r6, pc}
.L2338:
	ldr	r1, .L2360+20
	add	r3, r3, r3, lsl #1
	add	r1, r1, r3
	movs	r3, #20
	b	.L2357
.L2337:
	cmp	r3, #49
	bne	.L2342
	ldr	r1, [r4, #176]
	movs	r3, #3
	ldr	r0, .L2360+24
	ldr	r2, .L2360+28
	add	r1, r1, r1, lsl #1
	add	r1, r1, r0
	b	.L2359
.L2342:
	cmp	r3, #50
	bne	.L2344
	ldr	r0, [r4, #176]
	movs	r3, #1
	ldr	r1, .L2360+32
	ldr	r2, .L2360+36
	add	r1, r1, r0, lsl #2
	mov	r0, r4
	bl	sandisk_vender_set_param
	movs	r2, #0
	mov	r6, r0
	movs	r1, #93
	b	.L2358
.L2344:
	movs	r6, #0
	b	.L2341
.L2361:
	.align	2
.L2360:
	.word	.LANCHOR66
	.word	.LANCHOR62
	.word	.LANCHOR69
	.word	.LANCHOR68
	.word	.LANCHOR71
	.word	.LANCHOR70
	.word	.LANCHOR73
	.word	.LANCHOR72
	.word	.LANCHOR75
	.word	.LANCHOR74
	.size	sandisk_set_readretry, .-sandisk_set_readretry
	.section	.text.sandisk_activation_seq,"ax",%progbits
	.align	1
	.global	sandisk_activation_seq
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_activation_seq, %function
sandisk_activation_seq:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #9
	sub	sp, sp, #40
	mov	r6, r0
	mov	r2, r8
	add	r0, sp, #16
	ldr	r1, .L2367
	movs	r4, #0
	bl	memcpy
	mov	r0, r6
	strd	r4, r4, [sp, #28]
	strb	r4, [sp, #36]
	add	r7, sp, #28
	bl	nand_enable_chip
	ldr	r0, [r6, #260]
	bl	ndfc_disable_randomize
	movs	r3, #2
	mov	r2, r4
	strd	r4, r3, [sp, #4]
	mov	r0, r6
	mov	r3, r4
	ldr	r1, .L2367+4
	str	r4, [sp]
	bl	set_cmd_with_nand_bus
	movs	r3, #1
	mov	r5, r0
	strd	r7, r3, [sp]
	mov	r2, r4
	str	r8, [sp, #8]
	add	r1, sp, #16
	ldr	r3, .L2367+8
	mov	r0, r6
	bl	set_cmd_with_nand_bus
	orrs	r5, r5, r0
	mov	r0, r6
	bl	nand_disable_chip
	cbz	r5, .L2362
	mov	r1, r5
	ldr	r0, .L2367+12
	bl	NAND_Print
.L2362:
	mov	r0, r5
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2368:
	.align	2
.L2367:
	.word	.LANCHOR15+30
	.word	.LANCHOR63
	.word	.LANCHOR76
	.word	.LC415
	.size	sandisk_activation_seq, .-sandisk_activation_seq
	.section	.text.sandisk_readretry_init,"ax",%progbits
	.align	1
	.global	sandisk_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_readretry_init, %function
sandisk_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r2, #0
	ldr	r3, [r0, #264]
	str	r2, [r0, #176]
	ldr	r4, [r3, #52]
	ldr	r2, .L2373
	ldr	r3, .L2373+4
	ubfx	r1, r4, #16, #8
	lsrs	r5, r4, #8
	strb	r1, [r2]
	subs	r1, r1, #48
	strb	r5, [r3]
	cmp	r1, #1
	ldr	r5, .L2373+8
	strb	r4, [r5]
	mov	r5, r2
	mov	r4, r3
	bhi	.L2370
	bl	sandisk_activation_seq
.L2370:
	ldrb	r3, [r5]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #2
	bhi	.L2372
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r0, .L2373+12
	bl	NAND_Print_DBG
	movs	r0, #0
.L2369:
	pop	{r3, r4, r5, pc}
.L2372:
	mvn	r0, #98
	b	.L2369
.L2374:
	.align	2
.L2373:
	.word	.LANCHOR62
	.word	.LANCHOR69
	.word	.LANCHOR77
	.word	.LC416
	.size	sandisk_readretry_init, .-sandisk_readretry_init
	.section	.text.sandisk_readretry_exit,"ax",%progbits
	.align	1
	.global	sandisk_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_readretry_exit, %function
sandisk_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	sandisk_readretry_exit, .-sandisk_readretry_exit
	.section	.text.sandisk_exit_readretry,"ax",%progbits
	.align	1
	.global	sandisk_exit_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_exit_readretry, %function
sandisk_exit_readretry:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	movs	r3, #0
	mov	r4, r0
	str	r3, [sp, #4]
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r4, #260]
	bl	ndfc_is_toggle_interface
	ldr	r6, .L2387
	cbz	r0, .L2377
	ldr	r0, [r4, #260]
	bl	ndfc_set_legacy_interface
	movs	r3, #1
	str	r3, [r6]
.L2377:
	ldr	r3, .L2387+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L2378
	ldr	r2, .L2387+8
	movs	r3, #3
.L2386:
	add	r1, sp, #4
	mov	r0, r4
	bl	sandisk_vender_set_param
	mov	r5, r0
.L2379:
	ldr	r3, [r6]
	cmp	r3, #1
	bne	.L2381
	ldr	r0, [r4, #260]
	bl	ndfc_set_toggle_interface
.L2381:
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L2378:
	cmp	r3, #49
	bne	.L2380
	movs	r3, #3
	ldr	r2, .L2387+12
	b	.L2386
.L2380:
	cmp	r3, #50
	bne	.L2382
	movs	r2, #1
	movs	r1, #255
	mov	r0, r4
	bl	set_one_cmd
	movs	r3, #1
	ldr	r2, .L2387+16
	b	.L2386
.L2382:
	movs	r5, #0
	b	.L2379
.L2388:
	.align	2
.L2387:
	.word	.LANCHOR66
	.word	.LANCHOR62
	.word	.LANCHOR71
	.word	.LANCHOR72
	.word	.LANCHOR74
	.size	sandisk_exit_readretry, .-sandisk_exit_readretry
	.section	.text.sandisk_read_page_end,"ax",%progbits
	.align	1
	.global	sandisk_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_read_page_end, %function
sandisk_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2400
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2389
	ldr	r8, .L2400+12
	movs	r7, #0
	ldr	r10, .L2400+16
	ldr	r0, .L2400+4
	bl	NAND_Print_DBG
.L2391:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, r7
	ble	.L2395
	str	r7, [r5, #176]
	mov	r0, r5
	ldrh	r1, [r6, #8]
	bl	sandisk_set_readretry
	mov	r4, r0
	cbnz	r0, .L2392
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	mov	r0, r5
	bl	sandisk_end_one_read_retry
	ldr	r0, [r6, #20]
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2393
	ldr	r3, [r5, #176]
	mvn	r4, #1
	ldr	r1, [r5, #260]
	mov	r0, r10
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2392:
	adds	r7, r7, #1
	b	.L2391
.L2393:
	cmp	r4, #10
	beq	.L2394
	cmp	r4, #0
	bne	.L2392
.L2394:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2400+8
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2395:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	sandisk_exit_readretry
.L2389:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2401:
	.align	2
.L2400:
	.word	g_nsi
	.word	.LC417
	.word	.LC419
	.word	.LANCHOR69
	.word	.LC418
	.size	sandisk_read_page_end, .-sandisk_read_page_end
	.section	.text.sandisk_special_init,"ax",%progbits
	.align	1
	.global	sandisk_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_special_init, %function
sandisk_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2407
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2403:
	cbnz	r5, .L2404
	ldr	r3, .L2407+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2407+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2407+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2405
	ldr	r0, .L2407+16
	ldr	r5, .L2407+20
	str	r5, [r0]
	ldr	r0, .L2407+24
	bl	NAND_Print_DBG
.L2402:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2404:
	mov	r0, r5
	bl	sandisk_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2403
.L2405:
	ldr	r0, .L2407+28
	bl	NAND_Print
	b	.L2402
.L2408:
	.align	2
.L2407:
	.word	g_nsi
	.word	.LANCHOR62
	.word	.LANCHOR69
	.word	.LANCHOR77
	.word	df_read_page_end
	.word	sandisk_read_page_end
	.word	.LC420
	.word	.LC421
	.size	sandisk_special_init, .-sandisk_special_init
	.section	.text.sandisk_special_exit,"ax",%progbits
	.align	1
	.global	sandisk_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_special_exit, %function
sandisk_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2412
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2410:
	cbnz	r4, .L2411
	ldr	r0, .L2412+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2411:
	ldr	r4, [r4]
	b	.L2410
.L2413:
	.align	2
.L2412:
	.word	g_nsi
	.word	.LC422
	.size	sandisk_special_exit, .-sandisk_special_exit
	.section	.text.sandisk_A19_dsp_on,"ax",%progbits
	.align	1
	.global	sandisk_A19_dsp_on
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_dsp_on, %function
sandisk_A19_dsp_on:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2415
	push	{r4, lr}
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #0
	movs	r1, #38
	mov	r0, r4
	bl	set_one_cmd
	mov	r0, r4
	bl	nand_disable_chip
	movs	r0, #0
	pop	{r4, pc}
.L2416:
	.align	2
.L2415:
	.word	g_nsi
	.size	sandisk_A19_dsp_on, .-sandisk_A19_dsp_on
	.section	.text.sandisk_A19_cmd25,"ax",%progbits
	.align	1
	.global	sandisk_A19_cmd25
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_cmd25, %function
sandisk_A19_cmd25:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2418
	push	{r4, lr}
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #0
	movs	r1, #37
	mov	r0, r4
	bl	set_one_cmd
	mov	r0, r4
	bl	nand_disable_chip
	movs	r0, #0
	pop	{r4, pc}
.L2419:
	.align	2
.L2418:
	.word	g_nsi
	.size	sandisk_A19_cmd25, .-sandisk_A19_cmd25
	.section	.text.sandisk_A19_set_lmflgfix_next,"ax",%progbits
	.align	1
	.global	sandisk_A19_set_lmflgfix_next
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_set_lmflgfix_next, %function
sandisk_A19_set_lmflgfix_next:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2425
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	sub	sp, sp, #24
	ldr	r1, [r0]
	add	r7, sp, #22
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #0
	movs	r1, #92
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #197
	mov	r0, r4
	bl	set_one_cmd
	movs	r3, #0
	movs	r2, #1
	strb	r3, [sp, #21]
	movs	r3, #85
	strb	r3, [sp, #23]
	add	r1, sp, #23
	add	r3, sp, #21
	strd	r2, r2, [sp, #4]
	str	r7, [sp]
	mov	r0, r4
	strb	r2, [sp, #22]
	bl	set_cmd_with_nand_bus
	ldr	r3, .L2425+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #52
	bne	.L2421
	movs	r3, #34
.L2424:
	strb	r5, [sp, #22]
	movs	r5, #1
	strb	r3, [sp, #21]
	mov	r8, #85
	add	r3, sp, #21
	mov	r2, r5
	add	r1, sp, #23
	strd	r5, r5, [sp, #4]
	str	r7, [sp]
	mov	r0, r4
	movs	r6, #0
	strb	r8, [sp, #23]
	bl	set_cmd_with_nand_bus
	add	r3, sp, #21
	mov	r2, r5
	add	r1, sp, #23
	strd	r5, r5, [sp, #4]
	str	r7, [sp]
	mov	r0, r4
	strb	r6, [sp, #21]
	strb	r6, [sp, #22]
	strb	r8, [sp, #23]
	bl	set_cmd_with_nand_bus
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r6
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2421:
	cmp	r3, #53
	ite	eq
	moveq	r3, #37
	movne	r3, #35
	b	.L2424
.L2426:
	.align	2
.L2425:
	.word	g_nsi
	.word	.LANCHOR78
	.size	sandisk_A19_set_lmflgfix_next, .-sandisk_A19_set_lmflgfix_next
	.section	.text.sandisk_A19_readretry_init,"ax",%progbits
	.align	1
	.global	sandisk_A19_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_readretry_init, %function
sandisk_A19_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	ldr	r2, .L2430
	push	{r4, lr}
	movs	r4, #0
	ldr	r3, [r3, #52]
	str	r4, [r0, #176]
	ubfx	r1, r3, #16, #8
	ldr	r0, .L2430+4
	strb	r1, [r2]
	lsrs	r2, r3, #8
	strb	r2, [r0]
	ldr	r0, .L2430+8
	strb	r3, [r0]
	sub	r3, r1, #50
	cmp	r3, #3
	bls	.L2428
	ldr	r0, .L2430+12
	bl	NAND_Print
	mvn	r0, #98
.L2427:
	pop	{r4, pc}
.L2428:
	uxtb	r1, r2
	ldr	r0, .L2430+16
	bl	NAND_Print_DBG
	mov	r0, r4
	b	.L2427
.L2431:
	.align	2
.L2430:
	.word	.LANCHOR78
	.word	.LANCHOR79
	.word	.LANCHOR80
	.word	.LC423
	.word	.LC424
	.size	sandisk_A19_readretry_init, .-sandisk_A19_readretry_init
	.section	.text.sandisk_A19_readretry_exit,"ax",%progbits
	.align	1
	.global	sandisk_A19_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_readretry_exit, %function
sandisk_A19_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.size	sandisk_A19_readretry_exit, .-sandisk_A19_readretry_exit
	.section	.text.sandisk_A19_read_retry_clock_save,"ax",%progbits
	.align	1
	.global	sandisk_A19_read_retry_clock_save
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_read_retry_clock_save, %function
sandisk_A19_read_retry_clock_save:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L2434
	ldr	r0, [r0, #260]
	ldr	r3, [r3]
	ldr	r2, .L2434+4
	ldr	r1, .L2434+8
	ldr	r0, [r0, #8]
	blx	r3
	ldr	r0, [r4, #260]
	movs	r2, #20
	ldr	r3, .L2434+12
	movs	r1, #10
	ldr	r0, [r0, #8]
	ldr	r3, [r3]
	blx	r3
	movs	r0, #0
	pop	{r4, pc}
.L2435:
	.align	2
.L2434:
	.word	NAND_GetClk
	.word	.LANCHOR81
	.word	.LANCHOR82
	.word	NAND_SetClk
	.size	sandisk_A19_read_retry_clock_save, .-sandisk_A19_read_retry_clock_save
	.section	.text.sandisk_A19_read_retry_clock_recover,"ax",%progbits
	.align	1
	.global	sandisk_A19_read_retry_clock_recover
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_read_retry_clock_recover, %function
sandisk_A19_read_retry_clock_recover:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, [r0, #260]
	ldr	r3, .L2437
	ldr	r2, .L2437+4
	ldr	r1, .L2437+8
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r0, [r0, #8]
	blx	r3
	movs	r0, #0
	pop	{r3, pc}
.L2438:
	.align	2
.L2437:
	.word	NAND_SetClk
	.word	.LANCHOR81
	.word	.LANCHOR82
	.size	sandisk_A19_read_retry_clock_recover, .-sandisk_A19_read_retry_clock_recover
	.section	.text.sandisk_A19_vender_set_param,"ax",%progbits
	.align	1
	.global	sandisk_A19_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_vender_set_param, %function
sandisk_A19_vender_set_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	movs	r4, #1
	movs	r3, #4
	str	r1, [sp]
	strd	r3, r4, [sp, #4]
	mov	r3, r2
	ldr	r1, .L2440
	mov	r2, r4
	bl	set_cmd_with_nand_bus
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L2441:
	.align	2
.L2440:
	.word	.LANCHOR83
	.size	sandisk_A19_vender_set_param, .-sandisk_A19_vender_set_param
	.section	.text.sandisk_A19_set_readretry,"ax",%progbits
	.align	1
	.global	sandisk_A19_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_set_readretry, %function
sandisk_A19_set_readretry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r3, .L2447
	ldr	r1, [r4, #176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #52
	bne	.L2443
	ldr	r3, .L2447+4
	add	r1, r3, r1, lsl #2
.L2444:
	movs	r3, #1
	ldr	r2, .L2447+8
	mov	r0, r4
	bl	sandisk_A19_vender_set_param
	movs	r2, #0
	mov	r5, r0
	movs	r1, #93
	mov	r0, r4
	bl	set_one_cmd
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r5
	pop	{r3, r4, r5, pc}
.L2443:
	cmp	r3, #53
	lsl	r1, r1, #2
	ite	eq
	ldreq	r3, .L2447+12
	ldrne	r3, .L2447+16
	add	r1, r1, r3
	b	.L2444
.L2448:
	.align	2
.L2447:
	.word	.LANCHOR78
	.word	.LANCHOR84
	.word	.LANCHOR87
	.word	.LANCHOR85
	.word	.LANCHOR86
	.size	sandisk_A19_set_readretry, .-sandisk_A19_set_readretry
	.section	.text.sandisk_A19_exit_readretry,"ax",%progbits
	.align	1
	.global	sandisk_A19_exit_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_exit_readretry, %function
sandisk_A19_exit_readretry:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	movs	r3, #0
	mov	r4, r0
	add	r5, sp, #8
	str	r3, [r5, #-4]!
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #1
	movs	r1, #255
	mov	r0, r4
	bl	set_one_cmd
	mov	r1, r5
	movs	r3, #1
	ldr	r2, .L2450
	mov	r0, r4
	bl	sandisk_A19_vender_set_param
	mov	r5, r0
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L2451:
	.align	2
.L2450:
	.word	.LANCHOR87
	.size	sandisk_A19_exit_readretry, .-sandisk_A19_exit_readretry
	.section	.text.sandisk_A19_read_page_end,"ax",%progbits
	.align	1
	.global	sandisk_A19_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_read_page_end, %function
sandisk_A19_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2500
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r4
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r6, r0
	bne	.L2452
	ldr	r8, .L2500+28
	movs	r7, #0
	ldr	r0, .L2500+4
	bl	NAND_Print_DBG
	mov	r10, r8
.L2454:
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, r7
	bgt	.L2460
	ldr	r7, .L2500+8
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #51
	beq	.L2461
	ldr	fp, .L2500+12
	mov	r8, #0
.L2462:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, r8
	bgt	.L2468
	ldr	fp, .L2500+12
	mov	r8, #0
.L2469:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, r8
	bgt	.L2475
.L2461:
	ldr	fp, .L2500+12
	mov	r8, #0
.L2476:
	ldrb	r3, [r10]	@ zero_extendqisi2
	cmp	r3, r8
	bgt	.L2490
.L2491:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	sandisk_A19_exit_readretry
.L2452:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2460:
	str	r7, [r5, #176]
	mov	r0, r5
	ldrh	r1, [r4, #8]
	bl	sandisk_A19_set_readretry
	mov	r6, r0
	cbz	r0, .L2455
	ldr	r0, .L2500+12
	bl	NAND_Print_DBG
.L2456:
	adds	r7, r7, #1
	b	.L2454
.L2455:
	mov	r0, r4
	bl	generic_read_page_start
	mov	r6, r0
	mov	r0, r4
	bl	generic_read_page_end_not_retry
	orrs	r6, r6, r0
	ldr	r0, [r4, #20]
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2457
	ldr	r3, [r5, #176]
	mvn	r6, #1
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+16
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2456
.L2457:
	cmp	r6, #10
	beq	.L2488
	cmp	r6, #0
	bne	.L2456
.L2489:
	ldr	r3, [r5, #176]
	movs	r6, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+20
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2491
.L2468:
	str	r8, [r5, #176]
	mov	r0, r5
	ldrh	r1, [r4, #8]
	bl	sandisk_A19_set_readretry
	mov	r6, r0
	cbz	r0, .L2463
	mov	r0, fp
	bl	NAND_Print_DBG
.L2464:
	add	r8, r8, #1
	b	.L2462
.L2463:
	mov	r0, r4
	bl	sandisk_A19_dsp_on
	mov	r0, r4
	bl	generic_read_page_start
	mov	r6, r0
	mov	r0, r4
	bl	generic_read_page_end_not_retry
	orrs	r6, r6, r0
	ldr	r0, [r4, #20]
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2465
	ldr	r3, [r5, #176]
	mvn	r6, #1
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+16
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2464
.L2465:
	cmp	r6, #10
	beq	.L2488
	cmp	r6, #0
	bne	.L2464
	b	.L2489
.L2475:
	str	r8, [r5, #176]
	mov	r0, r5
	ldrh	r1, [r4, #8]
	bl	sandisk_A19_set_readretry
	mov	r6, r0
	cbz	r0, .L2470
	mov	r0, fp
	bl	NAND_Print_DBG
.L2471:
	add	r8, r8, #1
	b	.L2469
.L2470:
	mov	r0, r4
	bl	sandisk_A19_cmd25
	mov	r0, r4
	bl	generic_read_page_start
	mov	r6, r0
	mov	r0, r4
	bl	generic_read_page_end_not_retry
	orrs	r6, r6, r0
	ldr	r0, [r4, #20]
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2472
	ldr	r3, [r5, #176]
	mvn	r6, #1
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+16
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2471
.L2472:
	cmp	r6, #10
	beq	.L2488
	cmp	r6, #0
	bne	.L2471
	b	.L2489
.L2490:
	str	r8, [r5, #176]
	mov	r0, r5
	ldrh	r1, [r4, #8]
	bl	sandisk_A19_set_readretry
	mov	r6, r0
	cbz	r0, .L2477
	mov	r0, fp
	bl	NAND_Print_DBG
.L2478:
	add	r8, r8, #1
	b	.L2476
.L2477:
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #52
	bne	.L2479
	movs	r1, #198
.L2498:
	mov	r0, r4
	bl	sandisk_A19_set_lmflgfix_next
	mov	r0, r4
	bl	sandisk_A19_cmd25
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #50
	beq	.L2482
	subs	r3, r3, #52
	cmp	r3, #1
	bhi	.L2483
.L2482:
	mov	r0, r4
	bl	sandisk_A19_dsp_on
.L2483:
	mov	r0, r4
	bl	generic_read_page_start
	mov	r6, r0
	mov	r0, r4
	bl	generic_read_page_end_not_retry
	ldrb	r3, [r7]	@ zero_extendqisi2
	orrs	r6, r6, r0
	cmp	r3, #52
	bne	.L2484
	movs	r1, #194
.L2499:
	mov	r0, r4
	bl	sandisk_A19_set_lmflgfix_next
	ldr	r0, [r4, #20]
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2487
	ldr	r3, [r5, #176]
	mvn	r6, #1
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+16
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2478
.L2479:
	cmp	r3, #53
	ite	eq
	moveq	r1, #26
	movne	r1, #192
	b	.L2498
.L2484:
	cmp	r3, #53
	ite	eq
	moveq	r1, #10
	movne	r1, #64
	b	.L2499
.L2487:
	cmp	r6, #10
	beq	.L2488
	cmp	r6, #0
	bne	.L2478
	b	.L2489
.L2488:
	ldr	r3, [r5, #176]
	ldr	r1, [r5, #260]
	ldr	r0, .L2500+24
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2491
.L2501:
	.align	2
.L2500:
	.word	g_nsi
	.word	.LC425
	.word	.LANCHOR78
	.word	.LC426
	.word	.LC418
	.word	.LC427
	.word	.LC428
	.word	.LANCHOR79
	.size	sandisk_A19_read_page_end, .-sandisk_A19_read_page_end
	.section	.text.sandisk_A19_special_init,"ax",%progbits
	.align	1
	.global	sandisk_A19_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_special_init, %function
sandisk_A19_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2507
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2503:
	cbnz	r5, .L2504
	ldr	r3, .L2507+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2507+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2507+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2505
	ldr	r0, .L2507+16
	ldr	r5, .L2507+20
	str	r5, [r0]
	ldr	r0, .L2507+24
	bl	NAND_Print_DBG
.L2502:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2504:
	mov	r0, r5
	bl	sandisk_A19_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2503
.L2505:
	ldr	r0, .L2507+28
	bl	NAND_Print
	b	.L2502
.L2508:
	.align	2
.L2507:
	.word	g_nsi
	.word	.LANCHOR78
	.word	.LANCHOR79
	.word	.LANCHOR80
	.word	df_read_page_end
	.word	sandisk_A19_read_page_end
	.word	.LC429
	.word	.LC430
	.size	sandisk_A19_special_init, .-sandisk_A19_special_init
	.section	.text.sandisk_A19_special_exit,"ax",%progbits
	.align	1
	.global	sandisk_A19_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_special_exit, %function
sandisk_A19_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2520
	push	{r4, r5, r6, lr}
	movs	r6, #0
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2510:
	cbnz	r4, .L2513
	ldr	r0, .L2520+4
	mov	r5, r4
	bl	NAND_Print_DBG
	b	.L2509
.L2513:
	ldrb	r3, [r4, #254]	@ zero_extendqisi2
	cbz	r3, .L2511
	str	r6, [r4, #196]
	mov	r0, r4
	bl	sandisk_toggle_vendor_specific_setting
	mov	r5, r0
	cbz	r0, .L2511
	ldr	r1, .L2520+8
	ldr	r0, .L2520+12
	bl	NAND_Print
.L2509:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L2511:
	ldr	r4, [r4]
	b	.L2510
.L2521:
	.align	2
.L2520:
	.word	g_nsi
	.word	.LC432
	.word	.LANCHOR88
	.word	.LC431
	.size	sandisk_A19_special_exit, .-sandisk_A19_special_exit
	.section	.text.sandisk_A19_check_bad_block_first_burn,"ax",%progbits
	.align	1
	.global	sandisk_A19_check_bad_block_first_burn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	sandisk_A19_check_bad_block_first_burn, %function
sandisk_A19_check_bad_block_first_burn:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2526
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r8, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	ldr	r4, [r0, #260]
	mov	r5, r0
	ldr	r2, [r0, #20]
	ldr	r1, [r8, #4]
	ldr	r3, [r4, #12]
	add	r10, r4, #32
	ldr	r0, [r0, #24]
	cmp	r2, r3
	bcs	.L2523
	cmp	r1, r0
	bcc	.L2524
.L2523:
	strd	r1, r0, [sp]
	ldr	r1, [r4, #8]
	mvn	r4, #9
	ldr	r0, .L2526+4
	bl	NAND_Print
.L2522:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2524:
	mov	r0, r4
	movs	r6, #1
	bl	ndfc_disable_randomize
	mov	r0, r5
	movs	r7, #0
	bl	nand_read_chip_status_ready
	mov	r0, r5
	bl	nand_enable_chip
	mov	r0, r10
	bl	ndfc_clean_cmd_seq
	movs	r3, #162
	ldrd	r1, r2, [r8, #4]
	strd	r6, r3, [r4, #40]
	movs	r3, #128
	strd	r6, r3, [r4, #104]
	str	r7, [r4, #32]
	strd	r6, r7, [r4, #48]
	strd	r6, r7, [r4, #112]
	ldr	r0, [r5, #36]
	bl	get_row_addr
	movs	r3, #5
	mov	r2, r0
	str	r3, [r4, #136]
	add	r3, r4, #120
	str	r3, [sp]
	movs	r1, #2
	movs	r3, #3
	mov	r0, r7
	bl	fill_cmd_addr
	movs	r3, #16
	strd	r6, r6, [r4, #176]
	strd	r6, r3, [r4, #168]
	mov	r1, r10
	ldr	r0, [r5, #260]
	bl	ndfc_execute_cmd
	mov	r0, r5
	bl	nand_read_chip_status_ready
	mov	r4, r0
	mov	r0, r5
	bl	nand_disable_chip
	b	.L2522
.L2527:
	.align	2
.L2526:
	.word	g_nsi
	.word	.LC433
	.size	sandisk_A19_check_bad_block_first_burn, .-sandisk_A19_check_bad_block_first_burn
	.section	.text.hynix26nm_vender_set_param,"ax",%progbits
	.align	1
	.global	hynix26nm_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_vender_set_param, %function
hynix26nm_vender_set_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r5, r1
	sub	sp, sp, #24
	mov	r4, r2
	mov	r7, r3
	mov	r6, r0
	movs	r3, #54
	add	r10, sp, #24
	mov	r8, r5
	add	r7, r7, r4
	mov	fp, #1
	strb	r3, [r10, #-1]!
	bl	nand_enable_chip
	ldr	r0, [r6, #260]
	bl	ndfc_disable_randomize
.L2529:
	cmp	r4, r7
	bne	.L2530
	mov	r0, r6
	bl	nand_disable_chip
	ldrb	r0, [r5, #3]	@ zero_extendqisi2
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	str	r0, [sp]
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r0, .L2531
	bl	NAND_Print_DBG
	movs	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2530:
	mov	r3, r4
	str	r8, [sp]
	movs	r2, #0
	mov	r1, r10
	strd	fp, fp, [sp, #4]
	mov	r0, r6
	bl	set_cmd_with_nand_bus
	movs	r2, #0
	movs	r1, #22
	mov	r0, r6
	adds	r4, r4, #1
	bl	set_one_cmd
	add	r8, r8, #1
	b	.L2529
.L2532:
	.align	2
.L2531:
	.word	.LC407
	.size	hynix26nm_vender_set_param, .-hynix26nm_vender_set_param
	.section	.text.hynix26nm_set_readretry,"ax",%progbits
	.align	1
	.global	hynix26nm_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_set_readretry, %function
hynix26nm_set_readretry:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2542
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	ldr	r1, [r0, #176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r1, r3
	bhi	.L2541
	ldr	r4, .L2542+4
	movs	r6, #0
	ldr	r7, .L2542+8
	add	r5, sp, #4
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r7, r7, r1, lsl #3
.L2535:
	cmp	r3, r6
	bhi	.L2536
	subs	r2, r1, #2
	subs	r1, r1, #5
	cmp	r2, #4
	ldr	r8, .L2542+24
	it	ls
	movls	r2, #0
	mov	r6, #0
	it	ls
	strbls	r2, [sp, #4]
	cmp	r1, #1
	it	ls
	movls	r2, #0
	mov	r1, r5
	it	ls
	strbls	r2, [sp, #5]
	ldr	r2, .L2542+12
	bl	hynix26nm_vender_set_param
	mov	r7, r0
	ldr	r0, .L2542+16
	bl	NAND_Print_DBG
.L2539:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, r6
	bhi	.L2540
	ldr	r0, .L2542+20
	bl	NAND_Print_DBG
.L2533:
	mov	r0, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2536:
	adds	r2, r0, r6
	ldrh	ip, [r7, r6, lsl #1]
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	add	r2, r2, ip
	sxth	r2, r2
	usat	r2, #8, r2
	strb	r2, [r5, r6]
	adds	r6, r6, #1
	b	.L2535
.L2540:
	ldrb	r1, [r5, r6]	@ zero_extendqisi2
	mov	r0, r8
	bl	NAND_Print_DBG
	adds	r6, r6, #1
	b	.L2539
.L2541:
	mvn	r7, #52
	b	.L2533
.L2543:
	.align	2
.L2542:
	.word	.LANCHOR89
	.word	.LANCHOR90
	.word	.LANCHOR91
	.word	.LANCHOR92
	.word	.LC434
	.word	.LC7
	.word	.LC435
	.size	hynix26nm_set_readretry, .-hynix26nm_set_readretry
	.section	.text.hynix26nm_read_page_end,"ax",%progbits
	.align	1
	.global	hynix26nm_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_read_page_end, %function
hynix26nm_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2557
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2544
	ldr	r7, .L2557+4
	mov	r10, #0
	mov	r8, r10
	ldr	r0, .L2557+8
	bl	NAND_Print_DBG
.L2546:
	ldrb	r2, [r7]	@ zero_extendqisi2
	cmp	r2, r10
	ble	.L2550
	ldr	r3, [r5, #176]
	mov	r0, r5
	adds	r3, r3, #1
	cmp	r3, r2
	it	hi
	movhi	r3, r8
	str	r3, [r5, #176]
	bl	hynix26nm_set_readretry
	mov	r4, r0
	cbz	r0, .L2549
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix26nm_set_readretry
.L2550:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix26nm_set_readretry
.L2544:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2549:
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	cmp	r4, #10
	beq	.L2551
	cbnz	r4, .L2552
.L2551:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2557+12
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2550
.L2552:
	add	r10, r10, #1
	b	.L2546
.L2558:
	.align	2
.L2557:
	.word	g_nsi
	.word	.LANCHOR89
	.word	.LC436
	.word	.LC437
	.size	hynix26nm_read_page_end, .-hynix26nm_read_page_end
	.section	.text.hynix26nm_vender_get_param,"ax",%progbits
	.align	1
	.global	hynix26nm_vender_get_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_vender_get_param, %function
hynix26nm_vender_get_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r2
	sub	sp, sp, #20
	mov	r7, r3
	mov	r6, r0
	movs	r3, #55
	add	r8, sp, #16
	add	r7, r7, r4
	mov	r10, #1
	mov	r5, r1
	strb	r3, [r8, #-1]!
	bl	nand_enable_chip
	ldr	r0, [r6, #260]
	bl	ndfc_disable_randomize
.L2560:
	cmp	r4, r7
	bne	.L2561
	mov	r0, r6
	bl	nand_disable_chip
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2561:
	mov	r3, r5
	mov	r2, r4
	str	r10, [sp]
	mov	r1, r8
	mov	r0, r6
	adds	r4, r4, #1
	bl	get_data_with_nand_bus_one_cmd
	adds	r5, r5, #1
	b	.L2560
	.size	hynix26nm_vender_get_param, .-hynix26nm_vender_get_param
	.section	.text.hynix26nm_lsb_init,"ax",%progbits
	.align	1
	.global	hynix26nm_lsb_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_lsb_init, %function
hynix26nm_lsb_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #264]
	movs	r0, #0
	ldr	r2, .L2563
	ldr	r3, [r3, #52]
	lsrs	r1, r3, #16
	strb	r1, [r2]
	lsrs	r1, r3, #8
	ldr	r2, .L2563+4
	strb	r1, [r2]
	ldr	r2, .L2563+8
	strb	r3, [r2]
	movs	r2, #5
	ldr	r3, .L2563+12
	strb	r2, [r3]
	movs	r2, #164
	ldr	r3, .L2563+16
	strb	r2, [r3]
	movs	r2, #165
	strb	r2, [r3, #1]
	movs	r2, #176
	strb	r2, [r3, #2]
	movs	r2, #177
	strb	r2, [r3, #3]
	movs	r2, #201
	strb	r2, [r3, #4]
	movs	r2, #37
	ldr	r3, .L2563+20
	strb	r2, [r3]
	strb	r2, [r3, #1]
	strb	r2, [r3, #2]
	strb	r2, [r3, #3]
	movs	r2, #1
	strb	r2, [r3, #4]
	bx	lr
.L2564:
	.align	2
.L2563:
	.word	.LANCHOR93
	.word	.LANCHOR89
	.word	.LANCHOR90
	.word	.LANCHOR94
	.word	.LANCHOR95
	.word	.LANCHOR96
	.size	hynix26nm_lsb_init, .-hynix26nm_lsb_init
	.section	.text.hynix26nm_lsb_enable,"ax",%progbits
	.align	1
	.global	hynix26nm_lsb_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_lsb_enable, %function
hynix26nm_lsb_enable:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L2568
	ldr	r2, .L2568+4
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, .L2568+8
	bl	hynix26nm_vender_get_param
	ldrb	r3, [r4]	@ zero_extendqisi2
	movs	r2, #0
	ldr	r0, .L2568+8
	ldr	r4, .L2568+12
.L2566:
	cmp	r3, r2
	bhi	.L2567
	ldr	r2, .L2568+4
	mov	r1, sp
	mov	r0, r5
	bl	hynix26nm_vender_set_param
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L2567:
	ldrb	r1, [r2, r0]	@ zero_extendqisi2
	ldrb	r6, [r2, r4]	@ zero_extendqisi2
	add	r1, r1, r6
	strb	r1, [sp, r2]
	adds	r2, r2, #1
	b	.L2566
.L2569:
	.align	2
.L2568:
	.word	.LANCHOR94
	.word	.LANCHOR95
	.word	.LANCHOR97
	.word	.LANCHOR96
	.size	hynix26nm_lsb_enable, .-hynix26nm_lsb_enable
	.section	.text.hynix26nm_lsb_disable,"ax",%progbits
	.align	1
	.global	hynix26nm_lsb_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_lsb_disable, %function
hynix26nm_lsb_disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r3, .L2571
	ldr	r2, .L2571+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, .L2571+8
	bl	hynix26nm_vender_set_param
	movs	r0, #0
	pop	{r3, pc}
.L2572:
	.align	2
.L2571:
	.word	.LANCHOR94
	.word	.LANCHOR95
	.word	.LANCHOR97
	.size	hynix26nm_lsb_disable, .-hynix26nm_lsb_disable
	.section	.text.hynix26nm_lsb_exit,"ax",%progbits
	.align	1
	.global	hynix26nm_lsb_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_lsb_exit, %function
hynix26nm_lsb_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	set_one_cmd
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r2, #1
	movs	r1, #48
	mov	r0, r4
	bl	set_one_cmd
	ldr	r0, .L2574
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	nand_disable_chip
	movs	r0, #0
	pop	{r4, pc}
.L2575:
	.align	2
.L2574:
	.word	.LC438
	.size	hynix26nm_lsb_exit, .-hynix26nm_lsb_exit
	.section	.text.hynix26nm_getdefaultparam,"ax",%progbits
	.align	1
	.global	hynix26nm_getdefaultparam
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_getdefaultparam, %function
hynix26nm_getdefaultparam:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r4, r0, #48
	ldr	r5, .L2579
	mov	r6, r1
	mov	r1, r4
	ldr	r2, .L2579+4
	ldrb	r3, [r5]	@ zero_extendqisi2
	bl	hynix26nm_vender_get_param
	mov	r3, r6
.L2577:
	ldrb	r1, [r5]	@ zero_extendqisi2
	subs	r2, r3, r6
	cmp	r1, r2
	bgt	.L2578
	pop	{r4, r5, r6, pc}
.L2578:
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	strb	r2, [r3], #1
	b	.L2577
.L2580:
	.align	2
.L2579:
	.word	.LANCHOR90
	.word	.LANCHOR92
	.size	hynix26nm_getdefaultparam, .-hynix26nm_getdefaultparam
	.section	.text.hynix26nm_setdefaultparam,"ax",%progbits
	.align	1
	.global	hynix26nm_setdefaultparam
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_setdefaultparam, %function
hynix26nm_setdefaultparam:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	add	r1, r0, #48
	ldr	r5, .L2586
	movs	r2, #0
	ldrb	r3, [r5]	@ zero_extendqisi2
.L2582:
	cmp	r3, r2
	bgt	.L2583
	ldr	r7, .L2586+4
	mov	r1, sp
	ldr	r2, .L2586+8
	movs	r4, #0
	bl	hynix26nm_vender_set_param
	mov	r6, r0
	ldr	r0, .L2586+12
	bl	NAND_Print_DBG
.L2584:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, r4
	bgt	.L2585
	ldr	r0, .L2586+16
	bl	NAND_Print_DBG
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2583:
	ldrb	r4, [r1], #1	@ zero_extendqisi2
	strb	r4, [sp, r2]
	adds	r2, r2, #1
	b	.L2582
.L2585:
	ldrb	r1, [sp, r4]	@ zero_extendqisi2
	mov	r0, r7
	bl	NAND_Print_DBG
	adds	r4, r4, #1
	b	.L2584
.L2587:
	.align	2
.L2586:
	.word	.LANCHOR90
	.word	.LC440
	.word	.LANCHOR92
	.word	.LC439
	.word	.LC7
	.size	hynix26nm_setdefaultparam, .-hynix26nm_setdefaultparam
	.section	.text.hynix26nm_get_default_param,"ax",%progbits
	.align	1
	.global	hynix26nm_get_default_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_get_default_param, %function
hynix26nm_get_default_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #24
	add	r1, sp, #20
	mov	r4, r0
	bl	hynix26nm_getdefaultparam
	ldrb	r2, [sp, #23]	@ zero_extendqisi2
	ldr	r1, [r4, #260]
	ldrb	r3, [sp, #20]	@ zero_extendqisi2
	str	r2, [sp, #8]
	ldrb	r2, [sp, #22]	@ zero_extendqisi2
	ldr	r0, .L2589
	str	r2, [sp, #4]
	ldrb	r2, [sp, #21]	@ zero_extendqisi2
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	hynix26nm_setdefaultparam
	movs	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, pc}
.L2590:
	.align	2
.L2589:
	.word	.LC441
	.size	hynix26nm_get_default_param, .-hynix26nm_get_default_param
	.section	.text.hynix26nm_readretry_init,"ax",%progbits
	.align	1
	.global	hynix26nm_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_readretry_init, %function
hynix26nm_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, [r0, #264]
	ldr	r4, .L2606
	ldr	r2, [r3, #52]
	ldr	r3, .L2606+4
	ubfx	r1, r2, #16, #8
	strb	r1, [r3]
	lsrs	r3, r2, #8
	strb	r3, [r4]
	ldr	r4, .L2606+8
	strb	r2, [r4]
	cbnz	r1, .L2592
	ldr	r4, .L2606+12
	movs	r5, #172
	uxtb	r3, r3
	ldr	r6, .L2606+16
	uxtb	r2, r2
	strb	r5, [r4]
	movs	r5, #173
	strb	r5, [r4, #1]
	movs	r5, #174
	strb	r5, [r4, #2]
	movs	r5, #175
	strb	r5, [r4, #3]
	adds	r3, r3, #1
	ldr	r5, .L2606+20
.L2593:
	cmp	r3, r1
	bhi	.L2603
.L2596:
	add	r2, r0, #48
	add	r1, r0, #176
	movs	r3, #0
	str	r3, [r0, #176]
.L2602:
	strb	r3, [r2], #1
	cmp	r1, r2
	bne	.L2602
	bl	hynix26nm_get_default_param
	movs	r0, #0
	b	.L2591
.L2594:
	ldrh	r7, [r5, r4, lsl #1]
	strh	r7, [r6, r4, lsl #1]	@ movhi
	adds	r4, r4, #1
.L2595:
	cmp	r4, r2
	bcc	.L2594
	adds	r1, r1, #1
	adds	r5, r5, #8
	adds	r6, r6, #8
	b	.L2593
.L2603:
	movs	r4, #0
	b	.L2595
.L2592:
	cmp	r1, #1
	bne	.L2597
	ldr	r1, .L2606+12
	movs	r4, #167
	uxtb	r3, r3
	ldr	r5, .L2606+24
	ldr	r6, .L2606+16
	uxtb	r2, r2
	strb	r4, [r1]
	movs	r4, #173
	strb	r4, [r1, #1]
	movs	r4, #174
	strb	r4, [r1, #2]
	movs	r4, #175
	strb	r4, [r1, #3]
	adds	r3, r3, #1
	movs	r4, #0
.L2598:
	cmp	r3, r4
	bls	.L2596
	movs	r1, #0
	b	.L2600
.L2599:
	ldrh	r7, [r5, r1, lsl #1]
	strh	r7, [r6, r1, lsl #1]	@ movhi
	adds	r1, r1, #1
.L2600:
	cmp	r1, r2
	bcc	.L2599
	adds	r4, r4, #1
	adds	r5, r5, #8
	adds	r6, r6, #8
	b	.L2598
.L2597:
	ldr	r0, .L2606+28
	bl	NAND_Print
	mvn	r0, #53
.L2591:
	pop	{r3, r4, r5, r6, r7, pc}
.L2607:
	.align	2
.L2606:
	.word	.LANCHOR89
	.word	.LANCHOR93
	.word	.LANCHOR90
	.word	.LANCHOR92
	.word	.LANCHOR91
	.word	.LANCHOR98
	.word	.LANCHOR99
	.word	.LC442
	.size	hynix26nm_readretry_init, .-hynix26nm_readretry_init
	.section	.text.hynix26nm_readretry_exit,"ax",%progbits
	.align	1
	.global	hynix26nm_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_readretry_exit, %function
hynix26nm_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r0, .L2609
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	hynix26nm_setdefaultparam
	movs	r0, #0
	str	r0, [r4, #176]
	pop	{r4, pc}
.L2610:
	.align	2
.L2609:
	.word	.LC443
	.size	hynix26nm_readretry_exit, .-hynix26nm_readretry_exit
	.section	.text.hynix26nm_special_init,"ax",%progbits
	.align	1
	.global	hynix26nm_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_special_init, %function
hynix26nm_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2616
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2612:
	cbnz	r5, .L2613
	ldr	r3, .L2616+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2616+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2616+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2614
	ldr	r0, .L2616+16
	ldr	r5, .L2616+20
	str	r5, [r0]
	ldr	r0, .L2616+24
	bl	NAND_Print_DBG
.L2611:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2613:
	mov	r0, r5
	bl	hynix26nm_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2612
.L2614:
	ldr	r0, .L2616+28
	bl	NAND_Print
	b	.L2611
.L2617:
	.align	2
.L2616:
	.word	g_nsi
	.word	.LANCHOR93
	.word	.LANCHOR89
	.word	.LANCHOR90
	.word	df_read_page_end
	.word	hynix26nm_read_page_end
	.word	.LC444
	.word	.LC445
	.size	hynix26nm_special_init, .-hynix26nm_special_init
	.section	.text.hynix26nm_special_exit,"ax",%progbits
	.align	1
	.global	hynix26nm_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix26nm_special_exit, %function
hynix26nm_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2621
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2619:
	cbnz	r4, .L2620
	ldr	r0, .L2621+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2620:
	mov	r0, r4
	bl	hynix26nm_readretry_exit
	ldr	r4, [r4]
	b	.L2619
.L2622:
	.align	2
.L2621:
	.word	g_nsi
	.word	.LC446
	.size	hynix26nm_special_exit, .-hynix26nm_special_exit
	.section	.text.hynix20nm_vender_set_param,"ax",%progbits
	.align	1
	.global	hynix20nm_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_vender_set_param, %function
hynix20nm_vender_set_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r2
	sub	sp, sp, #28
	mov	r7, r3
	mov	r6, r0
	movs	r3, #54
	add	r8, sp, #24
	add	r7, r7, r4
	mov	r10, #1
	mov	r5, r1
	strb	r3, [r8, #-1]!
	bl	nand_enable_chip
	ldr	r0, [r6, #260]
	bl	ndfc_disable_randomize
.L2624:
	cmp	r4, r7
	bne	.L2625
	mov	r0, r6
	bl	nand_disable_chip
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2625:
	mov	r3, r4
	str	r5, [sp]
	movs	r2, #0
	mov	r1, r8
	strd	r10, r10, [sp, #4]
	mov	r0, r6
	bl	set_cmd_with_nand_bus
	movs	r2, #0
	movs	r1, #22
	mov	r0, r6
	adds	r4, r4, #1
	bl	set_one_cmd
	adds	r5, r5, #1
	b	.L2624
	.size	hynix20nm_vender_set_param, .-hynix20nm_vender_set_param
	.section	.text.hynix20nm_set_readretry,"ax",%progbits
	.align	1
	.global	hynix20nm_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_set_readretry, %function
hynix20nm_set_readretry:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2633
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r1, [r0, #176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r1, r3
	bhi	.L2632
	ldr	r5, .L2633+4
	lsls	r1, r1, #3
	movs	r2, #0
	ldrb	r3, [r5]	@ zero_extendqisi2
.L2628:
	cmp	r3, r2
	bhi	.L2629
	ldr	r7, .L2633+8
	mov	r1, sp
	ldr	r2, .L2633+12
	movs	r4, #0
	bl	hynix20nm_vender_set_param
	mov	r6, r0
	ldr	r0, .L2633+16
	bl	NAND_Print_DBG
.L2630:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, r4
	bhi	.L2631
	ldr	r0, .L2633+20
	bl	NAND_Print_DBG
.L2626:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2629:
	adds	r4, r1, r2
	add	r4, r4, r0
	ldrb	r4, [r4, #48]	@ zero_extendqisi2
	strb	r4, [sp, r2]
	adds	r2, r2, #1
	b	.L2628
.L2631:
	ldrb	r1, [sp, r4]	@ zero_extendqisi2
	mov	r0, r7
	bl	NAND_Print_DBG
	adds	r4, r4, #1
	b	.L2630
.L2632:
	mvn	r6, #91
	b	.L2626
.L2634:
	.align	2
.L2633:
	.word	.LANCHOR100
	.word	.LANCHOR101
	.word	.LC435
	.word	.LANCHOR102
	.word	.LC447
	.word	.LC7
	.size	hynix20nm_set_readretry, .-hynix20nm_set_readretry
	.section	.text.hynix20nm_read_page_end,"ax",%progbits
	.align	1
	.global	hynix20nm_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_read_page_end, %function
hynix20nm_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2651
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2635
	ldr	r8, .L2651+16
	movs	r7, #0
	ldr	r10, .L2651+20
	ldr	r0, .L2651+4
	bl	NAND_Print_DBG
.L2637:
	ldrb	r2, [r8]	@ zero_extendqisi2
	cmp	r2, r7
	ble	.L2641
	ldr	r3, [r5, #176]
	mov	r0, r5
	adds	r3, r3, #1
	cmp	r3, r2
	it	hi
	movhi	r3, #0
	str	r3, [r5, #176]
	bl	hynix20nm_set_readretry
	mov	r4, r0
	cbz	r0, .L2640
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix20nm_set_readretry
.L2641:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix20nm_set_readretry
.L2635:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2640:
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	ldr	fp, [r6, #20]
	orrs	r4, r4, r0
	mov	r0, fp
	bl	is_nouse_page
	cmp	r0, #1
	bne	.L2642
	ldr	r3, [r5, #176]
	mvn	r4, #1
	ldr	r1, [r5, #260]
	mov	r0, r10
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
.L2643:
	adds	r7, r7, #1
	b	.L2637
.L2642:
	cmp	r4, #10
	bne	.L2644
.L2645:
	ldrb	r0, [fp, #4]	@ zero_extendqisi2
	movs	r4, #10
	ldrb	r3, [fp, #3]	@ zero_extendqisi2
	ldrb	r2, [fp, #2]	@ zero_extendqisi2
	ldrb	r1, [fp, #1]	@ zero_extendqisi2
	str	r0, [sp]
	ldr	r0, .L2651+8
	bl	NAND_Print_DBG
	ldr	r3, [r5, #176]
	ldr	r1, [r5, #260]
	ldr	r0, .L2651+12
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2641
.L2644:
	cmp	r4, #0
	bne	.L2643
	b	.L2645
.L2652:
	.align	2
.L2651:
	.word	g_nsi
	.word	.LC448
	.word	.LC449
	.word	.LC450
	.word	.LANCHOR100
	.word	.LC418
	.size	hynix20nm_read_page_end, .-hynix20nm_read_page_end
	.section	.text.hynix20nm_vender_get_param,"ax",%progbits
	.align	1
	.global	hynix20nm_vender_get_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_vender_get_param, %function
hynix20nm_vender_get_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r7, r3
	sub	sp, sp, #20
	mov	r4, r2
	mov	r6, r0
	mov	r5, r1
	add	r7, r7, r4
	mov	r10, #1
	bl	nand_enable_chip
	ldr	r0, [r6, #260]
	add	r8, sp, #16
	bl	ndfc_disable_randomize
	movs	r3, #55
	strb	r3, [r8, #-1]!
.L2654:
	cmp	r4, r7
	bne	.L2655
	mov	r0, r6
	bl	nand_disable_chip
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2655:
	mov	r3, r5
	mov	r2, r4
	str	r10, [sp]
	mov	r1, r8
	mov	r0, r6
	adds	r4, r4, #1
	bl	get_data_with_nand_bus_one_cmd
	adds	r5, r5, #1
	b	.L2654
	.size	hynix20nm_vender_get_param, .-hynix20nm_vender_get_param
	.section	.text.hynix20nm_lsb_init,"ax",%progbits
	.align	1
	.global	hynix20nm_lsb_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_lsb_init, %function
hynix20nm_lsb_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #264]
	ldr	r1, .L2660
	ldr	r2, [r3, #52]
	ubfx	r3, r2, #16, #8
	strb	r3, [r1]
	lsrs	r0, r2, #8
	ldr	r1, .L2660+4
	cmp	r3, #2
	strb	r0, [r1]
	ldr	r1, .L2660+8
	strb	r2, [r1]
	bne	.L2657
	ldr	r3, .L2660+12
	movs	r2, #4
	strb	r2, [r3]
	movs	r2, #176
	ldr	r3, .L2660+16
	strb	r2, [r3]
	movs	r2, #177
	strb	r2, [r3, #1]
	movs	r2, #160
	strb	r2, [r3, #2]
	movs	r2, #161
.L2659:
	strb	r2, [r3, #3]
	movs	r2, #10
	ldr	r3, .L2660+20
	strb	r2, [r3]
	strb	r2, [r3, #1]
	strb	r2, [r3, #2]
	strb	r2, [r3, #3]
.L2658:
	movs	r0, #0
	bx	lr
.L2657:
	cmp	r3, #3
	bne	.L2658
	ldr	r3, .L2660+12
	movs	r2, #4
	strb	r2, [r3]
	movs	r2, #160
	ldr	r3, .L2660+16
	strb	r2, [r3]
	movs	r2, #161
	strb	r2, [r3, #1]
	movs	r2, #167
	strb	r2, [r3, #2]
	movs	r2, #168
	b	.L2659
.L2661:
	.align	2
.L2660:
	.word	.LANCHOR103
	.word	.LANCHOR100
	.word	.LANCHOR101
	.word	.LANCHOR104
	.word	.LANCHOR105
	.word	.LANCHOR106
	.size	hynix20nm_lsb_init, .-hynix20nm_lsb_init
	.section	.text.hynix20nm_lsb_enable,"ax",%progbits
	.align	1
	.global	hynix20nm_lsb_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_lsb_enable, %function
hynix20nm_lsb_enable:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r4, .L2665
	ldr	r2, .L2665+4
	ldrb	r3, [r4]	@ zero_extendqisi2
	ldr	r1, .L2665+8
	bl	hynix20nm_vender_get_param
	ldr	r6, .L2665+12
	movs	r2, #0
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r1, sp, #4
	ldr	r4, .L2665+8
.L2663:
	cmp	r3, r2
	bhi	.L2664
	ldr	r2, .L2665+4
	mov	r0, r5
	bl	hynix20nm_vender_set_param
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2664:
	ldrb	r0, [r2, r4]	@ zero_extendqisi2
	ldrb	r7, [r2, r6]	@ zero_extendqisi2
	add	r0, r0, r7
	strb	r0, [r1, r2]
	adds	r2, r2, #1
	b	.L2663
.L2666:
	.align	2
.L2665:
	.word	.LANCHOR104
	.word	.LANCHOR105
	.word	.LANCHOR107
	.word	.LANCHOR106
	.size	hynix20nm_lsb_enable, .-hynix20nm_lsb_enable
	.section	.text.hynix20nm_lsb_disable,"ax",%progbits
	.align	1
	.global	hynix20nm_lsb_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_lsb_disable, %function
hynix20nm_lsb_disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r3, .L2668
	ldr	r2, .L2668+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r1, .L2668+8
	bl	hynix20nm_vender_set_param
	movs	r0, #0
	pop	{r3, pc}
.L2669:
	.align	2
.L2668:
	.word	.LANCHOR104
	.word	.LANCHOR105
	.word	.LANCHOR107
	.size	hynix20nm_lsb_disable, .-hynix20nm_lsb_disable
	.section	.text.hynix20nm_lsb_exit,"ax",%progbits
	.align	1
	.global	hynix20nm_lsb_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_lsb_exit, %function
hynix20nm_lsb_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	set_one_cmd
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r2, #1
	movs	r1, #48
	mov	r0, r4
	bl	set_one_cmd
	ldr	r0, .L2671
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	nand_disable_chip
	movs	r0, #0
	pop	{r4, pc}
.L2672:
	.align	2
.L2671:
	.word	.LC451
	.size	hynix20nm_lsb_exit, .-hynix20nm_lsb_exit
	.section	.text.hynix20nm_vender_get_param_otp_hynix,"ax",%progbits
	.align	1
	.global	hynix20nm_vender_get_param_otp_hynix
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_vender_get_param_otp_hynix, %function
hynix20nm_vender_get_param_otp_hynix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r3, #0
	sub	sp, sp, #36
	mov	r4, r0
	strh	r3, [sp, #28]	@ movhi
	ldr	r3, .L2691
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L2674
	movw	r3, #52479
	strh	r3, [sp, #24]	@ movhi
	movw	r3, #19776
	strh	r3, [sp, #28]	@ movhi
.L2675:
	mov	r0, #1024
	movs	r6, #1
	bl	nand_get_temp_buf
	mov	r5, r0
	mov	r0, r4
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	movs	r2, #1
	movs	r1, #255
	mov	r0, r4
	bl	set_one_cmd
	movs	r3, #54
	movs	r2, #0
	strb	r3, [sp, #20]
	add	r3, sp, #28
	str	r3, [sp]
	add	r1, sp, #20
	add	r3, sp, #24
	strd	r6, r6, [sp, #4]
	mov	r0, r4
	bl	set_cmd_with_nand_bus
	movs	r2, #0
	add	r3, sp, #29
	mov	r1, r2
	str	r3, [sp]
	strd	r6, r6, [sp, #4]
	add	r3, sp, #25
	mov	r0, r4
	bl	set_cmd_with_nand_bus
	movs	r2, #0
	movs	r1, #22
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #23
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #4
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #25
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	set_one_cmd
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #2
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r3, #48
	movs	r2, #0
	strb	r3, [sp, #20]
	movs	r3, #2
	str	r3, [sp]
	add	r1, sp, #20
	mov	r3, r5
	mov	r0, r4
	bl	get_data_with_nand_bus_one_cmd
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldrb	r2, [r5, #1]	@ zero_extendqisi2
	cmp	r1, #8
	bne	.L2677
	cmp	r2, #8
	beq	.L2686
.L2677:
	mvn	r6, #95
	ldr	r0, .L2691+4
	bl	NAND_Print
.L2678:
	mov	r3, #1024
	movs	r2, #0
	str	r3, [sp]
	mov	r1, r2
	mov	r3, r5
	mov	r0, r4
	bl	get_data_with_nand_bus_one_cmd
	movs	r1, #0
	add	ip, r4, #112
.L2679:
	add	r2, r5, r1, lsl #7
	add	r3, r4, #48
.L2681:
	ldrb	r7, [r2], #1	@ zero_extendqisi2
	strb	r7, [r3], #1
	ldrb	r0, [r2, #63]	@ zero_extendqisi2
	add	r0, r0, r7
	cmp	r0, #255
	bne	.L2680
	cmp	r3, ip
	bne	.L2681
	ldr	r0, .L2691+8
	bl	NAND_Print_DBG
	b	.L2683
.L2674:
	cmp	r3, #3
	bne	.L2685
	movw	r3, #45230
	strh	r3, [sp, #24]	@ movhi
	movs	r3, #77
	strb	r3, [sp, #29]
	b	.L2675
.L2686:
	movs	r6, #0
	b	.L2678
.L2685:
	mvn	r6, #96
	b	.L2673
.L2680:
	adds	r1, r1, #1
	cmp	r1, #8
	bne	.L2679
	mvn	r6, #94
	ldr	r0, .L2691+12
	bl	NAND_Print_DBG
.L2683:
	movs	r2, #1
	movs	r1, #255
	mov	r0, r4
	bl	set_one_cmd
	movs	r1, #56
	movs	r2, #1
	mov	r0, r4
	bl	set_one_cmd
	mov	r0, r4
	bl	nand_disable_chip
	mov	r1, #1024
	mov	r0, r5
	bl	nand_free_temp_buf
.L2673:
	mov	r0, r6
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2692:
	.align	2
.L2691:
	.word	.LANCHOR103
	.word	.LC452
	.word	.LC454
	.word	.LC453
	.size	hynix20nm_vender_get_param_otp_hynix, .-hynix20nm_vender_get_param_otp_hynix
	.section	.text.hynix20nm_saveotpvalue,"ax",%progbits
	.align	1
	.global	hynix20nm_saveotpvalue
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_saveotpvalue, %function
hynix20nm_saveotpvalue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r3, r1, #1
	adds	r0, r0, #48
	adds	r1, r1, #63
.L2694:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r3, r1
	strb	r2, [r0], #1
	bne	.L2694
	bx	lr
	.size	hynix20nm_saveotpvalue, .-hynix20nm_saveotpvalue
	.section	.text.hynix20nm_getotpparam,"ax",%progbits
	.align	1
	.global	hynix20nm_getotpparam
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_getotpparam, %function
hynix20nm_getotpparam:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r8, .L2706+4
	mov	r5, r1
	movs	r6, #0
.L2699:
	mov	r1, r6
	mov	r0, r8
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	hynix20nm_vender_get_param_otp_hynix
	mov	r7, r0
	cbnz	r0, .L2697
	mov	r0, r4
	mov	r1, r5
	add	r2, r4, #64
.L2698:
	movs	r3, #0
.L2701:
	adds	r4, r0, r3
	ldrb	r4, [r4, #48]	@ zero_extendqisi2
	strb	r4, [r1, r3]
	adds	r3, r3, #1
	cmp	r3, #8
	bne	.L2701
	adds	r0, r0, #8
	adds	r1, r1, #8
	cmp	r2, r0
	bne	.L2698
.L2696:
	mov	r0, r7
	pop	{r4, r5, r6, r7, r8, pc}
.L2697:
	adds	r6, r6, #1
	cmp	r6, #5
	bne	.L2699
	ldr	r0, .L2706
	bl	NAND_Print
	b	.L2696
.L2707:
	.align	2
.L2706:
	.word	.LC456
	.word	.LC455
	.size	hynix20nm_getotpparam, .-hynix20nm_getotpparam
	.section	.text.hynix20nm_set_default_param,"ax",%progbits
	.align	1
	.global	hynix20nm_set_default_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_set_default_param, %function
hynix20nm_set_default_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	add	r1, r0, #48
	ldr	r5, .L2713
	movs	r2, #0
	ldrb	r3, [r5]	@ zero_extendqisi2
.L2709:
	cmp	r3, r2
	bhi	.L2710
	ldr	r7, .L2713+4
	mov	r1, sp
	ldr	r2, .L2713+8
	movs	r4, #0
	bl	hynix20nm_vender_set_param
	mov	r6, r0
	ldr	r0, .L2713+12
	bl	NAND_Print_DBG
.L2711:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, r4
	bhi	.L2712
	ldr	r0, .L2713+16
	bl	NAND_Print_DBG
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2710:
	ldrb	r4, [r1], #1	@ zero_extendqisi2
	strb	r4, [sp, r2]
	adds	r2, r2, #1
	b	.L2709
.L2712:
	ldrb	r1, [sp, r4]	@ zero_extendqisi2
	mov	r0, r7
	bl	NAND_Print_DBG
	adds	r4, r4, #1
	b	.L2711
.L2714:
	.align	2
.L2713:
	.word	.LANCHOR101
	.word	.LC440
	.word	.LANCHOR102
	.word	.LC439
	.word	.LC7
	.size	hynix20nm_set_default_param, .-hynix20nm_set_default_param
	.section	.text.hynix20nm_readretry_exit,"ax",%progbits
	.align	1
	.global	hynix20nm_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_readretry_exit, %function
hynix20nm_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r0, .L2716
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	hynix20nm_set_default_param
	movs	r0, #0
	str	r0, [r4, #176]
	pop	{r4, pc}
.L2717:
	.align	2
.L2716:
	.word	.LC457
	.size	hynix20nm_readretry_exit, .-hynix20nm_readretry_exit
	.section	.text.hynix20nm_special_exit,"ax",%progbits
	.align	1
	.global	hynix20nm_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_special_exit, %function
hynix20nm_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2721
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2719:
	cbnz	r4, .L2720
	ldr	r0, .L2721+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2720:
	mov	r0, r4
	bl	hynix20nm_readretry_exit
	ldr	r4, [r4]
	b	.L2719
.L2722:
	.align	2
.L2721:
	.word	g_nsi
	.word	.LC458
	.size	hynix20nm_special_exit, .-hynix20nm_special_exit
	.section	.text.generic_special_init,"ax",%progbits
	.align	1
	.global	generic_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	generic_special_init, %function
generic_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r2, .L2724
	ldr	r3, .L2724+4
	ldr	r0, .L2724+8
	str	r2, [r3]
	bl	NAND_Print_DBG
	movs	r0, #0
	pop	{r3, pc}
.L2725:
	.align	2
.L2724:
	.word	generic_read_page_end_not_retry
	.word	df_read_page_end
	.word	.LC459
	.size	generic_special_init, .-generic_special_init
	.section	.text.generic_special_exit,"ax",%progbits
	.align	1
	.global	generic_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	generic_special_exit, %function
generic_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, .L2727
	bl	NAND_Print_DBG
	movs	r0, #0
	pop	{r3, pc}
.L2728:
	.align	2
.L2727:
	.word	.LC460
	.size	generic_special_exit, .-generic_special_exit
	.section	.text.hynix16nm_vender_set_param,"ax",%progbits
	.align	1
	.global	hynix16nm_vender_set_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_vender_set_param, %function
hynix16nm_vender_set_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	hynix26nm_vender_set_param
	.size	hynix16nm_vender_set_param, .-hynix16nm_vender_set_param
	.section	.text.hynix16nm_set_readretry,"ax",%progbits
	.align	1
	.global	hynix16nm_set_readretry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_set_readretry, %function
hynix16nm_set_readretry:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2735
	push	{r0, r1, r4, lr}
	ldr	r1, [r0, #176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r1, r3
	bhi	.L2734
	ldr	r3, .L2735+4
	lsls	r1, r1, #2
	movs	r2, #0
	ldrb	r3, [r3]	@ zero_extendqisi2
.L2732:
	cmp	r3, r2
	bhi	.L2733
	ldr	r2, .L2735+8
	mov	r1, sp
	bl	hynix26nm_vender_set_param
.L2730:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L2733:
	adds	r4, r1, r2
	add	r4, r4, r0
	ldrb	r4, [r4, #48]	@ zero_extendqisi2
	strb	r4, [sp, r2]
	adds	r2, r2, #1
	b	.L2732
.L2734:
	mvn	r0, #73
	b	.L2730
.L2736:
	.align	2
.L2735:
	.word	.LANCHOR108
	.word	.LANCHOR109
	.word	.LANCHOR110
	.size	hynix16nm_set_readretry, .-hynix16nm_set_readretry
	.section	.text.hynix16nm_read_page_end,"ax",%progbits
	.align	1
	.global	hynix16nm_read_page_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_read_page_end, %function
hynix16nm_read_page_end:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2750
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r10, lr}
	mov	r6, r0
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	mov	r5, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	adds	r3, r0, #2
	mov	r4, r0
	bne	.L2737
	ldr	r7, .L2750+4
	mov	r10, #0
	mov	r8, r10
	ldr	r0, .L2750+8
	bl	NAND_Print_DBG
.L2739:
	ldrb	r2, [r7]	@ zero_extendqisi2
	cmp	r2, r10
	ble	.L2743
	ldr	r3, [r5, #176]
	mov	r0, r5
	adds	r3, r3, #1
	cmp	r3, r2
	it	hi
	movhi	r3, r8
	str	r3, [r5, #176]
	bl	hynix16nm_set_readretry
	mov	r4, r0
	cbz	r0, .L2742
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix16nm_set_readretry
.L2743:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r5, #176]
	bl	hynix16nm_set_readretry
.L2737:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2742:
	mov	r0, r6
	bl	generic_read_page_start
	mov	r4, r0
	mov	r0, r6
	bl	generic_read_page_end_not_retry
	orrs	r4, r4, r0
	cmp	r4, #10
	beq	.L2744
	cbnz	r4, .L2745
.L2744:
	ldr	r3, [r5, #176]
	movs	r4, #10
	ldr	r1, [r5, #260]
	ldr	r0, .L2750+12
	str	r3, [sp, #4]
	ldr	r3, [r6, #8]
	str	r3, [sp]
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #20]
	ldr	r1, [r1, #8]
	bl	NAND_Print_DBG
	b	.L2743
.L2745:
	add	r10, r10, #1
	b	.L2739
.L2751:
	.align	2
.L2750:
	.word	g_nsi
	.word	.LANCHOR108
	.word	.LC461
	.word	.LC462
	.size	hynix16nm_read_page_end, .-hynix16nm_read_page_end
	.section	.text.hynix16nm_get_special_info,"ax",%progbits
	.align	1
	.global	hynix16nm_get_special_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_get_special_info, %function
hynix16nm_get_special_info:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	ldr	r0, .L2765
	mov	r8, r1
	mov	r7, r2
	mov	r10, r3
	bl	NAND_Print_DBG
	mov	r0, sp
	bl	physic_info_get_offset
	cbz	r0, .L2759
	ldr	r0, .L2765+4
	bl	NAND_Print
	movs	r0, #1
.L2752:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2759:
	ldr	fp, .L2765+8
	movs	r5, #4
	add	r6, r4, #9728
.L2753:
	mov	r1, r5
	mov	r0, fp
	bl	NAND_Print_DBG
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #165
	beq	.L2755
	mov	r3, r4
	add	r2, sp, #4
	ldr	r1, [sp]
	mov	r0, r5
	bl	physic_info_get_one_copy
.L2755:
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #165
	bne	.L2756
	add	r2, r4, #9728
	add	r1, r4, #10752
	adds	r2, r2, #2
	movs	r3, #0
.L2757:
	ldrb	r0, [r2], #1	@ zero_extendqisi2
	cmp	r2, r1
	add	r3, r3, r0
	uxtb	r3, r3
	bne	.L2757
	movw	r2, #9729
	ldrb	r2, [r4, r2]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L2758
	mla	r1, r7, r10, r4
	mov	r0, r8
	mov	r2, r7
	add	r1, r1, #9728
	adds	r1, r1, #2
	bl	NAND_Memcpy
	movs	r0, #0
	b	.L2752
.L2758:
	movs	r3, #0
	strb	r3, [r6]
.L2756:
	adds	r5, r5, #1
	cmp	r5, #51
	bne	.L2753
	mov	r0, #-1
	b	.L2752
.L2766:
	.align	2
.L2765:
	.word	.LC463
	.word	.LC464
	.word	.LC465
	.size	hynix16nm_get_special_info, .-hynix16nm_get_special_info
	.section	.text.hynix20nm_init_readretry_param,"ax",%progbits
	.align	1
	.global	hynix20nm_init_readretry_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_init_readretry_param, %function
hynix20nm_init_readretry_param:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	sub	sp, sp, #64
	ldr	r0, [r3, #16]
	lsls	r0, r0, #9
	bl	nand_get_temp_buf
	mov	r6, r0
	cbnz	r0, .L2768
	mvn	r5, #93
	ldr	r0, .L2776
	bl	NAND_Print_DBG
.L2767:
	mov	r0, r5
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2768:
	mov	r0, #32768
	bl	nand_get_temp_buf
	cbnz	r0, .L2770
	ldr	r3, [r4, #264]
	mov	r0, r6
	mvn	r5, #75
	ldr	r1, [r3, #16]
	lsls	r1, r1, #9
	bl	nand_free_temp_buf
	ldr	r0, .L2776+4
	bl	NAND_Print
	b	.L2767
.L2770:
	ldr	r3, [r4, #16]
	movs	r2, #64
	mov	r1, r6
	bl	hynix16nm_get_special_info
	ldr	r3, [r4, #260]
	mov	r5, r0
	cbnz	r0, .L2771
	ldr	r7, .L2776+8
	ldr	r8, .L2776+24
	ldr	r2, [r4, #16]
	ldr	r1, [r3, #8]
	ldr	r0, .L2776+12
	bl	NAND_Print_DBG
.L2773:
	ldrb	r1, [r6, r5]	@ zero_extendqisi2
	mov	r0, r7
	bl	NAND_Print_DBG
	and	r3, r5, #7
	cmp	r3, #7
	bne	.L2772
	mov	r0, r8
	bl	NAND_Print_DBG
.L2772:
	adds	r5, r5, #1
	cmp	r5, #64
	bne	.L2773
	mov	r1, r6
	mov	r0, r4
	bl	hynix20nm_saveotpvalue
	mov	r0, r4
	bl	hynix20nm_set_default_param
	mov	r5, r0
.L2774:
	ldr	r3, [r4, #264]
	mov	r0, r6
	ldr	r1, [r3, #16]
	lsls	r1, r1, #9
	bl	nand_free_temp_buf
	b	.L2767
.L2771:
	ldr	r1, [r3, #8]
	ldr	r0, .L2776+16
	bl	NAND_Print_DBG
	mov	r1, sp
	mov	r0, r4
	bl	hynix20nm_getotpparam
	mov	r5, r0
	cmp	r0, #0
	bne	.L2774
	mov	r0, r4
	bl	hynix20nm_set_default_param
	ldr	r3, [r4, #260]
	ldr	r0, .L2776+20
	ldr	r1, [r3, #8]
	bl	NAND_Print_DBG
	b	.L2774
.L2777:
	.align	2
.L2776:
	.word	.LC466
	.word	.LC467
	.word	.LC469
	.word	.LC468
	.word	.LC470
	.word	.LC471
	.word	.LC7
	.size	hynix20nm_init_readretry_param, .-hynix20nm_init_readretry_param
	.section	.text.hynix20nm_readretry_init,"ax",%progbits
	.align	1
	.global	hynix20nm_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_readretry_init, %function
hynix20nm_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	ldr	r2, .L2787
	push	{r4, lr}
	ldr	r3, [r3, #52]
	ubfx	r1, r3, #16, #8
	strb	r1, [r2]
	lsrs	r4, r3, #8
	ldr	r2, .L2787+4
	cmp	r1, #2
	strb	r4, [r2]
	ldr	r2, .L2787+8
	strb	r3, [r2]
	bne	.L2779
	ldr	r3, .L2787+12
	movs	r2, #204
	strb	r2, [r3]
	movs	r2, #191
	strb	r2, [r3, #1]
	movs	r2, #170
	strb	r2, [r3, #2]
	movs	r2, #171
	strb	r2, [r3, #3]
	movs	r2, #205
	strb	r2, [r3, #4]
	movs	r2, #173
	strb	r2, [r3, #5]
	movs	r2, #174
	strb	r2, [r3, #6]
	movs	r2, #175
.L2786:
	strb	r2, [r3, #7]
	add	r1, r0, #176
	add	r2, r0, #48
	movs	r3, #0
	str	r3, [r0, #176]
.L2783:
	strb	r3, [r2], #1
	cmp	r2, r1
	bne	.L2783
	pop	{r4, lr}
	b	hynix20nm_init_readretry_param
.L2779:
	cmp	r1, #3
	bne	.L2781
	ldr	r3, .L2787+12
	movs	r2, #176
	strb	r2, [r3]
	movs	r2, #177
	strb	r2, [r3, #1]
	movs	r2, #178
	strb	r2, [r3, #2]
	movs	r2, #179
	strb	r2, [r3, #3]
	movs	r2, #180
	strb	r2, [r3, #4]
	movs	r2, #181
	strb	r2, [r3, #5]
	movs	r2, #182
	strb	r2, [r3, #6]
	movs	r2, #183
	b	.L2786
.L2781:
	ldr	r0, .L2787+16
	bl	NAND_Print
	mvn	r0, #92
	pop	{r4, pc}
.L2788:
	.align	2
.L2787:
	.word	.LANCHOR103
	.word	.LANCHOR100
	.word	.LANCHOR101
	.word	.LANCHOR102
	.word	.LC442
	.size	hynix20nm_readretry_init, .-hynix20nm_readretry_init
	.section	.text.hynix20nm_special_init,"ax",%progbits
	.align	1
	.global	hynix20nm_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix20nm_special_init, %function
hynix20nm_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2794
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2790:
	cbnz	r5, .L2791
	ldr	r3, .L2794+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2794+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2794+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2792
	ldr	r0, .L2794+16
	ldr	r5, .L2794+20
	str	r5, [r0]
	ldr	r0, .L2794+24
	bl	NAND_Print_DBG
.L2789:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2791:
	mov	r0, r5
	bl	hynix20nm_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2790
.L2792:
	ldr	r0, .L2794+28
	bl	NAND_Print
	b	.L2789
.L2795:
	.align	2
.L2794:
	.word	g_nsi
	.word	.LANCHOR103
	.word	.LANCHOR100
	.word	.LANCHOR101
	.word	df_read_page_end
	.word	hynix20nm_read_page_end
	.word	.LC472
	.word	.LC473
	.size	hynix20nm_special_init, .-hynix20nm_special_init
	.section	.text.hynix16nm_write_page_FF,"ax",%progbits
	.align	1
	.global	hynix16nm_write_page_FF
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_write_page_FF, %function
hynix16nm_write_page_FF:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2815
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r10, r0
	sub	sp, sp, #24
	mov	r6, r1
	ldr	r1, [r0]
	ldr	r0, [r3]
	bl	nci_get_from_nsi
	ldr	r4, [r0, #260]
	mov	r5, r0
	ldr	r2, [r0, #20]
	ldr	r1, [r10, #4]
	ldr	r3, [r4, #12]
	add	r7, r4, #32
	ldr	ip, [r0, #24]
	cmp	r2, r3
	bcs	.L2797
	cmp	r1, ip
	bcc	.L2798
.L2797:
	strd	r1, ip, [sp]
	ldr	r1, [r4, #8]
	mvn	r4, #107
	ldr	r0, .L2815+4
	bl	NAND_Print
.L2796:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2798:
	bl	nand_read_chip_status_ready
	mov	r0, r5
	bl	nand_enable_chip
	ldr	r0, [r5, #260]
	bl	ndfc_disable_randomize
	ldr	r0, [r5, #260]
	bl	ndfc_disable_ecc
	mov	r0, r7
	bl	ndfc_clean_cmd_seq
	cmp	r6, #8
	beq	.L2807
	cmp	r6, #16
	beq	.L2808
	movs	r3, #0
	str	r3, [sp, #12]
.L2812:
	str	r3, [sp, #8]
	add	r3, r4, #56
	str	r3, [sp, #16]
	mov	r8, #0
	ldr	r3, [sp, #8]
	mov	r6, r8
	subs	r3, r3, #1
	str	r3, [sp, #20]
.L2801:
	ldr	r3, [sp, #8]
	lsl	fp, r6, #10
	cmp	r6, r3
	bne	.L2805
	movs	r3, #0
	movs	r1, #16
	str	r3, [r4, #32]
	movs	r3, #1
	strd	r3, r1, [r4, #40]
	mov	r1, r7
	str	r3, [r4, #48]
	str	r3, [r4, #116]
	ldr	r0, [r5, #260]
	bl	ndfc_execute_cmd
	mov	r0, r5
	bl	nand_read_chip_status_ready
	mov	r4, r0
	cbz	r0, .L2806
	ldr	r0, .L2815+8
	bl	NAND_Print
.L2806:
	mov	r0, r5
	bl	nand_disable_chip
	b	.L2796
.L2807:
	mov	r3, #832
	str	r3, [sp, #12]
	movs	r3, #9
	b	.L2812
.L2808:
	mov	r3, #640
	str	r3, [sp, #12]
	movs	r3, #18
	b	.L2812
.L2805:
	ldr	r1, [r10, #16]
	cbnz	r6, .L2802
	movs	r3, #1
	movs	r0, #128
	mov	r2, #1024
	strd	r3, r0, [r4, #40]
	str	r3, [r4, #48]
	str	r3, [r4, #88]
	strd	r3, r3, [r4, #80]
	str	r1, [r4, #100]
	str	r2, [r4, #92]
	str	r3, [r4, #76]
	ldrd	r1, r2, [r10, #4]
	str	r6, [r4, #32]
	ldr	r0, [r5, #36]
	bl	get_row_addr
	movs	r3, #5
	mov	r8, r0
	str	r3, [r4, #72]
	mov	r2, r0
	ldr	r3, [sp, #16]
	movs	r1, #2
	str	r3, [sp]
	movs	r3, #3
.L2813:
	mov	r0, fp
	adds	r6, r6, #1
	bl	fill_cmd_addr
	mov	r1, r7
	ldr	r0, [r5, #260]
	bl	ndfc_execute_cmd
	b	.L2801
.L2802:
	ldr	r3, [sp, #20]
	add	r1, r1, fp
	movs	r2, #133
	str	r1, [r4, #100]
	str	r2, [r4, #44]
	movs	r2, #1
	cmp	r3, r6
	str	r2, [r4, #40]
	ite	eq
	ldreq	r1, [sp, #12]
	movne	r1, #1024
	str	r2, [r4, #48]
	movs	r3, #0
	str	r2, [r4, #88]
	strd	r2, r2, [r4, #80]
	str	r2, [r4, #76]
	ldr	r2, [sp, #16]
	str	r1, [r4, #92]
	movs	r1, #2
	str	r3, [r4, #32]
	str	r1, [r4, #72]
	str	r2, [sp]
	mov	r2, r8
	b	.L2813
.L2816:
	.align	2
.L2815:
	.word	g_nsi
	.word	.LC433
	.word	.LC474
	.size	hynix16nm_write_page_FF, .-hynix16nm_write_page_FF
	.section	.text.hynix16nm_vender_get_param,"ax",%progbits
	.align	1
	.global	hynix16nm_vender_get_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_vender_get_param, %function
hynix16nm_vender_get_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	hynix26nm_vender_get_param
	.size	hynix16nm_vender_get_param, .-hynix16nm_vender_get_param
	.section	.text.hynix16nm_major_check_byte,"ax",%progbits
	.align	1
	.global	hynix16nm_major_check_byte
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_major_check_byte, %function
hynix16nm_major_check_byte:
	@ args = 8, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r10, r0
	ldr	r8, [sp, #44]
	mov	r5, r2
	mov	fp, r3
	str	r1, [sp, #4]
	cmp	r2, r8, lsr #1
	bcs	.L2837
	mov	r2, r8
	mov	r1, r5
	ldr	r0, .L2840
	bl	NAND_Print
	mvn	r0, #106
	movs	r3, #255
	strb	r3, [r10]
.L2818:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2823:
	ldrb	lr, [r0], #1	@ zero_extendqisi2
	tst	lr, r1
	ite	ne
	addne	r2, r2, #1
	addeq	r3, r3, #1
.L2834:
	cmp	ip, r0
	bne	.L2823
	cmp	r5, r2
	bcs	.L2824
.L2839:
	orrs	r7, r7, r1
	uxtb	r7, r7
.L2825:
	adds	r6, r6, #1
.L2832:
	adds	r4, r4, #1
	cmp	r4, #8
	bne	.L2819
	cmp	r6, #8
	iteet	ne
	movne	r3, #255
	strbeq	r7, [r10]
	moveq	r0, #0
	strbne	r3, [r10]
	it	ne
	mvnne	r0, #79
	b	.L2818
.L2830:
	ldrb	lr, [r0], #1	@ zero_extendqisi2
	tst	lr, r1
	ite	ne
	addne	r3, r3, #1
	addeq	r2, r2, #1
	b	.L2827
.L2837:
	movs	r6, #0
	mov	r7, r6
	mov	r4, r6
.L2819:
	movs	r1, #1
	movs	r3, #0
	lsls	r1, r1, r4
	mov	r0, fp
	add	ip, r8, fp
	mov	r2, r3
	b	.L2834
.L2824:
	cmp	r5, r3
	bcc	.L2825
	ldr	r0, [sp, #4]
	cmp	r0, #1
	bne	.L2826
	ldr	r0, [sp, #40]
	movs	r3, #0
	mov	r2, r3
	add	ip, r8, r0
.L2827:
	cmp	r0, ip
	bne	.L2830
	cmp	r5, r2
	bcc	.L2839
	cmp	r5, r3
	bcc	.L2825
.L2826:
	mov	r1, r4
	ldr	r0, .L2840+4
	bl	NAND_Print
	mov	r1, r4
	ldr	r0, .L2840+8
	bl	NAND_Print
	b	.L2832
.L2841:
	.align	2
.L2840:
	.word	.LC475
	.word	.LC476
	.word	.LC477
	.size	hynix16nm_major_check_byte, .-hynix16nm_major_check_byte
	.section	.text.hynix16nm_get_read_retry_cfg,"ax",%progbits
	.align	1
	.global	hynix16nm_get_read_retry_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_get_read_retry_cfg, %function
hynix16nm_get_read_retry_cfg:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	sub	sp, sp, #72
	add	r4, sp, #8
	mov	fp, r0
	mov	r5, r1
	mov	r8, r2
	movs	r1, #0
	movs	r2, #32
	mov	r0, r4
	add	r7, sp, #40
	mov	r10, r3
	bl	memset
	movs	r2, #32
	movs	r1, #0
	mov	r0, r7
	bl	memset
	movs	r3, #0
.L2843:
	ldrb	r2, [r10, r3]	@ zero_extendqisi2
	strb	r2, [r4, r3]
	adds	r3, r3, #1
	cmp	r3, #8
	bne	.L2843
	strd	r7, r3, [sp]
	movs	r2, #4
	mov	r3, r4
	movs	r1, #0
	mov	r0, fp
	bl	hynix16nm_major_check_byte
	subs	r6, r0, #0
	bge	.L2844
	ldr	r0, .L2865
.L2864:
	bl	NAND_Print
.L2842:
	mov	r0, r6
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2844:
	ldrb	r1, [fp]	@ zero_extendqisi2
	ldr	r0, .L2865+4
	bl	NAND_Print_DBG
	add	r2, r10, #7
	movs	r3, #0
.L2846:
	ldrb	r1, [r2, #1]!	@ zero_extendqisi2
	strb	r1, [r4, r3]
	adds	r3, r3, #1
	cmp	r3, #8
	bne	.L2846
	strd	r7, r3, [sp]
	movs	r2, #4
	mov	r3, r4
	movs	r1, #0
	mov	r0, r5
	bl	hynix16nm_major_check_byte
	subs	r6, r0, #0
	bge	.L2847
	ldr	r0, .L2865+8
	b	.L2864
.L2847:
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r0, .L2865+12
	bl	NAND_Print_DBG
	ldrb	r1, [fp]	@ zero_extendqisi2
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r1, #8
	bne	.L2848
	cmp	r2, #4
	beq	.L2855
.L2848:
	ldr	r0, .L2865+16
	mvn	r6, #80
	bl	NAND_Print
	b	.L2842
.L2851:
	adds	r5, r5, #1
	cmp	r5, #32
	bne	.L2849
	movs	r6, #0
	b	.L2852
.L2855:
	movs	r5, #0
.L2849:
	add	r2, r10, r5
	movs	r3, #0
.L2850:
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	adds	r2, r2, #64
	strb	r1, [r4, r3]
	ldrb	r1, [r2, #-16]	@ zero_extendqisi2
	strb	r1, [r7, r3]
	adds	r3, r3, #1
	cmp	r3, #8
	bne	.L2850
	strd	r7, r3, [sp]
	movs	r2, #4
	mov	r3, r4
	movs	r1, #1
	add	r0, r8, r5
	bl	hynix16nm_major_check_byte
	subs	r6, r0, #0
	bge	.L2851
	mov	r1, r5
	ldr	r0, .L2865+20
	bl	NAND_Print
.L2852:
	ldr	r7, .L2865+24
	movs	r4, #0
	ldr	r5, .L2865+28
.L2854:
	lsls	r3, r4, #29
	bne	.L2853
	cbz	r4, .L2853
	mov	r0, r7
	bl	NAND_Print_DBG
.L2853:
	ldrb	r1, [r8, r4]	@ zero_extendqisi2
	mov	r0, r5
	adds	r4, r4, #1
	bl	NAND_Print_DBG
	cmp	r4, #32
	bne	.L2854
	ldr	r0, .L2865+24
	bl	NAND_Print_DBG
	b	.L2842
.L2866:
	.align	2
.L2865:
	.word	.LC478
	.word	.LC479
	.word	.LC480
	.word	.LC481
	.word	.LC482
	.word	.LC483
	.word	.LC7
	.word	.LC15
	.size	hynix16nm_get_read_retry_cfg, .-hynix16nm_get_read_retry_cfg
	.section	.text.hynix16nm_read_otp_info_hynix,"ax",%progbits
	.align	1
	.global	hynix16nm_read_otp_info_hynix
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_read_otp_info_hynix, %function
hynix16nm_read_otp_info_hynix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	mov	r4, r0
	sub	sp, sp, #32
	mov	r8, r1
	bl	nand_enable_chip
	ldr	r0, [r4, #260]
	bl	ndfc_disable_randomize
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #260]
	ldr	r0, .L2872
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #1148]
	ldr	r1, [r3, #1116]
	bl	NAND_Print_DBG
	cmp	r8, #0
	bne	.L2868
	mov	r0, r4
	bl	nand_disable_chip
	ldr	r0, .L2872+4
	bl	NAND_Print
	mvn	r0, #78
.L2867:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, fp, pc}
.L2868:
	movs	r2, #1
	movs	r1, #255
	mov	r0, r4
	movs	r6, #1
	bl	set_one_cmd
	add	r7, sp, #20
	movs	r3, #82
	movs	r5, #56
	mov	fp, #54
	strb	r3, [sp, #20]
	movs	r2, #0
	add	r3, sp, #24
	add	r1, sp, #16
	strd	r6, r6, [sp, #4]
	mov	r0, r4
	str	r7, [sp]
	mov	r10, #48
	strb	r5, [sp, #24]
	strb	fp, [sp, #16]
	bl	set_cmd_with_nand_bus
	movs	r2, #0
	movs	r1, #22
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #23
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #4
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	movs	r1, #25
	mov	r0, r4
	bl	set_one_cmd
	movs	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	set_one_cmd
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #2
	mov	r0, r4
	bl	set_one_addr
	movs	r1, #0
	mov	r0, r4
	bl	set_one_addr
	mov	r3, #528
	movs	r2, #0
	str	r3, [sp]
	add	r1, sp, #16
	mov	r3, r8
	mov	r0, r4
	strb	r10, [sp, #16]
	bl	get_data_with_nand_bus_one_cmd
	mov	r2, r6
	movs	r1, #255
	mov	r0, r4
	bl	set_one_cmd
	strb	r5, [sp, #24]
	movs	r5, #0
	add	r3, sp, #24
	mov	r2, r5
	add	r1, sp, #16
	strd	r6, r6, [sp, #4]
	str	r7, [sp]
	mov	r0, r4
	strb	fp, [sp, #16]
	strb	r5, [sp, #20]
	bl	set_cmd_with_nand_bus
	mov	r2, r5
	movs	r1, #22
	mov	r0, r4
	bl	set_one_cmd
	mov	r2, r5
	mov	r1, r5
	mov	r0, r4
	bl	set_one_cmd
	mov	r1, r5
	mov	r0, r4
	bl	set_one_addr
	mov	r1, r5
	mov	r0, r4
	bl	set_one_addr
	mov	r1, r5
	mov	r0, r4
	bl	set_one_addr
	mov	r1, r5
	mov	r0, r4
	bl	set_one_addr
	mov	r1, r5
	mov	r0, r4
	bl	set_one_addr
	mov	r2, r6
	mov	r1, r10
	mov	r0, r4
	bl	set_one_cmd
	ldrb	r1, [r8]	@ zero_extendqisi2
	ldrb	r2, [r8, #1]	@ zero_extendqisi2
	cmp	r1, #8
	bne	.L2870
	cmp	r2, #8
	beq	.L2871
.L2870:
	ldr	r0, .L2872+8
	bl	NAND_Print
	mov	r0, r4
	bl	nand_disable_chip
	mvn	r0, #95
	b	.L2867
.L2871:
	mov	r0, r4
	bl	nand_disable_chip
	mov	r0, r5
	b	.L2867
.L2873:
	.align	2
.L2872:
	.word	.LC484
	.word	.LC485
	.word	.LC452
	.size	hynix16nm_read_otp_info_hynix, .-hynix16nm_read_otp_info_hynix
	.section	.text.hynix16nm_get_rr_value_otp_hynix,"ax",%progbits
	.align	1
	.global	hynix16nm_get_rr_value_otp_hynix
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_get_rr_value_otp_hynix, %function
hynix16nm_get_rr_value_otp_hynix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #528
	bl	nand_get_temp_buf
	mov	r5, r0
	cbnz	r0, .L2875
	mvn	r6, #77
	ldr	r0, .L2879
	bl	NAND_Print
.L2874:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L2875:
	mov	r1, r0
	mov	r0, r4
	bl	hynix16nm_read_otp_info_hynix
	cmp	r0, #0
	bge	.L2877
	ldr	r3, [r4, #260]
	ldr	r2, [r4, #20]
	ldr	r0, .L2879+4
	ldr	r1, [r3, #8]
	bl	NAND_Print
.L2877:
	mov	r3, r5
	add	r2, r4, #48
	add	r1, sp, #7
	add	r0, sp, #6
	bl	hynix16nm_get_read_retry_cfg
	subs	r6, r0, #0
	bge	.L2878
	ldr	r3, [r4, #260]
	ldr	r2, [r4, #20]
	ldr	r0, .L2879+8
	ldr	r1, [r3, #8]
	bl	NAND_Print
.L2878:
	mov	r1, #528
	mov	r0, r5
	bl	nand_free_temp_buf
	b	.L2874
.L2880:
	.align	2
.L2879:
	.word	.LC486
	.word	.LC487
	.word	.LC488
	.size	hynix16nm_get_rr_value_otp_hynix, .-hynix16nm_get_rr_value_otp_hynix
	.section	.text.hynix16nm_save_otp_value,"ax",%progbits
	.align	1
	.global	hynix16nm_save_otp_value
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_save_otp_value, %function
hynix16nm_save_otp_value:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r3, r1, #1
	adds	r0, r0, #48
	adds	r1, r1, #31
.L2882:
	ldrb	r2, [r3, #1]!	@ zero_extendqisi2
	cmp	r3, r1
	strb	r2, [r0], #1
	bne	.L2882
	bx	lr
	.size	hynix16nm_save_otp_value, .-hynix16nm_save_otp_value
	.section	.text.hynix16nm_get_otp_param,"ax",%progbits
	.align	1
	.global	hynix16nm_get_otp_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_get_otp_param, %function
hynix16nm_get_otp_param:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r7, .L2891
	mov	r5, r1
	movs	r6, #0
.L2885:
	mov	r1, r6
	mov	r0, r7
	bl	NAND_Print_DBG
	mov	r0, r4
	adds	r6, r6, #1
	bl	hynix16nm_get_rr_value_otp_hynix
	cmp	r0, #0
	bne	.L2885
	mov	r0, r4
	mov	r1, r5
	adds	r4, r4, #32
.L2886:
	mov	r2, r1
	movs	r3, #0
.L2887:
	adds	r5, r0, r3
	adds	r3, r3, #1
	ldrb	r5, [r5, #48]	@ zero_extendqisi2
	cmp	r3, #4
	strb	r5, [r2], #1
	bne	.L2887
	adds	r0, r0, #4
	adds	r1, r1, #4
	cmp	r0, r4
	bne	.L2886
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L2892:
	.align	2
.L2891:
	.word	.LC455
	.size	hynix16nm_get_otp_param, .-hynix16nm_get_otp_param
	.section	.text.hynix16nm_set_default_param,"ax",%progbits
	.align	1
	.global	hynix16nm_set_default_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_set_default_param, %function
hynix16nm_set_default_param:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	add	r1, r0, #48
	ldr	r5, .L2898
	movs	r2, #0
	ldrb	r3, [r5]	@ zero_extendqisi2
.L2894:
	cmp	r3, r2
	bhi	.L2895
	ldr	r7, .L2898+4
	mov	r1, sp
	ldr	r2, .L2898+8
	movs	r4, #0
	bl	hynix26nm_vender_set_param
	mov	r6, r0
	ldr	r0, .L2898+12
	bl	NAND_Print_DBG
.L2896:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, r4
	bhi	.L2897
	ldr	r0, .L2898+16
	bl	NAND_Print_DBG
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L2895:
	ldrb	r4, [r1], #1	@ zero_extendqisi2
	strb	r4, [sp, r2]
	adds	r2, r2, #1
	b	.L2894
.L2897:
	ldrb	r1, [sp, r4]	@ zero_extendqisi2
	mov	r0, r7
	bl	NAND_Print_DBG
	adds	r4, r4, #1
	b	.L2896
.L2899:
	.align	2
.L2898:
	.word	.LANCHOR109
	.word	.LC440
	.word	.LANCHOR110
	.word	.LC439
	.word	.LC7
	.size	hynix16nm_set_default_param, .-hynix16nm_set_default_param
	.section	.text.hynix16nm_init_readretry_param,"ax",%progbits
	.align	1
	.global	hynix16nm_init_readretry_param
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_init_readretry_param, %function
hynix16nm_init_readretry_param:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	push	{r4, r5, r6, r7, r8, r10, lr}
	mov	r4, r0
	sub	sp, sp, #68
	ldr	r0, [r3, #16]
	lsls	r0, r0, #9
	bl	nand_get_temp_buf
	mov	r6, r0
	cmp	r0, #0
	beq	.L2907
	mov	r0, #32768
	bl	nand_get_temp_buf
	mov	r7, r0
	cbnz	r0, .L2902
	ldr	r3, [r4, #264]
	mov	r0, r6
	ldr	r1, [r3, #16]
	lsls	r1, r1, #9
	bl	nand_free_temp_buf
	ldr	r0, .L2909
	bl	NAND_Print
	mvn	r0, #75
.L2900:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r10, pc}
.L2902:
	ldr	r3, [r4, #16]
	movs	r2, #32
	mov	r1, r6
	bl	hynix16nm_get_special_info
	ldr	r3, [r4, #260]
	mov	r5, r0
	cbnz	r0, .L2903
	ldr	r8, .L2909+16
	mov	r2, r0
	ldr	r10, .L2909+20
	ldr	r1, [r3, #8]
	ldr	r0, .L2909+4
	bl	NAND_Print_DBG
.L2905:
	ldrb	r1, [r6, r5]	@ zero_extendqisi2
	mov	r0, r8
	bl	NAND_Print_DBG
	and	r3, r5, #7
	cmp	r3, #7
	bne	.L2904
	mov	r0, r10
	bl	NAND_Print_DBG
.L2904:
	adds	r5, r5, #1
	cmp	r5, #32
	bne	.L2905
	mov	r0, r4
	mov	r1, r6
	bl	hynix16nm_save_otp_value
	mov	r0, r4
	bl	hynix16nm_set_default_param
.L2906:
	mov	r1, #32768
	mov	r0, r7
	bl	nand_free_temp_buf
	ldr	r3, [r4, #264]
	mov	r0, r6
	ldr	r1, [r3, #16]
	lsls	r1, r1, #9
	bl	nand_free_temp_buf
	movs	r0, #0
	b	.L2900
.L2903:
	ldr	r1, [r3, #8]
	ldr	r0, .L2909+8
	bl	NAND_Print_DBG
	mov	r1, sp
	mov	r0, r4
	bl	hynix16nm_get_otp_param
	mov	r0, r4
	bl	hynix16nm_set_default_param
	ldr	r3, [r4, #260]
	movs	r2, #0
	ldr	r0, .L2909+12
	ldr	r1, [r3, #8]
	bl	NAND_Print_DBG
	b	.L2906
.L2907:
	mvn	r0, #76
	b	.L2900
.L2910:
	.align	2
.L2909:
	.word	.LC467
	.word	.LC489
	.word	.LC470
	.word	.LC490
	.word	.LC469
	.word	.LC7
	.size	hynix16nm_init_readretry_param, .-hynix16nm_init_readretry_param
	.section	.text.hynix16nm_readretry_init,"ax",%progbits
	.align	1
	.global	hynix16nm_readretry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_readretry_init, %function
hynix16nm_readretry_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #264]
	ldr	r2, .L2916
	push	{r4, lr}
	ldr	r3, [r3, #52]
	ubfx	r1, r3, #16, #8
	strb	r1, [r2]
	lsrs	r4, r3, #8
	ldr	r2, .L2916+4
	cmp	r1, #4
	strb	r4, [r2]
	ldr	r2, .L2916+8
	strb	r3, [r2]
	bne	.L2912
	ldr	r3, .L2916+12
	movs	r2, #56
	add	r1, r0, #176
	strb	r2, [r3]
	movs	r2, #57
	strb	r2, [r3, #1]
	movs	r2, #58
	strb	r2, [r3, #2]
	movs	r2, #59
	strb	r2, [r3, #3]
	add	r2, r0, #48
	movs	r3, #0
	str	r3, [r0, #176]
.L2913:
	strb	r3, [r2], #1
	cmp	r2, r1
	bne	.L2913
	bl	hynix16nm_init_readretry_param
	movs	r0, #0
.L2911:
	pop	{r4, pc}
.L2912:
	ldr	r0, .L2916+16
	bl	NAND_Print
	mvn	r0, #74
	b	.L2911
.L2917:
	.align	2
.L2916:
	.word	.LANCHOR111
	.word	.LANCHOR108
	.word	.LANCHOR109
	.word	.LANCHOR110
	.word	.LC442
	.size	hynix16nm_readretry_init, .-hynix16nm_readretry_init
	.section	.text.hynix16nm_readretry_exit,"ax",%progbits
	.align	1
	.global	hynix16nm_readretry_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_readretry_exit, %function
hynix16nm_readretry_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r0, .L2919
	bl	NAND_Print_DBG
	mov	r0, r4
	bl	hynix16nm_set_default_param
	movs	r0, #0
	str	r0, [r4, #176]
	pop	{r4, pc}
.L2920:
	.align	2
.L2919:
	.word	.LC491
	.size	hynix16nm_readretry_exit, .-hynix16nm_readretry_exit
	.section	.text.hynix16nm_special_init,"ax",%progbits
	.align	1
	.global	hynix16nm_special_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_special_init, %function
hynix16nm_special_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r4, #0
	ldr	r3, .L2926
	ldr	r3, [r3]
	ldr	r5, [r3, #8]
.L2922:
	cbnz	r5, .L2923
	ldr	r3, .L2926+4
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L2926+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L2926+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbnz	r4, .L2924
	ldr	r0, .L2926+16
	ldr	r5, .L2926+20
	str	r5, [r0]
	ldr	r0, .L2926+24
	bl	NAND_Print_DBG
.L2921:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L2923:
	mov	r0, r5
	bl	hynix16nm_readretry_init
	ldr	r5, [r5]
	orrs	r4, r4, r0
	b	.L2922
.L2924:
	ldr	r0, .L2926+28
	bl	NAND_Print
	b	.L2921
.L2927:
	.align	2
.L2926:
	.word	g_nsi
	.word	.LANCHOR111
	.word	.LANCHOR108
	.word	.LANCHOR109
	.word	df_read_page_end
	.word	hynix16nm_read_page_end
	.word	.LC492
	.word	.LC493
	.size	hynix16nm_special_init, .-hynix16nm_special_init
	.section	.text.hynix16nm_special_exit,"ax",%progbits
	.align	1
	.global	hynix16nm_special_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hynix16nm_special_exit, %function
hynix16nm_special_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2931
	push	{r4, lr}
	ldr	r3, [r3]
	ldr	r4, [r3, #8]
.L2929:
	cbnz	r4, .L2930
	ldr	r0, .L2931+4
	bl	NAND_Print_DBG
	mov	r0, r4
	pop	{r4, pc}
.L2930:
	mov	r0, r4
	bl	hynix16nm_readretry_exit
	ldr	r4, [r4]
	b	.L2929
.L2932:
	.align	2
.L2931:
	.word	g_nsi
	.word	.LC494
	.size	hynix16nm_special_exit, .-hynix16nm_special_exit
	.global	hynix16nm_read_retry_reg_adr
	.global	hynix16nm_read_retry_reg_num
	.global	hynix16nm_read_retry_cycle
	.global	hynix16nm_read_retry_mode
	.global	hynix20nm_lsb_mode_reg_num
	.global	hynix20nm_lsb_mode_val
	.global	hynix20nm_lsb_mode_default_val
	.global	hynix20nm_lsb_mode_reg_adr
	.global	hynix20nm_read_retry_reg_adr_2
	.global	hynix20nm_read_retry_reg_adr_1
	.global	hynix20nm_read_retry_reg_adr
	.global	hynix20nm_read_retry_reg_num
	.global	hynix20nm_read_retry_cycle
	.global	hynix20nm_read_retry_mode
	.global	para1
	.global	para0
	.global	hynix26nm_lsb_mode_reg_num
	.global	hynix26nm_lsb_mode_val
	.global	hynix26nm_lsb_mode_default_val
	.global	hynix26nm_lsb_mode_reg_adr
	.global	hynix26nm_read_retry_val
	.global	hynix26nm_read_retry_reg_adr
	.global	hynix26nm_read_retry_reg_num
	.global	hynix26nm_read_retry_cycle
	.global	hynix26nm_read_retry_mode
	.global	sandisk_A19_1z_8g
	.global	sandisk_A19_1z_16g
	.global	sandisk_A19_1y
	.global	sandisk_A19_read_retry_reg_adr_1y
	.global	sandisk_A19_read_retry_cmd_1y
	.global	sandisk_A19_read_retry_exit_cmd_1y
	.global	sandisk_A19_read_retry_enable_cmd_1y
	.global	sandisk_A19_read_retry_reg_cnt
	.global	sandisk_A19_read_retry_cycle
	.global	sandisk_A19_read_retry_mode
	.global	sandisk_1y
	.global	sandisk_read_retry_reg_adr_1y
	.global	sandisk_read_retry_cmd_1y
	.global	sandisk_read_retry_exit_cmd_1y
	.global	sandisk_read_retry_enable_cmd_1y
	.global	sandisk_24
	.global	sandisk_read_retry_reg_adr_24
	.global	sandisk_read_retry_cmd_24
	.global	sandisk_19_high
	.global	sandisk_19_low
	.global	sandisk_read_retry_reg_adr_19
	.global	sandisk_read_retry_cmd_19
	.global	sandisk_read_retry_disable_cmd_19
	.global	sandisk_read_retry_enable_cmd_19
	.global	sandisk_acti_start_addr
	.global	sandisk_acti_start_cmd
	.global	sandisk_read_retry_reg_cnt
	.global	sandisk_read_retry_cycle
	.global	sandisk_read_retry_mode
	.global	samsung_p1
	.global	samsung_read_retry_cmd
	.global	samsung_read_retry_addr
	.global	samsung_read_retry_cycle
	.global	samsung_read_retry_mode
	.global	micron_p1_4
	.global	micron_p1_3
	.global	micron_p1_2
	.global	micron_p1_1
	.global	micron_read_retry_cycle
	.global	micron_read_retry_mode
	.global	toshiba_read_retry_exit_cmd
	.global	toshiba_read_retry_last_cmd
	.global	toshiba_p1_3
	.global	toshiba_p1_2
	.global	toshiba_read_retry_addr_2
	.global	toshiba_read_retry_cmd_2
	.global	toshiba_p1_1
	.global	toshiba_read_retry_addr_1
	.global	toshiba_read_retry_cmd_1
	.global	toshiba_read_retry_end_cmd
	.global	toshiba_read_retry_start_cmd
	.global	toshiba_read_retry_reg_cnt
	.global	toshiba_read_retry_cycle
	.global	toshiba_read_retry_mode
	.global	phyinfo
	.global	nftl_blk_head
	.global	mod
	.global	com
	.section	.rodata
	.set	.LANCHOR15,. + 0
.LC2:
	.byte	44
	.byte	100
	.byte	68
	.byte	50
	.byte	-91
	.byte	-1
	.byte	-1
	.byte	-1
.LC3:
	.byte	44
	.byte	-124
	.byte	68
	.byte	50
	.byte	-86
	.byte	4
	.byte	0
	.byte	0
.LC1:
	.byte	115
	.byte	117
	.byte	110
	.byte	120
	.byte	105
.LC0:
	.byte	97
	.byte	108
	.byte	108
	.byte	119
	.byte	105
	.byte	110
	.byte	110
	.byte	101
	.byte	114
.LC4:
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.byte	83
	.section	.bss.hynix16nm_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR108,. + 0
	.type	hynix16nm_read_retry_cycle, %object
	.size	hynix16nm_read_retry_cycle, 1
hynix16nm_read_retry_cycle:
	.space	1
	.section	.bss.hynix16nm_read_retry_mode,"aw",%nobits
	.set	.LANCHOR111,. + 0
	.type	hynix16nm_read_retry_mode, %object
	.size	hynix16nm_read_retry_mode, 1
hynix16nm_read_retry_mode:
	.space	1
	.section	.bss.hynix16nm_read_retry_reg_adr,"aw",%nobits
	.set	.LANCHOR110,. + 0
	.type	hynix16nm_read_retry_reg_adr, %object
	.size	hynix16nm_read_retry_reg_adr, 4
hynix16nm_read_retry_reg_adr:
	.space	4
	.section	.bss.hynix16nm_read_retry_reg_num,"aw",%nobits
	.set	.LANCHOR109,. + 0
	.type	hynix16nm_read_retry_reg_num, %object
	.size	hynix16nm_read_retry_reg_num, 1
hynix16nm_read_retry_reg_num:
	.space	1
	.section	.bss.hynix20nm_lsb_mode_default_val,"aw",%nobits
	.set	.LANCHOR107,. + 0
	.type	hynix20nm_lsb_mode_default_val, %object
	.size	hynix20nm_lsb_mode_default_val, 4
hynix20nm_lsb_mode_default_val:
	.space	4
	.section	.bss.hynix20nm_lsb_mode_reg_adr,"aw",%nobits
	.set	.LANCHOR105,. + 0
	.type	hynix20nm_lsb_mode_reg_adr, %object
	.size	hynix20nm_lsb_mode_reg_adr, 4
hynix20nm_lsb_mode_reg_adr:
	.space	4
	.section	.bss.hynix20nm_lsb_mode_reg_num,"aw",%nobits
	.set	.LANCHOR104,. + 0
	.type	hynix20nm_lsb_mode_reg_num, %object
	.size	hynix20nm_lsb_mode_reg_num, 1
hynix20nm_lsb_mode_reg_num:
	.space	1
	.section	.bss.hynix20nm_lsb_mode_val,"aw",%nobits
	.set	.LANCHOR106,. + 0
	.type	hynix20nm_lsb_mode_val, %object
	.size	hynix20nm_lsb_mode_val, 4
hynix20nm_lsb_mode_val:
	.space	4
	.section	.bss.hynix20nm_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR100,. + 0
	.type	hynix20nm_read_retry_cycle, %object
	.size	hynix20nm_read_retry_cycle, 1
hynix20nm_read_retry_cycle:
	.space	1
	.section	.bss.hynix20nm_read_retry_mode,"aw",%nobits
	.set	.LANCHOR103,. + 0
	.type	hynix20nm_read_retry_mode, %object
	.size	hynix20nm_read_retry_mode, 1
hynix20nm_read_retry_mode:
	.space	1
	.section	.bss.hynix20nm_read_retry_reg_adr,"aw",%nobits
	.set	.LANCHOR102,. + 0
	.type	hynix20nm_read_retry_reg_adr, %object
	.size	hynix20nm_read_retry_reg_adr, 8
hynix20nm_read_retry_reg_adr:
	.space	8
	.section	.bss.hynix20nm_read_retry_reg_num,"aw",%nobits
	.set	.LANCHOR101,. + 0
	.type	hynix20nm_read_retry_reg_num, %object
	.size	hynix20nm_read_retry_reg_num, 1
hynix20nm_read_retry_reg_num:
	.space	1
	.section	.bss.hynix26nm_lsb_mode_default_val,"aw",%nobits
	.set	.LANCHOR97,. + 0
	.type	hynix26nm_lsb_mode_default_val, %object
	.size	hynix26nm_lsb_mode_default_val, 5
hynix26nm_lsb_mode_default_val:
	.space	5
	.section	.bss.hynix26nm_lsb_mode_reg_adr,"aw",%nobits
	.set	.LANCHOR95,. + 0
	.type	hynix26nm_lsb_mode_reg_adr, %object
	.size	hynix26nm_lsb_mode_reg_adr, 5
hynix26nm_lsb_mode_reg_adr:
	.space	5
	.section	.bss.hynix26nm_lsb_mode_reg_num,"aw",%nobits
	.set	.LANCHOR94,. + 0
	.type	hynix26nm_lsb_mode_reg_num, %object
	.size	hynix26nm_lsb_mode_reg_num, 1
hynix26nm_lsb_mode_reg_num:
	.space	1
	.section	.bss.hynix26nm_lsb_mode_val,"aw",%nobits
	.set	.LANCHOR96,. + 0
	.type	hynix26nm_lsb_mode_val, %object
	.size	hynix26nm_lsb_mode_val, 5
hynix26nm_lsb_mode_val:
	.space	5
	.section	.bss.hynix26nm_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR89,. + 0
	.type	hynix26nm_read_retry_cycle, %object
	.size	hynix26nm_read_retry_cycle, 1
hynix26nm_read_retry_cycle:
	.space	1
	.section	.bss.hynix26nm_read_retry_mode,"aw",%nobits
	.set	.LANCHOR93,. + 0
	.type	hynix26nm_read_retry_mode, %object
	.size	hynix26nm_read_retry_mode, 1
hynix26nm_read_retry_mode:
	.space	1
	.section	.bss.hynix26nm_read_retry_reg_adr,"aw",%nobits
	.set	.LANCHOR92,. + 0
	.type	hynix26nm_read_retry_reg_adr, %object
	.size	hynix26nm_read_retry_reg_adr, 4
hynix26nm_read_retry_reg_adr:
	.space	4
	.section	.bss.hynix26nm_read_retry_reg_num,"aw",%nobits
	.set	.LANCHOR90,. + 0
	.type	hynix26nm_read_retry_reg_num, %object
	.size	hynix26nm_read_retry_reg_num, 1
hynix26nm_read_retry_reg_num:
	.space	1
	.section	.bss.hynix26nm_read_retry_val,"aw",%nobits
	.align	1
	.set	.LANCHOR91,. + 0
	.type	hynix26nm_read_retry_val, %object
	.size	hynix26nm_read_retry_val, 56
hynix26nm_read_retry_val:
	.space	56
	.section	.bss.micron_p1,"aw",%nobits
	.align	2
	.set	.LANCHOR49,. + 0
	.type	micron_p1, %object
	.size	micron_p1, 4
micron_p1:
	.space	4
	.section	.bss.micron_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR50,. + 0
	.type	micron_read_retry_cycle, %object
	.size	micron_read_retry_cycle, 1
micron_read_retry_cycle:
	.space	1
	.section	.bss.micron_read_retry_mode,"aw",%nobits
	.set	.LANCHOR48,. + 0
	.type	micron_read_retry_mode, %object
	.size	micron_read_retry_mode, 1
micron_read_retry_mode:
	.space	1
	.section	.bss.nand_on_panic,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	nand_on_panic, %object
	.size	nand_on_panic, 4
nand_on_panic:
	.space	4
	.section	.bss.nftl_blk_head,"aw",%nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	nftl_blk_head, %object
	.size	nftl_blk_head, 76
nftl_blk_head:
	.space	76
	.section	.bss.panic_enable,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	panic_enable, %object
	.size	panic_enable, 4
panic_enable:
	.space	4
	.section	.bss.panic_info,"aw",%nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	panic_info, %object
	.size	panic_info, 24
panic_info:
	.space	24
	.section	.bss.panic_part,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	panic_part, %object
	.size	panic_part, 12
panic_part:
	.space	12
	.section	.bss.phyinfo,"aw",%nobits
	.align	2
	.set	.LANCHOR23,. + 0
	.type	phyinfo, %object
	.size	phyinfo, 20
phyinfo:
	.space	20
	.section	.bss.samsung_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR58,. + 0
	.type	samsung_read_retry_cycle, %object
	.size	samsung_read_retry_cycle, 1
samsung_read_retry_cycle:
	.space	1
	.section	.bss.samsung_read_retry_mode,"aw",%nobits
	.set	.LANCHOR59,. + 0
	.type	samsung_read_retry_mode, %object
	.size	samsung_read_retry_mode, 1
samsung_read_retry_mode:
	.space	1
	.section	.bss.sandisk_A19_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR79,. + 0
	.type	sandisk_A19_read_retry_cycle, %object
	.size	sandisk_A19_read_retry_cycle, 1
sandisk_A19_read_retry_cycle:
	.space	1
	.section	.bss.sandisk_A19_read_retry_mode,"aw",%nobits
	.set	.LANCHOR78,. + 0
	.type	sandisk_A19_read_retry_mode, %object
	.size	sandisk_A19_read_retry_mode, 1
sandisk_A19_read_retry_mode:
	.space	1
	.section	.bss.sandisk_A19_read_retry_reg_cnt,"aw",%nobits
	.set	.LANCHOR80,. + 0
	.type	sandisk_A19_read_retry_reg_cnt, %object
	.size	sandisk_A19_read_retry_reg_cnt, 1
sandisk_A19_read_retry_reg_cnt:
	.space	1
	.section	.bss.sandisk_A19_sclk0_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR82,. + 0
	.type	sandisk_A19_sclk0_bak, %object
	.size	sandisk_A19_sclk0_bak, 4
sandisk_A19_sclk0_bak:
	.space	4
	.section	.bss.sandisk_A19_sclk1_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR81,. + 0
	.type	sandisk_A19_sclk1_bak, %object
	.size	sandisk_A19_sclk1_bak, 4
sandisk_A19_sclk1_bak:
	.space	4
	.section	.bss.sandisk_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR69,. + 0
	.type	sandisk_read_retry_cycle, %object
	.size	sandisk_read_retry_cycle, 1
sandisk_read_retry_cycle:
	.space	1
	.section	.bss.sandisk_read_retry_mode,"aw",%nobits
	.set	.LANCHOR62,. + 0
	.type	sandisk_read_retry_mode, %object
	.size	sandisk_read_retry_mode, 1
sandisk_read_retry_mode:
	.space	1
	.section	.bss.sandisk_read_retry_reg_cnt,"aw",%nobits
	.set	.LANCHOR77,. + 0
	.type	sandisk_read_retry_reg_cnt, %object
	.size	sandisk_read_retry_reg_cnt, 1
sandisk_read_retry_reg_cnt:
	.space	1
	.section	.bss.sandisk_sclk0_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR61,. + 0
	.type	sandisk_sclk0_bak, %object
	.size	sandisk_sclk0_bak, 4
sandisk_sclk0_bak:
	.space	4
	.section	.bss.sandisk_sclk1_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR60,. + 0
	.type	sandisk_sclk1_bak, %object
	.size	sandisk_sclk1_bak, 4
sandisk_sclk1_bak:
	.space	4
	.section	.bss.sandisk_toggle_mode_flag,"aw",%nobits
	.align	2
	.set	.LANCHOR66,. + 0
	.type	sandisk_toggle_mode_flag, %object
	.size	sandisk_toggle_mode_flag, 4
sandisk_toggle_mode_flag:
	.space	4
	.section	.bss.toshiba_read_retry_cycle,"aw",%nobits
	.set	.LANCHOR46,. + 0
	.type	toshiba_read_retry_cycle, %object
	.size	toshiba_read_retry_cycle, 1
toshiba_read_retry_cycle:
	.space	1
	.section	.bss.toshiba_read_retry_mode,"aw",%nobits
	.set	.LANCHOR32,. + 0
	.type	toshiba_read_retry_mode, %object
	.size	toshiba_read_retry_mode, 1
toshiba_read_retry_mode:
	.space	1
	.section	.bss.toshiba_read_retry_reg_cnt,"aw",%nobits
	.set	.LANCHOR47,. + 0
	.type	toshiba_read_retry_reg_cnt, %object
	.size	toshiba_read_retry_reg_cnt, 1
toshiba_read_retry_reg_cnt:
	.space	1
	.section	.bss.toshiba_retry_flag,"aw",%nobits
	.align	2
	.set	.LANCHOR34,. + 0
	.type	toshiba_retry_flag, %object
	.size	toshiba_retry_flag, 4
toshiba_retry_flag:
	.space	4
	.section	.bss.toshiba_sclk0_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR31,. + 0
	.type	toshiba_sclk0_bak, %object
	.size	toshiba_sclk0_bak, 4
toshiba_sclk0_bak:
	.space	4
	.section	.bss.toshiba_sclk1_bak,"aw",%nobits
	.align	2
	.set	.LANCHOR30,. + 0
	.type	toshiba_sclk1_bak, %object
	.size	toshiba_sclk1_bak, 4
toshiba_sclk1_bak:
	.space	4
	.section	.bss.toshiba_toggle_mode_flag,"aw",%nobits
	.align	2
	.set	.LANCHOR42,. + 0
	.type	toshiba_toggle_mode_flag, %object
	.size	toshiba_toggle_mode_flag, 4
toshiba_toggle_mode_flag:
	.space	4
	.section	.data.hynix20nm_read_retry_reg_adr_1,"aw",%progbits
	.type	hynix20nm_read_retry_reg_adr_1, %object
	.size	hynix20nm_read_retry_reg_adr_1, 8
hynix20nm_read_retry_reg_adr_1:
	.byte	-52
	.byte	-65
	.byte	-86
	.byte	-85
	.byte	-51
	.byte	-83
	.byte	-82
	.byte	-81
	.section	.data.hynix20nm_read_retry_reg_adr_2,"aw",%progbits
	.type	hynix20nm_read_retry_reg_adr_2, %object
	.size	hynix20nm_read_retry_reg_adr_2, 8
hynix20nm_read_retry_reg_adr_2:
	.byte	-80
	.byte	-79
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-75
	.byte	-74
	.byte	-73
	.section	.data.micron_p1_1,"aw",%progbits
	.set	.LANCHOR52,. + 0
	.type	micron_p1_1, %object
	.size	micron_p1_1, 10
micron_p1_1:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.section	.data.micron_p1_2,"aw",%progbits
	.set	.LANCHOR51,. + 0
	.type	micron_p1_2, %object
	.size	micron_p1_2, 12
micron_p1_2:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	12
	.section	.data.micron_p1_3,"aw",%progbits
	.set	.LANCHOR53,. + 0
	.type	micron_p1_3, %object
	.size	micron_p1_3, 7
micron_p1_3:
	.byte	1
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.section	.data.micron_p1_4,"aw",%progbits
	.set	.LANCHOR54,. + 0
	.type	micron_p1_4, %object
	.size	micron_p1_4, 18
micron_p1_4:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.section	.data.samsung_p1,"aw",%progbits
	.set	.LANCHOR57,. + 0
	.type	samsung_p1, %object
	.size	samsung_p1, 60
samsung_p1:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	5
	.byte	10
	.byte	0
	.byte	0
	.byte	40
	.byte	0
	.byte	-20
	.byte	-40
	.byte	-19
	.byte	-11
	.byte	-19
	.byte	-26
	.byte	10
	.byte	15
	.byte	5
	.byte	0
	.byte	15
	.byte	10
	.byte	-5
	.byte	-20
	.byte	-24
	.byte	-17
	.byte	-24
	.byte	-36
	.byte	-15
	.byte	-5
	.byte	-2
	.byte	-16
	.byte	10
	.byte	0
	.byte	-5
	.byte	-20
	.byte	-48
	.byte	-30
	.byte	-48
	.byte	-62
	.byte	20
	.byte	15
	.byte	-5
	.byte	-20
	.byte	-24
	.byte	-5
	.byte	-24
	.byte	-36
	.byte	30
	.byte	20
	.byte	-5
	.byte	-20
	.byte	-5
	.byte	-1
	.byte	-5
	.byte	-8
	.byte	7
	.byte	12
	.byte	2
	.byte	0
	.section	.data.samsung_read_retry_addr,"aw",%progbits
	.set	.LANCHOR56,. + 0
	.type	samsung_read_retry_addr, %object
	.size	samsung_read_retry_addr, 4
samsung_read_retry_addr:
	.byte	-89
	.byte	-92
	.byte	-91
	.byte	-90
	.section	.data.samsung_read_retry_cmd,"aw",%progbits
	.set	.LANCHOR55,. + 0
	.type	samsung_read_retry_cmd, %object
	.size	samsung_read_retry_cmd, 4
samsung_read_retry_cmd:
	.byte	-95
	.byte	-95
	.byte	-95
	.byte	-95
	.section	.data.sandisk_19_high,"aw",%progbits
	.set	.LANCHOR70,. + 0
	.type	sandisk_19_high, %object
	.size	sandisk_19_high, 60
sandisk_19_high:
	.byte	0
	.byte	-16
	.byte	0
	.byte	15
	.byte	-32
	.byte	0
	.byte	15
	.byte	-48
	.byte	0
	.byte	14
	.byte	-32
	.byte	0
	.byte	14
	.byte	-48
	.byte	0
	.byte	13
	.byte	-16
	.byte	0
	.byte	13
	.byte	-32
	.byte	0
	.byte	13
	.byte	-48
	.byte	0
	.byte	1
	.byte	16
	.byte	0
	.byte	2
	.byte	32
	.byte	0
	.byte	2
	.byte	16
	.byte	0
	.byte	3
	.byte	32
	.byte	0
	.byte	15
	.byte	0
	.byte	0
	.byte	14
	.byte	-16
	.byte	0
	.byte	13
	.byte	-64
	.byte	0
	.byte	15
	.byte	-16
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	13
	.byte	-80
	.byte	0
	.byte	12
	.byte	-96
	.byte	0
	.section	.data.sandisk_19_low,"aw",%progbits
	.set	.LANCHOR68,. + 0
	.type	sandisk_19_low, %object
	.size	sandisk_19_low, 48
sandisk_19_low:
	.byte	-16
	.byte	0
	.byte	-16
	.byte	-32
	.byte	0
	.byte	-32
	.byte	-48
	.byte	0
	.byte	-48
	.byte	16
	.byte	0
	.byte	16
	.byte	32
	.byte	0
	.byte	32
	.byte	48
	.byte	0
	.byte	48
	.byte	-64
	.byte	0
	.byte	-48
	.byte	0
	.byte	0
	.byte	16
	.byte	0
	.byte	0
	.byte	32
	.byte	16
	.byte	0
	.byte	32
	.byte	-80
	.byte	0
	.byte	-48
	.byte	-96
	.byte	0
	.byte	-48
	.byte	-112
	.byte	0
	.byte	-48
	.byte	-80
	.byte	0
	.byte	-64
	.byte	-96
	.byte	0
	.byte	-64
	.byte	-112
	.byte	0
	.byte	-64
	.section	.data.sandisk_1y,"aw",%progbits
	.set	.LANCHOR75,. + 0
	.type	sandisk_1y, %object
	.size	sandisk_1y, 76
sandisk_1y:
	.byte	4
	.byte	0
	.byte	124
	.byte	124
	.byte	8
	.byte	0
	.byte	4
	.byte	4
	.byte	124
	.byte	124
	.byte	0
	.byte	124
	.byte	124
	.byte	124
	.byte	0
	.byte	0
	.byte	12
	.byte	0
	.byte	120
	.byte	120
	.byte	16
	.byte	0
	.byte	8
	.byte	8
	.byte	124
	.byte	124
	.byte	120
	.byte	120
	.byte	124
	.byte	124
	.byte	4
	.byte	4
	.byte	124
	.byte	124
	.byte	120
	.byte	116
	.byte	20
	.byte	4
	.byte	4
	.byte	0
	.byte	120
	.byte	120
	.byte	0
	.byte	124
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	116
	.byte	120
	.byte	120
	.byte	4
	.byte	0
	.byte	120
	.byte	116
	.byte	120
	.byte	116
	.byte	120
	.byte	116
	.byte	116
	.byte	112
	.byte	120
	.byte	116
	.byte	120
	.byte	120
	.byte	120
	.byte	112
	.byte	120
	.byte	116
	.byte	120
	.byte	112
	.byte	112
	.byte	112
	.section	.data.sandisk_24,"aw",%progbits
	.set	.LANCHOR73,. + 0
	.type	sandisk_24, %object
	.size	sandisk_24, 27
sandisk_24:
	.byte	0
	.byte	-16
	.byte	0
	.byte	0
	.byte	-32
	.byte	0
	.byte	-1
	.byte	-16
	.byte	-16
	.byte	-18
	.byte	-32
	.byte	-32
	.byte	-34
	.byte	-48
	.byte	-48
	.byte	-51
	.byte	-64
	.byte	-64
	.byte	1
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.section	.data.sandisk_A19_1y,"aw",%progbits
	.set	.LANCHOR86,. + 0
	.type	sandisk_A19_1y, %object
	.size	sandisk_A19_1y, 124
sandisk_A19_1y:
	.byte	124
	.byte	0
	.byte	0
	.byte	124
	.byte	4
	.byte	0
	.byte	124
	.byte	120
	.byte	120
	.byte	0
	.byte	120
	.byte	116
	.byte	8
	.byte	124
	.byte	0
	.byte	124
	.byte	0
	.byte	124
	.byte	124
	.byte	120
	.byte	124
	.byte	124
	.byte	120
	.byte	116
	.byte	0
	.byte	124
	.byte	116
	.byte	112
	.byte	0
	.byte	120
	.byte	0
	.byte	124
	.byte	0
	.byte	120
	.byte	124
	.byte	120
	.byte	0
	.byte	120
	.byte	120
	.byte	116
	.byte	0
	.byte	120
	.byte	116
	.byte	112
	.byte	0
	.byte	120
	.byte	112
	.byte	108
	.byte	0
	.byte	4
	.byte	4
	.byte	0
	.byte	0
	.byte	4
	.byte	0
	.byte	124
	.byte	12
	.byte	4
	.byte	124
	.byte	120
	.byte	12
	.byte	4
	.byte	120
	.byte	116
	.byte	16
	.byte	8
	.byte	0
	.byte	124
	.byte	16
	.byte	8
	.byte	4
	.byte	0
	.byte	120
	.byte	116
	.byte	120
	.byte	116
	.byte	120
	.byte	116
	.byte	116
	.byte	112
	.byte	120
	.byte	116
	.byte	112
	.byte	108
	.byte	120
	.byte	116
	.byte	108
	.byte	104
	.byte	120
	.byte	112
	.byte	120
	.byte	116
	.byte	120
	.byte	112
	.byte	116
	.byte	112
	.byte	120
	.byte	112
	.byte	108
	.byte	104
	.byte	120
	.byte	112
	.byte	112
	.byte	108
	.byte	120
	.byte	108
	.byte	112
	.byte	108
	.byte	120
	.byte	108
	.byte	108
	.byte	104
	.byte	120
	.byte	108
	.byte	104
	.byte	100
	.byte	116
	.byte	104
	.byte	108
	.byte	104
	.byte	116
	.byte	104
	.byte	104
	.byte	100
	.section	.data.sandisk_A19_1z_16g,"aw",%progbits
	.set	.LANCHOR84,. + 0
	.type	sandisk_A19_1z_16g, %object
	.size	sandisk_A19_1z_16g, 128
sandisk_A19_1z_16g:
	.byte	124
	.byte	0
	.byte	4
	.byte	0
	.byte	4
	.byte	0
	.byte	0
	.byte	124
	.byte	120
	.byte	0
	.byte	8
	.byte	4
	.byte	8
	.byte	0
	.byte	124
	.byte	120
	.byte	124
	.byte	124
	.byte	4
	.byte	0
	.byte	0
	.byte	124
	.byte	0
	.byte	124
	.byte	120
	.byte	124
	.byte	8
	.byte	4
	.byte	4
	.byte	124
	.byte	116
	.byte	120
	.byte	4
	.byte	4
	.byte	4
	.byte	0
	.byte	8
	.byte	4
	.byte	0
	.byte	124
	.byte	0
	.byte	4
	.byte	8
	.byte	4
	.byte	12
	.byte	4
	.byte	124
	.byte	120
	.byte	124
	.byte	4
	.byte	12
	.byte	8
	.byte	120
	.byte	120
	.byte	4
	.byte	0
	.byte	124
	.byte	120
	.byte	0
	.byte	124
	.byte	116
	.byte	120
	.byte	112
	.byte	120
	.byte	8
	.byte	8
	.byte	4
	.byte	0
	.byte	4
	.byte	8
	.byte	8
	.byte	4
	.byte	12
	.byte	8
	.byte	12
	.byte	8
	.byte	0
	.byte	0
	.byte	12
	.byte	8
	.byte	4
	.byte	0
	.byte	120
	.byte	116
	.byte	124
	.byte	124
	.byte	120
	.byte	116
	.byte	120
	.byte	120
	.byte	120
	.byte	116
	.byte	8
	.byte	8
	.byte	0
	.byte	124
	.byte	116
	.byte	116
	.byte	0
	.byte	124
	.byte	120
	.byte	116
	.byte	124
	.byte	120
	.byte	112
	.byte	116
	.byte	116
	.byte	116
	.byte	124
	.byte	116
	.byte	112
	.byte	112
	.byte	12
	.byte	12
	.byte	8
	.byte	4
	.byte	16
	.byte	12
	.byte	12
	.byte	8
	.byte	112
	.byte	112
	.byte	112
	.byte	116
	.byte	116
	.byte	112
	.byte	112
	.byte	112
	.section	.data.sandisk_A19_1z_8g,"aw",%progbits
	.set	.LANCHOR85,. + 0
	.type	sandisk_A19_1z_8g, %object
	.size	sandisk_A19_1z_8g, 124
sandisk_A19_1z_8g:
	.byte	4
	.byte	4
	.byte	120
	.byte	120
	.byte	4
	.byte	4
	.byte	124
	.byte	116
	.byte	0
	.byte	0
	.byte	4
	.byte	120
	.byte	4
	.byte	4
	.byte	124
	.byte	124
	.byte	0
	.byte	0
	.byte	0
	.byte	124
	.byte	0
	.byte	0
	.byte	0
	.byte	116
	.byte	8
	.byte	8
	.byte	4
	.byte	120
	.byte	124
	.byte	124
	.byte	4
	.byte	120
	.byte	124
	.byte	124
	.byte	0
	.byte	124
	.byte	4
	.byte	4
	.byte	124
	.byte	112
	.byte	124
	.byte	124
	.byte	116
	.byte	116
	.byte	0
	.byte	0
	.byte	120
	.byte	112
	.byte	12
	.byte	12
	.byte	8
	.byte	120
	.byte	120
	.byte	120
	.byte	124
	.byte	124
	.byte	4
	.byte	4
	.byte	8
	.byte	4
	.byte	120
	.byte	120
	.byte	8
	.byte	120
	.byte	124
	.byte	124
	.byte	120
	.byte	112
	.byte	120
	.byte	120
	.byte	112
	.byte	108
	.byte	0
	.byte	0
	.byte	116
	.byte	108
	.byte	8
	.byte	8
	.byte	0
	.byte	116
	.byte	124
	.byte	124
	.byte	120
	.byte	108
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	116
	.byte	116
	.byte	116
	.byte	108
	.byte	120
	.byte	120
	.byte	124
	.byte	112
	.byte	12
	.byte	12
	.byte	0
	.byte	116
	.byte	4
	.byte	4
	.byte	12
	.byte	8
	.byte	120
	.byte	120
	.byte	124
	.byte	116
	.byte	120
	.byte	120
	.byte	112
	.byte	104
	.byte	8
	.byte	8
	.byte	0
	.byte	112
	.byte	16
	.byte	16
	.byte	12
	.byte	120
	.byte	0
	.byte	0
	.byte	12
	.byte	8
	.section	.data.sandisk_A19_read_retry_cmd_1y,"aw",%progbits
	.set	.LANCHOR83,. + 0
	.type	sandisk_A19_read_retry_cmd_1y, %object
	.size	sandisk_A19_read_retry_cmd_1y, 1
sandisk_A19_read_retry_cmd_1y:
	.byte	-17
	.section	.data.sandisk_A19_read_retry_enable_cmd_1y,"aw",%progbits
	.type	sandisk_A19_read_retry_enable_cmd_1y, %object
	.size	sandisk_A19_read_retry_enable_cmd_1y, 1
sandisk_A19_read_retry_enable_cmd_1y:
	.byte	93
	.section	.data.sandisk_A19_read_retry_exit_cmd_1y,"aw",%progbits
	.type	sandisk_A19_read_retry_exit_cmd_1y, %object
	.size	sandisk_A19_read_retry_exit_cmd_1y, 1
sandisk_A19_read_retry_exit_cmd_1y:
	.byte	-1
	.section	.data.sandisk_A19_read_retry_reg_adr_1y,"aw",%progbits
	.set	.LANCHOR87,. + 0
	.type	sandisk_A19_read_retry_reg_adr_1y, %object
	.size	sandisk_A19_read_retry_reg_adr_1y, 1
sandisk_A19_read_retry_reg_adr_1y:
	.byte	17
	.section	.data.sandisk_acti_start_addr,"aw",%progbits
	.set	.LANCHOR76,. + 0
	.type	sandisk_acti_start_addr, %object
	.size	sandisk_acti_start_addr, 9
sandisk_acti_start_addr:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.section	.data.sandisk_acti_start_cmd,"aw",%progbits
	.set	.LANCHOR63,. + 0
	.type	sandisk_acti_start_cmd, %object
	.size	sandisk_acti_start_cmd, 2
sandisk_acti_start_cmd:
	.byte	59
	.byte	-71
	.section	.data.sandisk_read_retry_cmd_19,"aw",%progbits
	.set	.LANCHOR64,. + 0
	.type	sandisk_read_retry_cmd_19, %object
	.size	sandisk_read_retry_cmd_19, 3
sandisk_read_retry_cmd_19:
	.byte	83
	.byte	83
	.byte	83
	.section	.data.sandisk_read_retry_cmd_1y,"aw",%progbits
	.set	.LANCHOR65,. + 0
	.type	sandisk_read_retry_cmd_1y, %object
	.size	sandisk_read_retry_cmd_1y, 1
sandisk_read_retry_cmd_1y:
	.byte	-17
	.section	.data.sandisk_read_retry_cmd_24,"aw",%progbits
	.type	sandisk_read_retry_cmd_24, %object
	.size	sandisk_read_retry_cmd_24, 3
sandisk_read_retry_cmd_24:
	.byte	83
	.byte	83
	.byte	83
	.section	.data.sandisk_read_retry_disable_cmd_19,"aw",%progbits
	.set	.LANCHOR67,. + 0
	.type	sandisk_read_retry_disable_cmd_19, %object
	.size	sandisk_read_retry_disable_cmd_19, 1
sandisk_read_retry_disable_cmd_19:
	.byte	-42
	.section	.data.sandisk_read_retry_enable_cmd_19,"aw",%progbits
	.type	sandisk_read_retry_enable_cmd_19, %object
	.size	sandisk_read_retry_enable_cmd_19, 1
sandisk_read_retry_enable_cmd_19:
	.byte	-74
	.section	.data.sandisk_read_retry_enable_cmd_1y,"aw",%progbits
	.type	sandisk_read_retry_enable_cmd_1y, %object
	.size	sandisk_read_retry_enable_cmd_1y, 1
sandisk_read_retry_enable_cmd_1y:
	.byte	93
	.section	.data.sandisk_read_retry_exit_cmd_1y,"aw",%progbits
	.type	sandisk_read_retry_exit_cmd_1y, %object
	.size	sandisk_read_retry_exit_cmd_1y, 1
sandisk_read_retry_exit_cmd_1y:
	.byte	-1
	.section	.data.sandisk_read_retry_reg_adr_19,"aw",%progbits
	.set	.LANCHOR71,. + 0
	.type	sandisk_read_retry_reg_adr_19, %object
	.size	sandisk_read_retry_reg_adr_19, 9
sandisk_read_retry_reg_adr_19:
	.byte	4
	.byte	5
	.byte	7
	.space	6
	.section	.data.sandisk_read_retry_reg_adr_1y,"aw",%progbits
	.set	.LANCHOR74,. + 0
	.type	sandisk_read_retry_reg_adr_1y, %object
	.size	sandisk_read_retry_reg_adr_1y, 1
sandisk_read_retry_reg_adr_1y:
	.byte	17
	.section	.data.sandisk_read_retry_reg_adr_24,"aw",%progbits
	.set	.LANCHOR72,. + 0
	.type	sandisk_read_retry_reg_adr_24, %object
	.size	sandisk_read_retry_reg_adr_24, 9
sandisk_read_retry_reg_adr_24:
	.byte	4
	.byte	5
	.byte	7
	.space	6
	.section	.data.toshiba_p1_1,"aw",%progbits
	.set	.LANCHOR45,. + 0
	.type	toshiba_p1_1, %object
	.size	toshiba_p1_1, 28
toshiba_p1_1:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	124
	.byte	124
	.byte	124
	.byte	124
	.byte	120
	.byte	120
	.byte	120
	.byte	120
	.byte	116
	.byte	116
	.byte	116
	.byte	116
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.section	.data.toshiba_p1_2,"aw",%progbits
	.set	.LANCHOR43,. + 0
	.type	toshiba_p1_2, %object
	.size	toshiba_p1_2, 40
toshiba_p1_2:
	.byte	4
	.byte	4
	.byte	124
	.byte	126
	.byte	0
	.byte	0
	.byte	124
	.byte	120
	.byte	120
	.byte	0
	.byte	124
	.byte	118
	.byte	116
	.byte	114
	.byte	0
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	11
	.byte	126
	.byte	118
	.byte	116
	.byte	0
	.byte	16
	.byte	118
	.byte	114
	.byte	112
	.byte	0
	.byte	2
	.byte	0
	.byte	126
	.byte	124
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.data.toshiba_p1_3,"aw",%progbits
	.set	.LANCHOR44,. + 0
	.type	toshiba_p1_3, %object
	.size	toshiba_p1_3, 55
toshiba_p1_3:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	4
	.byte	2
	.byte	0
	.byte	0
	.byte	124
	.byte	0
	.byte	124
	.byte	124
	.byte	0
	.byte	122
	.byte	0
	.byte	122
	.byte	122
	.byte	0
	.byte	120
	.byte	2
	.byte	120
	.byte	122
	.byte	0
	.byte	126
	.byte	4
	.byte	126
	.byte	122
	.byte	0
	.byte	118
	.byte	4
	.byte	118
	.byte	120
	.byte	0
	.byte	4
	.byte	4
	.byte	4
	.byte	118
	.byte	0
	.byte	6
	.byte	10
	.byte	6
	.byte	2
	.byte	0
	.byte	116
	.byte	124
	.byte	116
	.byte	118
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.data.toshiba_read_retry_addr_1,"aw",%progbits
	.set	.LANCHOR41,. + 0
	.type	toshiba_read_retry_addr_1, %object
	.size	toshiba_read_retry_addr_1, 4
toshiba_read_retry_addr_1:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.section	.data.toshiba_read_retry_addr_2,"aw",%progbits
	.set	.LANCHOR40,. + 0
	.type	toshiba_read_retry_addr_2, %object
	.size	toshiba_read_retry_addr_2, 5
toshiba_read_retry_addr_2:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	13
	.section	.data.toshiba_read_retry_cmd_1,"aw",%progbits
	.set	.LANCHOR37,. + 0
	.type	toshiba_read_retry_cmd_1, %object
	.size	toshiba_read_retry_cmd_1, 4
toshiba_read_retry_cmd_1:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.section	.data.toshiba_read_retry_cmd_2,"aw",%progbits
	.set	.LANCHOR33,. + 0
	.type	toshiba_read_retry_cmd_2, %object
	.size	toshiba_read_retry_cmd_2, 5
toshiba_read_retry_cmd_2:
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.byte	85
	.section	.data.toshiba_read_retry_end_cmd,"aw",%progbits
	.set	.LANCHOR38,. + 0
	.type	toshiba_read_retry_end_cmd, %object
	.size	toshiba_read_retry_end_cmd, 2
toshiba_read_retry_end_cmd:
	.byte	38
	.byte	93
	.section	.data.toshiba_read_retry_exit_cmd,"aw",%progbits
	.set	.LANCHOR35,. + 0
	.type	toshiba_read_retry_exit_cmd, %object
	.size	toshiba_read_retry_exit_cmd, 1
toshiba_read_retry_exit_cmd:
	.byte	-1
	.section	.data.toshiba_read_retry_last_cmd,"aw",%progbits
	.set	.LANCHOR36,. + 0
	.type	toshiba_read_retry_last_cmd, %object
	.size	toshiba_read_retry_last_cmd, 1
toshiba_read_retry_last_cmd:
	.byte	-77
	.section	.data.toshiba_read_retry_start_cmd,"aw",%progbits
	.set	.LANCHOR39,. + 0
	.type	toshiba_read_retry_start_cmd, %object
	.size	toshiba_read_retry_start_cmd, 2
toshiba_read_retry_start_cmd:
	.byte	92
	.byte	-59
	.section	.rodata.__FUNCTION__.6908,"a",%progbits
	.set	.LANCHOR17,. + 0
	.type	__FUNCTION__.6908, %object
	.size	__FUNCTION__.6908, 25
__FUNCTION__.6908:
	.ascii	"nand_power_off_ecc_error\000"
	.section	.rodata.__func__.5977,"a",%progbits
	.set	.LANCHOR18,. + 0
	.type	__func__.5977, %object
	.size	__func__.5977, 19
__func__.5977:
	.ascii	"panic_recover_data\000"
	.section	.rodata.__func__.6029,"a",%progbits
	.set	.LANCHOR27,. + 0
	.type	__func__.6029, %object
	.size	__func__.6029, 9
__func__.6029:
	.ascii	"nftl_add\000"
	.section	.rodata.__func__.6189,"a",%progbits
	.set	.LANCHOR26,. + 0
	.type	__func__.6189, %object
	.size	__func__.6189, 16
__func__.6189:
	.ascii	"nftl_initialize\000"
	.section	.rodata.__func__.6346,"a",%progbits
	.set	.LANCHOR12,. + 0
	.type	__func__.6346, %object
	.size	__func__.6346, 16
__func__.6346:
	.ascii	"zone_param_init\000"
	.section	.rodata.__func__.6494,"a",%progbits
	.set	.LANCHOR22,. + 0
	.type	__func__.6494, %object
	.size	__func__.6494, 23
__func__.6494:
	.ascii	"get_current_used_block\000"
	.section	.rodata.__func__.6560,"a",%progbits
	.set	.LANCHOR5,. + 0
	.type	__func__.6560, %object
	.size	__func__.6560, 9
__func__.6560:
	.ascii	"init_nrc\000"
	.section	.rodata.__func__.6645,"a",%progbits
	.set	.LANCHOR19,. + 0
	.type	__func__.6645, %object
	.size	__func__.6645, 23
__func__.6645:
	.ascii	"torture_block_and_mark\000"
	.section	.rodata.__func__.6768,"a",%progbits
	.set	.LANCHOR21,. + 0
	.type	__func__.6768, %object
	.size	__func__.6768, 26
__func__.6768:
	.ascii	"block_last_page_ecc_error\000"
	.section	.rodata.__func__.6800,"a",%progbits
	.set	.LANCHOR6,. + 0
	.type	__func__.6800, %object
	.size	__func__.6800, 18
__func__.6800:
	.ascii	"nand_dbg_phy_read\000"
	.section	.rodata.__func__.6811,"a",%progbits
	.set	.LANCHOR7,. + 0
	.type	__func__.6811, %object
	.size	__func__.6811, 23
__func__.6811:
	.ascii	"nand_dbg_zone_phy_read\000"
	.section	.rodata.__func__.6822,"a",%progbits
	.set	.LANCHOR8,. + 0
	.type	__func__.6822, %object
	.size	__func__.6822, 24
__func__.6822:
	.ascii	"nand_dbg_zone_phy_write\000"
	.section	.rodata.__func__.6831,"a",%progbits
	.set	.LANCHOR9,. + 0
	.type	__func__.6831, %object
	.size	__func__.6831, 19
__func__.6831:
	.ascii	"nand_dbg_phy_write\000"
	.section	.rodata.__func__.6884,"a",%progbits
	.set	.LANCHOR14,. + 0
	.type	__func__.6884, %object
	.size	__func__.6884, 19
__func__.6884:
	.ascii	"write_data_to_nand\000"
	.section	.rodata.__func__.7035,"a",%progbits
	.set	.LANCHOR11,. + 0
	.type	__func__.7035, %object
	.size	__func__.7035, 19
__func__.7035:
	.ascii	"get_logic_page_map\000"
	.section	.rodata.__func__.7074,"a",%progbits
	.set	.LANCHOR13,. + 0
	.type	__func__.7074, %object
	.size	__func__.7074, 16
__func__.7074:
	.ascii	"nftl_cache_init\000"
	.section	.rodata.__func__.7519,"a",%progbits
	.set	.LANCHOR28,. + 0
	.type	__func__.7519, %object
	.size	__func__.7519, 15
__func__.7519:
	.ascii	"shutdown_on_gc\000"
	.section	.rodata.__func__.7566,"a",%progbits
	.set	.LANCHOR24,. + 0
	.type	__func__.7566, %object
	.size	__func__.7566, 11
__func__.7566:
	.ascii	"nftl_start\000"
	.section	.rodata.__func__.7616,"a",%progbits
	.set	.LANCHOR10,. + 0
	.type	__func__.7616, %object
	.size	__func__.7616, 35
__func__.7616:
	.ascii	"_nftl_nand_read_logic_history_page\000"
	.section	.rodata.__func__.8019,"a",%progbits
	.set	.LANCHOR29,. + 0
	.type	__func__.8019, %object
	.size	__func__.8019, 23
__func__.8019:
	.ascii	"nftl_sector_cache_init\000"
	.section	.rodata.__func__.8607,"a",%progbits
	.set	.LANCHOR88,. + 0
	.type	__func__.8607, %object
	.size	__func__.8607, 25
__func__.8607:
	.ascii	"sandisk_A19_special_exit\000"
	.section	.rodata.__nand_discard.str1.1,"aMS",%progbits,1
.LC77:
	.ascii	"[ND]dicard sector:0x%x,len:0x%x\012\000"
	.section	.rodata.__nand_flush_write_cache.str1.1,"aMS",%progbits,1
.LC74:
	.ascii	"[NE]nand_flush_write_cache write error\012\000"
.LC75:
	.ascii	"[ND]flush cache %d %d!\012\000"
	.section	.rodata.__nand_read.str1.1,"aMS",%progbits,1
.LC61:
	.ascii	"[ND]read sector:0x%x,len:0x%x\012\000"
	.section	.rodata.__nand_write.str1.1,"aMS",%progbits,1
.LC62:
	.ascii	"[ND]write sector:0x%x,len:0x%x\012\000"
	.section	.rodata._nand_read_history.str1.1,"aMS",%progbits,1
.LC45:
	.ascii	"[NE]paramter error. beyond reality capacity\012\000"
	.section	.rodata._nftl_nand_read_logic_history_page.str1.1,"aMS",%progbits,1
.LC37:
	.ascii	"[NE]%s malloc buffer fail\012\000"
.LC38:
	.ascii	"scan super block@%d\012\000"
.LC39:
	.ascii	"block@%d is bad\012\000"
.LC40:
	.ascii	"[NE]read sb@%u sp@%u err, maybe read a bad block\012"
	.ascii	"\000"
.LC41:
	.ascii	"[NE]read lb@%u lp@%u err\012\000"
.LC42:
	.ascii	"page@%u history%d data:\012\000"
.LC43:
	.ascii	"oob:\012\000"
.LC44:
	.ascii	"scan end total super blocks:%d\012\000"
	.section	.rodata._nftl_nand_read_logic_page.str1.1,"aMS",%progbits,1
.LC339:
	.ascii	"[NE]read a page: %d READ_RECLAIM!\012\000"
	.section	.rodata._nftl_nand_write_logic_page.str1.1,"aMS",%progbits,1
.LC386:
	.ascii	"[NE]error nand_write_logic_page_no_gc page_no:%u\012"
	.ascii	"\000"
	.section	.rodata.adjust_free_list.str1.1,"aMS",%progbits,1
.LC269:
	.ascii	"[NE]adjust free list fail!!\012\000"
.LC270:
	.ascii	"[NI]adjust free list : %d %d!!\012\000"
	.section	.rodata.block_last_page_ecc_error.str1.1,"aMS",%progbits,1
.LC253:
	.ascii	"[NE]do block_last_page_ecc_error!!\012\000"
.LC254:
	.ascii	"[NE]%s:malloc fail 1!\012\000"
.LC255:
	.ascii	"[NE]%s:malloc fail 2!\012\000"
.LC256:
	.ascii	"[NE]current_block_ecc_error unkown page data!!\012\000"
.LC257:
	.ascii	"[NE]current_block_ecc_error invalid page data!!\012"
	.ascii	"\000"
.LC258:
	.ascii	"[NE]do block_last_page_ecc_error end!!\012\000"
	.section	.rodata.build_zone_list.str1.1,"aMS",%progbits,1
.LC350:
	.ascii	"[ND]first\012\000"
.LC351:
	.ascii	"[NE]init_zone_after_first_scan error\012\000"
.LC352:
	.ascii	"[NE]second_scan_all_blocks error\012\000"
.LC353:
	.ascii	"[NI]nftl ok!\012\000"
	.section	.rodata.build_zone_list_first.str1.1,"aMS",%progbits,1
.LC35:
	.ascii	"[ND]build_zone_list_first.\012\000"
.LC36:
	.ascii	"[NE]no block %d\012\000"
	.section	.rodata.check_invalid_page_right.str1.1,"aMS",%progbits,1
.LC107:
	.ascii	"[ND]logic_page_map_temp NULL!!\012\000"
.LC108:
	.ascii	"[NE]invaild_page num error:[%d] [%d]  used_page:[%d"
	.ascii	"]!!\012\000"
	.section	.rodata.check_static_wear_leveling.str1.1,"aMS",%progbits,1
.LC266:
	.ascii	"[ND]swl: static WL need to do(%d : %d)\012\000"
.LC267:
	.ascii	"[ND]swl: min_ec_blk_no = %d,\012\000"
.LC268:
	.ascii	"[ND]swl: zone->blocks = %d)\012\000"
	.section	.rodata.com,"a",%progbits
	.set	.LANCHOR25,. + 0
	.type	com, %object
	.size	com, 11
com:
	.byte	99
	.byte	111
	.byte	109
	.byte	112
	.byte	97
	.byte	116
	.byte	105
	.byte	98
	.byte	108
	.byte	101
	.byte	0
	.section	.rodata.crc_wrong.str1.1,"aMS",%progbits,1
.LC82:
	.ascii	"[NE]exception case wb %04x %04x, len: %d\012\000"
	.section	.rodata.cross_talk_rebuild_current_block.str1.1,"aMS",%progbits,1
.LC229:
	.ascii	"[NE]cross_talk_rebuild_current_block fail 1\012\000"
.LC230:
	.ascii	"[NE]cross_talk_rebuild_current_block!! %d,%d,%d!\012"
	.ascii	"\000"
.LC231:
	.ascii	"[NE]cross_talk_rebuild_current_block fail 2\012\000"
.LC232:
	.ascii	"[NE]cross_talk_rebuild_current_block!! %d,%d,%d,%d,"
	.ascii	"%d,%d!\012\000"
.LC233:
	.ascii	"[NE]cross_talk_rebuild_current_block fail 3\012\000"
.LC234:
	.ascii	"[NE]corss talk rebuild 1 %d %d %d!\012\000"
.LC235:
	.ascii	"[NE]corss talk rebuild 2 %d %d %d!\012\000"
.LC236:
	.ascii	"[NE]get free block fail!\012\000"
.LC237:
	.ascii	"[NE]something is error here 14!\012\000"
.LC238:
	.ascii	"[NE]page lost %d %d\012\000"
	.section	.rodata.current_block_ecc_error.str1.1,"aMS",%progbits,1
.LC244:
	.ascii	"[NE]current_block_ecc_error no free block!!!\012\000"
.LC245:
	.ascii	"[NE]something is error here 16!\012\000"
.LC246:
	.ascii	"[NE]do current_block_ecc_error %d!!\012\000"
.LC247:
	.ascii	"[NE]power off ecc error 2.\012\000"
.LC248:
	.ascii	"[NE]current_block_ecc ok page %d %d!!\012\000"
.LC249:
	.ascii	"[NE]current_block_ecc_error page %d!!\012\000"
.LC250:
	.ascii	"[NE]current_block_ecc_error invalid page data %d!!\012"
	.ascii	"\000"
.LC251:
	.ascii	"[NE]current_block_ecc_error unkown page data %d!!\012"
	.ascii	"\000"
.LC252:
	.ascii	"[ND]do current_block_ecc_error end %d %d!!\012\000"
	.section	.rodata.do_after_write.str1.1,"aMS",%progbits,1
.LC310:
	.ascii	"[NE]write_phy_page_map_to_current_block error!\012\000"
.LC311:
	.ascii	"[NE]get_new_current_block error1!\012\000"
.LC312:
	.ascii	"[NE]get_new_current_block error2!\012\000"
	.section	.rodata.do_before_write.str1.1,"aMS",%progbits,1
.LC273:
	.ascii	"[NE]get_new_current_block error3!\012\000"
.LC274:
	.ascii	"[NE]get_new_current_block error4!\012\000"
	.section	.rodata.do_prio_gc.str1.1,"aMS",%progbits,1
.LC334:
	.ascii	"[ND]no block to prio gc\012\000"
.LC335:
	.ascii	"[ND]no need gc:%d, type:%d\012\000"
.LC336:
	.ascii	"[NE]do_prio_gc garbage_collect_first fail:%d, type:"
	.ascii	"%d\012\000"
.LC337:
	.ascii	"[ND]prio gc fail1:%d, type:%d\012\000"
.LC338:
	.ascii	"[ND]prio gc fail2:%d, type:%d\012\000"
	.section	.rodata.do_write_error.str1.1,"aMS",%progbits,1
.LC259:
	.ascii	"[NE]no free block\012\000"
.LC260:
	.ascii	"[NE]do_write_error erase error sb:%d!\012\000"
.LC261:
	.ascii	"[NE]do_write_error sb@%d nftl_nand_copy_page error!"
	.ascii	"\012\000"
	.section	.rodata.do_write_error_in_build_list.str1.1,"aMS",%progbits,1
.LC19:
	.ascii	"[NE]NAND EVENT:do_write_error erase error1!\012\000"
.LC20:
	.ascii	"[NE]NAND EVENT:do_write_error erase error2!\012\000"
	.section	.rodata.done_static_wear_leveling.str1.1,"aMS",%progbits,1
.LC340:
	.ascii	"[ND]swl: the block(%d) for static WL is not in inva"
	.ascii	"lid_list\012\000"
.LC341:
	.ascii	"[ND]swl: done_static_wear_leveling(min_ec) block:%d"
	.ascii	", erase_count:%d\012\000"
.LC342:
	.ascii	"[NE]swl: garbage_collect_first fail:%d\012\000"
.LC343:
	.ascii	"[NE]swl: last->check fail:%d\012\000"
	.section	.rodata.dump_buf.str1.1,"aMS",%progbits,1
.LC15:
	.ascii	"%02x \000"
	.section	.rodata.dumphex.str1.1,"aMS",%progbits,1
.LC5:
	.ascii	"%08x: \000"
.LC6:
	.ascii	"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %"
	.ascii	"02x %02x %02x %02x %02x %02x\012\000"
.LC7:
	.ascii	"\012\000"
	.section	.rodata.erase_block.str1.1,"aMS",%progbits,1
.LC196:
	.ascii	"[NI]erase_block block %d!\012\000"
.LC197:
	.ascii	"[NE]erase_block block fail %d!\012\000"
	.section	.rodata.first_scan_all_blocks.str1.1,"aMS",%progbits,1
.LC211:
	.ascii	"[ND]fsab\012\000"
.LC212:
	.ascii	"[NI]ftl end block! %d!\012\000"
.LC213:
	.ascii	"[ND]READ_RECLAIM!\012\000"
.LC214:
	.ascii	"[NI]start page , do nothing\012\000"
.LC215:
	.ascii	"[ND]fill block %d\012\000"
.LC216:
	.ascii	"[NI]b@%d p@0 unknow spare data:%x,%x,%x,%x,%x,%x,%x"
	.ascii	",%x,%x,%x,%x,%x,%x,%x,%x,%x.\012\000"
.LC217:
	.ascii	"[NE]nftl bad block: %d\012\000"
.LC218:
	.ascii	"[NE]nftl b@%d p@0 ecc error\012\000"
.LC219:
	.ascii	"[NE]b@%d last page ok !\012\000"
.LC220:
	.ascii	"[NI]READ_RECLAIM!\012\000"
.LC221:
	.ascii	"[NE]last page blank ! %d!\012\000"
.LC222:
	.ascii	"[NE]last page unkown ! %d!\012\000"
.LC223:
	.ascii	"[NE]b@%d first page last page ecc error\012\000"
.LC224:
	.ascii	"[NE]b@%d last page spare data %x,%x,%x,%x,%x,%x,%x,"
	.ascii	"%x,%x,%x,%x,%x,%x,%x,%x,%x\012\000"
.LC225:
	.ascii	"[NI]nftl bad block: %d\012\000"
	.section	.rodata.flush_write_cache_to_nand.str1.1,"aMS",%progbits,1
.LC64:
	.ascii	"[NE]flush write cache to nand no cache!\012\000"
.LC65:
	.ascii	"[NE]ECC_LIMIT happened 10! page:%d cache: %d!\012\000"
.LC66:
	.ascii	"[NE]flush write cache to nand error!\012\000"
.LC67:
	.ascii	"[NE]fwctn %d\012\000"
.LC68:
	.ascii	"[NE]fwctn w+\012\000"
	.section	.rodata.garbage_collect.str1.1,"aMS",%progbits,1
.LC383:
	.ascii	"[NE]garbage_collect phy_block null\012\000"
.LC384:
	.ascii	"[ND]garbage too frequency! %d:%d\012\000"
.LC385:
	.ascii	"[NE]garbage_collect_first wrong fbn:%d\012\000"
	.section	.rodata.garbage_collect_first.str1.1,"aMS",%progbits,1
.LC323:
	.ascii	"[NI]garbage_collect_first none!!\012\000"
.LC324:
	.ascii	"[ND]garbage_collect_first wrong!!\012\000"
.LC325:
	.ascii	"[ND]garbage_collect_first cannot find PHY_MAPPING_P"
	.ascii	"AGE%d %d %d %d!!\012\000"
.LC326:
	.ascii	"[ND]garbage_collect_first cannot find PHY_MAPPING_P"
	.ascii	"AGE%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x."
	.ascii	"\012\000"
.LC327:
	.ascii	"[ND][NE]garbage_collect_first rebuild %d,%d!!\012\000"
.LC328:
	.ascii	"[ND]garbage_collect_first PHY_MAPPING_PAGEecc err b"
	.ascii	"lock:%d !!\012\000"
.LC329:
	.ascii	"[NE]garbage_collect_first invaild_page num error!!\012"
	.ascii	"\000"
.LC330:
	.ascii	"[ND]garbage_collect_first read a logic page error%d"
	.ascii	" %d %d %d spare data:\012\000"
.LC331:
	.ascii	"%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\012"
	.ascii	"\000"
.LC332:
	.ascii	"[NE]nand_write_logic_page_no_gc gc fail!!\012\000"
.LC333:
	.ascii	"[NE]erase ecc error block\012\000"
	.section	.rodata.gc_one.str1.1,"aMS",%progbits,1
.LC344:
	.ascii	"[ND]gc_one ok!\012\000"
.LC345:
	.ascii	"[NE]gc_one error!\012\000"
	.section	.rodata.gc_win_block.str1.1,"aMS",%progbits,1
.LC346:
	.ascii	"[ND][NE] gc_win_block gc_one error \012\000"
	.section	.rodata.generic_special_exit.str1.1,"aMS",%progbits,1
.LC460:
	.ascii	" generic special exit \012\000"
	.section	.rodata.generic_special_init.str1.1,"aMS",%progbits,1
.LC459:
	.ascii	" generic special init \012\000"
	.section	.rodata.get_current_used_block.str1.1,"aMS",%progbits,1
.LC282:
	.ascii	"%s %d:\012\000"
.LC283:
	.ascii	"[ND]recover %d %d\012\000"
.LC284:
	.ascii	"[NE]page used:%d invalid page count:%d error\012\000"
.LC285:
	.ascii	"[NE]new_block_init_for_write error here!\012\000"
.LC286:
	.ascii	"[NE]something is error here 10!\012\000"
.LC287:
	.ascii	"[NE]something is error here 11!\012\000"
.LC288:
	.ascii	"[NE]assist block page used:%d current block page us"
	.ascii	"ed:%d something is error here 12.\012\000"
.LC289:
	.ascii	"[NE]assist block page used:%d current block page us"
	.ascii	"ed:%d something is error here 17.\012\000"
.LC290:
	.ascii	"[ND]get a new free block\012\000"
.LC291:
	.ascii	"[NE]no free block to use!\012\000"
	.section	.rodata.get_logic_page_map.str1.1,"aMS",%progbits,1
.LC47:
	.ascii	"[NE]%s:logic_page:0x%x >= total_pages:0x%x\012\000"
	.section	.rodata.get_new_current_block.str1.1,"aMS",%progbits,1
.LC271:
	.ascii	"[ND]swl: new_cur_blk->alloc ok(max_ec): block_no = "
	.ascii	"%d; ec = %d; \012\000"
.LC272:
	.ascii	"[NE]no free block!!!!\012\000"
	.section	.rodata.get_used_page_num.str1.1,"aMS",%progbits,1
.LC100:
	.ascii	"[NE]get_used_page_num ecc error block:%d page:%d!\012"
	.ascii	"\000"
.LC101:
	.ascii	"[NE]power off ecc error 4!!\012\000"
.LC102:
	.ascii	"[NE]sb@%d sp@%d get_used_page_num used spare data %"
	.ascii	"x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\012\000"
	.section	.rodata.get_used_page_num_no_crosstalk.str1.1,"aMS",%progbits,1
.LC103:
	.ascii	"[NE]gupnnc ecc err b:%d p:%d.\012\000"
.LC104:
	.ascii	"[NE]gupnnc power off ecc err.\012\000"
.LC105:
	.ascii	"[NE]cross talk block:%d total_good_num %d good_page"
	.ascii	"_num: %d!\012\000"
	.section	.rodata.hynix16nm_get_read_retry_cfg.str1.1,"aMS",%progbits,1
.LC478:
	.ascii	"_get_read_retry_parameters, get rr count failed!\012"
	.ascii	"\000"
.LC479:
	.ascii	"rr cnt: %d\012\000"
.LC480:
	.ascii	"_get_read_retry_parameters, get rr reg count failed"
	.ascii	"!\012\000"
.LC481:
	.ascii	"rr reg cnt: %d\012\000"
.LC482:
	.ascii	"read retry value from otp error: rr_cnt %d rr_reg_c"
	.ascii	"nt %d!\012\000"
.LC483:
	.ascii	"_get_read_retry_parameters, get the %d-th byte of r"
	.ascii	"r table failed!\012\000"
	.section	.rodata.hynix16nm_get_rr_value_otp_hynix.str1.1,"aMS",%progbits,1
.LC486:
	.ascii	"otp_info_hynix_16nm : allocate memory fail\012\000"
.LC487:
	.ascii	"m1 CH %d chip %d get otp info failed!\012\000"
.LC488:
	.ascii	"m1 CH %d chip %d get read retry cfg from otp info f"
	.ascii	"ailed!\012\000"
	.section	.rodata.hynix16nm_get_special_info.str1.1,"aMS",%progbits,1
.LC463:
	.ascii	"get_hynix_special_info start!!\012\000"
.LC464:
	.ascii	"hynix_special_info:can't find uboot head\012\000"
.LC465:
	.ascii	"physic info start_block %d\012\000"
	.section	.rodata.hynix16nm_init_readretry_param.str1.1,"aMS",%progbits,1
.LC489:
	.ascii	"ch %d, chip %d Read Retry value Table from uboot\012"
	.ascii	"\000"
.LC490:
	.ascii	"[PHY_DBG] repair ch %d chip %d otp value end\012\000"
	.section	.rodata.hynix16nm_major_check_byte.str1.1,"aMS",%progbits,1
.LC475:
	.ascii	"_major_check_byte, wrong input para, level %d, len "
	.ascii	"%d\012\000"
.LC476:
	.ascii	"%d:  '1'-'0' : %d - %d\012\000"
.LC477:
	.ascii	"get bit %d failed!\012\000"
	.section	.rodata.hynix16nm_read_otp_info_hynix.str1.1,"aMS",%progbits,1
.LC484:
	.ascii	"start get read retry param from: ce %d, rb %d...\012"
	.ascii	"\000"
.LC485:
	.ascii	"invalid buffer for otp info!\012\000"
	.section	.rodata.hynix16nm_read_page_end.str1.1,"aMS",%progbits,1
.LC461:
	.ascii	"m1 retry!\012\000"
.LC462:
	.ascii	"m1 ReadRetry ok! ch =%d, chip = %d  block = %d, pag"
	.ascii	"e = %d, RetryCount = %d  \012\000"
	.section	.rodata.hynix16nm_readretry_exit.str1.1,"aMS",%progbits,1
.LC491:
	.ascii	"hynix16nm_readretry_exit. \012\000"
	.section	.rodata.hynix16nm_special_exit.str1.1,"aMS",%progbits,1
.LC494:
	.ascii	" hynix16nm_special_exit \012\000"
	.section	.rodata.hynix16nm_special_init.str1.1,"aMS",%progbits,1
.LC492:
	.ascii	" hynix16nm_special_init hynix16nm_read_retry_mode: "
	.ascii	"%d hynix16nm_read_retry_cycle:%d hynix16nm_read_ret"
	.ascii	"ry_reg_num:%d\012\000"
.LC493:
	.ascii	" hynix16nm_special_init error hynix16nm_read_retry_"
	.ascii	"mode: %d hynix16nm_read_retry_cycle:%d hynix16nm_re"
	.ascii	"ad_retry_reg_num:%d\012\000"
	.section	.rodata.hynix16nm_write_page_FF.str1.1,"aMS",%progbits,1
.LC474:
	.ascii	"m1 write page FF wrong\012\000"
	.section	.rodata.hynix20nm_getotpparam.str1.1,"aMS",%progbits,1
.LC455:
	.ascii	"_vender_get_param_otp_hynix time %d!\012\000"
.LC456:
	.ascii	"_vender_get_param_otp_hynix error!\012\000"
	.section	.rodata.hynix20nm_init_readretry_param.str1.1,"aMS",%progbits,1
.LC466:
	.ascii	"hynix20nm get default param error !\012\000"
.LC467:
	.ascii	"[PHY_GetDefaultParam]:readbuf malloc fail\012\000"
.LC468:
	.ascii	"ch %d, chip %d Read Retry value Table from uboot:\012"
	.ascii	"\000"
.LC469:
	.ascii	"0x%x \000"
.LC470:
	.ascii	"[PHY_DBG] ch %d, can't get right otp value from nan"
	.ascii	"d otp blocks, then use otp command\012\000"
.LC471:
	.ascii	"[PHY_DBG] repair ch %d otp value end\012\000"
	.section	.rodata.hynix20nm_lsb_exit.str1.1,"aMS",%progbits,1
.LC451:
	.ascii	"hynix20nm_lsb_exit\012\000"
	.section	.rodata.hynix20nm_read_page_end.str1.1,"aMS",%progbits,1
.LC448:
	.ascii	"hynix20nm retry!\012\000"
.LC449:
	.ascii	"sdata:0x%x %x %x %x \000"
.LC450:
	.ascii	"hynix20nm ReadRetry ok! ch =%d, chip = %d  block = "
	.ascii	"%d, page = %d, RetryCount = %d  \012\000"
	.section	.rodata.hynix20nm_readretry_exit.str1.1,"aMS",%progbits,1
.LC457:
	.ascii	"hynix20nm_readretry_exit. \012\000"
	.section	.rodata.hynix20nm_set_readretry.str1.1,"aMS",%progbits,1
.LC447:
	.ascii	"retry para:\000"
	.section	.rodata.hynix20nm_special_exit.str1.1,"aMS",%progbits,1
.LC458:
	.ascii	" hynix20nm_special_exit \012\000"
	.section	.rodata.hynix20nm_special_init.str1.1,"aMS",%progbits,1
.LC472:
	.ascii	" hynix20nm_special_init hynix20nm_read_retry_mode: "
	.ascii	"%d hynix20nm_read_retry_cycle:%d hynix20nm_read_ret"
	.ascii	"ry_reg_num:%d\012\000"
.LC473:
	.ascii	" hynix20nm_special_init error hynix20nm_read_retry_"
	.ascii	"mode: %d hynix20nm_read_retry_cycle:%d hynix20nm_re"
	.ascii	"ad_retry_reg_num:%d\012\000"
	.section	.rodata.hynix20nm_vender_get_param_otp_hynix.str1.1,"aMS",%progbits,1
.LC452:
	.ascii	"hynix OTP RegCount value error: 0x%x, 0x%x \012\000"
.LC453:
	.ascii	"otp copy failed!\012\000"
.LC454:
	.ascii	"otp copy %d is ok!\012\000"
	.section	.rodata.hynix26nm_get_default_param.str1.1,"aMS",%progbits,1
.LC441:
	.ascii	"hynix26nm_get_default_param: ch: %d, chip: %d, valu"
	.ascii	"e: 0x%x 0x%x 0x%x 0x%x \012\000"
	.section	.rodata.hynix26nm_lsb_exit.str1.1,"aMS",%progbits,1
.LC438:
	.ascii	"hynix26nm_lsb_exit\012\000"
	.section	.rodata.hynix26nm_read_page_end.str1.1,"aMS",%progbits,1
.LC436:
	.ascii	"m0 retry!\012\000"
.LC437:
	.ascii	"hynix26nm ReadRetry ok! ch =%d, chip = %d  block = "
	.ascii	"%d, page = %d, RetryCount = %d  \012\000"
	.section	.rodata.hynix26nm_readretry_exit.str1.1,"aMS",%progbits,1
.LC443:
	.ascii	"hynix26nm_readretry_exit. \012\000"
	.section	.rodata.hynix26nm_readretry_init.str1.1,"aMS",%progbits,1
.LC442:
	.ascii	"NFC_ReadRetryInit, unknown read retry mode 0x%x\012"
	.ascii	"\000"
	.section	.rodata.hynix26nm_set_readretry.str1.1,"aMS",%progbits,1
.LC434:
	.ascii	"hynix26nm retry param:\000"
.LC435:
	.ascii	" %x \000"
	.section	.rodata.hynix26nm_setdefaultparam.str1.1,"aMS",%progbits,1
.LC439:
	.ascii	"set retry default value: \000"
.LC440:
	.ascii	" %x\000"
	.section	.rodata.hynix26nm_special_exit.str1.1,"aMS",%progbits,1
.LC446:
	.ascii	" hynix26nm_special_exit \012\000"
	.section	.rodata.hynix26nm_special_init.str1.1,"aMS",%progbits,1
.LC444:
	.ascii	" hynix26nm_special_init hynix26nm_read_retry_mode: "
	.ascii	"%d hynix26nm_read_retry_cycle:%d hynix26nm_read_ret"
	.ascii	"ry_reg_num:%d\012\000"
.LC445:
	.ascii	" hynix26nm_special_init error hynix26nm_read_retry_"
	.ascii	"mode: %d hynix26nm_read_retry_cycle:%d hynix26nm_re"
	.ascii	"ad_retry_reg_num:%d\012\000"
	.section	.rodata.init_nrc.str1.1,"aMS",%progbits,1
.LC21:
	.ascii	"%s %d:fail 1\012\000"
.LC22:
	.ascii	"%s %d:fail 2\012\000"
.LC23:
	.ascii	"%s %d:fail 3\012\000"
.LC24:
	.ascii	"%s %d:fail 4\012\000"
	.section	.rodata.init_zone_after_first_scan.str1.1,"aMS",%progbits,1
.LC16:
	.ascii	"[ND]before second %d %d.\012\000"
.LC17:
	.ascii	"[NE]only have blocks:%u,logic cap need blocks:%u th"
	.ascii	"is zone not enough data block!!\012\000"
.LC18:
	.ascii	"[NE]this zone not enough free block %d , %d!!\012\000"
	.section	.rodata.is_no_use_device.str1.1,"aMS",%progbits,1
.LC46:
	.ascii	"[NE]mtd size changed !\012\000"
	.section	.rodata.malloc_logic_page_map.str1.1,"aMS",%progbits,1
.LC48:
	.ascii	"[NE]%s:malloc fail for logic_page_map %d\012\000"
.LC49:
	.ascii	"[NE]%s: malloc fail for logic_page_map %d\012\000"
.LC50:
	.ascii	"[NE]zone_param_init malloc_logic_page_map error %d\012"
	.ascii	"\000"
	.section	.rodata.micron_intel_set_feature.str1.1,"aMS",%progbits,1
.LC399:
	.ascii	"set feature(addr %d) p0: %d readretry Configuration"
	.ascii	" failed!\012\000"
	.section	.rodata.micron_read_page_end.str1.1,"aMS",%progbits,1
.LC400:
	.ascii	"micron retry!\012\000"
.LC401:
	.ascii	"micron ReadRetry ok! ch =%d, chip = %d  block = %d,"
	.ascii	" page = %d, RetryCount = %d  \012\000"
	.section	.rodata.micron_readretry_init.str1.1,"aMS",%progbits,1
.LC402:
	.ascii	"micron read retry cannot support!\012\000"
.LC403:
	.ascii	"micron read retry conut: %d !\012\000"
	.section	.rodata.micron_special_exit.str1.1,"aMS",%progbits,1
.LC406:
	.ascii	" micron_special_exit \012\000"
	.section	.rodata.micron_special_init.str1.1,"aMS",%progbits,1
.LC404:
	.ascii	" micron_special_init micron_read_retry_mode:%d micr"
	.ascii	"on_read_retry_cycle:%d \012\000"
.LC405:
	.ascii	" micron_special_init error micron_read_retry_mode:%"
	.ascii	"d micron_read_retry_cycle:%d \012\000"
	.section	.rodata.mod,"a",%progbits
	.set	.LANCHOR20,. + 0
	.type	mod, %object
	.size	mod, 6
mod:
	.byte	109
	.byte	111
	.byte	100
	.byte	101
	.byte	108
	.byte	0
	.section	.rodata.nand_cache_read.str1.1,"aMS",%progbits,1
.LC59:
	.ascii	"[NI]nand_cache_read error buf is  NULL!\012\000"
.LC60:
	.ascii	"[NE]error1 node %d,%d,%d!\012\000"
	.section	.rodata.nand_cache_write.str1.1,"aMS",%progbits,1
.LC69:
	.ascii	"[NE]error1 bitmap %x!\012\000"
.LC70:
	.ascii	"[NE]ECC_LIMIT happened 12! page:%d!\012\000"
.LC71:
	.ascii	"[NE]error1 flush write cache to nand\012\000"
.LC72:
	.ascii	"[NE]error2 flush write cache to nand\012\000"
.LC73:
	.ascii	"[NI]ECC_LIMIT happened 11! page:%d!\012\000"
	.section	.rodata.nand_check_table.str1.1,"aMS",%progbits,1
.LC358:
	.ascii	"[ND]==========================\012\000"
	.section	.rodata.nand_clean_zone_table2.str1.1,"aMS",%progbits,1
.LC29:
	.ascii	"[ND]zoneNO:%d total_pages: %d\012\000"
.LC30:
	.ascii	"[ND]NAND_Memset bytes: %d\012\000"
	.section	.rodata.nand_crc16_table,"a",%progbits
	.align	1
	.set	.LANCHOR16,. + 0
	.type	nand_crc16_table, %object
	.size	nand_crc16_table, 512
nand_crc16_table:
	.short	0
	.short	-16191
	.short	-15999
	.short	320
	.short	-15615
	.short	960
	.short	640
	.short	-15807
	.short	-14847
	.short	1728
	.short	1920
	.short	-14527
	.short	1280
	.short	-14911
	.short	-15231
	.short	1088
	.short	-13311
	.short	3264
	.short	3456
	.short	-12991
	.short	3840
	.short	-12351
	.short	-12671
	.short	3648
	.short	2560
	.short	-13631
	.short	-13439
	.short	2880
	.short	-14079
	.short	2496
	.short	2176
	.short	-14271
	.short	-10239
	.short	6336
	.short	6528
	.short	-9919
	.short	6912
	.short	-9279
	.short	-9599
	.short	6720
	.short	7680
	.short	-8511
	.short	-8319
	.short	8000
	.short	-8959
	.short	7616
	.short	7296
	.short	-9151
	.short	5120
	.short	-11071
	.short	-10879
	.short	5440
	.short	-10495
	.short	6080
	.short	5760
	.short	-10687
	.short	-11775
	.short	4800
	.short	4992
	.short	-11455
	.short	4352
	.short	-11839
	.short	-12159
	.short	4160
	.short	-4095
	.short	12480
	.short	12672
	.short	-3775
	.short	13056
	.short	-3135
	.short	-3455
	.short	12864
	.short	13824
	.short	-2367
	.short	-2175
	.short	14144
	.short	-2815
	.short	13760
	.short	13440
	.short	-3007
	.short	15360
	.short	-831
	.short	-639
	.short	15680
	.short	-255
	.short	16320
	.short	16000
	.short	-447
	.short	-1535
	.short	15040
	.short	15232
	.short	-1215
	.short	14592
	.short	-1599
	.short	-1919
	.short	14400
	.short	10240
	.short	-5951
	.short	-5759
	.short	10560
	.short	-5375
	.short	11200
	.short	10880
	.short	-5567
	.short	-4607
	.short	11968
	.short	12160
	.short	-4287
	.short	11520
	.short	-4671
	.short	-4991
	.short	11328
	.short	-7167
	.short	9408
	.short	9600
	.short	-6847
	.short	9984
	.short	-6207
	.short	-6527
	.short	9792
	.short	8704
	.short	-7487
	.short	-7295
	.short	9024
	.short	-7935
	.short	8640
	.short	8320
	.short	-8127
	.short	-24575
	.short	24768
	.short	24960
	.short	-24255
	.short	25344
	.short	-23615
	.short	-23935
	.short	25152
	.short	26112
	.short	-22847
	.short	-22655
	.short	26432
	.short	-23295
	.short	26048
	.short	25728
	.short	-23487
	.short	27648
	.short	-21311
	.short	-21119
	.short	27968
	.short	-20735
	.short	28608
	.short	28288
	.short	-20927
	.short	-22015
	.short	27328
	.short	27520
	.short	-21695
	.short	26880
	.short	-22079
	.short	-22399
	.short	26688
	.short	30720
	.short	-18239
	.short	-18047
	.short	31040
	.short	-17663
	.short	31680
	.short	31360
	.short	-17855
	.short	-16895
	.short	32448
	.short	32640
	.short	-16575
	.short	32000
	.short	-16959
	.short	-17279
	.short	31808
	.short	-19455
	.short	29888
	.short	30080
	.short	-19135
	.short	30464
	.short	-18495
	.short	-18815
	.short	30272
	.short	29184
	.short	-19775
	.short	-19583
	.short	29504
	.short	-20223
	.short	29120
	.short	28800
	.short	-20415
	.short	20480
	.short	-28479
	.short	-28287
	.short	20800
	.short	-27903
	.short	21440
	.short	21120
	.short	-28095
	.short	-27135
	.short	22208
	.short	22400
	.short	-26815
	.short	21760
	.short	-27199
	.short	-27519
	.short	21568
	.short	-25599
	.short	23744
	.short	23936
	.short	-25279
	.short	24320
	.short	-24639
	.short	-24959
	.short	24128
	.short	23040
	.short	-25919
	.short	-25727
	.short	23360
	.short	-26367
	.short	22976
	.short	22656
	.short	-26559
	.short	-30719
	.short	18624
	.short	18816
	.short	-30399
	.short	19200
	.short	-29759
	.short	-30079
	.short	19008
	.short	19968
	.short	-28991
	.short	-28799
	.short	20288
	.short	-29439
	.short	19904
	.short	19584
	.short	-29631
	.short	17408
	.short	-31551
	.short	-31359
	.short	17728
	.short	-30975
	.short	18368
	.short	18048
	.short	-31167
	.short	-32255
	.short	17088
	.short	17280
	.short	-31935
	.short	16640
	.short	-32319
	.short	-32639
	.short	16448
	.section	.rodata.nand_dbg_phy_read.str1.1,"aMS",%progbits,1
.LC25:
	.ascii	"[NE]%s:malloc 4096 fail!\012\000"
.LC26:
	.ascii	"[ND]spare: %x %x %x %x %x %x %x %x %x %x %x %x %x %"
	.ascii	"x %x %x\000"
.LC27:
	.ascii	"[ND]buf:%x %x %x %x %x %x %x %x %x %x %x.\012\000"
	.section	.rodata.nand_dbg_zone_phy_write.str1.1,"aMS",%progbits,1
.LC28:
	.ascii	"[NE]%s:malloc 8192 fail!\012\000"
	.section	.rodata.nand_discard.str1.1,"aMS",%progbits,1
.LC76:
	.ascii	"[NE]nand_discard paramter error!\012\000"
	.section	.rodata.nand_find_zone_table.str1.1,"aMS",%progbits,1
.LC354:
	.ascii	"[ND]build_zone_list start\012\000"
.LC355:
	.ascii	"[ND]nftl_cache_init start\012\000"
.LC356:
	.ascii	"[ND]=================================2============="
	.ascii	"==========================\012\000"
.LC357:
	.ascii	"[ND]nand_find_zone_table end\012\000"
	.section	.rodata.nand_power_off_ecc_error.str1.1,"aMS",%progbits,1
.LC83:
	.ascii	"[NE]exception case bad block\012\000"
.LC84:
	.ascii	"[NE]exception case wbc\012\000"
.LC85:
	.ascii	"[NE]exception case gd\012\000"
.LC86:
	.ascii	"[NE]%s %d, flag = %d\012\000"
.LC87:
	.ascii	"[NE]OOB :\000"
.LC88:
	.ascii	"%.2x %.2x %.2x %.2x %.2x %.2x %.2x %.2x %.2x %.2x %"
	.ascii	".2x %.2x %.2x %.2x %.2x %.2x\012\000"
	.section	.rodata.nand_sector_cache_read.str1.1,"aMS",%progbits,1
.LC388:
	.ascii	"[NE]nand_sector_cache_read 1!\012\000"
	.section	.rodata.nand_sector_cache_write.str1.1,"aMS",%progbits,1
.LC389:
	.ascii	"[NE]nand_sector_cache_write 1!\012\000"
.LC390:
	.ascii	"[NE]nand_sector_cache_write 2!\012\000"
	.section	.rodata.nand_write_data_page.str1.1,"aMS",%progbits,1
.LC319:
	.ascii	"[NE]do after write error1!\012\000"
.LC320:
	.ascii	"[NE]do_before_write error!\012\000"
.LC321:
	.ascii	"[NE]write data to page error!\012\000"
.LC322:
	.ascii	"[NE]do after write error2!\012\000"
	.section	.rodata.new_block_init_for_write.str1.1,"aMS",%progbits,1
.LC106:
	.ascii	"[NE]new_block_init_for_write erase error!\012\000"
	.section	.rodata.nftl_add.str1.1,"aMS",%progbits,1
.LC376:
	.ascii	"[NE]%s:malloc fail for nftl_blk\012\000"
.LC377:
	.ascii	"[NE]nftl_initialize failed\012\000"
.LC378:
	.ascii	"[ND]nftl_add ok\012\000"
	.section	.rodata.nftl_build_all.str1.1,"aMS",%progbits,1
.LC379:
	.ascii	"[NE]nftl_build_all error!\012\000"
	.section	.rodata.nftl_cache_init.str1.1,"aMS",%progbits,1
.LC57:
	.ascii	"[NE]%s:malloc fail for cache_node!\012\000"
.LC58:
	.ascii	"[NE]%s:malloc fail for cache_page_buf!\012\000"
	.section	.rodata.nftl_get_gc_info.str1.1,"aMS",%progbits,1
.LC80:
	.ascii	"%d %d %d %d %d %d/%d %d/%d\012\000"
.LC81:
	.ascii	"%d:%d \000"
	.section	.rodata.nftl_initialize.str1.1,"aMS",%progbits,1
.LC368:
	.ascii	"007\000"
.LC369:
	.ascii	"7\000"
.LC370:
	.ascii	"3\000"
.LC371:
	.ascii	"sunxi nftl version %s.%s.%s  %s-%s\012\000"
.LC372:
	.ascii	"10:58\000"
.LC373:
	.ascii	"2020.07.30\000"
.LC374:
	.ascii	"[NE]%s:malloc fail for nftl_cfg\012\000"
.LC375:
	.ascii	"[ND]max_erase_times = %i\012\000"
	.section	.rodata.nftl_malloc.str1.1,"aMS",%progbits,1
.LC14:
	.ascii	"[NI]malloc size is large %d!\012\000"
	.section	.rodata.nftl_read.str1.1,"aMS",%progbits,1
.LC12:
	.ascii	"[NE]parameter error %d,%d !\012\000"
	.section	.rodata.nftl_read_history.str1.1,"aMS",%progbits,1
.LC13:
	.ascii	"awa1543 nftl_logic_size:%u\012\000"
	.section	.rodata.nftl_sector_cache_init.str1.1,"aMS",%progbits,1
.LC387:
	.ascii	"[NE]%s:malloc fail for cache_buf!\012\000"
	.section	.rodata.nftl_start.str1.1,"aMS",%progbits,1
.LC359:
	.ascii	"[NE]%s: malloc fail for zone\012\000"
.LC360:
	.ascii	"[NE]%s: malloc fail for nand_chip\012\000"
.LC361:
	.ascii	"[NE]%s: malloc fail for nand_block_info\012\000"
.LC362:
	.ascii	"[NE]not enough blocks %d!\012\000"
.LC363:
	.ascii	"[ND]nftl start:%d,%d\012\000"
.LC364:
	.ascii	"[NE]zone_param_init fail!\012\000"
.LC365:
	.ascii	"[NE]build_zone_list_first fail!\012\000"
.LC366:
	.ascii	"[NE]build_zone_list fail!\012\000"
.LC367:
	.ascii	"[NI]try again\012\000"
	.section	.rodata.no_cross_talk_rebuild_current_block.str1.1,"aMS",%progbits,1
.LC239:
	.ascii	"[NI]nctrcb1 %d,%d,%d!\012\000"
.LC240:
	.ascii	"[NE]no_cross_talk_rebuild_current_block fail 2\012\000"
.LC241:
	.ascii	"[NI]nctrcb2 %d,%d,%d,%d,%d,%d!\012\000"
.LC242:
	.ascii	"[NE]no_cross_talk_rebuild_current_block fail 4\012\000"
.LC243:
	.ascii	"[NE]no_cross_talk_rebuild_current_block erase block"
	.ascii	" fail %d!\012\000"
	.section	.rodata.panic_backup_block.str1.1,"aMS",%progbits,1
.LC226:
	.ascii	"[ND] reserved panic block before %d!\012\000"
.LC227:
	.ascii	"[NE] reserved panic block %d!\012\000"
.LC228:
	.ascii	"[NE] no reserved panic block!!! quit!\012\000"
	.section	.rodata.panic_init_part.str1.1,"aMS",%progbits,1
.LC8:
	.ascii	"[ND] panic part %s off %u size %u\012\000"
	.section	.rodata.panic_recover_data.str1.1,"aMS",%progbits,1
.LC198:
	.ascii	"[ND] not find panic data, no need to recovery!\012\000"
.LC199:
	.ascii	"[ND] recovery panic data start!\012\000"
.LC200:
	.ascii	"[NE] %s(%d): malloc failed\012\000"
.LC201:
	.ascii	"[ND] ignore blk %d page %d as dummy page\012\000"
.LC202:
	.ascii	"[ND] exit recovery panic block\012\000"
.LC203:
	.ascii	"[ND] invalid blk %d page %d, finish recovery\012\000"
.LC204:
	.ascii	"[ND] move blk %d page %d to logic addr %d\012\000"
	.section	.rodata.panic_recover_info.str1.1,"aMS",%progbits,1
.LC9:
	.ascii	"[ND] find panic block : %d\012\000"
.LC10:
	.ascii	"[NE] invalid panic block index %d\012\000"
	.section	.rodata.panic_write.str1.1,"aMS",%progbits,1
.LC31:
	.ascii	"[ND] write panic data : logic addr: %d, sectors %d,"
	.ascii	" pages %d, blocks %d\012\000"
.LC32:
	.ascii	"[NE] too much data for panic-write, %d sectors left"
	.ascii	" over\012\000"
.LC33:
	.ascii	"[ND] write panic data block: %d page %d !\012\000"
.LC34:
	.ascii	"[ND] write dummy data block: %d page %d !\012\000"
	.section	.rodata.para0,"a",%progbits
	.align	1
	.set	.LANCHOR98,. + 0
	.type	para0, %object
	.size	para0, 56
para0:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	10
	.short	6
	.short	0
	.short	-3
	.short	-7
	.short	-8
	.short	0
	.short	-6
	.short	-13
	.short	-15
	.short	0
	.short	-11
	.short	-20
	.short	-23
	.short	0
	.short	0
	.short	-26
	.short	-30
	.short	0
	.short	0
	.short	-32
	.short	-37
	.section	.rodata.para1,"a",%progbits
	.align	1
	.set	.LANCHOR99,. + 0
	.type	para1, %object
	.size	para1, 56
para1:
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	10
	.short	6
	.short	0
	.short	-3
	.short	-7
	.short	-8
	.short	0
	.short	-6
	.short	-13
	.short	-15
	.short	0
	.short	-9
	.short	-20
	.short	-23
	.short	0
	.short	0
	.short	-26
	.short	-30
	.short	0
	.short	0
	.short	-32
	.short	-37
	.section	.rodata.phy_block_from_invalid_page_incr.str1.1,"aMS",%progbits,1
.LC276:
	.ascii	"[ND]invalid_page_count more than pages per blk 0 %d"
	.ascii	" %d!!\012\000"
.LC277:
	.ascii	"[ND]invalid_page_count more than pages per blk 1!!\012"
	.ascii	"\000"
	.section	.rodata.power_on_gc.str1.1,"aMS",%progbits,1
.LC347:
	.ascii	"[ND]not power on gc [%d, %d, %d], [%d %d %d]!\012\000"
.LC348:
	.ascii	"[ND]emergency power on gc %d !\012\000"
.LC349:
	.ascii	"[ND]power on gc %d!\012\000"
	.section	.rodata.print_all_nftl_blk.str1.1,"aMS",%progbits,1
.LC11:
	.ascii	"[ND]cap: 0x%08x.\012\000"
	.section	.rodata.print_block_count_list.str1.1,"aMS",%progbits,1
.LC192:
	.ascii	"[ND]block_used_count list: \012\000"
.LC193:
	.ascii	"[ND]block NO: %d \000"
.LC194:
	.ascii	"[ND]block_used_count: %d \012\000"
	.section	.rodata.print_block_invalid_list.str1.1,"aMS",%progbits,1
.LC190:
	.ascii	"[ND]invalid_page_count list: \012\000"
.LC191:
	.ascii	"[ND]count:%4d; invalid:%3d;\000"
	.section	.rodata.print_free_list.str1.1,"aMS",%progbits,1
.LC186:
	.ascii	"[ND]free list: \012\000"
.LC187:
	.ascii	"[ND]block NO:%4d; erase:%3d; \000"
.LC188:
	.ascii	"[ND]count:%4d; \000"
.LC189:
	.ascii	"[ND]info:0x%x\012\000"
	.section	.rodata.print_logic_page_map.str1.1,"aMS",%progbits,1
.LC78:
	.ascii	"[NI]page_map NULL!!\012\000"
.LC79:
	.ascii	"[ND]%4d:<%4d %3d><%d>\012\000"
	.section	.rodata.print_nftl_zone.str1.1,"aMS",%progbits,1
.LC133:
	.ascii	"[ND]nand3.x \012\000"
.LC134:
	.ascii	"[ND]zone->nand_chip->blk_per_chip: %d \012\000"
.LC135:
	.ascii	"[ND]zone->nand_chip->bytes_per_page: %d \012\000"
.LC136:
	.ascii	"[ND]zone->nand_chip->pages_per_blk: %d \012\000"
.LC137:
	.ascii	"[ND]zone->nand_chip->max_erase_times: %d \012\000"
.LC138:
	.ascii	"[ND]zone->nand_chip->support_read_reclaim: %d \012\000"
.LC139:
	.ascii	"[ND]zone->test: %d \012\000"
.LC140:
	.ascii	"[ND]zone->zone_no: %d \012\000"
.LC141:
	.ascii	"[ND]zone->zone_attr: %d \012\000"
.LC142:
	.ascii	"[ND]zone->blocks: %d \012\000"
.LC143:
	.ascii	"[ND]zone->bad_block: %d \012\000"
.LC144:
	.ascii	"[ND]zone->logic_cap_in_sects: %d \012\000"
.LC145:
	.ascii	"[ND]zone->backup_cap_in_sects: %d \012\000"
.LC146:
	.ascii	"[ND]zone->free_block_num: %d \012\000"
.LC147:
	.ascii	"[ND]zone->gc_strategy.start_gc_free_blocks: %d \012"
	.ascii	"\000"
.LC148:
	.ascii	"[ND]zone->gc_strategy.stop_gc_free_blocks: %d \012\000"
.LC149:
	.ascii	"[ND]zone->gc_strategy.gc_page: %d \012\000"
.LC150:
	.ascii	"[ND]zone->gc_strategy.process: %d \012\000"
.LC151:
	.ascii	"[ND]zone->prio_gc.prio_type : %d \012\000"
.LC152:
	.ascii	"[ND]zone->zone_start_phy_block->phy_block.Block_NO:"
	.ascii	" %d \012\000"
.LC153:
	.ascii	"[ND]zone->zone_end_phy_block->phy_block.Block_NO: %"
	.ascii	"d \012\000"
.LC154:
	.ascii	"[ND]zone->zone_phy_page_map_for_gc: %x \012\000"
.LC155:
	.ascii	"[ND]zone->current_block.user_info: %x \012\000"
.LC156:
	.ascii	"[ND]zone->current_block.block_info: %x \012\000"
.LC157:
	.ascii	"[ND]zone->current_block.block_info->phy_block.Block"
	.ascii	"_NO: %d \012\000"
.LC158:
	.ascii	"[ND]zone->current_block.page_used: %d \012\000"
.LC159:
	.ascii	"[ND]zone->current_block.block_info->block_used_coun"
	.ascii	"t: %d \012\000"
.LC160:
	.ascii	"[ND]zone->recv_free_block: %d %d!!\012\000"
.LC161:
	.ascii	"[ND]zone->assist_block.user_info: %x \012\000"
.LC162:
	.ascii	"[ND]zone->assist_block.block_info: %x \012\000"
.LC163:
	.ascii	"[ND]zone->assist_block.block_info->phy_block.Block_"
	.ascii	"NO: %d \012\000"
.LC164:
	.ascii	"[ND]zone->assist_block.page_used: %d \012\000"
.LC165:
	.ascii	"[ND]zone->assist_block.block_info->block_used_count"
	.ascii	": %d \012\000"
.LC166:
	.ascii	"[ND]zone->read_reclaim_complete: %x \012\000"
.LC167:
	.ascii	"[ND]zone->temp_page_buf: %x \012\000"
.LC168:
	.ascii	"[ND]zone->max_erase_num: %d \012\000"
.LC169:
	.ascii	"[ND]zone->cache.cache_totals: %x \012\000"
.LC170:
	.ascii	"[ND]zone->wl_gc_count: %d \012\000"
.LC171:
	.ascii	"[ND]zone->wl_gc_page_num: %d \012\000"
.LC172:
	.ascii	"[ND]zone->cfg->nftl_dont_use_cache: %x \012\000"
.LC173:
	.ascii	"[ND]zone->cfg->nftl_use_cache_sort: %x \012\000"
.LC174:
	.ascii	"[ND]zone->cfg->nftl_support_gc_read_reclaim: %x \012"
	.ascii	"\000"
.LC175:
	.ascii	"[ND]zone->cfg->nftl_support_wear_leveling: %x \012\000"
.LC176:
	.ascii	"[ND]zone->cfg->nftl_need_erase: %x \012\000"
.LC177:
	.ascii	"[ND]zone->cfg->nftl_min_free_block_num: %x \012\000"
.LC178:
	.ascii	"[ND]zone->cfg->nftl_gc_threshold_free_block_num: %x"
	.ascii	" \012\000"
.LC179:
	.ascii	"[ND]zone->cfg->nftl_min_free_block: %x \012\000"
.LC180:
	.ascii	"[ND]zone->cfg->nftl_gc_threshold_ratio_numerator: %"
	.ascii	"x \012\000"
.LC181:
	.ascii	"[ND]zone->cfg->nftl_gc_threshold_ratio_denominator:"
	.ascii	" %x \012\000"
.LC182:
	.ascii	"[ND]zone->cfg->nftl_max_cache_num: %d \012\000"
.LC183:
	.ascii	"[ND]zone->cfg->nftl_max_cache_write_num: %d \012\000"
.LC184:
	.ascii	"[ND]zone->cfg->nftl_cross_talk: %x \012\000"
.LC185:
	.ascii	"[ND]zone->cfg->nftl_read_claim_interval: %d \012\000"
	.section	.rodata.print_smart.str1.1,"aMS",%progbits,1
.LC109:
	.ascii	"[ND]smart->version:%x;\012\000"
.LC110:
	.ascii	"[ND]smart->total_recv_read_sectors:%lld;\012\000"
.LC111:
	.ascii	"[ND]smart->total_recv_write_sectors:%lld;\012\000"
.LC112:
	.ascii	"[ND]smart->total_real_read_pages:%lld;\012\000"
.LC113:
	.ascii	"[ND]smart->total_real_write_pages:%lld;\012\000"
.LC114:
	.ascii	"[ND]smart->total_recv_discard_sectors:%lld;\012\000"
.LC115:
	.ascii	"[ND]smart->total_real_discard_sectors:%lld;\012\000"
.LC116:
	.ascii	"[ND]smart->total_recv_read_claim_pages:%d;\012\000"
.LC117:
	.ascii	"[ND]smart->total_gc_times:%d;\012\000"
.LC118:
	.ascii	"[ND]smart->total_gc_pages:%d;\012\000"
.LC119:
	.ascii	"[ND]smart->total_wl_times:%d;\012\000"
.LC120:
	.ascii	"[ND]smart->total_wl_gc_times:%d;\012\000"
.LC121:
	.ascii	"[ND]smart->total_real_read_error_pages:%d;\012\000"
.LC122:
	.ascii	"[ND]smart->total_real_write_error_pages:%d;\012\000"
.LC123:
	.ascii	"[ND]smart->total_normal_power_cycles:%x;\012\000"
.LC124:
	.ascii	"[ND]smart->total_unusual_power_cycles:%x;\012\000"
.LC125:
	.ascii	"[ND]smart->max_block_erase_times:%d;\012\000"
.LC126:
	.ascii	"[ND]smart->min_block_erase_times:%d;\012\000"
.LC127:
	.ascii	"[ND]smart->max_block_used_counter:%d;\012\000"
.LC128:
	.ascii	"[ND]smart->min_block_used_counter:%d;\012\000"
.LC129:
	.ascii	"[ND]smart->read_reclaim_utc:%d;\012\000"
.LC130:
	.ascii	"[ND]smart->cross_talk_times:%d;\012\000"
.LC131:
	.ascii	"[ND]smart->read_reclaim_zone_no:%d;\012\000"
.LC132:
	.ascii	"[ND]smart->read_reclaim_page_no:%d;\012\000"
	.section	.rodata.put_phy_block_to_free_list.str1.1,"aMS",%progbits,1
.LC195:
	.ascii	"[ND]free_list error !\012\000"
	.section	.rodata.put_phy_block_to_invalid_page_list.str1.1,"aMS",%progbits,1
.LC275:
	.ascii	"[ND]add invalid_list error !\012\000"
	.section	.rodata.recover_block_phy_page_mapping.str1.1,"aMS",%progbits,1
.LC96:
	.ascii	"[NE]ret:%d read fail %d %d,read one more time!!\012"
	.ascii	"\000"
.LC97:
	.ascii	"[NE]ret:%d read fail %d %d,%d times,don't read more"
	.ascii	"!!\012\000"
.LC98:
	.ascii	"[NE]power off ecc error 3!!\012\000"
.LC99:
	.ascii	"[NE]recover sb@%d sp@%d phy page mapping error.\012"
	.ascii	"\000"
	.section	.rodata.recover_logic_page_mapping.str1.1,"aMS",%progbits,1
.LC278:
	.ascii	"[NI]logic_page_map is NULL\012\000"
.LC279:
	.ascii	"[NE]invalid_page_count more than pages_per_blk :%d\012"
	.ascii	"\000"
.LC280:
	.ascii	"[NE]inv P b:%d p:%d,lp %x\012\000"
.LC281:
	.ascii	"[NE]build invalid_page_count more than pages_per_bl"
	.ascii	"k\012\000"
	.section	.rodata.recover_phy_page_mapping.str1.1,"aMS",%progbits,1
.LC89:
	.ascii	"[NE]sb@%d sp@%d recover_phy_page_mapping no used pa"
	.ascii	"ge\012\000"
.LC90:
	.ascii	"[NE]sb@%d sp@%d power off ecc error1.\012\000"
.LC91:
	.ascii	"[NE]invalid logic_page block:%d page:%d,logic_page "
	.ascii	"0x%x.\012\000"
.LC92:
	.ascii	"[NE]rppm invalid page %d!!\012\000"
.LC93:
	.ascii	"[NI]power_down page %d!!\012\000"
.LC94:
	.ascii	"[NE]recover_phy_page_mapping unkown page data %d!!\012"
	.ascii	"\000"
.LC95:
	.ascii	"[NE]recover_phy_page_mapping ecc error block:%d;pag"
	.ascii	"e:%d.\012\000"
	.section	.rodata.samsung_read_page_end.str1.1,"aMS",%progbits,1
.LC409:
	.ascii	"samsung retry!\012\000"
.LC410:
	.ascii	"samsung ReadRetry ok! ch =%d, chip = %d  block = %d"
	.ascii	", page = %d, RetryCount = %d  \012\000"
	.section	.rodata.samsung_readretry_init.str1.1,"aMS",%progbits,1
.LC411:
	.ascii	"samsung read retry conut: %d !\012\000"
	.section	.rodata.samsung_set_readretry.str1.1,"aMS",%progbits,1
.LC408:
	.ascii	"samsung set readretry error ! %x \012\000"
	.section	.rodata.samsung_special_exit.str1.1,"aMS",%progbits,1
.LC414:
	.ascii	" samsung_special_exit \012\000"
	.section	.rodata.samsung_special_init.str1.1,"aMS",%progbits,1
.LC412:
	.ascii	" samsung_special_init samsung_read_retry_mode:%d sa"
	.ascii	"msung_read_retry_cycle :%d \012\000"
.LC413:
	.ascii	" samsung_special_init error samsung_read_retry_mode"
	.ascii	":%d samsung_read_retry_cycle :%d \012\000"
	.section	.rodata.samsung_vender_set_param.str1.1,"aMS",%progbits,1
.LC407:
	.ascii	"rr value %x %x %x %x!\012\000"
	.section	.rodata.sandisk_A19_check_bad_block_first_burn.str1.1,"aMS",%progbits,1
.LC433:
	.ascii	"fatal err -0, wrong input parameter, ch: %d  chip: "
	.ascii	"%d/%d  block: %d/%d \012\000"
	.section	.rodata.sandisk_A19_read_page_end.str1.1,"aMS",%progbits,1
.LC425:
	.ascii	"sandisk_A19 retry!\012\000"
.LC426:
	.ascii	"sandisk_A19 set readretry error\012\000"
.LC427:
	.ascii	"sandisk_A19 ReadRetry ok! ch =%d, chip = %d  block "
	.ascii	"= %d, page = %d, RetryCount = %d  \012\000"
.LC428:
	.ascii	"sandisk_A19 ReadRetry ok with ecc limit! ch =%d, ch"
	.ascii	"ip = %d  block = %d, page = %d, RetryCount = %d  \012"
	.ascii	"\000"
	.section	.rodata.sandisk_A19_readretry_init.str1.1,"aMS",%progbits,1
.LC423:
	.ascii	"sandisk_A19 retry mode err : %d !\012\000"
.LC424:
	.ascii	"sandisk A19 read retry conut: %d !\012\000"
	.section	.rodata.sandisk_A19_special_exit.str1.1,"aMS",%progbits,1
.LC431:
	.ascii	"%s sandisk toggle vendor specific setting failed!\012"
	.ascii	"\000"
.LC432:
	.ascii	" sandisk_A19_special_exit \012\000"
	.section	.rodata.sandisk_A19_special_init.str1.1,"aMS",%progbits,1
.LC429:
	.ascii	" sandisk_A19_special_init sandisk_A19_read_retry_mo"
	.ascii	"de:%d sandisk_A19_read_retry_cycle :%d sandisk_A19_"
	.ascii	"read_retry_reg_cnt %d \012\000"
.LC430:
	.ascii	" sandisk_A19_special_init error sandisk_A19_read_re"
	.ascii	"try_mode:%d sandisk_A19_read_retry_cycle :%d sandis"
	.ascii	"k_A19_read_retry_reg_cnt %d \012\000"
	.section	.rodata.sandisk_activation_seq.str1.1,"aMS",%progbits,1
.LC415:
	.ascii	"sandisk activation seq fail 0x%x\012\000"
	.section	.rodata.sandisk_read_page_end.str1.1,"aMS",%progbits,1
.LC417:
	.ascii	"sandisk retry!\012\000"
.LC418:
	.ascii	"retry spare all 0xff! ch =%d, chip = %d  block = %d"
	.ascii	", page = %d, RetryCount = %d  \012\000"
.LC419:
	.ascii	"sandisk ReadRetry ok! ch =%d, chip = %d  block = %d"
	.ascii	", page = %d, RetryCount = %d  \012\000"
	.section	.rodata.sandisk_readretry_init.str1.1,"aMS",%progbits,1
.LC416:
	.ascii	"sandisk read retry conut: %d !\012\000"
	.section	.rodata.sandisk_special_exit.str1.1,"aMS",%progbits,1
.LC422:
	.ascii	" sandisk_special_exit \012\000"
	.section	.rodata.sandisk_special_init.str1.1,"aMS",%progbits,1
.LC420:
	.ascii	" sandisk_special_init sandisk_read_retry_mode:%d sa"
	.ascii	"ndisk_read_retry_cycle :%d sandisk_read_retry_reg_c"
	.ascii	"nt %d \012\000"
.LC421:
	.ascii	" sandisk_special_init error sandisk_read_retry_mode"
	.ascii	":%d sandisk_read_retry_cycle :%d sandisk_read_retry"
	.ascii	"_reg_cnt %d \012\000"
	.section	.rodata.second_scan_all_blocks.str1.1,"aMS",%progbits,1
.LC292:
	.ascii	"[NI]NAND_EVENT: 2 current used block found %d,%d!\012"
	.ascii	"\000"
.LC293:
	.ascii	"[NE]no crosstalk:2 block used count diff %d,%d %d,%"
	.ascii	"d !\012\000"
.LC294:
	.ascii	"[NE]NAND_EVENT: muti current used block found1 %d %"
	.ascii	"d!\012\000"
.LC295:
	.ascii	"[NE]NAND_EVENT: muti current used block found2 %d %"
	.ascii	"d!\012\000"
.LC296:
	.ascii	"[NE]NAND_EVENT: muti current used block found3 %d %"
	.ascii	"d!\012\000"
.LC297:
	.ascii	"[NE]NAND_EVENT: last page spare data %x,%x,%x,%x,%x"
	.ascii	",%x,%x %x %x %x %x %x %x %x %x %x!!\012\000"
.LC298:
	.ascii	"[NI]zone@%d b@%d last page unkown ecc ok.\012\000"
.LC299:
	.ascii	"[NE]zone@%d b@%d last page ecc error.\012\000"
.LC300:
	.ascii	"[NE]something strange %d,%d!!\012\000"
.LC301:
	.ascii	"[NI]all block full!!\012\000"
.LC302:
	.ascii	"[ND]corss talk rebuild 0 %d %d!!\012\000"
.LC303:
	.ascii	"[NE]1st current block:%d 1st current block uc:%d mu"
	.ascii	"ti current used block 1st.\012\000"
.LC304:
	.ascii	"[ND]2nd current block:%d 2nd current block uc:%d mu"
	.ascii	"ti current used block 2nd.\012\000"
.LC305:
	.ascii	"[NE]something is error here 7!\012\000"
.LC306:
	.ascii	"[NE]p_phy_block_info_last %d %d.\012\000"
.LC307:
	.ascii	"[NE]get_current_used_block fail.\012\000"
.LC308:
	.ascii	"[ND]free block nums is %d, aec: %d, iec: %d, a_buc:"
	.ascii	" %d, i_buc: %d!\012\000"
	.section	.rodata.shutdown_on_gc.str1.1,"aMS",%progbits,1
.LC380:
	.ascii	"[ND]%s %p %d %d %d %\012\000"
.LC381:
	.ascii	"[NI]shutdown_on_gc end! [%d %d %d]\012\000"
.LC382:
	.ascii	"[ND]shutdown_on_gc one ok! [%d %d %d]\012\000"
	.section	.rodata.torture_block_and_mark.str1.1,"aMS",%progbits,1
.LC205:
	.ascii	"[NI]torture b@%d.\012\000"
.LC206:
	.ascii	"[NE]%s write b@%d p@%d err\012\000"
.LC207:
	.ascii	"[NE]%s read b@%d p@%d err\012\000"
.LC208:
	.ascii	"[NE]%s b@%d p@%d patt %02x checking main data fail\012"
	.ascii	"\000"
.LC209:
	.ascii	"[NE]%s b@%d p@%d patt %02x checking spare data fail"
	.ascii	"\012\000"
.LC210:
	.ascii	"[NE][NE]erase_block block fail %d!\012\000"
	.section	.rodata.toshiba_read_page_end.str1.1,"aMS",%progbits,1
.LC394:
	.ascii	"toshiba retry!\012\000"
.LC395:
	.ascii	"toshiba ReadRetry ok! ch =%d, chip = %d  block = %d"
	.ascii	", page = %d, RetryCount = %d  \012\000"
	.section	.rodata.toshiba_readretry_init.str1.1,"aMS",%progbits,1
.LC393:
	.ascii	"toshiba read retry conut: %d !\012\000"
	.section	.rodata.toshiba_special_exit.str1.1,"aMS",%progbits,1
.LC398:
	.ascii	" toshiba_special_exit \012\000"
	.section	.rodata.toshiba_special_init.str1.1,"aMS",%progbits,1
.LC396:
	.ascii	" toshiba_special_init toshiba_read_retry_mode :%d t"
	.ascii	"oshiba_read_retry_cycle :%d toshiba_read_retry_reg_"
	.ascii	"cnt :%d \012\000"
.LC397:
	.ascii	" toshiba_special_init error toshiba_read_retry_mode"
	.ascii	" :%d toshiba_read_retry_cycle :%d toshiba_read_retr"
	.ascii	"y_reg_cnt :%d \012\000"
	.section	.rodata.toshiba_vender_pre_condition.str1.1,"aMS",%progbits,1
.LC392:
	.ascii	"toshiba vender_pre_condition error!\012\000"
	.section	.rodata.toshiba_vender_set_param.str1.1,"aMS",%progbits,1
.LC391:
	.ascii	"toshiba rr value 3 %x %x %x %x!\012\000"
	.section	.rodata.write_data_to_nand.str1.1,"aMS",%progbits,1
.LC63:
	.ascii	"[NE][NE]%s:malloc 512 fail!\012\000"
	.section	.rodata.write_data_to_page.str1.1,"aMS",%progbits,1
.LC318:
	.ascii	"[NE]write logic data to current block error\012\000"
	.section	.rodata.write_logic_data_to_current_block.str1.1,"aMS",%progbits,1
.LC313:
	.ascii	"[ND]logic_page_map NULL!!\012\000"
.LC314:
	.ascii	"[ND]invalid_page_count more than pages_per_blk at w"
	.ascii	"rite logic data to current block:%d!!\012\000"
.LC315:
	.ascii	"[NE]write_phy_data_to_current_block error2\012\000"
.LC316:
	.ascii	"[NE]invalid_page_count more than pages_per_blk at w"
	.ascii	"rite logic data to current block:%d!!\012\000"
.LC317:
	.ascii	"[NE]write phy data to current block error2\012\000"
	.section	.rodata.write_phy_data_to_current_block.str1.1,"aMS",%progbits,1
.LC262:
	.ascii	"[ND]last block can not used to logic page %d!!\012\000"
.LC263:
	.ascii	"[ND]last block can not used to power down page %d!!"
	.ascii	"\012\000"
.LC264:
	.ascii	"[ND]write_phy_data_to_current_block write error %d!"
	.ascii	"\012\000"
.LC265:
	.ascii	"[NE]do_write_error error\012\000"
	.section	.rodata.write_phy_page_map_to_current_block.str1.1,"aMS",%progbits,1
.LC309:
	.ascii	"[NE]write_phy_data_to_current_block error1\012\000"
	.section	.rodata.zone_param_init.str1.1,"aMS",%progbits,1
.LC51:
	.ascii	"[NE]%s:malloc fail for temp_page_buf\012\000"
.LC52:
	.ascii	"[NE]%s:malloc fail for logic_page_buf\012\000"
.LC53:
	.ascii	"[NE]zone_param_init error2\012\000"
.LC54:
	.ascii	"[NE]%s:malloc fail for current_block.user_info.buf\012"
	.ascii	"\000"
.LC55:
	.ascii	"[NE]%s:malloc fail for assist_block.user_info.buf\012"
	.ascii	"\000"
.LC56:
	.ascii	"[NE]%s:malloc fail for zone_phy_page_map_for_gc.buf"
	.ascii	"\012\000"
	.ident	"GCC: (Linaro GCC 7.2-2017.11) 7.2.1 20171011"
	.section	.note.GNU-stack,"",%progbits
