	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnkUiHand
PutUnkUiHand: @ 0x08049FC8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _08049FFC @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _0804A000 @ =0x08B9A860
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049FFC: .4byte 0x08B9A868
_0804A000: .4byte 0x08B9A860
