	.include "macro.inc"

	.syntax unified

	thumb_func_start PutText
PutText: @ 0x08005590
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _080055DC @ =0x02028D70
	ldr r1, [r0]
	ldrb r3, [r4, #4]
	ldrb r5, [r4, #6]
	adds r0, r5, #0
	muls r0, r3, r0
	ldrh r5, [r4]
	adds r0, r5, r0
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r1, r0
	cmp r3, #0
	beq _080055C4
_080055B0:
	strh r1, [r2]
	adds r1, #1
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080055B0
_080055C4:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _080055D4
	movs r0, #1
	ldrb r1, [r4, #6]
	eors r0, r1
	strb r0, [r4, #6]
_080055D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080055DC: .4byte 0x02028D70
