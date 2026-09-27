	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099FA0
sub_08099FA0: @ 0x08099FA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08099358
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl LoadUiSpinningArrowGfx
	movs r0, #3
	bl SetUiSpinningArrowConfig
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl SetUiSpinningArrowPositions
	ldr r3, _0809A020 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A020: .4byte 0x03002870
