	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_StartMainBodyIntro
EkrDragon_StartMainBodyIntro: @ 0x08064EE8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08064F50
	ldr r5, _08064F0C @ =0x0203E02C
	ldrh r0, [r5]
	cmp r0, #2
	bne _08064F10
	adds r0, r4, #0
	bl Proc_Break
	b _08064F50
	.align 2, 0
_08064F0C: .4byte 0x0203E02C
_08064F10:
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	bl NewEkrDragonTunkFace
	adds r2, r0, #0
	str r2, [r4, #0x64]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08064F2C
	cmp r0, #1
	beq _08064F3C
	b _08064F44
_08064F2C:
	ldr r1, _08064F38 @ =0x0201FB00
	movs r0, #0x38
	ldrh r1, [r1]
	subs r0, r0, r1
	b _08064F42
	.align 2, 0
_08064F38: .4byte 0x0201FB00
_08064F3C:
	ldr r0, _08064F58 @ =0x0201FB00
	ldrh r0, [r0]
	rsbs r0, r0, #0
_08064F42:
	strh r0, [r2, #0x34]
_08064F44:
	ldr r1, [r4, #0x64]
	movs r0, #0x4c
	strh r0, [r1, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
_08064F50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064F58: .4byte 0x0201FB00
