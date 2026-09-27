	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBattleForecastHelpBox
StartBattleForecastHelpBox: @ 0x080341C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08034214 @ =0x08B96D5C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08034238
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034238
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #0x14
	cmp r0, #0
	bge _080341F8
	movs r5, #0
_080341F8:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	beq _08034218
	cmp r0, #2
	beq _0803422C
	b _08034238
	.align 2, 0
_08034214: .4byte 0x08B96D5C
_08034218:
	ldr r0, _08034228 @ =0x08CC2568
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMovingHelpBoxExt
	b _08034238
	.align 2, 0
_08034228: .4byte 0x08CC2568
_0803422C:
	ldr r0, _08034240 @ =0x08CC2610
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMovingHelpBoxExt
_08034238:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034240: .4byte 0x08CC2610
