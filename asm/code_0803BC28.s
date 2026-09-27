	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BC28
sub_0803BC28: @ 0x0803BC28
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803BC88 @ =0x0203A8EC
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803BC7E
	ldr r0, _0803BC8C @ =0x03004690
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0803BC7E
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BC7E
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BC7E:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BC88: .4byte 0x0203A8EC
_0803BC8C: .4byte 0x03004690
