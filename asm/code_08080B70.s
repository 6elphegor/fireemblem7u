	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenPageName_Main
StatScreenPageName_Main: @ 0x08080B70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl PutUpdateStatScreenPageName
	ldr r1, _08080B94 @ =0x0200310C
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08080B98
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _08080B9C
	.align 2, 0
_08080B94: .4byte 0x0200310C
_08080B98:
	ldrb r0, [r1]
	strb r0, [r5]
_08080B9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
