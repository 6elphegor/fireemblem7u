	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D6E8
sub_0803D6E8: @ 0x0803D6E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803D6F6
	bl _call_via_r1
_0803D6F6:
	ldr r5, _0803D754 @ =0x08B98AEC
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne _0803D74C
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq _0803D72A
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803D72A:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl SioEmitData
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803D74C
	adds r0, r4, #0
	bl Proc_Break
_0803D74C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D754: .4byte 0x08B98AEC
