	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020AD0
sub_08020AD0: @ 0x08020AD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020B60 @ =0x0819B558
	ldr r1, _08020B64 @ =0x06002000
	bl Decompress
	ldr r0, _08020B68 @ =0x0819C56C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08020B6C @ =0x0819C58C
	ldr r4, _08020B70 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020AFA:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020AFA
	ldr r0, _08020B74 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r3, _08020B78 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020B7C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020B80 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020B60: .4byte 0x0819B558
_08020B64: .4byte 0x06002000
_08020B68: .4byte 0x0819C56C
_08020B6C: .4byte 0x0819C58C
_08020B70: .4byte 0x0200323C
_08020B74: .4byte 0x02022C60
_08020B78: .4byte 0x03002870
_08020B7C: .4byte 0x0000FFE0
_08020B80: .4byte 0x0000E0FF
