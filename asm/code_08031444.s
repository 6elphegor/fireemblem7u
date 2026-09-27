	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031444
sub_08031444: @ 0x08031444
	push {lr}
	ldr r0, _08031468 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r2, [r0, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r2, r1
	ldr r2, _0803146C @ =0x0203A85C
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	bl GetUnitCommandUseFlags
	pop {r1}
	bx r1
	.align 2, 0
_08031468: .4byte 0x03004690
_0803146C: .4byte 0x0203A85C
