	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattleLvupHanlder
EkrBattleLvupHanlder: @ 0x0804BE2C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0804BE70
	ldr r2, _0804BE54 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0804BE5C
	ldr r0, _0804BE58 @ =0x0203E0D0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804BE66
	.align 2, 0
_0804BE54: .4byte 0x0203E0D4
_0804BE58: .4byte 0x0203E0D0
_0804BE5C:
	ldr r0, _0804BEDC @ =0x0203E0D0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804BE66:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804BE70
	bl NewEkrLvlupFan
_0804BE70:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _0804BF08
	bl SpellFx_ClearBG1
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _0804BEE0 @ =0x03002870
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
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _0804BEE4 @ =0x0203E0D4
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0804BEE8
	ldr r0, _0804BEDC @ =0x0203E0D0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804BEF2
	.align 2, 0
_0804BEDC: .4byte 0x0203E0D0
_0804BEE0: .4byte 0x03002870
_0804BEE4: .4byte 0x0203E0D4
_0804BEE8:
	ldr r0, _0804BEFC @ =0x0203E0D0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804BEF2:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804BF04
	ldr r0, _0804BF00 @ =EkrBattleExecEkrLvup
	b _0804BF06
	.align 2, 0
_0804BEFC: .4byte 0x0203E0D0
_0804BF00: .4byte EkrBattleExecEkrLvup
_0804BF04:
	ldr r0, _0804BF10 @ =EkrBattleExecPopup
_0804BF06:
	str r0, [r4, #0xc]
_0804BF08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF10: .4byte EkrBattleExecPopup
