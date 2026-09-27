	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSioErrorScreen
StartSioErrorScreen: @ 0x080867C0
	push {lr}
	ldr r1, _080867E8 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _080867EC @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080867F0 @ =OnVBlank_SioError
	bl SetOnVBlank
	ldr r0, _080867F4 @ =OnMain_SioError
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
_080867E8: .4byte 0x04000004
_080867EC: .4byte 0x04000208
_080867F0: .4byte OnVBlank_SioError
_080867F4: .4byte OnMain_SioError
