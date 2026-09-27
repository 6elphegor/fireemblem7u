	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099358
sub_08099358: @ 0x08099358
	push {r4, lr}
	ldr r4, _080993FC @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r2, #3
	ldrb r0, [r4, #0x10]
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r2, r1
	strb r2, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	movs r0, #4
	bl ApplyIconPalettes
	bl PrepRestartMuralBackground
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080993FC: .4byte 0x03002870
