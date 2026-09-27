	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080843D8
sub_080843D8: @ 0x080843D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08084468 @ =0x08CC2AAC
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _08084430
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl SetBoxDialogueSize
_08084430:
	ldrb r5, [r5]
	cmp r5, #2
	bne _08084460
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _08084454
	movs r1, #5
_08084454:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08084460:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084468: .4byte 0x08CC2AAC
