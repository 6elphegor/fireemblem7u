	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleForecastPanelSide
GetBattleForecastPanelSide: @ 0x08033354
	ldr r0, _08033370 @ =0x0203A470
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _08033374 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	bgt _08033378
	movs r0, #1
	b _08033384
	.align 2, 0
_08033370: .4byte 0x0203A470
_08033374: .4byte 0x0202BBB8
_08033378:
	cmp r0, #0x70
	bgt _08033380
	movs r0, #0
	b _08033384
_08033380:
	movs r0, #1
	rsbs r0, r0, #0
_08033384:
	bx lr
	.align 2, 0
