	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxClouds_Update
WfxClouds_Update: @ 0x0802DD2C
	push {lr}
	sub sp, #4
	ldr r0, _0802DD54 @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	rsbs r2, r2, #0
	ldr r3, _0802DD58 @ =0x08B96214
	ldr r0, _0802DD5C @ =0x0000AC12
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802DD54: .4byte 0x0202BBB8
_0802DD58: .4byte 0x08B96214
_0802DD5C: .4byte 0x0000AC12
