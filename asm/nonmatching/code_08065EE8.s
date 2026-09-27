	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonFxMainHandler
EkrDragonFxMainHandler: @ 0x08065EE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _08065F58
	str r1, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r1, #9
	bhi _08065F58
	lsls r0, r1, #2
	ldr r1, _08065F10 @ =_08065F14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065F10: .4byte _08065F14
_08065F14: @ jump table
	.4byte _08065F3C @ case 0
	.4byte _08065F44 @ case 1
	.4byte _08065F3C @ case 2
	.4byte _08065F44 @ case 3
	.4byte _08065F4C @ case 4
	.4byte _08065F4C @ case 5
	.4byte _08065F54 @ case 6
	.4byte _08065F54 @ case 7
	.4byte _08065F54 @ case 8
	.4byte _08065F3C @ case 9
_08065F3C:
	ldr r0, _08065F40 @ =0x082DE7AA
	b _08065F56
	.align 2, 0
_08065F40: .4byte 0x082DE7AA
_08065F44:
	ldr r0, _08065F48 @ =0x082DE7BC
	b _08065F56
	.align 2, 0
_08065F48: .4byte 0x082DE7BC
_08065F4C:
	ldr r0, _08065F50 @ =0x082DE7CE
	b _08065F56
	.align 2, 0
_08065F50: .4byte 0x082DE7CE
_08065F54:
	ldr r0, _08065F8C @ =0x082DE7A4
_08065F56:
	str r0, [r4, #0x48]
_08065F58:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08065F98
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08065F90 @ =0x02019784
	bl LZ77UnCompWram
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065F94 @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	b _0806600C
	.align 2, 0
_08065F8C: .4byte 0x082DE7A4
_08065F90: .4byte 0x02019784
_08065F94: .4byte 0x0201FB00
_08065F98:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08065FC6
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08065FBC
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0806600C
	b _08065FD6
_08065FBC:
	bl CheckEkrHitDone
	cmp r0, #1
	bne _0806600C
	b _08066000
_08065FC6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08065FEA
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08065FDC
_08065FD6:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _0806600C
_08065FDC:
	ldr r1, [r4, #0x5c]
	movs r0, #8
	ldrh r1, [r1, #0x10]
	ands r0, r1
	cmp r0, #0
	beq _0806600C
	b _08066000
_08065FEA:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806600C
	ldr r0, _08066014 @ =0x000002F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066000:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_0806600C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066014: .4byte 0x000002F2
