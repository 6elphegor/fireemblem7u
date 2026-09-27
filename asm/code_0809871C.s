	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809871C
sub_0809871C: @ 0x0809871C
	push {r4, lr}
	sub sp, #4
	movs r0, #0xaa
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x68
	movs r2, #8
	movs r3, #4
	bl PrepItemDrawPopupBox
	ldr r4, _0809877C @ =0x08B905F8
	ldr r0, _08098780 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08098784 @ =0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x6c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _08098788 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809878C @ =0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x7c
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809877C: .4byte 0x08B905F8
_08098780: .4byte 0x0000B088
_08098784: .4byte 0x0000B08C
_08098788: .4byte 0x0000B080
_0809878C: .4byte 0x0000B084
