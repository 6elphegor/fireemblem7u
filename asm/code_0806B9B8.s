	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpellAssocStructPtr
GetSpellAssocStructPtr: @ 0x0806B9B8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0806B9E4 @ =0x08C999C0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4]
	ldr r2, _0806B9E8 @ =0x0000FFFF
	cmp r1, r2
	beq _0806B9DC
_0806B9D0:
	cmp r1, r0
	beq _0806B9DC
	adds r4, #0x10
	ldrh r1, [r4]
	cmp r1, r2
	bne _0806B9D0
_0806B9DC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806B9E4: .4byte 0x08C999C0
_0806B9E8: .4byte 0x0000FFFF
