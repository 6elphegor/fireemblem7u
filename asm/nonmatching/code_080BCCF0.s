	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCCF0
sub_080BCCF0: @ 0x080BCCF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #8
	mov sb, r0
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _080BCD2C
	ldr r0, [r5, #0x2c]
	bl sub_080BD570
	str r0, [r5, #0x30]
	cmp r0, #0
	bne _080BCD2C
	ldr r0, [r5, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BCD24
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BCDA4
_080BCD24:
	adds r0, r5, #0
	bl Proc_Break
	b _080BCDA4
_080BCD2C:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r1, sb
	bl __divsi3
	adds r7, r0, #0
	subs r7, #0x10
	ldr r0, [r5, #0x30]
	muls r0, r7, r0
	ldr r6, [r5, #0x3c]
	cmp r6, r0
	bge _080BCD9E
	adds r0, r6, #0
	adds r1, r7, #0
	bl __modsi3
	adds r4, r0, #0
	movs r0, #0x40
	mov r1, sb
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsi3
	mov r8, r0
	cmp r4, #0
	bne _080BCD80
	adds r0, r6, #0
	adds r1, r7, #0
	bl __divsi3
	ldr r1, [r5, #0x2c]
	lsls r2, r0, #2
	adds r1, r1, r2
	ldr r2, [r1]
	lsls r0, r0, #0xb
	ldr r1, [r5, #0x38]
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_080BCB1C
_080BCD80:
	mov r1, r8
	lsls r0, r1, #6
	ldr r3, [r5, #0x38]
	adds r3, r3, r0
	ldr r0, [r5, #0x3c]
	str r0, [sp]
	movs r0, #2
	movs r1, #2
	mov r2, sb
	bl sub_080BCB34
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	b _080BCDA4
_080BCD9E:
	adds r0, r5, #0
	bl Proc_Break
_080BCDA4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
