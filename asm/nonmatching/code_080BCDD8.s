	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCDD8
sub_080BCDD8: @ 0x080BCDD8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0x1f
	bgt _080BCDFC
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	ldr r3, [r4, #0x38]
	str r0, [sp]
	movs r0, #0x1e
	movs r2, #2
	bl sub_080BCBFC
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BCE0C
_080BCDFC:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BCE0C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
