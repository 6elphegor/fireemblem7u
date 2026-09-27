	.include "macro.inc"

	.syntax unified

	thumb_func_start ConfigSysHandCursorShadowEnabled
ConfigSysHandCursorShadowEnabled: @ 0x080A9594
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A95B0 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A95A8
	adds r0, #0x34
	strb r4, [r0]
_080A95A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A95B0: .4byte 0x08CE4AC8
