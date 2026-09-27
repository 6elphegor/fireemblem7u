	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F770
sub_0800F770: @ 0x0800F770
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r4, [r1, #8]
	ldr r2, [r1, #0xc]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F7AC
	cmp r2, #0
	beq _0800F7A4
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	movs r1, #2
	adds r2, r3, #0
	adds r3, r4, #0
	bl WmMergeFace
	b _0800F7AC
_0800F7A4:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080B39D8
_0800F7AC:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
