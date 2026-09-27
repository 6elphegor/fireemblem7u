	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013C7C
sub_08013C7C: @ 0x08013C7C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013C94 @ =0x08B92A48
	lsls r1, r1, #5
	ldr r2, _08013C98 @ =0x02022860
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08013C94: .4byte 0x08B92A48
_08013C98: .4byte 0x02022860
