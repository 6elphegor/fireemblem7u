	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057A20
sub_08057A20: @ 0x08057A20
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08057A7C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057A80 @ =0x08BA18BC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r3, _08057A84 @ =0x08BAA2A8
	cmp r0, #0
	bne _08057A50
	ldr r3, _08057A88 @ =0x08BA96A8
_08057A50:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _08057A8C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08057A96
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057A90
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _08057AAA
	.align 2, 0
_08057A7C: .4byte 0x0201774C
_08057A80: .4byte 0x08BA18BC
_08057A84: .4byte 0x08BAA2A8
_08057A88: .4byte 0x08BA96A8
_08057A8C: .4byte 0x0203E02C
_08057A90:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _08057AAA
_08057A96:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057AA6
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _08057AAA
_08057AA6:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_08057AAA:
	strh r0, [r4, #2]
	ldr r0, _08057AC8 @ =0x081EF21C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057ACC @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057AC8: .4byte 0x081EF21C
_08057ACC: .4byte 0x081EE51C
