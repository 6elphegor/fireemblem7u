	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014C50
sub_08014C50: @ 0x08014C50
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble _08014C6C
_08014C5C:
	ldrh r5, [r4]
	adds r0, r5, r3
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt _08014C5C
_08014C6C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
