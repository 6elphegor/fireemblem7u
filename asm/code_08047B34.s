	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047B34
sub_08047B34: @ 0x08047B34
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _08047BB8 @ =0x081D5516
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _08047BBC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl ApplySystemGraphics
	ldr r0, _08047BC0 @ =0x081C7F84
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r4, _08047BC4 @ =0x081CBD4C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08047BC8 @ =0x081CDEFC
	ldr r1, _08047BCC @ =0x02024460
	bl Decompress
	ldr r0, _08047BD0 @ =0x081CE21C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047BB8: .4byte 0x081D5516
_08047BBC: .4byte 0x03002870
_08047BC0: .4byte 0x081C7F84
_08047BC4: .4byte 0x081CBD4C
_08047BC8: .4byte 0x081CDEFC
_08047BCC: .4byte 0x02024460
_08047BD0: .4byte 0x081CE21C
