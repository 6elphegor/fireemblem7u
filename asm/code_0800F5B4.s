	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F5B4
sub_0800F5B4: @ 0x0800F5B4
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	ldr r4, [r1, #8]
	ldr r3, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0800F5D8
	adds r0, r2, #0
	bl EndFaceById
	b _0800F5F8
_0800F5D8:
	cmp r3, #0
	beq _0800F5EE
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl WmMergeFace
	b _0800F5F8
_0800F5EE:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_080B4E88
_0800F5F8:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
