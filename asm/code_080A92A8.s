	.include "macro.inc"

	.syntax unified

	thumb_func_start UnblockAllSysBlackBoxs
UnblockAllSysBlackBoxs: @ 0x080A92A8
	push {r4, lr}
	ldr r0, _080A92D0 @ =0x08CE4A80
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A92C8
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #5
	bl SysBlackBoxSetGfx
_080A92C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A92D0: .4byte 0x08CE4A80
