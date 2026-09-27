	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStringTextBox
GetStringTextBox: @ 0x080056C4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl MsgExpand
	adds r4, r0, #0
	b _080056DA
_080056D8:
	adds r4, #1
_080056DA:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08005704
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _080056F0
	str r1, [r6]
_080056F0:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl GetStringLineEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _080056D8
_08005704:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
