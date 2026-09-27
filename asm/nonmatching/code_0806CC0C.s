	.include "macro.inc"

	.syntax unified

	thumb_func_start Mu_OnLoop
Mu_OnLoop: @ 0x0806CC0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806CC64
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806CC4C
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #3
	beq _0806CC46
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #2
	beq _0806CC46
	b _0806CC4C
_0806CC46:
	ldr r0, [r7]
	bl RunMuMoveScript
_0806CC4C:
	ldr r0, _0806CC7C @ =0x08C9CFEC
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x3f
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r7]
	bl _call_via_r1
_0806CC64:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xf
	bne _0806CC80
	ldr r0, [r7]
	bl sub_0806D148
	b _0806CC86
	.align 2, 0
_0806CC7C: .4byte 0x08C9CFEC
_0806CC80:
	ldr r0, [r7]
	bl sub_0806D250
_0806CC86:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
