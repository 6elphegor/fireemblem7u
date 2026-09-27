	.include "macro.inc"

	.syntax unified

	thumb_func_start EventSnowStormfx_End
EventSnowStormfx_End: @ 0x0801131C
	push {lr}
	ldr r0, _08011354 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r2, _08011358 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08011354: .4byte 0x02023C60
_08011358: .4byte 0x03002870
