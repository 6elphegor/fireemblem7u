	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DAE4
sub_0803DAE4: @ 0x0803DAE4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803DB04 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r1, _0803DB08 @ =0x00001286
	strh r1, [r0, #0x30]
	ldr r1, _0803DB0C @ =0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0803DB00
	adds r0, r2, #0
	bl Proc_Break
_0803DB00:
	pop {r0}
	bx r0
	.align 2, 0
_0803DB04: .4byte 0x08B98AEC
_0803DB08: .4byte 0x00001286
_0803DB0C: .4byte 0x00001B7E
