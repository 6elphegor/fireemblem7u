	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FA00
sub_0803FA00: @ 0x0803FA00
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_08049220
	ldr r4, _0803FA30 @ =0x0203D998
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0803FA34 @ =0x081D5288
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0803FA38 @ =0x02022F76
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803FA30: .4byte 0x0203D998
_0803FA34: .4byte 0x081D5288
_0803FA38: .4byte 0x02022F76
