	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSpecialItemFuncIndex
GetSpecialItemFuncIndex: @ 0x0803B9C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _0803B9F4 @ =0x081D3BDC
	ldrh r0, [r3]
	cmp r0, #0
	beq _0803BA08
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
_0803B9E2:
	ldrh r0, [r2]
	cmp r5, r0
	bne _0803B9F8
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _0803B9F8
	adds r0, r4, #0
	b _0803BA0C
	.align 2, 0
_0803B9F4: .4byte 0x081D3BDC
_0803B9F8:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, _0803BA14 @ =0x081D3BDC
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803B9E2
_0803BA08:
	movs r0, #1
	rsbs r0, r0, #0
_0803BA0C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803BA14: .4byte 0x081D3BDC
