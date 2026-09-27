	.include "macro.inc"

	.syntax unified

	thumb_func_start AiUpdateNoMoveFlag
AiUpdateNoMoveFlag: @ 0x0803C0C8
	adds r0, #0x40
	movs r1, #0x80
	lsls r1, r1, #6
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803C0E8
	ldr r0, _0803C0E4 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0803C0F4
	.align 2, 0
_0803C0E4: .4byte 0x0203A8EC
_0803C0E8:
	ldr r1, _0803C0F8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0803C0F4:
	bx lr
	.align 2, 0
_0803C0F8: .4byte 0x0203A8EC
