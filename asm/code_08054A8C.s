	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054A8C
sub_08054A8C: @ 0x08054A8C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x44]
	bl GetAISLayerId
	cmp r0, #0
	bne _08054ADE
	ldr r3, _08054AE4 @ =0x081D856C
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r1, _08054AE8 @ =0x08E00008
	adds r0, r0, r1
	ldr r1, [r0, #0xc]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r5, [r6, #0x28]
	ldrb r3, [r3, #0x18]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, r0
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r5, [r2, #0x30]
	ldr r0, [r1, #8]
	adds r5, r5, r0
	str r5, [r2, #0x3c]
	ldr r5, [r4, #0x30]
	ldr r0, _08054AEC @ =0x000057F0
	adds r5, r5, r0
	str r5, [r4, #0x3c]
	ldr r1, [r6, #0x2c]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _08054ADE
	adds r0, r7, #0
	bl NewEkrChienCHR
	ldr r0, [r7, #0x28]
	str r0, [r6, #0x2c]
_08054ADE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054AE4: .4byte 0x081D856C
_08054AE8: .4byte 0x08E00008
_08054AEC: .4byte 0x000057F0
