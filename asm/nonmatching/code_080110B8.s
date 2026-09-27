	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BgFadeToMap
EvtCmd_BgFadeToMap: @ 0x080110B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r2, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080110F8
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r2, [r4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080110F4
	movs r0, #0xff
	strb r0, [r4]
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
_080110F4:
	movs r0, #0
	b _08011110
_080110F8:
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r2, #0
	adds r1, r5, #0
	bl StartEvtBgFadeToMap
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4d
	strb r6, [r0]
	movs r0, #2
_08011110:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
