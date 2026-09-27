	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB76C
sub_080BB76C: @ 0x080BB76C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080BB7D0 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB79A
	movs r4, #0
	movs r5, #0xbc
	lsls r5, r5, #5
_080BB786:
	lsls r1, r4, #6
	str r5, [sp]
	movs r0, #4
	ldr r2, _080BB7D4 @ =0x00000484
	ldr r3, _080BB7D8 @ =0x08B90600
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #3
	ble _080BB786
_080BB79A:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BB7E0
	ldr r4, _080BB7DC @ =0x08CEF490
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x80
	adds r3, r4, #0
	bl PutSpriteExt
	movs r0, #0x92
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSpriteExt
	b _080BB7F2
	.align 2, 0
_080BB7D0: .4byte 0x03001620
_080BB7D4: .4byte 0x00000484
_080BB7D8: .4byte 0x08B90600
_080BB7DC: .4byte 0x08CEF490
_080BB7E0:
	ldr r3, _080BB7FC @ =0x08CEF490
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	bl PutSpriteExt
_080BB7F2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7FC: .4byte 0x08CEF490
