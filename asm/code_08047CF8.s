	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047CF8
sub_08047CF8: @ 0x08047CF8
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x58]
	movs r6, #3
	ands r6, r0
	cmp r0, #0
	bge _08047D06
	adds r0, #3
_08047D06:
	asrs r4, r0, #2
	ldr r0, _08047D44 @ =0x081CBAF0
	ldr r1, _08047D48 @ =0x06000800
	bl Decompress
	ldr r0, _08047D4C @ =0x081C4A68
	ldr r5, _08047D50 @ =0x02020140
	adds r1, r5, #0
	bl Decompress
	lsls r0, r6, #8
	lsls r4, r4, #0xb
	adds r0, r0, r4
	adds r0, r0, r5
	ldr r1, _08047D54 @ =0x06014000
	movs r2, #8
	movs r3, #2
	bl sub_08047CB8
	ldr r0, _08047D58 @ =0x02023C60
	ldr r1, _08047D5C @ =0x081CBCD0
	movs r2, #0x82
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047D44: .4byte 0x081CBAF0
_08047D48: .4byte 0x06000800
_08047D4C: .4byte 0x081C4A68
_08047D50: .4byte 0x02020140
_08047D54: .4byte 0x06014000
_08047D58: .4byte 0x02023C60
_08047D5C: .4byte 0x081CBCD0
