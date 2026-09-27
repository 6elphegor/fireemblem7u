	.include "macro.inc"

	.syntax unified

	thumb_func_start Minimap_InitProcVars
Minimap_InitProcVars: @ 0x080A3148
	adds r2, r0, #0
	adds r2, #0x4a
	movs r1, #0
	strh r1, [r2]
	ldr r2, _080A3164 @ =0x0202E3D8
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
_080A3164: .4byte 0x0202E3D8
