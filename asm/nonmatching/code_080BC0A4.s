	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC0A4
sub_080BC0A4: @ 0x080BC0A4
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r2, _080BC0C0 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0
_080BC0C0: .4byte 0x03001620
