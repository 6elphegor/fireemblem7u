	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF0FC
sub_080AF0FC: @ 0x080AF0FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, [r7, #0x30]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AF148
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r5, [r4]
	movs r0, #0x2c
	ldrsh r6, [r7, r0]
	ldrb r0, [r1]
	bl sub_080AEF00
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080AF554
	ldr r2, _080AF150 @ =0x02000000
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r1, r1, r2
	str r0, [r1]
	ldr r0, [r7, #0x30]
	ldrb r0, [r0]
	bl sub_080AEF48
	ldrh r1, [r7, #0x2c]
	adds r0, r1, r0
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x30]
	adds r0, #1
	str r0, [r7, #0x30]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080AF148:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF150: .4byte 0x02000000
