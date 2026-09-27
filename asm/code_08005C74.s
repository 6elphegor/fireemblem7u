	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSpriteText
InitSpriteText: @ 0x08005C74
	ldr r1, _08005C94 @ =0x02028D70
	ldr r3, [r1]
	ldrh r1, [r3, #0x12]
	movs r2, #0
	strh r1, [r0]
	movs r1, #0x20
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r1, [r3, #0x12]
	adds r1, #0x40
	strh r1, [r3, #0x12]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_08005C94: .4byte 0x02028D70
