	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetClassRank
AiGetClassRank: @ 0x08037044
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _08037050 @ =0x08B970C8
	b _0803706C
	.align 2, 0
_08037050: .4byte 0x08B970C8
_08037054:
	ldr r1, [r2]
	b _0803705E
_08037058:
	cmp r0, r4
	beq _08037072
	adds r1, #1
_0803705E:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08037058
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
_0803706C:
	ldr r0, [r2]
	cmp r0, #0
	bne _08037054
_08037072:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
