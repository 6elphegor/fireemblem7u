	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStringTextLen
GetStringTextLen: @ 0x080055FC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _08005618 @ =0x02028D70
	ldr r1, [r0]
	adds r5, r0, #0
	ldrb r1, [r1, #0x16]
	cmp r1, #5
	beq _08005644
	adds r0, r2, #0
	bl sub_08005C00
	b _0800564C
	.align 2, 0
_08005618: .4byte 0x02028D70
_0800561C:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08005644
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08005654 @ =0xFFFFFF00
	adds r0, r0, r1
_08005634:
	ldr r0, [r0]
	cmp r0, #0
	beq _08005644
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _08005634
	ldrb r0, [r0, #5]
	adds r4, r0, r4
_08005644:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _0800561C
	adds r0, r4, #0
_0800564C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005654: .4byte 0xFFFFFF00
