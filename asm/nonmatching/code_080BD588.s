	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD588
sub_080BD588: @ 0x080BD588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	mov sl, r1
	ldr r7, [r0, #4]
	cmp r2, #0
	blt _080BD678
	cmp r1, #0
	beq _080BD5DA
	adds r0, r6, #0
	bl GetBgChrOffset
	adds r4, r0, #0
	mov r2, sb
	ldr r2, [r2]
	ldr r1, [r2, #0x14]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #0xa
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	adds r4, r4, r0
	mov r1, sb
	ldr r1, [r1]
	ldr r0, [r1, #0x10]
	adds r4, r4, r0
	mov r0, sl
	adds r1, r4, #0
	bl Decompress
_080BD5DA:
	cmp r7, #0
	beq _080BD638
	ldrb r2, [r7]
	mov sl, r2
	ldrh r3, [r7]
	lsrs r4, r3, #8
	adds r7, #2
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r5, [r3]
	ldr r1, [r5, #0x14]
	mov r0, r8
	bl __modsi3
	subs r4, r4, r0
	mov r3, sl
	adds r3, #1
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #1
	adds r7, r7, r0
	movs r2, #0
	cmp r2, sl
	bgt _080BD678
	ldr r0, [r5, #4]
	lsls r4, r0, #0xc
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0xf
	lsrs r1, r0, #0x14
	adds r2, r3, #0
_080BD624:
	ldrh r3, [r7]
	adds r0, r3, r4
	adds r0, r0, r1
	strh r0, [r6]
	adds r6, #2
	adds r7, #2
	subs r2, #1
	cmp r2, #0
	bne _080BD624
	b _080BD678
_080BD638:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	mov r0, r8
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	lsls r1, r1, #0xc
	adds r4, r4, r1
	adds r0, r4, r0
	movs r2, #0x1f
_080BD66C:
	strh r0, [r6]
	adds r6, #2
	adds r0, #1
	subs r2, #1
	cmp r2, #0
	bge _080BD66C
_080BD678:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
