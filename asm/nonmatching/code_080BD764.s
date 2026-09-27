	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD764
sub_080BD764: @ 0x080BD764
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r1, [sp, #0x2c]
	mov r2, sp
	ldr r0, _080BD848 @ =0x0867735C
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080BD84C @ =0x08CEF750
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x34]
	ldr r2, [r6, #4]
	ldr r0, [r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080BD7AE
	adds r3, r1, #0
	movs r1, #0
_080BD7A0:
	adds r1, #1
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _080BD7A0
	str r1, [r5, #0x34]
_080BD7AE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _080BD7BC
	ldr r0, [r5, #0x34]
	subs r0, #0x14
	mov sb, r0
_080BD7BC:
	mov r0, sb
	lsls r2, r0, #0xd
	str r2, [r5, #0x38]
	str r6, [r5, #0x2c]
	mov r1, r8
	str r1, [r5, #0x30]
	str r4, [r5, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #6
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r6]
	ldr r4, [r0, #0xc]
	cmp r4, #0
	beq _080BD7FA
	mov r0, r8
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
_080BD7FA:
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #0
	beq _080BD812
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _080BD812
	ldr r1, [r1, #4]
	lsls r1, r1, #5
	lsls r2, r2, #5
	bl ApplyPaletteExt
_080BD812:
	movs r4, #1
	rsbs r4, r4, #0
	mov r3, r8
	lsls r7, r3, #2
_080BD81A:
	mov r0, sb
	adds r2, r0, r4
	mov r0, r8
	adds r1, r6, #0
	bl sub_080BD588
	adds r4, #1
	cmp r4, #0x13
	ble _080BD81A
	mov r1, sp
	adds r0, r1, r7
	ldr r0, [r0]
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD848: .4byte 0x0867735C
_080BD84C: .4byte 0x08CEF750
