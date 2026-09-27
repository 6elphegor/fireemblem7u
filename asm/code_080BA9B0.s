	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_IDLE
Title_IDLE: @ 0x080BA9B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	adds r0, #1
	str r0, [r4, #0x54]
	adds r2, r4, #0
	adds r2, #0x50
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strb r0, [r2]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	ldr r1, _080BAA0C @ =0x085E9B2C
	adds r0, r0, r1
	movs r1, #0x8c
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
	ldr r0, _080BAA10 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BAA1C
	ldr r0, _080BAA14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA9FE
	ldr r0, _080BAA18 @ =0x0000038D
	bl m4aSongNumStart
_080BA9FE:
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
	b _080BAA32
	.align 2, 0
_080BAA0C: .4byte 0x085E9B2C
_080BAA10: .4byte 0x08B857F8
_080BAA14: .4byte 0x0202BBF8
_080BAA18: .4byte 0x0000038D
_080BAA1C:
	ldr r1, [r4, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _080BAA32
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	bl Proc_Break
_080BAA32:
	pop {r4}
	pop {r0}
	bx r0
