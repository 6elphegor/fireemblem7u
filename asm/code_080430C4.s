	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_8048730
XMapTransfer_8048730: @ 0x080430C4
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r5, #0
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	ldr r0, _08043120 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _08043124 @ =0x0203D970
	ldr r0, _08043128 @ =0x00000771
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _0804312C @ =0x0202303C
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043120: .4byte 0x0203DA60
_08043124: .4byte 0x0203D970
_08043128: .4byte 0x00000771
_0804312C: .4byte 0x0202303C
