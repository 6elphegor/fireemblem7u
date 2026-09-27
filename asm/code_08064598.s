	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopThunderOBJ
StartCRSubSpell_efxopThunderOBJ: @ 0x08064598
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetMagicEffectBufferFor
	adds r7, r0, #0
	ldr r0, _080645D4 @ =0x08BA48E8
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _080645D8 @ =0x08BB3F30
	ldr r3, _080645DC @ =0x08BB3404
	adds r0, r5, #0
	movs r1, #1
	bl sub_080640D4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080645E0
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _080645E4
	.align 2, 0
_080645D4: .4byte 0x08BA48E8
_080645D8: .4byte 0x08BB3F30
_080645DC: .4byte 0x08BB3404
_080645E0:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_080645E4:
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r2, [r7, #6]
	adds r0, r1, r2
	strh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldrh r7, [r7, #8]
	adds r0, r1, r7
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _0806460C @ =0x081FC634
	bl sub_0806421C
	ldr r0, [r6, #0x5c]
	ldr r1, _08064610 @ =0x081FC19C
	bl sub_080641EC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806460C: .4byte 0x081FC634
_08064610: .4byte 0x081FC19C
