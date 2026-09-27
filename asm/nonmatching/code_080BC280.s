	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC280
sub_080BC280: @ 0x080BC280
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080BC296
	movs r0, #0x5f
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
_080BC296:
	ldr r0, [r4, #0x2c]
	cmp r0, #0x1f
	bgt _080BC2C4
	str r0, [sp]
	movs r0, #0x20
	movs r1, #2
	movs r2, #2
	movs r3, #0
	bl sub_080BCBFC
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	movs r0, #0x20
	movs r1, #2
	movs r2, #2
	bl sub_080BCBFC
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	b _080BC2CA
_080BC2C4:
	adds r0, r4, #0
	bl Proc_Break
_080BC2CA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
