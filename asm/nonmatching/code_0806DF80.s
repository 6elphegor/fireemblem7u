	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DF80
sub_0806DF80: @ 0x0806DF80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r2, #1
	ands r1, r2
	adds r3, r1, #0
	lsls r2, r3, #0x18
	lsrs r1, r2, #0x18
	cmp r1, #0
	beq _0806DFCC
	movs r1, #2
	b _0806DFD0
_0806DFCC:
	movs r1, #2
	rsbs r1, r1, #0
_0806DFD0:
	movs r2, #0
	bl sub_0806DB48
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xb
	bls _0806DFF6
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0
	bl sub_0806DB48
	ldr r0, [r7]
	bl Proc_Break
_0806DFF6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
