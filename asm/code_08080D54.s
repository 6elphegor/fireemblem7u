	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenSprites_BumpCheck
StatScreenSprites_BumpCheck: @ 0x08080D54
	adds r1, r0, #0
	ldr r2, _08080D84 @ =0x0200310C
	movs r0, #0x20
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D6A
	movs r0, #0x1f
	strh r0, [r1, #0x32]
	movs r0, #0x63
	strh r0, [r1, #0x2a]
_08080D6A:
	movs r0, #0x10
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D7C
	movs r0, #0x1f
	strh r0, [r1, #0x34]
	movs r0, #0xd0
	strh r0, [r1, #0x2c]
_08080D7C:
	movs r0, #0
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08080D84: .4byte 0x0200310C
