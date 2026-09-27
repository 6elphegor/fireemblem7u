	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F844
sub_0800F844: @ 0x0800F844
	push {lr}
	sub sp, #0xc
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800F87C
	cmp r2, #0
	beq _0800F876
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #0
	bl WmMergeFace
	b _0800F87C
_0800F876:
	adds r0, r3, #0
	bl sub_080B5844
_0800F87C:
	movs r0, #0
	add sp, #0xc
	pop {r1}
	bx r1
