	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC8C0
sub_080BC8C0: @ 0x080BC8C0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080BC6A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC8EE
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BC8F4 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl Proc_Goto
_080BC8EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8F4: .4byte 0x02024460
