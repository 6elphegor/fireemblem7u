	.include "macro.inc"

	.syntax unified

	thumb_func_start SysBlackBoxSetGfx
SysBlackBoxSetGfx: @ 0x080A91D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A91F8 @ =0x08CE4A80
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A91F2
	lsls r0, r4, #0xf
	lsrs r0, r0, #0x14
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, _080A91FC @ =0x08403A48
	ldr r2, _080A9200 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A91F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A91F8: .4byte 0x08CE4A80
_080A91FC: .4byte 0x08403A48
_080A9200: .4byte 0x06010000
