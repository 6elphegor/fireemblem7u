	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemEffectiveAgainst
IsItemEffectiveAgainst: @ 0x08016820
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r7, #4]
	ldrb r3, [r0, #4]
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016844 @ =0x08BE222C
	adds r0, r0, r1
	ldr r2, [r0, #0x10]
	adds r5, r1, #0
	cmp r2, #0
	beq _080168A4
	b _08016850
	.align 2, 0
_08016844: .4byte 0x08BE222C
_08016848:
	ldrb r0, [r2]
	cmp r0, r3
	beq _08016858
	adds r2, #1
_08016850:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08016848
	b _080168A4
_08016858:
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0, #0x10]
	ldr r0, _080168A0 @ =0x08C97ED2
	cmp r1, r0
	bne _0801689A
	movs r3, #0
	movs r6, #0xff
	adds r2, r7, #0
	adds r2, #0x1e
	movs r4, #4
_08016876:
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1, #8]
	orrs r3, r0
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _08016876
	movs r0, #0x80
	lsls r0, r0, #7
	ands r3, r0
	cmp r3, #0
	bne _080168A4
_0801689A:
	movs r0, #1
	b _080168A6
	.align 2, 0
_080168A0: .4byte 0x08C97ED2
_080168A4:
	movs r0, #0
_080168A6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
