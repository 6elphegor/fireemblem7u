	.include "macro.inc"

	.syntax unified

	thumb_func_start SioSend16
SioSend16: @ 0x0803D0E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D0FC @ =0x08B98AEC
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0803D100
	adds r0, r2, #0
	b _0803D122
	.align 2, 0
_0803D0FC: .4byte 0x08B98AEC
_0803D100:
	ldr r2, _0803D128 @ =0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0803D120
	cmp r1, #0
	bge _0803D120
	ldr r1, _0803D12C @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0803D120:
	movs r0, #0
_0803D122:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803D128: .4byte 0x04000128
_0803D12C: .4byte 0x030013C8
