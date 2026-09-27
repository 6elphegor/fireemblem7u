	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F7B8
sub_0800F7B8: @ 0x0800F7B8
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r3, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F7D6
	movs r0, #0
	b _0800F7F4
_0800F7D6:
	cmp r3, #0
	beq _0800F7EC
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r3, #0
	movs r1, #3
	movs r3, #0
	bl WmMergeFace
	b _0800F7F2
_0800F7EC:
	adds r0, r2, #0
	bl sub_080B3AFC
_0800F7F2:
	movs r0, #2
_0800F7F4:
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
