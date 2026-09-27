	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096110
sub_08096110: @ 0x08096110
	push {r4, lr}
	sub sp, #4
	ldr r0, _08096150 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r4, _08096154 @ =0x08B905F8
	ldr r0, _08096158 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809615C @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096150: .4byte 0x0000A980
_08096154: .4byte 0x08B905F8
_08096158: .4byte 0x0000B080
_0809615C: .4byte 0x0000B088
