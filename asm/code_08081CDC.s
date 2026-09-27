	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyHelpBoxContentSize
ApplyHelpBoxContentSize: @ 0x08081CDC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl GetHelpBoxItemInfoKind
	cmp r0, #2
	beq _08081D0E
	cmp r0, #2
	bgt _08081D02
	cmp r0, #1
	beq _08081D08
	b _08081D2A
_08081D02:
	cmp r0, #3
	beq _08081D16
	b _08081D2A
_08081D08:
	movs r4, #0xa0
	adds r5, #0x20
	b _08081D2A
_08081D0E:
	cmp r4, #0x5f
	bgt _08081D28
	movs r4, #0x60
	b _08081D28
_08081D16:
	ldr r0, _08081D3C @ =0x0202BBF8
	adds r0, #0x2b
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	movs r4, #0x40
	cmp r1, #0
	beq _08081D28
	movs r4, #0xc0
_08081D28:
	adds r5, #0x10
_08081D2A:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081D3C: .4byte 0x0202BBF8
