	.include "macro.inc"

	.syntax unified

	thumb_func_start efxResireBG_Loop_B
efxResireBG_Loop_B: @ 0x08059BD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08059BFC @ =0x02017750
	ldr r0, [r5]
	cmp r0, #2
	bne _08059C04
	ldr r1, _08059C00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_End
	b _08059C5E
	.align 2, 0
_08059BFC: .4byte 0x02017750
_08059C00: .4byte 0x0201774C
_08059C04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble _08059C1C
	strh r1, [r4, #0x2c]
_08059C1C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne _08059C5E
	ldr r0, [r5]
	cmp r0, #1
	bne _08059C5E
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, _08059C64 @ =0x081E8570
	str r0, [r4, #0x48]
	ldr r0, _08059C68 @ =0x08BA2150
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _08059C6C @ =0x08BA2084
	str r0, [r4, #0x54]
	ldr r0, _08059C70 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059C58
	bl EfxGetCamMovDuration
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08059C58:
	adds r0, r4, #0
	bl Proc_Break
_08059C5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059C64: .4byte 0x081E8570
_08059C68: .4byte 0x08BA2150
_08059C6C: .4byte 0x08BA2084
_08059C70: .4byte 0x0203E02C
