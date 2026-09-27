	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096160
sub_08096160: @ 0x08096160
	push {lr}
	sub sp, #4
	ldr r0, _0809618C @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x22
	movs r2, #5
	movs r3, #2
	bl PrepItemDrawPopupBox
	ldr r3, _08096190 @ =0x08B905F8
	ldr r0, _08096194 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x26
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809618C: .4byte 0x0000A980
_08096190: .4byte 0x08B905F8
_08096194: .4byte 0x0000B080
