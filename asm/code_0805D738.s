	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D738
sub_0805D738: @ 0x0805D738
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _0805D768
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxReserveOBJ
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _0805D800
_0805D768:
	cmp r1, #0x34
	bne _0805D780
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxReserveBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805D8DC
	b _0805D800
_0805D780:
	cmp r1, #0xb7
	bne _0805D7EC
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	bl sub_0805D970
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805DB34
	ldr r3, _0805D7E8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl StartSubSpell_efxLiveALPHA
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl StartSubSpell_efxLiveALPHA
	b _0805D800
	.align 2, 0
_0805D7E8: .4byte 0x03002870
_0805D7EC:
	ldr r0, _0805D808 @ =0x000001C5
	cmp r1, r0
	bne _0805D800
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805D800:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D808: .4byte 0x000001C5
