	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FFD0
sub_0800FFD0: @ 0x0800FFD0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	ldr r2, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010004 @ =0x0000FFFD
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010008
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventStartCgTalk
	movs r0, #2
	b _0801000A
	.align 2, 0
_08010004: .4byte 0x0000FFFD
_08010008:
	movs r0, #0
_0801000A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
