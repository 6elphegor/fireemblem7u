	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleForecastLabels
InitBattleForecastLabels: @ 0x08033410
	push {r4, r5, r6, r7, lr}
	movs r7, #0
_08033414:
	lsls r5, r7, #3
	ldr r0, _08033458 @ =0x02002FDC
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #4
	bl InitText
	ldr r1, _0803345C @ =0x081C4068
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r6, [r0]
	adds r0, r6, #0
	bl DecodeMsg
	adds r1, r0, #0
	movs r0, #0x20
	bl GetStringTextCenteredPos
	adds r4, r0, #0
	adds r0, r6, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r7, #1
	cmp r7, #5
	ble _08033414
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033458: .4byte 0x02002FDC
_0803345C: .4byte 0x081C4068
