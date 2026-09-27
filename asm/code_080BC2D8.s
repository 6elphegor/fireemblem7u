	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC2D8
sub_080BC2D8: @ 0x080BC2D8
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BC300
	ldr r0, [r2, #0x54]
	cmp r0, #1
	bne _080BC300
	ldr r0, _080BC308 @ =0x08659C9C
	adds r1, r0, #0
	adds r1, #0x20
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080BD0D4
_080BC300:
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BC308: .4byte 0x08659C9C
