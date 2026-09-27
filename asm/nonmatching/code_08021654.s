	.include "macro.inc"

	.syntax unified

	thumb_func_start GenericSelection_BackToUM
GenericSelection_BackToUM: @ 0x08021654
	push {lr}
	bl EndTargetSelection
	ldr r0, _080216A0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl HideMoveRangeGraphics
	ldr r0, _080216A4 @ =0x08B95AAC
	ldr r2, _080216A8 @ =0x0202BBB8
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	ldr r1, _080216AC @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_080216A0: .4byte 0x02023C60
_080216A4: .4byte 0x08B95AAC
_080216A8: .4byte 0x0202BBB8
_080216AC: .4byte 0x03004690
