	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepErrorHelpbox
StartPrepErrorHelpbox: @ 0x08090D20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08090D3C
	cmp r1, #0
	bge _08090D3C
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
_08090D3C:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08090D54 @ =0x08CC43F4
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08090D54: .4byte 0x08CC43F4
