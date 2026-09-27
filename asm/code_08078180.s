	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078180
sub_08078180: @ 0x08078180
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0807818C
	movs r0, #0
	b _080781A6
_0807818C:
	ldr r2, [r3]
	ldr r0, _080781AC @ =0x08C9E9A4
	ldrh r4, [r2]
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl sub_0807812C
_080781A6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080781AC: .4byte 0x08C9E9A4
