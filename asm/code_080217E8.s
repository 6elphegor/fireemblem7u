	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080217E8
sub_080217E8: @ 0x080217E8
	push {lr}
	ldr r0, _08021800 @ =0x03004690
	ldr r0, [r0]
	bl MakeRescueTargetList
	ldr r0, _08021804 @ =0x08B95D18
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021800: .4byte 0x03004690
_08021804: .4byte 0x08B95D18
