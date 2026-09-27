	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopFireOBJ
StartCRSubSpell_efxopFireOBJ: @ 0x08064358
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetMagicEffectBufferFor
	adds r7, r0, #0
	ldr r0, _08064394 @ =0x08BA4868
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08064398 @ =0x08BB46D0
	ldr r3, _0806439C @ =0x08BB4348
	adds r0, r5, #0
	movs r1, #1
	bl sub_080640D4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080643A0
	ldrh r0, [r5, #2]
	subs r0, #8
	b _080643A4
	.align 2, 0
_08064394: .4byte 0x08BA4868
_08064398: .4byte 0x08BB46D0
_0806439C: .4byte 0x08BB4348
_080643A0:
	ldrh r0, [r5, #2]
	adds r0, #8
_080643A4:
	strh r0, [r4, #2]
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r4, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r7, #6]
	adds r1, r2, r3
	strh r1, [r4, #2]
	ldrh r7, [r7, #8]
	adds r0, r7, r0
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _080643D0 @ =0x081FEE00
	bl sub_0806421C
	ldr r0, [r6, #0x5c]
	ldr r1, _080643D4 @ =0x081FE804
	bl sub_080641EC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080643D0: .4byte 0x081FEE00
_080643D4: .4byte 0x081FE804
