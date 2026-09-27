	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBaStart_InitBattleScreen
ekrBaStart_InitBattleScreen: @ 0x08050CDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08050D08 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050D40
	bl NewEkrGauge
	bl NewEkrDispUP
	ldr r0, _08050D0C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _08050D10
	cmp r0, #3
	ble _08050D40
	cmp r0, #4
	beq _08050D38
	b _08050D40
	.align 2, 0
_08050D08: .4byte 0x0203E008
_08050D0C: .4byte 0x0203E02C
_08050D10:
	ldr r4, _08050D34 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08050D22
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
_08050D22:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08050D40
	bl EkrGauge_0804CC58
	bl EkrDispUP_0804D5B4
	b _08050D40
	.align 2, 0
_08050D34: .4byte 0x0203E010
_08050D38:
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
_08050D40:
	bl EfxClearScreenFx
	movs r0, #0
	bl NewEkrUnitKakudai
	movs r0, #0
	bl NewEkrBaseKaiten
	movs r0, #0
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl NewEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl NewEkrBaseAppear
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
