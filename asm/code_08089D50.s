	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089D50
sub_08089D50: @ 0x08089D50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldr r1, _08089D7C @ =0x0200CBF0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08089D84
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _08089D80 @ =0x000003B1
	b _08089DAE
	.align 2, 0
_08089D7C: .4byte 0x0200CBF0
_08089D80: .4byte 0x000003B1
_08089D84:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08089DC6
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089DBC
	adds r0, r5, #0
	bl sub_08090DB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089DBC
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x38
	ldr r2, _08089DB8 @ =0x000003AD
_08089DAE:
	movs r0, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _08089DCE
	.align 2, 0
_08089DB8: .4byte 0x000003AD
_08089DBC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08089C00
	b _08089DCE
_08089DC6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08089CA8
_08089DCE:
	pop {r4, r5}
	pop {r0}
	bx r0
