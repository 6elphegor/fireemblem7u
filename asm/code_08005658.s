	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCharTextLen
GetCharTextLen: @ 0x08005658
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08005674 @ =0x02028D70
	ldr r1, [r0]
	ldrb r0, [r1, #0x16]
	cmp r0, #5
	beq _08005678
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_08005BD0
	b _0800569C
	.align 2, 0
_08005674: .4byte 0x02028D70
_08005678:
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080056A4 @ =0xFFFFFF00
	adds r0, r0, r1
_0800568A:
	ldr r0, [r0]
	cmp r0, #0
	beq _0800569A
	ldrb r1, [r0, #4]
	cmp r1, r3
	bne _0800568A
	ldrb r0, [r0, #5]
	str r0, [r4]
_0800569A:
	adds r0, r2, #0
_0800569C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080056A4: .4byte 0xFFFFFF00
