	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearPidStats_ret
ClearPidStats_ret: @ 0x0809FA2C
	push {lr}
	ldr r1, _0809FA48 @ =0x0202BBF8
	ldr r0, _0809FA4C @ =0xFFFFE00F
	ldrh r2, [r1, #0x2c]
	ands r0, r2
	strh r0, [r1, #0x2c]
	movs r0, #0
	bl SetGold
	bl ClearPidStats
	pop {r0}
	bx r0
	.align 2, 0
_0809FA48: .4byte 0x0202BBF8
_0809FA4C: .4byte 0xFFFFE00F
