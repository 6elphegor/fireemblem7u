	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BCC4
sub_0801BCC4: @ 0x0801BCC4
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801BCDC
	movs r0, #3
	bl ReadSuspendSave
	bl sub_08012BAC
	movs r0, #0x17
	b _0801BCDE
_0801BCDC:
	movs r0, #8
_0801BCDE:
	pop {r1}
	bx r1
	.align 2, 0
