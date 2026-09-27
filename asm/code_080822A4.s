	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080822A4
sub_080822A4: @ 0x080822A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080822AE
	movs r4, #0x4a
_080822AE:
	cmp r4, #0x4b
	beq _080822D0
	cmp r4, #0x4b
	bgt _080822BC
	cmp r4, #0x4a
	beq _080822C2
	b _080822E8
_080822BC:
	cmp r4, #0x4c
	beq _080822DC
	b _080822E8
_080822C2:
	ldr r0, _080822CC @ =0x000005D2
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822CC: .4byte 0x000005D2
_080822D0:
	ldr r0, _080822D8 @ =0x000005D3
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822D8: .4byte 0x000005D3
_080822DC:
	ldr r0, _080822E4 @ =0x000005D4
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822E4: .4byte 0x000005D4
_080822E8:
	movs r0, #0x7f
	ands r0, r4
	bl GetChapterInfo
	asrs r1, r4, #7
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #1
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
_08082302:
	pop {r4}
	pop {r1}
	bx r1
