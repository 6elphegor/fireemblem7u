	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C65C
sub_0801C65C: @ 0x0801C65C
	push {r4, r5, r6, lr}
	ldr r4, _0801C6B0 @ =0x0202BBB8
	adds r5, r4, #0
	adds r5, #0x3e
	movs r6, #1
	adds r0, r6, #0
	ldrb r1, [r5]
	ands r0, r1
	bl sub_0801B008
	ldr r0, _0801C6B4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0801C6B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C690
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0801C690:
	movs r0, #8
	ldrb r1, [r4, #4]
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	adds r0, r6, #0
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0801C6BC
	movs r0, #5
	bl DisplayMoveRangeGraphics
	b _0801C6C2
	.align 2, 0
_0801C6B0: .4byte 0x0202BBB8
_0801C6B4: .4byte 0x0202E3E4
_0801C6B8: .4byte 0x0202BBF8
_0801C6BC:
	movs r0, #3
	bl DisplayMoveRangeGraphics
_0801C6C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
