	.include "macro.inc"

	.syntax unified

	thumb_func_start TargetSelection_HandleSelectInput
TargetSelection_HandleSelectInput: @ 0x0804AFB0
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0804AFD0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AFD4
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne _0804AFF4
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b _0804AFF0
	.align 2, 0
_0804AFD0: .4byte 0x08B857F8
_0804AFD4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804AFE2
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b _0804AFF0
_0804AFE2:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B000
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
_0804AFF0:
	cmp r3, #0
	beq _0804B000
_0804AFF4:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804B000:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
