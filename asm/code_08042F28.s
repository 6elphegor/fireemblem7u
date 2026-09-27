	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawXMapReceiveProgress
DrawXMapReceiveProgress: @ 0x08042F28
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08042F80
	ldr r0, _08042F88 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08042F4C
	movs r0, #0x7d
	bl m4aSongNumStart
_08042F4C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08042F8C @ =0x0203D970
	ldr r1, _08042F90 @ =0x081D544C
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08042F94 @ =0x0202303C
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
_08042F80:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042F88: .4byte 0x0202BBF8
_08042F8C: .4byte 0x0203D970
_08042F90: .4byte 0x081D544C
_08042F94: .4byte 0x0202303C
