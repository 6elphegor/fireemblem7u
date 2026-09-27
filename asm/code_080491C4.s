	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080491C4
sub_080491C4: @ 0x080491C4
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _080491E6
	ldr r1, [r1, #0x2c]
	ldr r3, _080491EC @ =0x081D575A
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_08049124
_080491E6:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080491EC: .4byte 0x081D575A
