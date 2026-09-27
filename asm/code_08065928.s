	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonFlashingWingBg_Loop
EkrDragonFlashingWingBg_Loop: @ 0x08065928
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08065944
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08065A0A
_08065944:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08065956
	cmp r1, #1
	beq _08065970
	b _0806598C
_08065956:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08065968 @ =0x082DE598
	str r0, [r4, #0x48]
	ldr r0, _0806596C @ =0x082E0FEC
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	b _0806598C
	.align 2, 0
_08065968: .4byte 0x082DE598
_0806596C: .4byte 0x082E0FEC
_08065970:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080659B8 @ =0x082DE5AA
	str r0, [r4, #0x48]
	ldr r0, _080659BC @ =0x082E0FEC
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
	ldr r0, [r4, #0x5c]
	movs r1, #0x3c
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
_0806598C:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080659C4
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080659C0 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _080659E8
	.align 2, 0
_080659B8: .4byte 0x082DE5AA
_080659BC: .4byte 0x082E0FEC
_080659C0: .4byte 0x02022920
_080659C4:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080659D2
	movs r0, #0
	strb r0, [r5]
	b _080659E8
_080659D2:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080659E8
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080659E8:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _08065A04
	adds r0, r1, #0
	cmp r0, #1
	beq _080659FC
	cmp r0, #3
	bne _08065A00
_080659FC:
	movs r0, #1
	b _08065A02
_08065A00:
	movs r0, #0
_08065A02:
	strb r0, [r5]
_08065A04:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_08065A0A:
	pop {r4, r5}
	pop {r0}
	bx r0
