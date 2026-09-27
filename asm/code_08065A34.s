	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonFlashingWingObj_Loop
EkrDragonFlashingWingObj_Loop: @ 0x08065A34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08065A50
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08065AFE
_08065A50:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08065A62
	cmp r1, #1
	beq _08065A70
	b _08065A82
_08065A62:
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _08065A6C @ =0x082DE6A4
	b _08065A78
	.align 2, 0
_08065A6C: .4byte 0x082DE6A4
_08065A70:
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08065AAC @ =0x082DE6AA
_08065A78:
	str r0, [r4, #0x48]
	ldr r0, _08065AB0 @ =0x082E4084
	str r0, [r4, #0x4c]
	movs r0, #0x64
	strb r0, [r5]
_08065A82:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08065AB8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _08065AB4 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	b _08065ADC
	.align 2, 0
_08065AAC: .4byte 0x082DE6AA
_08065AB0: .4byte 0x082E4084
_08065AB4: .4byte 0x02022B40
_08065AB8:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08065AC6
	movs r0, #0
	strb r0, [r5]
	b _08065ADC
_08065AC6:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08065ADC
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl NewEfxFlashBgWhite
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_08065ADC:
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r1, r0
	beq _08065AF8
	adds r0, r1, #0
	cmp r0, #1
	beq _08065AF0
	cmp r0, #3
	bne _08065AF4
_08065AF0:
	movs r0, #1
	b _08065AF6
_08065AF4:
	movs r0, #0
_08065AF6:
	strb r0, [r5]
_08065AF8:
	ldr r0, [r4, #0x5c]
	ldrb r0, [r0, #0x12]
	str r0, [r4, #0x54]
_08065AFE:
	pop {r4, r5}
	pop {r0}
	bx r0
