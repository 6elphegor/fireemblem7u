	.include "macro.inc"

	.syntax unified

	thumb_func_start PutString
PutString: @ 0x08014698
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _080146D8 @ =0x03000430
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #7
	cmp r1, #0
	bge _080146B0
	adds r1, #7
_080146B0:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl InitText
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080146D8: .4byte 0x03000430
