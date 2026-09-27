	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080330F4
sub_080330F4: @ 0x080330F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08033114 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033114: .4byte 0x0203A85C
