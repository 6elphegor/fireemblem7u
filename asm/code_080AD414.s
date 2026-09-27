	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD414
sub_080AD414: @ 0x080AD414
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	bge _080AD476
	movs r4, #0x30
_080AD426:
	ldr r0, _080AD450 @ =0x08CE5788
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD454
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
	b _080AD468
	.align 2, 0
_080AD450: .4byte 0x08CE5788
_080AD454:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_080AD468:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	blt _080AD426
_080AD476:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
