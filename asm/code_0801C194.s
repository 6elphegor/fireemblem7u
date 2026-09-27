	.include "macro.inc"

	.syntax unified

	thumb_func_start HandlePlayerMapCursor
HandlePlayerMapCursor: @ 0x0801C194
	push {lr}
	ldr r1, _0801C1C8 @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #4]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0801C1D4
	ldr r0, _0801C1CC @ =0x0202BBB8
	ldr r0, [r0, #0x20]
	ldr r1, _0801C1D0 @ =0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0801C1D4
	ldrh r0, [r2, #0x10]
	bl HandleMapCursorInput
	movs r0, #8
	bl HandleMoveMapCursor
	movs r0, #8
	bl HandleMoveCameraWithMapCursor
	b _0801C1E8
	.align 2, 0
_0801C1C8: .4byte 0x08B857F8
_0801C1CC: .4byte 0x0202BBB8
_0801C1D0: .4byte 0x00070007
_0801C1D4:
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	bl HandleMapCursorInput
	movs r0, #4
	bl HandleMoveMapCursor
	movs r0, #4
	bl HandleMoveCameraWithMapCursor
_0801C1E8:
	ldr r0, _0801C20C @ =0x0202BBB8
	ldrh r1, [r0, #0x20]
	ldrh r2, [r0, #0x22]
	orrs r1, r2
	adds r0, r1, #0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C206
	ldr r0, _0801C210 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _0801C214 @ =0x0000FCF4
	ldrh r3, [r1, #8]
	ands r0, r3
	strh r0, [r1, #8]
_0801C206:
	pop {r0}
	bx r0
	.align 2, 0
_0801C20C: .4byte 0x0202BBB8
_0801C210: .4byte 0x08B857F8
_0801C214: .4byte 0x0000FCF4
