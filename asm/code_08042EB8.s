	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawXMapSendProgress
DrawXMapSendProgress: @ 0x08042EB8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08042F10
	ldr r0, _08042F18 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08042EDC
	movs r0, #0x7d
	bl m4aSongNumStart
_08042EDC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08042F1C @ =0x0203D970
	ldr r1, _08042F20 @ =0x081D5444
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08042F24 @ =0x0202303C
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
_08042F10:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042F18: .4byte 0x0202BBF8
_08042F1C: .4byte 0x0203D970
_08042F20: .4byte 0x081D5444
_08042F24: .4byte 0x0202303C
