	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkPrintColor
SetTalkPrintColor: @ 0x080080F4
	push {r4, r5, r6, lr}
	ldr r2, _08008128 @ =0x08B909B8
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08008120
	adds r6, r2, #0
	ldr r5, _0800812C @ =0x030000C8
_0800810A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _0800810A
_08008120:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008128: .4byte 0x08B909B8
_0800812C: .4byte 0x030000C8
