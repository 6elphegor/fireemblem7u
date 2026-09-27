	.include "macro.inc"

	.syntax unified

	thumb_func_start GetConvoyItemCostSum
GetConvoyItemCostSum: @ 0x0801704C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetConvoyItemArray
	adds r3, r0, #0
	movs r5, #0
	ldrh r0, [r3]
	cmp r0, #0
	beq _08017096
	ldr r7, _0801707C @ =0x08BE222C
_08017060:
	ldrh r4, [r3]
	ldrb r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017080
	ldrh r0, [r2, #0x1a]
	b _08017086
	.align 2, 0
_0801707C: .4byte 0x08BE222C
_08017080:
	asrs r0, r4, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_08017086:
	adds r6, r6, r0
	adds r3, #2
	adds r5, #1
	cmp r5, #0x63
	bgt _08017096
	ldrh r0, [r3]
	cmp r0, #0
	bne _08017060
_08017096:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
