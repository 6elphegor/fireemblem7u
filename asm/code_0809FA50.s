	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearPidStats
ClearPidStats: @ 0x0809FA50
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _0809FA90 @ =0x0203E7A0
	ldr r2, _0809FA94 @ =0x01000230
	bl CpuSet
	ldr r4, _0809FA98 @ =0x0202BBF8
	ldr r0, [r4, #0x38]
	ldr r1, _0809FA9C @ =0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	movs r0, #0xf
	ldrh r1, [r4, #0x36]
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _0809FAA0 @ =0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl GetPartyTotalGoldValue
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA90: .4byte 0x0203E7A0
_0809FA94: .4byte 0x01000230
_0809FA98: .4byte 0x0202BBF8
_0809FA9C: .4byte 0xF00000FF
_0809FAA0: .4byte 0xFFF00000
