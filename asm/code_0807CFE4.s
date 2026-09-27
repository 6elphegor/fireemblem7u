	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CFE4
sub_0807CFE4: @ 0x0807CFE4
	push {lr}
	ldr r0, _0807CFF0 @ =0x00002710
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_0807CFF0: .4byte 0x00002710
