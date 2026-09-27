	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLightningBG
StartSubSpell_efxLightningBG: @ 0x08059F18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059F6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059F70 @ =0x08BA224C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059F74 @ =0x081E85D4
	str r0, [r5, #0x48]
	ldr r0, _08059F78 @ =0x08BA236C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059F7C @ =0x08BA2264
	str r0, [r5, #0x54]
	ldr r0, _08059F80 @ =0x08BA22E8
	str r0, [r5, #0x58]
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08059F84 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059F92
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059F88
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059F92
	.align 2, 0
_08059F6C: .4byte 0x0201774C
_08059F70: .4byte 0x08BA224C
_08059F74: .4byte 0x081E85D4
_08059F78: .4byte 0x08BA236C
_08059F7C: .4byte 0x08BA2264
_08059F80: .4byte 0x08BA22E8
_08059F84: .4byte 0x0203E02C
_08059F88:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059F92:
	pop {r4, r5}
	pop {r0}
	bx r0
