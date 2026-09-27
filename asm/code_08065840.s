	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDragonDeadFallBody_Blocking
EfxDragonDeadFallBody_Blocking: @ 0x08065840
	ldr r2, [r0, #0x60]
	ldrh r1, [r0, #0x32]
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x3a]
	strh r0, [r2, #4]
	bx lr
