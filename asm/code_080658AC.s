	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDragonDeadFallHead_Loop1
EfxDragonDeadFallHead_Loop1: @ 0x080658AC
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bne _080658D2
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_080658D2:
	pop {r0}
	bx r0
	.align 2, 0
