	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5130
sub_080A5130: @ 0x080A5130
	lsls r2, r2, #4
	cmp r2, #0
	ble _080A5146
	adds r3, r0, #0
_080A5138:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080A5138
_080A5146:
	bx lr
