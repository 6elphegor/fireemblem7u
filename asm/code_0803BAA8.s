	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BAA8
sub_0803BAA8: @ 0x0803BAA8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _0803BB30 @ =0x0203A8EC
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _0803BB34 @ =0x80000001
	ands r0, r1
	cmp r0, #0
	beq _0803BB26
	ldr r0, _0803BB38 @ =0x03004690
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl sub_0803BCE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BB26
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _0803BB3C @ =0x0203A97C
	ldrb r0, [r4, #0xa]
	cmp r0, #1
	bne _0803BB26
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803BB26
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0803BB26:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BB30: .4byte 0x0203A8EC
_0803BB34: .4byte 0x80000001
_0803BB38: .4byte 0x03004690
_0803BB3C: .4byte 0x0203A97C
