	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB420
sub_080AB420: @ 0x080AB420
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x50]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AB43A
	movs r0, #0
	b _080AB43C
_080AB43A:
	movs r0, #1
_080AB43C:
	bx lr
	.align 2, 0
