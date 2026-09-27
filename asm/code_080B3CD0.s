	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3CD0
sub_080B3CD0: @ 0x080B3CD0
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B3D10
	movs r4, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B3CEC
	movs r4, #0x70
_080B3CEC:
	ldr r3, _080B3D18 @ =0x08CE75A0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
	ldr r3, _080B3D1C @ =0x08CE760E
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl PutSpriteExt
_080B3D10:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D18: .4byte 0x08CE75A0
_080B3D1C: .4byte 0x08CE760E
