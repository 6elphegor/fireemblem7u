	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSupportUnitSubScreen
StartSupportUnitSubScreen: @ 0x0809D754
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0809D774 @ =0x08CC5984
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D774: .4byte 0x08CC5984
