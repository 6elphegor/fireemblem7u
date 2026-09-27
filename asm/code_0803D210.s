	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D210
sub_0803D210: @ 0x0803D210
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0803D260 @ =0x08B98AEC
	ldr r3, [r0]
	ldr r0, _0803D264 @ =0x00001B74
	adds r4, r3, r0
	movs r6, #0x8c
	ldrb r1, [r4]
	adds r5, r1, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xdf
	bne _0803D26C
	ldr r1, _0803D268 @ =0x030013D0
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r1, [r4]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r4, [r4]
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b _0803D26E
	.align 2, 0
_0803D260: .4byte 0x08B98AEC
_0803D264: .4byte 0x00001B74
_0803D268: .4byte 0x030013D0
_0803D26C:
	movs r0, #0
_0803D26E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
