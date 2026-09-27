	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepScreen
EndPrepScreen: @ 0x080311E0
	push {r4, lr}
	movs r4, #1
_080311E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08031222
	ldr r3, [r2]
	cmp r3, #0
	beq _08031222
	ldr r1, [r2, #0xc]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _08031218 @ =0x02010004
	ands r0, r1
	cmp r0, #0
	bne _08031222
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0803121C
	ldrb r0, [r3, #4]
	bl PidStatsSubFavval100
	b _08031222
	.align 2, 0
_08031218: .4byte 0x02010004
_0803121C:
	ldrb r0, [r3, #4]
	bl PidStatsAddDeployAmt
_08031222:
	adds r4, #1
	cmp r4, #0x3f
	ble _080311E4
	bl sub_0803117C
	ldr r0, _0803124C @ =0x08B96460
	bl Proc_EndEach
	ldr r2, _08031250 @ =0x0202BBB8
	movs r1, #0xef
	adds r0, r1, #0
	ldrb r3, [r2, #4]
	ands r0, r3
	strb r0, [r2, #4]
	ldr r0, _08031254 @ =0x0202BBF8
	ldrb r2, [r0, #0x14]
	ands r1, r2
	strb r1, [r0, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803124C: .4byte 0x08B96460
_08031250: .4byte 0x0202BBB8
_08031254: .4byte 0x0202BBF8
