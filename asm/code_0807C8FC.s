	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C8FC
sub_0807C8FC: @ 0x0807C8FC
	push {r4, lr}
	ldr r2, _0807C95C @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0807C966
	movs r4, #1
_0807C92A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807C960
	ldr r1, [r2]
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0807C960
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	b _0807C966
	.align 2, 0
_0807C95C: .4byte 0x03002870
_0807C960:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807C92A
_0807C966:
	pop {r4}
	pop {r0}
	bx r0
