	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096198
sub_08096198: @ 0x08096198
	push {lr}
	sub sp, #4
	ldr r0, _080961C4 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x32
	movs r2, #5
	movs r3, #2
	bl PrepItemDrawPopupBox
	ldr r3, _080961C8 @ =0x08B905F8
	ldr r0, _080961CC @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x36
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080961C4: .4byte 0x0000A980
_080961C8: .4byte 0x08B905F8
_080961CC: .4byte 0x0000B088
