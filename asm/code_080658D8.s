	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDragonDeadFallHead_Loop2
EfxDragonDeadFallHead_Loop2: @ 0x080658D8
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x32]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x3a]
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080658FE
	strh r3, [r1, #0x2c]
	ldr r0, _08065900 @ =0x08BDACB0
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
_080658FE:
	bx lr
	.align 2, 0
_08065900: .4byte 0x08BDACB0
